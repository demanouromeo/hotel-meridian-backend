<?php

return [

    'paths' => ['api/*', 'sanctum/csrf-cookie'],

    'allowed_methods' => ['*'],

    'allowed_origins' => array_merge(
        explode(',', env('CORS_ALLOWED_ORIGINS', 'http://localhost:5173')),
        [
            // Mobile app WebView origins (Capacitor) — not environment-specific,
            // always allowed alongside whatever CORS_ALLOWED_ORIGINS lists.
            'https://localhost',
            'capacitor://localhost',
        ],
    ),

    'allowed_origins_patterns' => [],

    'allowed_headers' => ['*'],

    'exposed_headers' => [],

    'max_age' => 0,

    'supports_credentials' => true,

];
