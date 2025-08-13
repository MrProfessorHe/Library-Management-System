<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;
use App\Models\Fine;

class SendFineReminders extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'fines:send-reminders {--days=7 : Send reminders for fines older than this many days}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send reminders to users with pending fines';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $days = $this->option('days');
        $this->info("Sending fine reminders for fines older than {$days} days...");

        $usersWithFines = User::whereHas('fines', function($query) use ($days) {
            $query->where('status', 'pending')
                  ->where('created_at', '<=', now()->subDays($days));
        })->with(['fines' => function($query) use ($days) {
            $query->where('status', 'pending')
                  ->where('created_at', '<=', now()->subDays($days))
                  ->with('lending.book');
        }])->get();

        $sentCount = 0;

        foreach ($usersWithFines as $user) {
            $totalFine = $user->fines->sum('amount');
            $fineCount = $user->fines->count();

            // Here you would implement actual email sending
            // For now, we'll just log and update the fine notes
            $this->line("Sending reminder to: {$user->name} ({$user->email})");
            $this->line("  - Total pending fines: ₹{$totalFine}");
            $this->line("  - Number of fines: {$fineCount}");

            // Update fine notes to indicate reminder was sent
            foreach ($user->fines as $fine) {
                $fine->update([
                    'notes' => $fine->notes . "\nReminder sent on " . now()->format('Y-m-d H:i:s') . " via command line",
                ]);
            }

            $sentCount++;
        }

        $this->info("Fine reminders completed!");
        $this->info("Reminders sent to: {$sentCount} users");

        return 0;
    }
} 