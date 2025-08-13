<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\FineRule;

class FineRuleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        FineRule::create([
            'name' => 'Standard Late Fee',
            'daily_rate' => 5.00,
            'grace_period_days' => 0,
            'max_fine' => 100.00,
            'is_active' => true,
            'description' => 'Standard late fee of ₹5 per day with maximum fine of ₹100',
        ]);

        FineRule::create([
            'name' => 'Student Late Fee',
            'daily_rate' => 3.00,
            'grace_period_days' => 1,
            'max_fine' => 50.00,
            'is_active' => true,
            'description' => 'Reduced late fee for students with 1-day grace period',
        ]);

        FineRule::create([
            'name' => 'Premium Member Late Fee',
            'daily_rate' => 2.00,
            'grace_period_days' => 2,
            'max_fine' => 30.00,
            'is_active' => false,
            'description' => 'Special rate for premium members with extended grace period',
        ]);
    }
} 