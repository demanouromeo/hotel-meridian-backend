<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Booking;
use App\Models\RoomType;
use App\Models\Service;
use App\Models\ServiceReservation;
use Illuminate\Support\Carbon;

class DashboardController extends Controller
{
    private const ACTIVE_STATUSES = ['confirmed', 'checked_in', 'checked_out'];

    public function stats()
    {
        $today = Carbon::today();

        $totalUnits = RoomType::query()->sum('total_units');

        $occupiedTonight = Booking::query()
            ->whereIn('status', ['confirmed', 'checked_in'])
            ->where('check_in', '<=', $today)
            ->where('check_out', '>', $today)
            ->count();

        $monthlyBookings = Booking::query()
            ->whereIn('status', self::ACTIVE_STATUSES)
            ->whereMonth('created_at', $today->month)
            ->whereYear('created_at', $today->year);

        $revenueThisMonth = (int) (clone $monthlyBookings)->sum('total_price');
        $bookingsThisMonth = (clone $monthlyBookings)->count();

        $summary = [
            'todays_arrivals' => Booking::query()
                ->whereDate('check_in', $today)
                ->whereIn('status', ['confirmed', 'pending_payment'])
                ->count(),
            'todays_departures' => Booking::query()
                ->whereDate('check_out', $today)
                ->where('status', 'checked_in')
                ->count(),
            'occupancy_rate' => $totalUnits > 0 ? round(($occupiedTonight / $totalUnits) * 100, 1) : 0,
            'pending_payment_bookings' => Booking::query()->where('status', 'pending_payment')->count(),
            'revenue_this_month' => $revenueThisMonth,
            'bookings_this_month' => $bookingsThisMonth,
            'avg_booking_value' => $bookingsThisMonth > 0 ? (int) round($revenueThisMonth / $bookingsThisMonth) : 0,
            'service_reservations_this_month' => ServiceReservation::query()
                ->where('status', 'confirmed')
                ->whereMonth('created_at', $today->month)
                ->whereYear('created_at', $today->year)
                ->count(),
        ];

        $rangeStart = $today->copy()->subDays(29);

        $dailyRows = Booking::query()
            ->selectRaw('DATE(created_at) as date, SUM(total_price) as revenue, COUNT(*) as bookings')
            ->whereIn('status', self::ACTIVE_STATUSES)
            ->where('created_at', '>=', $rangeStart->copy()->startOfDay())
            ->groupBy('date')
            ->get()
            ->keyBy('date');

        $revenueTrend = [];
        for ($date = $rangeStart->copy(); $date->lte($today); $date->addDay()) {
            $key = $date->toDateString();
            $row = $dailyRows->get($key);
            $revenueTrend[] = [
                'date' => $key,
                'revenue' => $row ? (int) $row->revenue : 0,
                'bookings' => $row ? (int) $row->bookings : 0,
            ];
        }

        $roomTypeBreakdown = RoomType::query()
            ->withCount(['bookings as bookings_count' => function ($query) use ($today) {
                $query->whereIn('status', self::ACTIVE_STATUSES)
                    ->whereMonth('created_at', $today->month)
                    ->whereYear('created_at', $today->year);
            }])
            ->withSum(['bookings as bookings_revenue' => function ($query) use ($today) {
                $query->whereIn('status', self::ACTIVE_STATUSES)
                    ->whereMonth('created_at', $today->month)
                    ->whereYear('created_at', $today->year);
            }], 'total_price')
            ->orderByDesc('bookings_revenue')
            ->get()
            ->map(fn (RoomType $roomType) => [
                'code' => $roomType->code,
                'name_en' => $roomType->name_en,
                'name_fr' => $roomType->name_fr,
                'bookings' => $roomType->bookings_count,
                'revenue' => (int) ($roomType->bookings_revenue ?? 0),
            ])
            ->values();

        $bookingStatusBreakdown = Booking::query()
            ->selectRaw('status, COUNT(*) as count')
            ->groupBy('status')
            ->pluck('count', 'status');

        $topServices = Service::query()
            ->withCount(['reservations as reservations_count' => function ($query) use ($today) {
                $query->where('status', 'confirmed')
                    ->whereMonth('created_at', $today->month)
                    ->whereYear('created_at', $today->year);
            }])
            ->orderByDesc('reservations_count')
            ->get()
            ->map(fn (Service $service) => [
                'code' => $service->code,
                'name_en' => $service->name_en,
                'name_fr' => $service->name_fr,
                'reservations' => $service->reservations_count,
            ])
            ->values();

        return response()->json([
            'summary' => $summary,
            'revenue_trend' => $revenueTrend,
            'room_type_breakdown' => $roomTypeBreakdown,
            'booking_status_breakdown' => $bookingStatusBreakdown,
            'top_services' => $topServices,
        ]);
    }
}
