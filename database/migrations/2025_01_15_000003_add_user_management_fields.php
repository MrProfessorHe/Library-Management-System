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
        Schema::table('users', function (Blueprint $table) {
            $table->enum('status', ['active', 'blocked', 'pending'])->default('active')->after('role');
            $table->timestamp('blocked_at')->nullable()->after('status');
            $table->text('block_reason')->nullable()->after('blocked_at');
            $table->integer('max_books_allowed')->default(3)->after('block_reason');
            $table->integer('max_days_allowed')->default(14)->after('max_books_allowed');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn(['status', 'blocked_at', 'block_reason', 'max_books_allowed', 'max_days_allowed']);
        });
    }
}; 