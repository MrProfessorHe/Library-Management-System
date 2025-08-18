<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable implements MustVerifyEmail
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'phone',
        'address',
        'role',
        'status',
        'blocked_at',
        'block_reason',
        'max_books_allowed',
        'max_days_allowed',
    ];


    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];



    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'blocked_at' => 'datetime',
        ];
    }



    public function lendings()
    {
        return $this->hasMany(\App\Models\Lending::class);
    }

    public function fines()
    {
        return $this->hasMany(Fine::class);
    }

    public function approvedLendings()
    {
        return $this->hasMany(Lending::class, 'approved_by');
    }

    public function returnedLendings()
    {
        return $this->hasMany(Lending::class, 'returned_to');
    }

    // Scopes
    public function scopeActive($query)
    {
        return $query->where('status', 'active');
    }

    public function scopeBlocked($query)
    {
        return $query->where('status', 'blocked');
    }

    public function scopeLibrarians($query)
    {
        return $query->where('role', 'librarian');
    }

    public function scopeAdmins($query)
    {
        return $query->where('role', 'admin');
    }

    public function scopeMembers($query)
    {
        return $query->where('role', 'member');
    }

    // Methods
    public function isAdmin()
    {
        return $this->role === 'admin';
    }

    public function isLibrarian()
    {
        return $this->role === 'librarian';
    }

    public function isMember()
    {
        return $this->role === 'member';
    }

    public function isBlocked()
    {
        return $this->status === 'blocked';
    }

    public function isActive()
    {
        return $this->status === 'active';
    }

    public function block($reason = null)
    {
        $this->update([
            'status' => 'blocked',
            'blocked_at' => now(),
            'block_reason' => $reason,
        ]);
    }

    public function unblock()
    {
        $this->update([
            'status' => 'active',
            'blocked_at' => null,
            'block_reason' => null,
        ]);
    }

    public function getCurrentFineAmount()
    {
        return $this->fines()->pending()->sum('amount');
    }

    public function getOverdueBooksCount()
    {
        return $this->lendings()
            ->where('status', 'approved')
            ->where('return_at', '<', now())
            ->whereNull('returned_at')
            ->count();
    }

    public function canBorrowMoreBooks()
    {
        $currentBorrowed = $this->lendings()
            ->where('status', 'approved')
            ->whereNull('returned_at')
            ->count();
        
        return $currentBorrowed < $this->max_books_allowed;
    }
}
