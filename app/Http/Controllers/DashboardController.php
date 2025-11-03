<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Lending;
use App\Models\User;
use App\Models\Book;
use Illuminate\Support\Carbon;

class DashboardController extends Controller
{
    public function index()
    {
        $user = Auth::user();

        if ($user->role === 'admin') {
            $totalUsers = User::count();
            $totalBooks = Book::count();
            $totalLendings = Lending::count();

            $users = User::with('lendings.book')->get();

            $members = $users->map(function ($user) {
                $totalRequests = $user->lendings->count();
                $approved = $user->lendings->where('status', 'approved')->count();
                
                // FIXED: Currently borrowed should be approved and NOT returned
                $currentlyBorrowed = $user->lendings
                    ->where('status', 'approved')
                    ->whereNull('returned_at')
                    ->count();

                $fine = $user->getCurrentFineAmount();

                return [
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                    'total_requests' => $totalRequests,
                    'approved' => $approved,
                    'borrowed' => $currentlyBorrowed,
                    'fine' => $fine,
                ];
            });

            return view('dashboard', compact('totalUsers', 'totalBooks', 'totalLendings', 'members'));
        } else {
            // Regular user dashboard - FIXED: Get all user's lendings
            $lendings = Lending::with('book')
                ->where('user_id', $user->id)
                ->orderBy('created_at', 'desc')
                ->get();

            // FIXED: Only show ACTIVE overdue books (approved, not returned, and past due date)
            $overdue = Lending::with('book')
                ->where('user_id', $user->id)
                ->where('status', 'approved') // Only approved books
                ->whereNull('returned_at')    // Not returned yet
                ->where('return_at', '<', now()) // Past due date
                ->orderBy('return_at', 'asc')
                ->get();

            // Initialize empty members array for non-admin users
            $members = collect();

            return view('dashboard', compact('lendings', 'overdue', 'members'));
        }
    }
}