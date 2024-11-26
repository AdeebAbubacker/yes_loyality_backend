<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'postmark' => [
        'token' => env('POSTMARK_TOKEN'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],

    'firebase_credentials' => [
        "type" => "service_account",
        "project_id" => "yes-yes-loyalty",
        "private_key_id" => "bcd16bd910a32f8392ed57e56d517a2d2bcfd0f3",
        "private_key" => "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDWAySwL72a27dW\n4gkeHyRde3hIB0fckR/0KS/TzTrNRaak4uXytW+SeUTG4S5rLyzrXO3wYnCVBrL1\nVk/5FcfKTMLcS4B5UPuY5DEtnIaUmJybefnzSmnWcmKwN+qYJGrbuvjofbBxI69o\nPLkF8GATJ+l0AUz7Kuagu/14/6IAHVwabkJNSkk91yy0cDu8vonGrC+gpby+fBeQ\nElixUpuvZSft2GfQ7Xgdg+3Nv61dny3OUXR4VbS7PH/0zbpdCgTb2MACbkpBgf4S\ne1s4V8PocMI6FpEt+T5hY+3OqLpW/PxVEqhmMpf9MekvwJjYXrGLYlRzv6Y84hsm\nb9mXkBmZAgMBAAECgf8mhj+pzO4/XM3kFfcONQzsHGMf6YTwxNm7r1kCB4T47qYm\nMwdcaXdsJpL65LjhEoeY1rb+TrogGX9IKqwQFUZMZFpaIufoRBZbr2LVkxem0tII\n1YGTtLwt85P6+hXWIrgZqyP4tfzNC7THpCaqVbBLF87ZKGLIfoXa6VGiNmIzIsFb\nO8JjPEPMKIm9JtAZUlpvokF1nsY2otEx4ILCQKjSaCsuZ4CDyS66SbgCFpwp6CPs\niZoRZO1Q6mhYUZgJbDTe1bEwjpzJ815Oh8P9RtFIEdV2JjmLCJfzDguXX9/mGZqp\nJu0dDJA6y2xCbLdtbGWayuHK3Y1u2vfmq+k9hZ0CgYEA/C6fu9s9R0aWQ8bsCyfs\nRQD/2HjqV1DuDS1hc7B/NsZxMbC9EVueY/vVLe8L9fxuiUxBRpXJuSxTpm9CtY98\nlskn1G5TXFQ87ZYcUbINjfBiIFv7xvOEvERcekd/fE+aiq8vhUp0ukxHX7HOOKjg\n0+AxaKsLaTh647f/gjDH1y0CgYEA2UCV3jFFGdr6iEiV9NxKbtsKLPkz2SidJbZU\nF6JQYFRyZNoY7kkew4GsRO/541jDjda3ncp/DHGxccQriCbORvKFDqAlSYRMD4TN\nvQgjeMVMfKj2HAYZA9P81VHoKJq8stx6fq6gpQ3T7pKzFnm1d6sQlw8VY6JPsSVx\n2Qxrj50CgYEA+F1u4hQlgOorGetzE/Wow7kdQPStT3ucSAwWu1rrn2XHm7nGK69B\nCpW+ufOBoy2PK9eXPk5NkvruE6/mUmxTtym7+YMCxJ8ONqwtjeQ/ZziFW/tbt/Ck\nHMtzDNcX3rWDreylb7AJ0GVJshyqzrC8ZM+bucsjfOisV1Qi5/TlDK0CgYAwTxFE\nSDZyamQdW+6kdTvD7McVexCRcFuJYELQwpIW6ZBKZsj2a6IAnVweNDKf4EQTzTQl\nTTr1HG71ukZnzyE9W35E402HTHjRVpmdOCsTFuRMMBIR5zU2ybPGB6GVLdtZ9nby\npogoS6vduBdEnynAA3T78imybwxDeu0W85ETbQKBgQCyGTpF1PRDtn2CJ6PHdlKZ\nmgz4vsAV40wIsAyyyNKx9cLPLxC6ZVq3QhFsOHmdTb/m6HL1nUoE5v6giZd47jh9\nDC/dxBiOkcQZH+T4oLGdMO2G9PRzCYHHR47swr+3vuBSkfiRmkn5vPe4kYjYtS3K\nGVyHNaNNICYFShz+B6OyfQ==\n-----END PRIVATE KEY-----\n",
        "client_email" => "firebase-adminsdk-xk9p3@yes-yes-loyalty.iam.gserviceaccount.com",
        "client_id" => "116535907257376883314",
        "auth_uri" => "https://accounts.google.com/o/oauth2/auth",
        "token_uri" => "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url" => "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url" => "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-xk9p3%40yes-yes-loyalty.iam.gserviceaccount.com",
        "universe_domain" => "googleapis.com"
    ],
];
