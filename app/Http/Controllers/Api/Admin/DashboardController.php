<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Booking;
use App\Models\RoomType;
use Illuminate\Support\Carbon;

class DashboardController extends Controller
{
    public function stats()
    {
        $today = Carbon::today();

        $totalUnits = RoomType::query()->sum('total_units');

        $occupiedTonight = Booking::query()
            ->whereIn('status', ['confirmed', 'checked_in'])
            ->where('check_in', '<=', $today)
            ->where('check_out', '>', $today)
            ->count();

        return response()->json([
            'todays_arrivals' => Booking::query()->whereDate('check_in', $today)->whereIn('status', ['confirmed', 'pending_payment'])->count(),
            'todays_departures' => Booking::query()->whereDate('check_out', $today)->where('status', 'checked_in')->count(),
            'occupancy_rate' => $totalUnits > 0 ? round(($occupiedTonight / $totalUnits) * 100, 1) : 0,
            'pending_payment_bookings' => Booking::query()->where('status', 'pending_payment')->count(),
            'revenue_this_month' => Booking::query()
                ->whereIn('status', ['confirmed', 'checked_in', 'checked_out'])
                ->whereMonth('created_at', $today->month)
                ->whereYear('created_at', $today->year)
                ->sum('total_price'),
        ]);
    }
}
