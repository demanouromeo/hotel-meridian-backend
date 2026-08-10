<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreContactMessageRequest;
use App\Mail\NewContactMessageMail;
use App\Models\ContactMessage;
use Illuminate\Support\Facades\Mail;

class ContactMessageController extends Controller
{
    public function store(StoreContactMessageRequest $request)
    {
        $contactMessage = ContactMessage::create($request->validated());

        Mail::to(config('services.hotel.contact_email'))
            ->queue(new NewContactMessageMail($contactMessage));

        return response()->json([
            'message' => 'Your message has been received. We will get back to you shortly.',
        ], 201);
    }
}
