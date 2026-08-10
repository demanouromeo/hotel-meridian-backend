<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\DiningServiceResource;
use App\Models\DiningService;
use Illuminate\Http\Request;

class DiningServiceController extends Controller
{
    public function index()
    {
        return DiningServiceResource::collection(DiningService::query()->orderBy('price_per_guest_per_night')->get());
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name_en' => ['required', 'string', 'max:255'],
            'name_fr' => ['required', 'string', 'max:255'],
            'description_en' => ['nullable', 'string'],
            'description_fr' => ['nullable', 'string'],
            'price_per_guest_per_night' => ['required', 'integer', 'min:0'],
            'is_active' => ['sometimes', 'boolean'],
        ]);

        $diningService = DiningService::create($data);

        return new DiningServiceResource($diningService);
    }

    public function update(Request $request, DiningService $diningService)
    {
        $data = $request->validate([
            'name_en' => ['sometimes', 'string', 'max:255'],
            'name_fr' => ['sometimes', 'string', 'max:255'],
            'description_en' => ['nullable', 'string'],
            'description_fr' => ['nullable', 'string'],
            'price_per_guest_per_night' => ['sometimes', 'integer', 'min:0'],
            'is_active' => ['sometimes', 'boolean'],
        ]);

        $diningService->update($data);

        return new DiningServiceResource($diningService);
    }

    public function destroy(DiningService $diningService)
    {
        $diningService->delete();

        return response()->json(status: 204);
    }
}
