<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Lending;
use Carbon\Carbon;

class DeleteExpiredLendings extends Command
{
    protected $signature = 'lendings:delete-expired';
    protected $description = 'Delete lendings that were approved more than 1 day ago and not issued';

    public function handle()
    {
        $cutoff = Carbon::now()->subDay();

        $deleted = Lending::whereNotNull('approved_at')
            ->whereNull('issued_at')
            ->where('approved_at', '<=', $cutoff)
            ->delete();

        $this->info("Deleted {$deleted} expired lending requests.");
    }
}
