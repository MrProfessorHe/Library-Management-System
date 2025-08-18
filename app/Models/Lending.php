<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Book;
use App\Models\User;

class Lending extends Model
{
    use HasFactory;

    protected $fillable = [
        'book_id',
        'user_id',
        'status',
        'issued_at',
        'return_at',
        'approved_at',
        'returned_at',
        'approved_by',
        'returned_to',
        'notes',
        'renewal_count',
        'last_renewed_at',
    ];

    protected $casts = [
        'issued_at' => 'datetime',
        'return_at' => 'datetime',
        'approved_at' => 'datetime',
        'returned_at' => 'datetime',
        'last_renewed_at' => 'datetime',
    ];

    // 🔗 Define relationship with Book
    public function book()
    {
        return $this->belongsTo(Book::class);
    }

    // 🔗 Define relationship with User
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function approvedBy()
    {
        return $this->belongsTo(User::class, 'approved_by');
    }

    public function returnedTo()
    {
        return $this->belongsTo(User::class, 'returned_to');
    }

    public function fines()
    {
        return $this->hasMany(Fine::class);
    }

    // Scopes
    public function scopePending($query)
    {
        return $query->where('status', 'pending');
    }

    public function scopeApproved($query)
    {
        return $query->where('status', 'approved');
    }

    public function scopeOverdue($query)
    {
        return $query->where('return_at', '<', now())
                    ->whereNull('returned_at');
    }

    public function scopeReturned($query)
    {
        return $query->whereNotNull('returned_at');
    }

    // Methods
    public function isOverdue()
    {
        return $this->return_at && $this->return_at < now() && !$this->returned_at;
    }

    public function getDaysOverdue()
    {
        if (!$this->isOverdue()) {
            return 0;
        }
        return now()->diffInDays($this->return_at);
    }

    public function canBeRenewed()
    {
        return $this->status === 'approved' && 
               !$this->returned_at && 
               $this->renewal_count < 2; // Max 2 renewals
    }

    public function renew($days = 7)
    {
        if (!$this->canBeRenewed()) {
            return false;
        }

        $this->update([
            'return_at' => $this->return_at ? $this->return_at->addDays($days) : now()->addDays($days),
            'renewal_count' => $this->renewal_count + 1,
            'last_renewed_at' => now(),
        ]);

        return true;
    }

    public function markAsReturned($returnedToUserId = null)
    {
        $this->update([
            'status' => 'returned',
            'returned_at' => now(),
            'returned_to' => $returnedToUserId,
        ]);
    }

    public function calculateFine()
    {
        if (!$this->isOverdue()) {
            return 0;
        }

        $daysOverdue = $this->getDaysOverdue();
        $fineRule = FineRule::active()->first();
        
        if (!$fineRule) {
            return $daysOverdue * 5; // Default ₹5 per day
        }

        return $fineRule->calculateFine($daysOverdue);
    }
}
