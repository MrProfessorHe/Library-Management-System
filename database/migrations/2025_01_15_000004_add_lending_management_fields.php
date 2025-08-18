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
        Schema::table('lendings', function (Blueprint $table) {
            $table->timestamp('returned_at')->nullable()->after('return_at');
            $table->foreignId('approved_by')->nullable()->constrained('users')->after('returned_at');
            $table->foreignId('returned_to')->nullable()->constrained('users')->after('approved_by');
            $table->text('notes')->nullable()->after('returned_to');
            $table->integer('renewal_count')->default(0)->after('notes');
            $table->timestamp('last_renewed_at')->nullable()->after('renewal_count');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('lendings', function (Blueprint $table) {
            $table->dropForeign(['approved_by', 'returned_to']);
            $table->dropColumn(['returned_at', 'approved_by', 'returned_to', 'notes', 'renewal_count', 'last_renewed_at']);
        });
    }
}; 