<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\ServiceResource;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ServiceController extends Controller
{
    public function index()
    {
        return ServiceResource::collection(Service::query()->orderBy('starting_price')->get());
    }

    public function update(Request $request, Service $service)
    {
        $data = $request->validate([
            'name_en' => ['sometimes', 'string', 'max:255'],
            'name_fr' => ['sometimes', 'string', 'max:255'],
            'description_en' => ['nullable', 'string'],
            'description_fr' => ['nullable', 'string'],
            'starting_price' => ['sometimes', 'integer', 'min:0'],
            'is_active' => ['sometimes', 'boolean'],
        ]);

        $service->update($data);

        return new ServiceResource($service);
    }

    public function uploadImage(Request $request, Service $service)
    {
        $request->validate([
            'image' => ['required', 'file', 'mimes:jpg,jpeg,png,webp,avif', 'max:4096'],
        ]);

        if ($service->image_path) {
            Storage::disk('public')->delete($service->image_path);
        }

        $path = $request->file('image')->store('services', 'public');
        $service->update(['image_path' => $path]);

        return new ServiceResource($service);
    }

    public function deleteImage(Service $service)
    {
        if ($service->image_path) {
            Storage::disk('public')->delete($service->image_path);
            $service->update(['image_path' => null]);
        }

        return new ServiceResource($service);
    }
}
