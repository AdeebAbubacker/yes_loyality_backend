<?php

use Illuminate\Foundation\Application;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use App\Http\Middleware\PreventBackHistory;


return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        api: __DIR__ . '/../routes/api.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
        then: function () {
            // Optional code to run after routing configuration
        },
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->append(PreventBackHistory::class);;
    })
    ->withExceptions(function (Exceptions $exceptions) {
        $exceptions->render(function (Throwable $e, $request) {
            if ($request->is('api/*') || $request->routeIs('api.*')) {
                // Gather more error details
                $errorDetails = [
                    'file' => $e->getFile(),
                    'line' => $e->getLine(),
                    'trace' => $e->getTrace(), 
                    // Add any other relevant details you need
                ];

                // API request - render as JSON with more details
                return ArrayBadResp(
                    Message: $e->getMessage(),
                    RespCode: (!in_array($e->getCode(), [200, 400, 401, 403, 404, 500])) ? 500 : $e->getCode(),
                    Misc: $errorDetails, // Include the detailed error information
                    Redirect: null
                );
            }

            // Non-API request
            if ($e instanceof AuthenticationException) {
                // Handle authentication-related exceptions
                return redirect()->route('LoginView');
            }

            // Handle other exceptions (optional)
            // You can customize this part based on your needs

            // Default behavior (optional)
        });
    })
    ->create();
