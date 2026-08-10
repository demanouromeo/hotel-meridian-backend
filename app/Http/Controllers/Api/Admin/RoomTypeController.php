<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\RoomTypeResource;
use App\Models\RoomType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class RoomTypeController extends Controller
{
    public function index()
    {
        return RoomTypeResource::collection(RoomType::query()->orderBy('price_per_night')->get());
    }

    public function show(RoomType $roomType)
    {
        return new RoomTypeResource($roomType);
    }

    public function update(Request $request, RoomType $roomType)
    {
        $data = $request->validate([
            'name_en' => ['sometimes', 'string', 'max:255'],
            'name_fr' => ['sometimes', 'string', 'max:255'],
            'description_en' => ['nullable', 'string'],
            'description_fr' => ['nullable', 'string'],
            'beds' => ['sometimes', 'integer', 'min:1'],
            'baths' => ['sometimes', 'integer', 'min:1'],
            'capacity' => ['sometimes', 'integer', 'min:1'],
            'price_per_night' => ['sometimes', 'integer', 'min:0'],
            'total_units' => ['sometimes', 'integer', 'min:0'],
            'amenities' => ['sometimes', 'array'],
        ]);

        $roomType->update($data);

        return new RoomTypeResource($roomType);
    }

    public function uploadImage(Request $request, RoomType $roomType)
    {
        $request->validate([
            'image' => ['required', 'file', 'mimes:jpg,jpeg,png,webp,avif', 'max:4096'],
        ]);

        if ($roomType->image_path) {
            Storage::disk('public')->delete($roomType->image_path);
        }

        $path = $request->file('image')->store('room-types', 'public');
        $roomType->update(['image_path' => $path]);

        return new RoomTypeResource($roomType);
    }

    public function deleteImage(RoomType $roomType)
    {
        if ($roomType->image_path) {
            Storage::disk('public')->delete($roomType->image_path);
            $roomType->update(['image_path' => null]);
        }

        return new RoomTypeResource($roomType);
    }
}
