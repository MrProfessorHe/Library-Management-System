<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class FineRule extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'daily_rate',
        'grace_period_days',
        'max_fine',
        'is_active',
        'description',
    ];

    protected $casts = [
        'daily_rate' => 'decimal:2',
        'max_fine' => 'decimal:2',
        'is_active' => 'boolean',
    ];

    // Scopes
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    // Methods
    public function calculateFine($daysOverdue)
    {
        if ($daysOverdue <= $this->grace_period_days) {
            return 0;
        }

        $fineDays = $daysOverdue - $this->grace_period_days;
        $fine = $fineDays * $this->daily_rate;

        if ($this->max_fine && $fine > $this->max_fine) {
            return $this->max_fine;
        }

        return $fine;
    }

    public function getFormattedDailyRateAttribute()
    {
        return '₹' . number_format($this->daily_rate, 2);
    }

    public function getFormattedMaxFineAttribute()
    {
        return $this->max_fine ? '₹' . number_format($this->max_fine, 2) : 'No limit';
    }
} 