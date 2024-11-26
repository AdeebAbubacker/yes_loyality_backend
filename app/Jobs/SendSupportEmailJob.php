<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Mail\GetSupport;
use App\Mail\GetSupportResponse;
use Illuminate\Support\Facades\Mail;



class SendSupportEmailJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $emailData;

    public $send_to_mails;

    /**
     * Create a new job instance.
     */
    public function __construct(array $send_to_mails, $emailData)
    {
       
        $this->send_to_mails = $send_to_mails;
        $this->emailData = $emailData;

    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        foreach($this->send_to_mails as $mail_id) {
            Mail::to($mail_id)->send(new GetSupport($this->emailData));
        }

        // * Return Mail to User
        Mail::to($this->emailData['email'])->send(new GetSupportResponse($this->emailData));
    }
}
