<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Lending;
use App\Models\Fine;
use App\Models\FineRule;

class CalculateOverdueFines extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'fines:calculate-overdue';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Calculate fines for overdue books';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->info('Starting overdue fines calculation...');

        $overdueLendings = Lending::overdue()->with(['user', 'book'])->get();
        $createdCount = 0;
        $updatedCount = 0;

        foreach ($overdueLendings as $lending) {
            $daysOverdue = $lending->getDaysOverdue();
            
            // Check if fine already exists
            $existingFine = $lending->fines()->pending()->first();
            
            if (!$existingFine) {
                // Create new fine
                $this->createFine($lending, $daysOverdue);
                $createdCount++;
                $this->line("Created fine for: {$lending->book->title} - {$lending->user->name} (₹{$lending->calculateFine()})");
            } else {
                // Update existing fine if days overdue changed
                $newAmount = $this->calculateFineAmount($daysOverdue);
                if ($existingFine->amount != $newAmount) {
                    $existingFine->update([
                        'amount' => $newAmount,
                        'days_overdue' => $daysOverdue,
                    ]);
                    $updatedCount++;
                    $this->line("Updated fine for: {$lending->book->title} - {$lending->user->name} (₹{$newAmount})");
                }
            }
        }

        $this->info("Fines calculation completed!");
        $this->info("Created: {$createdCount} new fines");
        $this->info("Updated: {$updatedCount} existing fines");
        $this->info("Total overdue books processed: " . $overdueLendings->count());

        return 0;
    }

    private function createFine($lending, $daysOverdue)
    {
        $amount = $this->calculateFineAmount($daysOverdue);

        if ($amount > 0) {
            Fine::create([
                'lending_id' => $lending->id,
                'user_id' => $lending->user_id,
                'amount' => $amount,
                'days_overdue' => $daysOverdue,
                'status' => 'pending',
            ]);
        }
    }

    private function calculateFineAmount($daysOverdue)
    {
        $fineRule = FineRule::active()->first();
        
        if (!$fineRule) {
            return $daysOverdue * 5; // Default ₹5 per day
        }

        return $fineRule->calculateFine($daysOverdue);
    }
} 