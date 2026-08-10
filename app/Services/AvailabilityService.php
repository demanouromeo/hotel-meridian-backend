<?php

namespace App\Services;

use App\Models\Booking;
use App\Models\RoomType;
use Carbon\CarbonInterface;

class AvailabilityService
{
    /**
     * Number of active (unreleased) bookings overlapping the given date range for a room type.
     */
    public function bookedUnits(RoomType $roomType, CarbonInterface $checkIn, CarbonInterface $checkOut): int
    {
        return Booking::query()
            ->where('room_type_id', $roomType->id)
            ->whereIn('status', ['pending_payment', 'confirmed', 'checked_in'])
            ->where('check_in', '<', $checkOut)
            ->where('check_out', '>', $checkIn)
            ->count();
    }

    public function availableUnits(RoomType $roomType, CarbonInterface $checkIn, CarbonInterface $checkOut): int
    {
        return max(0, $roomType->total_units - $this->bookedUnits($roomType, $checkIn, $checkOut));
    }

    public function isAvailable(RoomType $roomType, CarbonInterface $checkIn, CarbonInterface $checkOut, int $unitsNeeded = 1): bool
    {
        return $this->availableUnits($roomType, $checkIn, $checkOut) >= $unitsNeeded;
    }
}
