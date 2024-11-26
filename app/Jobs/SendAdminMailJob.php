<?php

namespace App\Jobs;

use App\Mail\GetSupportAdmin;
use Illuminate\Bus\Queueable;
use App\Mail\GetSupportResponse;
use Illuminate\Support\Facades\Mail;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class SendAdminMailJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $emailData;

    /**
     * Create a new job instance.
     */
    public function __construct($emailData)
    {
        $this->emailData = $emailData;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        // Mail::to($this->emailData['adminMail'])->send(new GetSupportAdmin($this->emailData));

        // $user_mail = $this->emailData['email'];

        // Mail::to($user_mail)->send(new GetSupportResponse($this->emailData));

        Mail::to($this->emailData['adminMail'])->send(new GetSupportAdmin($this->emailData));

        if ($this->emailData['adminMail_2'] != null) {
            Mail::to($this->emailData['adminMail_2'])->send(new GetSupportAdmin($this->emailData));
        }

        $user_mail = $this->emailData['email'];
        Mail::to($user_mail)->send(new GetSupportResponse($this->emailData));
    }
}
