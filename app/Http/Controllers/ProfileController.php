<?php

namespace App\Http\Controllers;

use Illuminate\Http\RedirectResponse;
use App\Models\User;
use App\Models\Lending; // Add this import
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
use Illuminate\Validation\Rule;

class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     */
    public function edit(Request $request): View
    {
        return view('profile.edit', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Update the user's profile information.
     */
    public function update(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => [
                'required', 
                'string', 
                'lowercase', 
                'email', 
                'max:255', 
                Rule::unique('users')->ignore($request->user()->id)
            ],
            'phone' => ['required', 'string', 'max:20'],
            'address' => ['required', 'string', 'max:500'],
        ]);

        $user = $request->user();
        
        // Update user fields
        $user->name = $validated['name'];
        $user->email = $validated['email'];
        $user->phone = $validated['phone'];
        $user->address = $validated['address'];

        // If email changed, reset verification
        if ($user->isDirty('email')) {
            $user->email_verified_at = null;
        }

        $user->save();

        return Redirect::route('profile.edit')->with('status', 'profile-updated');
    }

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }

    /**
     * Show user profile
     */
    public function show(Request $request)
    {
        $user = $request->user();

        // Total books borrowed by user
        $booksBorrowedCount = Lending::where('user_id', $user->id)->count();

        // Active rentals (currently borrowed) - FIXED: Changed 'ending' to 'Lending'
        $activeRentalsCount = Lending::where('user_id', $user->id)
            ->where('status', 'approved')
            ->whereNull('returned_at')
            ->count();

        return view('profile.show', [
            'user' => $user,
            'booksBorrowedCount' => $booksBorrowedCount,
            'activeRentalsCount' => $activeRentalsCount,
        ]);
    }
}