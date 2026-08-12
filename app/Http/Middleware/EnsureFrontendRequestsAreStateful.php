<?php

namespace App\Http\Middleware;

use Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful as SanctumEnsureFrontendRequestsAreStateful;

class EnsureFrontendRequestsAreStateful extends SanctumEnsureFrontendRequestsAreStateful
{
    /**
     * Sanctum's own implementation hardcodes session.same_site to "lax" on
     * every request, silently overriding SESSION_SAME_SITE from .env. That
     * works for the website (hotelmeridian.dmsacad.com -> dmsacad.com is
     * same-site), but the Capacitor Android app's origin (https://localhost)
     * is genuinely cross-site, so a forced "lax" cookie never makes it back
     * to the app — this override lets the configured value through instead.
     */
    protected function configureSecureCookieSessions()
    {
        config([
            'session.http_only' => true,
            'session.same_site' => config('session.same_site', 'lax'),
        ]);
    }
}
