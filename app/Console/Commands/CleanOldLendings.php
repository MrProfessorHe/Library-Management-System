<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Lending;
use Carbon\Carbon;

class CleanOldLendings extends Command
{
    protected $signature = 'lendings:clean-old';
    protected $description = 'Delete lendings that are pending or approved for more than 1 day';

    public function handle()
    {
        $cutoff = Carbon::now()->subDay();

        $count = Lending::whereIn('status', ['pending', 'approved'])
            ->where('created_at', '<', $cutoff)
            ->delete();

        $this->info("Deleted {$count} old lending requests.");
    }
}
