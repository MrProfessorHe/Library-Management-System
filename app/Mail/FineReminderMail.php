<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class FineReminderMail extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    public $pendingFines;

    public function __construct($user, $pendingFines)
    {
        $this->user = $user;
        $this->pendingFines = $pendingFines;
    }

    public function build()
    {
        return $this->subject('Library Fine Reminder')
                    ->markdown('emails.fine_reminder');
    }
}
