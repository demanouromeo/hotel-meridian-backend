<?php

use Illuminate\Support\Facades\Route;

// The React SPA is built into public/ (see frontend/package.json "deploy:build").
// Anything that isn't an API route or an existing static file falls through to
// index.html so React Router can handle client-side routes like /rooms/standard.
Route::get('/{any?}', function () {
    $indexPath = public_path('index.html');

    if (! file_exists($indexPath)) {
        return response('Frontend build not found. Run the frontend build and copy dist/ into public/.', 404);
    }

    return response(file_get_contents($indexPath), 200)->header('Content-Type', 'text/html');
})->where('any', '^(?!api).*$');
