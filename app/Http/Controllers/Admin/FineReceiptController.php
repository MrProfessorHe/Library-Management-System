<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Models\User;

class FineReceiptController extends Controller
{
    public function downloadReceipt($userId)
    {
        $user = User::with(['fines' => function($query) {
            $query->where('status', 'paid')->with('lending.book');
        }])->findOrFail($userId);

        if ($user->fines->isEmpty()) {
            return back()->with('error', 'No paid fines found for this user.');
        }

        $pdf = Pdf::loadView('admin.fines.fine_receipt', [
            'user' => $user,
            'fines' => $user->fines
        ]);

        return $pdf->stream('receipt_' . $user->id . '.pdf');
    }
}

