<?php

namespace App\Http\Controllers;

use App\Models\Lending;
use App\Models\Book;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon; // <-- Make sure this is imported

class LendingController extends Controller
{
    /**
     * Display a listing of the lending resources for the admin panel.
     * This method handles searching and categorization efficiently.
     */
    public function index(Request $request)
    {
        $searchTerm = $request->input('search');

        // Start with a base query and eager load relationships for performance
        $baseQuery = Lending::with(['user', 'book'])->latest();

        // Apply the search filter to the query builder if a search term exists
        if ($searchTerm) {
            $baseQuery->whereHas('user', function ($query) use ($searchTerm) {
                $query->where('name', 'like', '%' . $searchTerm . '%');
            });
        }

        // Clone the query builder to run a specific, efficient query for each section
        $pendingLendings = (clone $baseQuery)->where('status', 'pending')->get();

        $approvedLendings = (clone $baseQuery)
            ->where('status', 'approved')
            ->whereNull('returned_at')
            ->get();

        $overdueLendings = (clone $baseQuery)
            ->where('status', 'approved')
            ->where('return_at', '<', Carbon::now())
            ->whereNull('returned_at')
            ->get();
            
        $returnedLendings = (clone $baseQuery)->where('status', 'returned')->get();

        // Pass the correctly filtered data collections to the view
        return view('admin.lendings.index', compact(
            'pendingLendings',
            'approvedLendings',
            'overdueLendings',
            'returnedLendings'
        ));
    }

    /**
     * Allows a user to request to borrow a book.
     */
    public function requestBorrow(Book $book)
    {
        $userId = Auth::id();

        // Check for sufficient quantity before anything else
        if ($book->quantity < 1) {
            return redirect()->back()->with('error', 'Sorry, there are no available copies of this book.');
        }

        // CORRECTED LOGIC: Check if the user has an active (not returned) lending for this book.
        $existing = Lending::where('book_id', $book->id)
            ->where('user_id', $userId)
            ->whereNull('returned_at') // This single check covers both pending and approved books
            ->first();

        if ($existing) {
            $statusMessage = $existing->status === 'pending' ? 'requested' : 'borrowed';
            return redirect()->back()->with('error', "You have already {$statusMessage} this book.");
        }

        // Create a new request
        Lending::create([
            'book_id' => $book->id,
            'user_id' => $userId,
            'status' => 'pending',
        ]);

        return redirect()->back()->with('success', 'Your request has been sent to the admin.');
    }

    /**
     * Approve a pending lending request.
     */
    public function approve(Lending $lending)
    {
        if ($lending->status !== 'pending') {
            return redirect()->back()->with('error', 'This request has already been handled.');
        }

        $book = $lending->book;

        if ($book->quantity < 1) {
            $lending->update(['status' => 'rejected']); // Auto-reject if stock is gone
            return redirect()->back()->with('error', 'No available copies. The request has been rejected.');
        }

        $lending->update([
            'status' => 'approved',
            'approved_at' => now(),
            'issued_at' => now(),
            'return_at' => now()->addDays(7), // Set a 7-day return period
        ]);

        $book->decrement('quantity');

        return redirect()->back()->with('success', 'Book issued successfully.');
    }

    /**
     * Reject a pending lending request.
     */
    public function reject(Lending $lending)
    {
        if ($lending->status !== 'pending') {
            return redirect()->back()->with('error', 'This request has already been handled.');
        }

        $lending->update(['status' => 'rejected']);

        return redirect()->back()->with('success', 'Lending request rejected.');
    }

    // Note: The methods `manage()` and `manageRequests()` are now redundant
    // because their functionality is fully handled by the improved `index()` method.
    // It is recommended to remove them and update your routes accordingly.
}