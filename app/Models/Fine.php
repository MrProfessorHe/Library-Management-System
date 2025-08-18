<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Fine extends Model
{
    use HasFactory;

    protected $fillable = [
        'lending_id',
        'user_id',
        'amount',
        'days_overdue',
        'status',
        'paid_at',
        'notes',
    ];

    protected $casts = [
        'paid_at' => 'datetime',
        'amount' => 'decimal:2',
    ];

    // Relationships
    public function lending()
    {
        return $this->belongsTo(Lending::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Scopes
    public function scopePending($query)
    {
        return $query->where('status', 'pending');
    }

    public function scopePaid($query)
    {
        return $query->where('status', 'paid');
    }

    public function scopeOverdue($query)
    {
        return $query->where('days_overdue', '>', 0);
    }

    // Methods
    public function markAsPaid()
    {
        $this->update([
            'status' => 'paid',
            'paid_at' => now(),
        ]);
    }

    public function waive()
    {
        $this->update([
            'status' => 'waived',
            'notes' => $this->notes . "\nWaived on " . now()->format('Y-m-d H:i:s'),
        ]);
    }

    public function isOverdue()
    {
        return $this->days_overdue > 0;
    }
} 