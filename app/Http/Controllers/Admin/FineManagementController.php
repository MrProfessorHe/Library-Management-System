<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Fine;
use App\Models\FineRule;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Mail\FineReminderMail;

class FineManagementController extends Controller
{


    public function sendReminder(User $user)
    {
        // Get all pending fines
        $pendingFines = $user->fines()->where('status', 'pending')->get();

        if ($pendingFines->isEmpty()) {
            return back()->with('error', 'No pending fines for this user.');
        }

        // Update notes with reminder date
        foreach ($pendingFines as $fine) {
            $fine->update([
                'notes' => trim(($fine->notes ?? '') . "\nReminder sent on " . now()->format('Y-m-d H:i:s'))
            ]);
        }

        // Send the reminder email
        Mail::to($user->email)->send(new FineReminderMail($user, $pendingFines));

        return back()->with('success', 'Fine reminder sent to ' . $user->name);
    }



    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('role:admin,librarian');
    }

    public function index(Request $request)
    {
        $query = User::query()
            ->withSum(['fines as pending_fines_amount' => function ($q) {
                $q->where('status', 'pending');
            }], 'amount')
            ->withSum(['fines as paid_fines_amount' => function ($q) {
                $q->where('status', 'paid');
            }], 'amount');


        if ($request->has('filter')) {
            switch ($request->filter) {
                case 'pending':
                    $query->whereHas('fines', fn($q) => $q->where('status', 'pending'));
                    break;
                case 'paid':
                    $query->whereHas('fines', fn($q) => $q->where('status', 'paid'));
                    break;
                case 'none':
                    $query->doesntHave('fines');
                    break;
            }
        }

        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('name', 'like', '%' . $request->search . '%')
                    ->orWhere('email', 'like', '%' . $request->search . '%');
            });
        }

        $users = $query->get();

        $totalPending = Fine::pending()->sum('amount');
        $totalPaid = Fine::paid()->sum('amount');

        return view('admin.fines.index', compact('users', 'totalPending', 'totalPaid'));
    }

    public function userFines(User $user)
    {
        $allFines = $user->fines()->with('lending.book')->get();

        $pendingFines = $allFines->where('status', 'pending');
        $paidFines = $allFines->where('status', 'paid');

        $totalPending = $pendingFines->sum('amount');
        $totalPaid = $paidFines->sum('amount');

        return view('admin.fines.user', compact('user', 'pendingFines', 'paidFines', 'totalPending', 'totalPaid'));
    }


    public function markAsPaid(Fine $fine)
    {
        $fine->update([
            'status' => 'paid',
            'paid_at' => now(),
        ]);

        return redirect()->route('admin.fines.index') // 👈 redirect to summary page
            ->with('success', 'Fine marked as paid successfully.');
    }


    public function waive(Fine $fine)
    {
        $fine->update([
            'status' => 'waived',
            'paid_at' => now(),
        ]);

        return redirect()->route('admin.fines.index') // 👈 back to summary
            ->with('success', 'Fine waived successfully.');
    }


    public function bulkMarkAsPaid(Request $request)
    {
        $request->validate([
            'fine_ids' => 'required|array',
            'fine_ids.*' => 'exists:fines,id',
        ]);

        Fine::whereIn('id', $request->fine_ids)->update([
            'status' => 'paid',
            'paid_at' => now(),
        ]);

        return redirect()->back()
            ->with('success', 'Selected fines marked as paid successfully.');
    }




    public function fineRules()
    {
        $rules = FineRule::orderBy('created_at', 'desc')->get();

        return view('admin.fines.rules', compact('rules'));
    }

    public function createFineRule(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'daily_rate' => 'required|numeric|min:0',
            'grace_period_days' => 'required|integer|min:0',
            'max_fine' => 'nullable|numeric|min:0',
            'description' => 'nullable|string',
        ]);

        FineRule::create($request->all());

        return redirect()->back()
            ->with('success', 'Fine rule created successfully.');
    }

    public function updateFineRule(Request $request, FineRule $rule)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'daily_rate' => 'required|numeric|min:0',
            'grace_period_days' => 'required|integer|min:0',
            'max_fine' => 'nullable|numeric|min:0',
            'description' => 'nullable|string',
            'is_active' => 'boolean',
        ]);

        $rule->update($request->all());

        return redirect()->back()
            ->with('success', 'Fine rule updated successfully.');
    }

    public function deleteFineRule(FineRule $rule)
    {
        $rule->delete();

        return redirect()->back()
            ->with('success', 'Fine rule deleted successfully.');
    }

    public function calculateAllFines()
    {
        $overdueLendings = \App\Models\Lending::overdue()->with(['user', 'book'])->get();
        $createdCount = 0;

        foreach ($overdueLendings as $lending) {
            $existingFine = $lending->fines()->pending()->first();

            if (!$existingFine) {
                $this->createFine($lending);
                $createdCount++;
            }
        }

        return redirect()->back()
            ->with('success', "Created {$createdCount} new fines for overdue books.");
    }

    private function createFine($lending)
    {
        $daysOverdue = $lending->getDaysOverdue();
        $fineRule = FineRule::active()->first();

        if (!$fineRule) {
            $amount = $daysOverdue * 5;
        } else {
            $amount = $fineRule->calculateFine($daysOverdue);
        }

        if ($amount > 0) {
            Fine::create([
                'lending_id' => $lending->id,
                'user_id' => $lending->user_id,
                'amount' => $amount,
                'days_overdue' => $daysOverdue,
                'status' => 'pending',
            ]);
        }
    }

    public function report()
    {
        $monthlyStats = Fine::selectRaw('
            YEAR(created_at) as year,
            MONTH(created_at) as month,
            COUNT(*) as total_fines,
            SUM(amount) as total_amount,
            SUM(CASE WHEN status = "paid" THEN amount ELSE 0 END) as paid_amount,
            SUM(CASE WHEN status = "pending" THEN amount ELSE 0 END) as pending_amount
        ')
            ->groupBy('year', 'month')
            ->orderBy('year', 'desc')
            ->orderBy('month', 'desc')
            ->get();

        $userStats = User::withCount(['fines as total_fines', 'fines as pending_fines' => function ($query) {
            $query->where('status', 'pending');
        }])
            ->withSum('fines as total_fine_amount')
            ->withSum(['fines as pending_fine_amount' => function ($query) {
                $query->where('status', 'pending');
            }])
            ->having('total_fines', '>', 0)
            ->orderBy('total_fine_amount', 'desc')
            ->get();

        return view('admin.fines.report', compact('monthlyStats', 'userStats'));
    }
}
