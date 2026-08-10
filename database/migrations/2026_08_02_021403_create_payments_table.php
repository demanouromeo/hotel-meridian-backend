<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('booking_id')->constrained()->cascadeOnDelete();
            $table->string('aggregator')->default('campay');
            $table->string('operator')->nullable();
            $table->string('campay_reference')->nullable()->index();
            $table->unsignedInteger('amount');
            $table->string('currency', 3)->default('XAF');
            $table->string('phone_number');
            $table->enum('status', ['initiated', 'pending', 'successful', 'failed'])->default('initiated');
            $table->json('raw_payload')->nullable();
            $table->timestamp('paid_at')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('payments');
    }
};
