<?php

namespace App\Services;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use RuntimeException;

/**
 * Thin client for the Campay collection API (MTN Mobile Money / Orange Money).
 * Docs: https://www.campay.net/en/documentation
 */
class CampayService
{
    private string $baseUrl;

    public function __construct()
    {
        $this->baseUrl = rtrim(config('services.campay.base_url'), '/');
    }

    private function token(): string
    {
        return Cache::remember('campay_token', now()->addMinutes(50), function () {
            $response = Http::asForm()->post("{$this->baseUrl}/token/", [
                'username' => config('services.campay.username'),
                'password' => config('services.campay.password'),
            ]);

            if (! $response->successful()) {
                throw new RuntimeException('Unable to authenticate with Campay: '.$response->body());
            }

            return $response->json('token');
        });
    }

    /**
     * Request a Mobile Money / Orange Money collection (pushes a USSD prompt to the guest's phone).
     */
    public function collect(string $phoneNumber, int $amount, string $externalReference, string $description): array
    {
        $response = Http::withToken($this->token())
            ->post("{$this->baseUrl}/collect/", [
                'amount' => (string) $amount,
                'currency' => 'XAF',
                'from' => $phoneNumber,
                'description' => $description,
                'external_reference' => $externalReference,
            ]);

        if (! $response->successful()) {
            throw new RuntimeException('Campay collect request failed: '.$response->body());
        }

        return $response->json();
    }

    /**
     * Authoritative status lookup — used to confirm a webhook payload rather than trusting it blindly.
     */
    public function transactionStatus(string $campayReference): array
    {
        $response = Http::withToken($this->token())
            ->get("{$this->baseUrl}/transaction/status/{$campayReference}/");

        if (! $response->successful()) {
            throw new RuntimeException('Campay status lookup failed: '.$response->body());
        }

        return $response->json();
    }
}
