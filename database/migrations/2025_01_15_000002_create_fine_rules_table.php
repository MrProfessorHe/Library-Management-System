<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('fine_rules', function (Blueprint $table) {
            $table->id();
            $table->string('name'); // e.g., "Standard Late Fee"
            $table->decimal('daily_rate', 8, 2); // Amount per day (e.g., 5.00)
            $table->integer('grace_period_days')->default(0); // Days before fine starts
            $table->decimal('max_fine', 8, 2)->nullable(); // Maximum fine amount
            $table->boolean('is_active')->default(true);
            $table->text('description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fine_rules');
    }
}; 