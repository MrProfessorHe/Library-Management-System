<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Fine;
use App\Models\Lending;
use Carbon\Carbon;

class FineSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Get any existing users and lendings (for testing)
        $users = User::all();
        $lendings = Lending::all();

        // Loop and assign dummy fines
        foreach ($users as $index => $user) {
            $lending = $lendings[$index] ?? null;
            if (!$lending) {
                continue;
            }

            Fine::create([
                'user_id' => $user->id,
                'lending_id' => $lending->id,
                'amount' => rand(20, 100), // Random fine between ₹20-₹100
                'days_overdue' => rand(2, 10),
                'status' => 'pending',
                'notes' => 'Test fine inserted via seeder',
                'created_at' => Carbon::now()->subDays(rand(1, 10)),
                'updated_at' => now(),
            ]);
        }
    }
}
