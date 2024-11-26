<?php

namespace App\Helpers;

use Kreait\Firebase\Factory;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;
use Kreait\Firebase\Contract\Messaging;
use Kreait\Firebase\Exception\MessagingException;
use Illuminate\Support\Facades\Log;

use Kreait\Firebase\Messaging\AndroidConfig;
use Kreait\Firebase\Messaging\ApnsConfig;
use Kreait\Firebase\Messaging\WebPushConfig;

use Kreait\Firebase\Http\HttpClientOptions;
use GuzzleHttp\RequestOptions;

class Firebase
{
    private static $firebase = null;
    private static array $fcm_tokens = [];
    private static string $title = '';
    private static string $body = '';
    private static array $data = [];
    private static ?int $group = null;

    /**
     * @var array Custom configurations for Android.
     */
    private static array $android_config = [];

    /**
     * @var array Custom configurations for Apple (Apple Push Notification Service).
     */
    private static array $apn_config = [];

    /**
     * @var array Custom configurations for Web.
     */
    private static array $web_config = [];

    const NEW_STORE = 51301;
    const NEW_OFFER = 51302;
    const NEW_CUSTOMER = 51303;
    const NEW_TRANSACTION = 51304;
    const POINTS_ADDED = 51305;
    const POINTS_REDEEMED = 51306;


    // ===========================================================================
    // ===========================================================================
    // ===========================================================================

    function __construct()
    {
        $credentials = self::getFirebaseCredentials();

        // Directly use the entire credentials array with withServiceAccount()
        self::$firebase = (new Factory)
            ->withProjectId($credentials['project_id'])
            ->withServiceAccount($credentials);

        if (env('APP_ENV') == 'local') {
            self::$firebase = self::$firebase->withHttpClientOptions(
                HttpClientOptions::default()->withGuzzleConfigOptions([
                    RequestOptions::VERIFY => false, // Disable SSL verification
                ])
            );
        }
    }

    private static function getFirebaseCredentials(): ?array
    {
        // 1. Check environment variable for JSON file path
        $credentials_path = env('FIREBASE_CREDENTIALS');

        if ($credentials_path && file_exists($credentials_path)) {
            $json = file_get_contents($credentials_path);
            return json_decode($json, true);
        } else {
            // 2. Fallback: Check config/services.php
            $credentials = config('services.firebase.credentials');

            if ($credentials) {
                return $credentials;
            }
        }

        // 3. Credentials not found 
        Log::critical("Firebase credentials not found.");
        throw new \RuntimeException("Firebase credentials not found.");
    }

    /**
     * Set the FCM tokens for the notification.
     *
     * @param string|array $fcm_tokens Single token as string or multiple tokens in an array.
     * 
     * @return self
     */
    public static function devices(string|array $fcm_tokens): self
    {
        self::$fcm_tokens = array_merge(self::$fcm_tokens, is_array($fcm_tokens) ? $fcm_tokens : [$fcm_tokens]);
        return new self();
    }

    /**
     * Set the notification title.
     *
     * @param string $title Notification title.
     * 
     * @return self
     */
    public static function title(string $value): self
    {
        self::$title = $value;
        return new self();
    }

    /**
     * Set the notification body.
     *
     * @param string $body Notification body.
     * 
     * @return self
     */
    public static function body(string $value): self
    {
        self::$body = $value;
        return new self();
    }

    /**
     * Add data to the notification payload.
     *
     * @param array $data Additional data payload.
     * 
     * @return self
     */
    public static function data(array $values): self
    {
        self::$data = array_merge(self::$data, $values);
        return new self();
    }

    /**
     * Set the notification group ID for collapsing.
     *
     * @param int|null $group Notification group ID.
     * 
     * @return self
     */
    public static function group(?int $value): self
    {
        self::$group = $value;
        return new self();
    }

    /**
     * Send the push notification.
     * 
     * @return void
     */
    public static function notify(): void
    {
        // Get the Firebase Messaging instance
        $messaging = self::$firebase->createMessaging();

        // print_r(self::$firebase); exit;

        // Prepare notification data
        $notification = Notification::create(self::$title, self::$body);

        // Add collapse key if group is set
        if (self::$group !== null) {
            self::$data['collapse_key'] = self::$group;
        }

        // Prepare the message
        $message = CloudMessage::new();

        if (count(self::$fcm_tokens) === 1) {
            $message = $message->withTarget('token', self::$fcm_tokens[0]);
        }

        $message = $message->withNotification($notification)
            ->withData(self::$data);

        // NOTE: When scaling, retreive the device platform from the app instance using the token..
        // Then customise the priority & notification UI for each platform seperately.  
        if (!empty(self::$android_config)) {
            $message = $message->withAndroidConfig(AndroidConfig::fromArray(self::$android_config));
        }

        if (!empty(self::$apn_config)) {
            $message = $message->withApnsConfig(ApnsConfig::fromArray(self::$apn_config));
        }

        if (!empty(self::$web_config)) {
            $message = $message->withWebPushConfig(WebPushConfig::fromArray(self::$web_config));
        }

        // Send the notification
        try {
            $sendReport = null;

            if (count(self::$fcm_tokens) === 1) {
                $messaging->send($message);
            } else {
                $sendReport = $messaging->sendMulticast($message, self::$fcm_tokens);
            }


            // Log success and attempt to get delivery info
            Log::info('Firebase notification sent.', [
                'title' => self::$title,
                'body' => self::$body,
                'group' => self::$group,
                'token_count' => count(self::$fcm_tokens),
                'success_count' => $sendReport?->successes()->count(),
                'failure_count' => $sendReport?->failures()->count(),
            ]);

        } catch (MessagingException $e) {
            Log::error('Error sending Firebase notification:', [
                'title' => self::$title,
                'body' => self::$body,
                'group' => self::$group,
                'token_count' => count(self::$fcm_tokens),
                'success_count' => $sendReport?->successes()->count(),
                'failure_count' => $sendReport?->failures()->count(),
                'message' => $e->getMessage(),
                'code' => $e->getCode(),
            ]);
        } finally {
            self::$fcm_tokens = [];
            self::$title = '';
            self::$body = '';
            self::$data = [];
            self::$group = null;
            self::$android_config = [];
            self::$apn_config = [];
            self::$web_config = [];
        }
    }

    /**
     * Subscribe a device token to one or more topics.
     * 
     * @param string|array $topics One or more topics to subscribe to.
     * 
     * @return self
     * @throws MessagingException If there is an error subscribing to topics.
     */
    public static function subscribe(string|array $topics): self
    {
        $messaging = app(Messaging::class);
        $messaging->subscribeToTopics($topics, self::$fcm_tokens);
        return new self();
    }

    /**
     * Unsubscribe a device token from one or more topics.
     * 
     * @param string|array $topics One or more topics to unsubscribe from.
     * 
     * @return self
     * @throws MessagingException If there is an error unsubscribing from topics.
     */
    public static function unsubscribe(string|array $topics): self
    {
        $messaging = app(Messaging::class);
        $messaging->unsubscribeFromTopics($topics, self::$fcm_tokens);
        return new self();
    }

    /**
     * Custom configurations for Android.
     *
     * Refer: https://firebase-php.readthedocs.io/en/7.15.0/cloud-messaging.html#adding-target-platform-specific-configuration 
     * 
     * @param array $config Configurations 
     * 
     * @return self
     */
    public static function android_config(array $config): self
    {
        self::$android_config = array_merge(self::$android_config, $config);
        return new self();
    }

    /**
     * Custom configurations for Apple (Apple Push Notification Service).
     *
     * Refer: https://firebase-php.readthedocs.io/en/7.15.0/cloud-messaging.html#adding-target-platform-specific-configuration 
     * 
     * @param array $config Configurations 
     * 
     * @return self
     */
    public static function apn_config(array $config): self
    {
        self::$apn_config = array_merge(self::$apn_config, $config);
        return new self();
    }

    /**
     * Custom configurations for Web.
     *
     * Refer: https://firebase-php.readthedocs.io/en/7.15.0/cloud-messaging.html#adding-target-platform-specific-configuration 
     * 
     * @param array $config Configurations 
     * 
     * @return self
     */
    public static function web_config(array $config): self
    {
        self::$web_config = array_merge(self::$web_config, $config);
        return new self();
    }

    /**
     * Set the image URL for the notification.
     *
     * @param string|null $url The URL of the image to display.
     * 
     * @return self
     */
    public static function image(?string $url): self
    {
        if ($url) {
            self::$data['image'] = $url;
        }
        return new self();
    }

    /**
     * Set the link URL for the notification.
     *
     * @param string|null $url The URL to open when the notification is clicked.
     * 
     * @return self
     */
    public static function link(?string $url): self
    {
        if ($url) {
            self::$data['link'] = $url;
        }
        return new self();
    }

    /**
     * Set the deep link URL for the notification (for opening specific content in the app).
     *
     * @param string|null $path The deep link URL to handle in the app.
     * 
     * @return self
     */
    public static function deep_link(?string $path): self
    {
        if ($path) {
            self::$data['deep_link'] = $path;
        }
        return new self();
    }
}