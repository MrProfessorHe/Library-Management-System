<?php

namespace App\Http\Controllers;

use App\Models\Lending;
use App\Models\Book;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

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
        $user = Auth::user();

        // Check if user account is blocked
        if ($this->isUserBlocked($user)) {
            return redirect()->back()->with('error', 'Your account has been blocked. Please contact administrator.');
        }

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

        // Check if user can borrow more books (respect max_books_allowed)
        if (!$this->canUserBorrowMoreBooks($user)) {
            $maxBooks = $user->max_books_allowed ?? 3;
            return redirect()->back()->with('error', "You have reached your maximum borrowing limit of {$maxBooks} books.");
        }

        // Create a new request WITH dates
        Lending::create([
            'book_id' => $book->id,
            'user_id' => $userId,
            'issued_at' => now(), // Add issued date
            'return_at' => now()->addDays(14), // Add return date (14 days from now)
            'status' => 'pending',
        ]);

        return redirect()->back()->with('success', 'Your request has been sent to the admin.');
    }

    /**
     * Approve a pending lending request.
     */
    public function approve(Lending $lending)
    {
        $user = $lending->user;

        if ($lending->status !== 'pending') {
            return redirect()->back()->with('error', 'This request has already been handled.');
        }

        // Check if user account is blocked
        if ($this->isUserBlocked($user)) {
            $lending->update([
                'status' => 'rejected',
                'notes' => 'Auto-rejected: User account is blocked'
            ]);
            return redirect()->back()->with('error', 'Cannot approve request. User account is blocked.');
        }

        $book = $lending->book;

        if ($book->quantity < 1) {
            $lending->update(['status' => 'rejected']); // Auto-reject if stock is gone
            return redirect()->back()->with('error', 'No available copies. The request has been rejected.');
        }

        // Check if user can borrow more books
        if (!$this->canUserBorrowMoreBooks($user)) {
            $lending->update([
                'status' => 'rejected',
                'notes' => 'Auto-rejected: User has reached borrowing limit'
            ]);
            $maxBooks = $user->max_books_allowed ?? 3;
            return redirect()->back()->with('error', "User has reached maximum borrowing limit of {$maxBooks} books. Request rejected.");
        }

        $lending->update([
            'status' => 'approved',
            'approved_at' => now(),
            'issued_at' => now(), // Ensure issued date is set
            'return_at' => now()->addDays($user->max_days_allowed ?? 7), // Use user's max_days_allowed or default 7
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

        $lending->update([
            'status' => 'rejected',
            'notes' => 'Rejected by admin'
        ]);

        return redirect()->back()->with('success', 'Lending request rejected.');
    }

    /**
     * Check if user account is blocked
     */
    private function isUserBlocked(User $user): bool
    {
        // Check both status field and blocked_at timestamp for redundancy
        return $user->status === 'blocked' || $user->blocked_at !== null;
    }

    /**
     * Check if user can borrow more books based on max_books_allowed
     */
    private function canUserBorrowMoreBooks(User $user): bool
    {
        $maxBooks = $user->max_books_allowed ?? 3; // Default to 3 if not set
        
        $currentBorrowedCount = Lending::where('user_id', $user->id)
            ->where('status', 'approved')
            ->whereNull('returned_at')
            ->count();

        return $currentBorrowedCount < $maxBooks;
    }

    /**
     * Get blocked user message with details
     */
    private function getBlockedUserMessage(User $user): string
    {
        $message = 'Your account has been blocked.';
        
        if ($user->block_reason) {
            $message .= " Reason: {$user->block_reason}";
        }
        
        if ($user->blocked_at) {
            $message .= " Blocked on: " . $user->blocked_at->format('M d, Y');
        }
        
        $message .= ' Please contact administrator for assistance.';
        
        return $message;
    }
}