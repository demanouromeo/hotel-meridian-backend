<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\RoomTypeResource;
use App\Models\RoomType;
use App\Services\AvailabilityService;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class RoomTypeController extends Controller
{
    public function __construct(private readonly AvailabilityService $availability) {}

    public function index(Request $request)
    {
        $request->validate([
            'check_in' => ['nullable', 'date'],
            'check_out' => ['nullable', 'date', 'after:check_in'],
        ]);

        $roomTypes = RoomType::query()->orderBy('price_per_night')->get();

        if ($request->filled('check_in') && $request->filled('check_out')) {
            $checkIn = Carbon::parse($request->input('check_in'));
            $checkOut = Carbon::parse($request->input('check_out'));

            $roomTypes->each(function (RoomType $roomType) use ($checkIn, $checkOut) {
                $roomType->available_units = $this->availability->availableUnits($roomType, $checkIn, $checkOut);
            });
        }

        return RoomTypeResource::collection($roomTypes);
    }

    public function show(RoomType $roomType)
    {
        return new RoomTypeResource($roomType);
    }
}
