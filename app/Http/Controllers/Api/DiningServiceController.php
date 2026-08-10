<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\DiningServiceResource;
use App\Models\DiningService;

class DiningServiceController extends Controller
{
    public function index()
    {
        return DiningServiceResource::collection(
            DiningService::query()->where('is_active', true)->orderBy('price_per_guest_per_night')->get()
        );
    }
}
