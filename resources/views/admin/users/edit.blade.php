@extends('layouts.app')

@section('title', 'Edit User')

@section('content')
<div class="max-w-md mx-auto mt-12 px-6 py-8 bg-white dark:bg-gray-800 rounded-2xl shadow-lg text-gray-900 dark:text-gray-100">
    <h1 class="text-3xl font-extrabold mb-8 text-center text-gray-900 dark:text-white">Edit User</h1>

    <form method="POST" action="{{ route('users.update', $user->id) }}" novalidate>
        @csrf
        @method('PUT')

        {{-- Name --}}
        <div class="mb-6">
            <label for="name" class="block mb-2 text-sm font-semibold text-gray-700 dark:text-gray-300">Name</label>
            <input type="text" name="name" id="name" value="{{ old('name', $user->name) }}"
                class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-indigo-500 focus:outline-none
                       bg-white text-gray-900 dark:bg-gray-900 dark:text-white dark:border-gray-600 dark:focus:ring-indigo-400" 
                placeholder="Enter full name" required>
            @error('name')
                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
            @enderror
        </div>

        {{-- Email --}}
        <div class="mb-6">
            <label for="email" class="block mb-2 text-sm font-semibold text-gray-700 dark:text-gray-300">Email</label>
            <input type="email" name="email" id="email" value="{{ old('email', $user->email) }}"
                class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-indigo-500 focus:outline-none
                       bg-white text-gray-900 dark:bg-gray-900 dark:text-white dark:border-gray-600 dark:focus:ring-indigo-400" 
                placeholder="Enter email address" required>
            @error('email')
                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
            @enderror
        </div>

        {{-- Phone Number --}}
        <div class="mb-6">
            <label for="phone" class="block mb-2 text-sm font-semibold text-gray-700 dark:text-gray-300">Phone Number</label>
            <input type="tel" name="phone" id="phone" value="{{ old('phone', $user->phone) }}"
                class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-indigo-500 focus:outline-none
                       bg-white text-gray-900 dark:bg-gray-900 dark:text-white dark:border-gray-600 dark:focus:ring-indigo-400" 
                placeholder="Enter phone number">
            @error('phone')
                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
            @enderror
        </div>

        {{-- Address --}}
        <div class="mb-8">
            <label for="address" class="block mb-2 text-sm font-semibold text-gray-700 dark:text-gray-300">Address</label>
            <textarea name="address" id="address" rows="4" placeholder="Enter address"
                class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-indigo-500 focus:outline-none
                       bg-white text-gray-900 dark:bg-gray-900 dark:text-white dark:border-gray-600 dark:focus:ring-indigo-400">{{ old('address', $user->address) }}</textarea>
            @error('address')
                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
            @enderror
        </div>

        <button type="submit" class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-3 rounded-lg shadow transition duration-200">
            Update User
        </button>
    </form>
</div>
@endsection
