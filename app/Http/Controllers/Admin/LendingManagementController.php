<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Lending;
use App\Models\User;
use App\Models\Book;
use App\Models\Fine;
use App\Models\FineRule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LendingManagementController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('role:admin,librarian');
    }

    public function index()
    {
        $pendingLendings = Lending::with(['user', 'book'])
            ->pending()
            ->orderBy('created_at', 'desc')
            ->paginate(15);

        $approvedLendings = Lending::with(['user', 'book'])
            ->where('status', 'approved')
            ->whereNull('returned_at')
            ->orderBy('return_at', 'asc')
            ->paginate(15);

        $overdueLendings = Lending::with(['user', 'book'])
            ->overdue()
            ->orderBy('return_at', 'asc')
            ->paginate(15);

        $returnedLendings = Lending::with(['user', 'book'])
            ->whereNotNull('returned_at')
            ->orderBy('returned_at', 'desc')
            ->paginate(15);

        return view('admin.lendings.index', compact(
            'pendingLendings',
            'approvedLendings',
            'overdueLendings',
            'returnedLendings'
        ));
    }




    public function approve(Lending $lending)
    {
        $user = $lending->user;

        // Check if user can borrow more books
        if (!$user->canBorrowMoreBooks()) {
            return redirect()->back()
                ->with('error', 'User has reached maximum books limit.');
        }

        // Check if user is blocked
        if ($user->isBlocked()) {
            return redirect()->back()
                ->with('error', 'User is blocked and cannot borrow books.');
        }

        $lending->update([
            'status' => 'approved',
            'approved_at' => now(),
            'approved_by' => Auth::id(),
            'issued_at' => now(),
            'return_at' => now()->addDays($user->max_days_allowed),
        ]);

        return redirect()->back()
            ->with('success', 'Lending request approved successfully.');
    }

    public function reject(Lending $lending)
    {
        $lending->update([
            'status' => 'rejected',
            'notes' => 'Rejected by ' . Auth::user()->name . ' on ' . now()->format('Y-m-d H:i:s'),
        ]);

        return redirect()->back()
            ->with('success', 'Lending request rejected successfully.');
    }

    public function setDueDate(Request $request, Lending $lending)
    {
        $request->validate([
            'return_at' => 'required|date|after:today',
        ]);

        $lending->update([
            'return_at' => $request->return_at,
        ]);

        return redirect()->back()
            ->with('success', 'Due date updated successfully.');
    }

    public function requestBorrow(Book $book)
    {
        $user = auth()->user();

        // Check if already borrowed or requested
        $existing = Lending::where('user_id', $user->id)
            ->where('book_id', $book->id)
            ->whereIn('status', ['pending', 'approved'])
            ->exists();

        if ($existing) {
            return back()->with('error', 'You have already requested or borrowed this book.');
        }

        // Create new lending request
        Lending::create([
            'user_id' => $user->id,
            'book_id' => $book->id,
            'issued_at' => now(),
            'return_at' => now()->addDays(14),
            'status' => 'pending',
        ]);

        return back()->with('success', 'Book request submitted.');
    }

    // In LendingManagementController
    public function manageRequests(Request $request)
    {
        $search = $request->input('search');

        $query = Lending::with(['user', 'book']);

        if ($search) {
            $query->whereHas('user', function ($q) use ($search) {
                $q->where('name', 'like', "%$search%");
            });
        }

        return view('admin.lendings.index', [
            'pendingLendings' => (clone $query)->where('status', 'pending')->get(),
            'approvedLendings' => (clone $query)->where('status', 'approved')->whereNull('returned_at')->get(),
            'overdueLendings' => (clone $query)->where('status', 'approved')->whereNull('returned_at')->whereDate('return_at', '<', now())->get(),
            'returnedLendings' => (clone $query)->where('status', 'returned')->get(),
        ]);
    }


    public function markAsReturned(Lending $lending)
    {
        $lending->markAsReturned(Auth::id());

        // Calculate and create fine if overdue
        if ($lending->isOverdue()) {
            $this->createFine($lending);
        }

        return redirect()->back()
            ->with('success', 'Book marked as returned successfully.');
    }

    public function renew(Lending $lending)
    {
        if (!$lending->canBeRenewed()) {
            return redirect()->back()
                ->with('error', 'Book cannot be renewed.');
        }

        $user = $lending->user;
        $renewalDays = $user->max_days_allowed;

        $lending->renew($renewalDays);

        return redirect()->back()
            ->with('success', 'Book renewed successfully.');
    }

    public function extendDueDate(Request $request, Lending $lending)
    {
        $request->validate([
            'days' => 'required|integer|min:1|max:30',
        ]);

        $lending->update([
            'return_at' => $lending->return_at->addDays($request->days),
        ]);

        return redirect()->back()
            ->with('success', 'Due date extended successfully.');
    }

    private function createFine(Lending $lending)
    {
        $daysOverdue = $lending->getDaysOverdue();
        $fineRule = FineRule::active()->first();

        if (!$fineRule) {
            $amount = $daysOverdue * 5; // Default ₹5 per day
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

    public function show(Lending $lending)
    {
        $lending->load(['user', 'book', 'approvedBy', 'returnedTo', 'fines']);

        return view('admin.lendings.show', compact('lending'));
    }

    public function calculateFines()
    {
        $overdueLendings = Lending::overdue()->with(['user', 'book'])->get();

        foreach ($overdueLendings as $lending) {
            // Check if fine already exists
            $existingFine = $lending->fines()->pending()->first();

            if (!$existingFine) {
                $this->createFine($lending);
            }
        }

        return redirect()->back()
            ->with('success', 'Fines calculated for overdue books.');
    }
}
