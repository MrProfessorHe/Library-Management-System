<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function index()
    {
        $users = User::all(); // or paginate() for pagination
        return view('users.index', compact('users'));
    }


public function edit(User $user)
{
    return view('users.edit', compact('user'));
}

public function update(Request $request, User $user)
{
    $validated = $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'required|email|max:255|unique:users,email,' . $user->id,
        'role' => 'required|in:user,admin',
    ]);

    $user->update($validated);

    return redirect()->route('users.index')->with('success', 'User updated successfully.');
}


}

