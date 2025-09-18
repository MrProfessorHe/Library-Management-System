<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        //add books
        $this->call([
            // BookSeeder::class,
            FineRuleSeeder::class,
        ]);

        //fine and fine rule Seeder
        // $this->call([
        //     FineRuleSeeder::class,
        //     FineSeeder::class,
        // ]);
    }
}
