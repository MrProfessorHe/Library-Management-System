<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserManagementController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('role:admin');
    }

    public function index(Request $request)
    {
        $query = User::with(['lendings', 'fines']);

        // Search by name or email
        if ($request->has('search') && $request->search !== null) {
            $query->where(function ($q) use ($request) {
                $q->where('name', 'like', '%' . $request->search . '%')
                    ->orWhere('email', 'like', '%' . $request->search . '%');
            });
        }

        // Filter by role
        if ($request->filled('role')) {
            $query->where('role', $request->role);
        }

        // Filter by status
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $users = $query->orderBy('created_at', 'desc')->paginate(15);

        return view('admin.users.index', compact('users'));
    }

    public function show(User $user)
    {
        $user->load(['lendings.book', 'fines.lending.book']);

        $currentLendings = $user->lendings()
            ->where('status', 'approved')
            ->whereNull('returned_at')
            ->with('book')
            ->get();

        $overdueLendings = $user->lendings()
            ->overdue()
            ->with('book')
            ->get();

        $pendingFines = $user->fines()->pending()->sum('amount');

        return view('admin.users.show', compact('user', 'currentLendings', 'overdueLendings', 'pendingFines'));
    }

    public function edit(User $user)
    {
        return view('admin.users.edit', compact('user'));
    }


    public function update(Request $request, User $user)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,' . $user->id,
            'role' => 'required|in:admin,librarian,member',
            'status' => 'required|in:active,blocked,pending',
            'max_books_allowed' => 'required|integer|min:1|max:10',
            'max_days_allowed' => 'required|integer|min:1|max:30',
            'block_reason' => 'nullable|string|max:500',
        ]);

        $user->update([
            'name' => $request->name,
            'email' => $request->email,
            'role' => $request->role,
            'status' => $request->status,
            'max_books_allowed' => $request->max_books_allowed,
            'max_days_allowed' => $request->max_days_allowed,
            'block_reason' => $request->block_reason,
            'blocked_at' => $request->status === 'blocked' ? now() : null,
        ]);

        return redirect()->route('admin.users.show', $user)
            ->with('success', 'User updated successfully.');
    }

    public function block(User $user)
    {
        $user->block();

        return redirect()->back()
            ->with('success', 'User blocked successfully.');
    }

    public function unblock(User $user)
    {
        $user->unblock();

        return redirect()->back()
            ->with('success', 'User unblocked successfully.');
    }

    public function assignRole(Request $request, User $user)
    {
        $request->validate([
            'role' => 'required|in:admin,librarian,member',
        ]);

        $user->update(['role' => $request->role]);

        return redirect()->back()
            ->with('success', 'User role updated successfully.');
    }

    public function activity(User $user)
    {
        $lendings = $user->lendings()
            ->with('book')
            ->orderBy('created_at', 'desc')
            ->paginate(20);

        $fines = $user->fines()
            ->with('lending.book')
            ->orderBy('created_at', 'desc')
            ->paginate(20);

        return view('admin.users.activity', compact('user', 'lendings', 'fines'));
    }
}
