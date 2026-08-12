<?php

use App\Http\Controllers\Api\Admin\AuthController as AdminAuthController;
use App\Http\Controllers\Api\Admin\BookingController as AdminBookingController;
use App\Http\Controllers\Api\Admin\ContactMessageController as AdminContactMessageController;
use App\Http\Controllers\Api\Admin\DashboardController as AdminDashboardController;
use App\Http\Controllers\Api\Admin\DiningServiceController as AdminDiningServiceController;
use App\Http\Controllers\Api\Admin\PaymentController as AdminPaymentController;
use App\Http\Controllers\Api\Admin\RoomController as AdminRoomController;
use App\Http\Controllers\Api\Admin\RoomTypeController as AdminRoomTypeController;
use App\Http\Controllers\Api\Admin\ServiceController as AdminServiceController;
use App\Http\Controllers\Api\Admin\ServiceReservationController as AdminServiceReservationController;
use App\Http\Controllers\Api\Admin\SettingController as AdminSettingController;
use App\Http\Controllers\Api\BookingController;
use App\Http\Controllers\Api\ContactMessageController;
use App\Http\Controllers\Api\DiningServiceController;
use App\Http\Controllers\Api\PaymentWebhookController;
use App\Http\Controllers\Api\RoomTypeController;
use App\Http\Controllers\Api\ServiceController;
use App\Http\Controllers\Api\ServiceReservationController;
use App\Http\Controllers\Api\SettingController;
use Illuminate\Support\Facades\Route;
use Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful;

// Public
Route::get('/room-types', [RoomTypeController::class, 'index']);
Route::get('/room-types/{roomType:code}', [RoomTypeController::class, 'show']);
Route::get('/dining-services', [DiningServiceController::class, 'index']);
Route::get('/settings', [SettingController::class, 'index']);
Route::post('/contact', [ContactMessageController::class, 'store'])->middleware('throttle:5,1');

Route::post('/bookings', [BookingController::class, 'store'])->middleware('throttle:10,1');
Route::post('/bookings/{reference}/pay', [BookingController::class, 'pay'])->middleware('throttle:10,1');
Route::get('/bookings/{reference}', [BookingController::class, 'show']);
Route::get('/bookings/{reference}/status', [BookingController::class, 'status']);

Route::post('/webhooks/payments/campay', [PaymentWebhookController::class, 'campay']);

Route::get('/services', [ServiceController::class, 'index']);
Route::get('/services/{service:code}/reservations', [ServiceReservationController::class, 'reservedDates']);
Route::post('/services/{service:code}/reservations', [ServiceReservationController::class, 'store'])
    ->middleware('throttle:10,1');
Route::get('/service-reservations/{reference}', [ServiceReservationController::class, 'show']);
Route::post('/service-reservations/{reference}/cancel', [ServiceReservationController::class, 'cancel'])
    ->middleware('throttle:10,1');

// Password reset is token-based, not session-based, so it stays outside the
// Sanctum-stateful group like the other public routes above.
Route::post('/admin/forgot-password', [AdminAuthController::class, 'forgotPassword'])->middleware('throttle:5,1');
Route::post('/admin/reset-password', [AdminAuthController::class, 'resetPassword'])->middleware('throttle:5,1');

// The Capacitor Android app authenticates with a Sanctum personal access
// token instead of the cookie/session flow below — its page origin
// (https://localhost) is a different site than the API's, so it can never
// read back the session's CSRF cookie (a browser same-origin restriction,
// not something any server-side config can work around). This endpoint is
// deliberately stateless/outside the stateful group: no session, no CSRF.
Route::post('/admin/mobile-login', [AdminAuthController::class, 'mobileLogin'])->middleware('throttle:5,1');

// Admin — session-based SPA auth via Sanctum, scoped so public routes above stay
// fully stateless (no session/CSRF requirement for anonymous guest requests).
// This only ever applies to the website: Origin/Referer has to match
// SANCTUM_STATEFUL_DOMAINS (hotelmeridian.dmsacad.com) to engage at all, and
// the app's requests (Origin: https://localhost, Bearer token instead of a
// cookie) never match, so they pass straight through to auth:sanctum below
// as plain token-authenticated requests.
Route::middleware(EnsureFrontendRequestsAreStateful::class)->group(function () {
    Route::post('/admin/login', [AdminAuthController::class, 'login'])->middleware('throttle:5,1');

    Route::middleware(['auth:sanctum', 'staff'])->prefix('admin')->group(function () {
        Route::post('/logout', [AdminAuthController::class, 'logout']);
        Route::get('/me', [AdminAuthController::class, 'me']);
        Route::put('/password', [AdminAuthController::class, 'updatePassword']);
        Route::put('/profile', [AdminAuthController::class, 'updateProfile']);

        Route::get('/room-types', [AdminRoomTypeController::class, 'index']);
        Route::get('/room-types/{roomType:code}', [AdminRoomTypeController::class, 'show']);
        Route::put('/room-types/{roomType:code}', [AdminRoomTypeController::class, 'update']);
        Route::post('/room-types/{roomType:code}/image', [AdminRoomTypeController::class, 'uploadImage']);
        Route::delete('/room-types/{roomType:code}/image', [AdminRoomTypeController::class, 'deleteImage']);

        Route::apiResource('rooms', AdminRoomController::class)->except(['show']);

        Route::apiResource('dining-services', AdminDiningServiceController::class)->except(['show']);

        Route::get('/bookings', [AdminBookingController::class, 'index']);
        Route::get('/bookings/{booking}', [AdminBookingController::class, 'show']);
        Route::put('/bookings/{booking}', [AdminBookingController::class, 'update']);

        Route::get('/payments', [AdminPaymentController::class, 'index']);

        Route::get('/contact-messages', [AdminContactMessageController::class, 'index']);
        Route::put('/contact-messages/{contactMessage}', [AdminContactMessageController::class, 'update']);

        Route::get('/services', [AdminServiceController::class, 'index']);
        Route::put('/services/{service:code}', [AdminServiceController::class, 'update']);
        Route::post('/services/{service:code}/image', [AdminServiceController::class, 'uploadImage']);
        Route::delete('/services/{service:code}/image', [AdminServiceController::class, 'deleteImage']);

        Route::get('/service-reservations', [AdminServiceReservationController::class, 'index']);
        Route::put('/service-reservations/{serviceReservation}', [AdminServiceReservationController::class, 'update']);

        Route::get('/settings', [AdminSettingController::class, 'index']);
        Route::put('/settings', [AdminSettingController::class, 'update']);

        Route::get('/dashboard-stats', [AdminDashboardController::class, 'stats']);
    });
});
