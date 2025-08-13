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
                $currentlyBorrowed = $user->lendings->where('status', 'approved')
                    ->where('return_at', '>=', now())
                    ->count();

                $fine = $user->getCurrentFineAmount(); // ✅ Fix here

                return [
                    'id' => $user->id, // 👈 Add this
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
            $lendings = Lending::with('book')->where('user_id', $user->id)->get();

            $overdue = Lending::with('book')
                ->where('user_id', $user->id)
                ->whereDate('return_at', '<', now())
                ->get();

            // Initialize empty members array for non-admin users
            $members = collect();

            return view('dashboard', compact('lendings', 'overdue', 'members'));
        }
    }
}
