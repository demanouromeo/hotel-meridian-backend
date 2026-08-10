<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Room;
use Illuminate\Http\Request;

class RoomController extends Controller
{
    public function index(Request $request)
    {
        $rooms = Room::query()
            ->with('roomType')
            ->when($request->filled('room_type_id'), fn ($q) => $q->where('room_type_id', $request->input('room_type_id')))
            ->orderBy('room_number')
            ->get();

        return response()->json($rooms);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'room_type_id' => ['required', 'integer', 'exists:room_types,id'],
            'room_number' => ['required', 'string', 'max:20', 'unique:rooms,room_number'],
            'floor' => ['nullable', 'integer'],
            'status' => ['sometimes', 'in:available,maintenance,out_of_service'],
        ]);

        $room = Room::create($data);

        return response()->json($room->load('roomType'), 201);
    }

    public function update(Request $request, Room $room)
    {
        $data = $request->validate([
            'room_type_id' => ['sometimes', 'integer', 'exists:room_types,id'],
            'room_number' => ['sometimes', 'string', 'max:20', 'unique:rooms,room_number,'.$room->id],
            'floor' => ['nullable', 'integer'],
            'status' => ['sometimes', 'in:available,maintenance,out_of_service'],
        ]);

        $room->update($data);

        return response()->json($room->load('roomType'));
    }

    public function destroy(Room $room)
    {
        $room->delete();

        return response()->json(status: 204);
    }
}
