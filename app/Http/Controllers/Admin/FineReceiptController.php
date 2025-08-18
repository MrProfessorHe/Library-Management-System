<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Models\Fine;

class FineReceiptController extends Controller
{
    public function downloadReceipt($id)
    {
        $fine = Fine::with('user', 'lending.book')->findOrFail($id);

        $pdf = Pdf::loadView('admin.fines.fine_receipt', compact('fine'));

        return $pdf->stream('fine_receipt_' . $fine->id . '.pdf'); // opens directly
    }
}
