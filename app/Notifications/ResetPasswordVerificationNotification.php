<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Support\Carbon;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class ResetPasswordVerificationNotification extends Notification
{
    use Queueable;
    public $message;
    public $subject;
    public $mailer;
    public $otp;



    /**
     * Create a new notification instance.
     */
    public function __construct($otp)
    {

        $this->message = 'Use the below code for resetting your password';
        $this->subject = 'Yes Yes Loyalty | Reset Password';
        $this->mailer = 'smtp';
        $this->otp = $otp;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage
    {

        // return (new MailMessage)
        //     ->mailer('smtp')
        //     ->subject($this->subject)
        //     ->greeting('Hello' . $notifiable->name)
        //     ->line($this->message)
        //     ->line('code:' . $this->otp);
        $currentDate = Carbon::now();

        return (new MailMessage)
            ->mailer('smtp')
            ->subject($this->subject)
            ->view('layouts.otp', ['currentDate' => $currentDate,'otp' => $this->otp, 'user' => $notifiable]);
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            //
        ];
    }
}
