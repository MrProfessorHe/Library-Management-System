@extends('layouts.app')

@section('title', 'My Profile')

@section('content')
    <div class="bg-gray-100 dark:bg-gray-900 py-10">
        <div class="max-w-4xl mx-auto bg-white dark:bg-gray-800 shadow-2xl rounded-2xl overflow-hidden">

            <!-- Back Button -->
            <div class="p-6 pb-0">
                <a href="{{ url()->previous() }}" 
                   class="inline-flex items-center gap-2 px-4 py-2 border border-gray-300 dark:border-gray-600 text-gray-600 dark:text-gray-300 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors duration-200 font-semibold">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                    Back
                </a>
            </div>

            <!-- Profile Header -->
            <div class="p-6 md:p-8 border-b border-gray-200 dark:border-gray-700">
                <div class="flex flex-col sm:flex-row items-center justify-between space-y-4 sm:space-y-0">
                    <div class="flex items-center space-x-5">
                        <!-- Avatar with Ring -->
                        <img class="h-24 w-24 rounded-full object-cover ring-4 ring-offset-2 ring-offset-white dark:ring-offset-gray-800 ring-indigo-500"
                            src="{{ $user->profile_photo_url ?? 'https://ui-avatars.com/api/?name=' . urlencode($user->name) . '&color=FFFFFF&background=818cf8' }}"
                            alt="{{ $user->name }}'s profile picture">

                        <!-- User Name, Email, and Role -->
                        <div class="flex flex-col">
                            <h1 class="text-2xl md:text-3xl font-bold text-gray-900 dark:text-gray-100">{{ $user->name }}
                            </h1>
                            <p class="text-sm text-gray-500 dark:text-gray-400 mt-1">{{ $user->email }}</p>
                            <span class="mt-2 text-xs font-semibold inline-block py-1 px-2 uppercase rounded-full 
                                    {{ $user->role === 'admin' ? 'text-red-600 bg-red-200 dark:bg-red-800 dark:text-red-100' :
        ($user->role === 'librarian' ? 'text-green-600 bg-green-200 dark:bg-green-800 dark:text-green-100' :
            'text-indigo-600 bg-indigo-200 dark:bg-indigo-800 dark:text-indigo-100') }}">
                                {{ $user->role }}
                            </span>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="flex space-x-3">
                        <a href="{{ route('dashboard') }}"
                            class="px-4 py-2 text-sm font-medium text-gray-700 bg-white dark:bg-gray-700 dark:text-gray-200 border border-gray-300 dark:border-gray-600 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-600 transition duration-150 ease-in-out">
                            Dashboard
                        </a>
                        <a href="{{ route('profile.edit') }}"
                            class="px-4 py-2 text-sm font-medium text-white bg-indigo-600 rounded-lg hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:focus:ring-offset-gray-800 transition duration-150 ease-in-out">
                            Edit Profile
                        </a>
                    </div>
                </div>
            </div>

            <!-- Profile Details -->
            <div class="p-6 md:p-8">
                <h3 class="text-xl font-semibold text-gray-800 dark:text-gray-200 mb-6">Personal Information</h3>
                <dl class="grid grid-cols-1 md:grid-cols-2 gap-x-6 gap-y-8">
                    <!-- Phone Number -->
                    <div class="flex items-start space-x-4">
                        <div
                            class="flex-shrink-0 h-10 w-10 flex items-center justify-center rounded-lg bg-indigo-100 dark:bg-indigo-900/50 text-indigo-500">
                            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z">
                                </path>
                            </svg>
                        </div>
                        <div>
                            <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Phone Number</dt>
                            <dd class="mt-1 text-base text-gray-900 dark:text-gray-100">{{ $user->phone ?? 'Not Provided' }}
                            </dd>
                        </div>
                    </div>

                    <!-- Address -->
                    <div class="flex items-start space-x-4">
                        <div
                            class="flex-shrink-0 h-10 w-10 flex items-center justify-center rounded-lg bg-indigo-100 dark:bg-indigo-900/50 text-indigo-500">
                            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                            </svg>
                        </div>
                        <div>
                            <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Address</dt>
                            @php
                                $addressParts = array_filter([$user->address, $user->city, $user->state, $user->country]);
                                $fullAddress = !empty($addressParts) ? implode(', ', $addressParts) : 'Not Provided';
                            @endphp
                            <dd class="mt-1 text-base text-gray-900 dark:text-gray-100">{{ $fullAddress }}</dd>
                        </div>
                    </div>

                    <!-- Member Since -->
                    <div class="flex items-start space-x-4">
                        <div
                            class="flex-shrink-0 h-10 w-10 flex items-center justify-center rounded-lg bg-indigo-100 dark:bg-indigo-900/50 text-indigo-500">
                            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                        </div>
                        <div>
                            <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Member Since</dt>
                            <dd class="mt-1 text-base text-gray-900 dark:text-gray-100">
                                {{ $user->created_at->format('F j, Y') }}
                            </dd>
                        </div>
                    </div>

                    <!-- Account Status -->
                    <div class="flex items-start space-x-4">
                        <div
                            class="flex-shrink-0 h-10 w-10 flex items-center justify-center rounded-lg bg-indigo-100 dark:bg-indigo-900/50 text-indigo-500">
                            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" aria-hidden="true">
                                <path fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                    clip-rule="evenodd" />
                            </svg>
                        </div>
                        <div>
                            <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Account Status</dt>
                            <dd class="mt-1 text-base text-gray-900 dark:text-gray-100">
                                <span
                                    class="px-2 py-1 text-xs font-medium rounded-full bg-green-100 text-green-800 dark:bg-green-800 dark:text-green-100">
                                    Active
                                </span>
                            </dd>
                        </div>
                    </div>

                    <!-- Last Updated -->
                    <div class="flex items-start space-x-4">
                        <div
                            class="flex-shrink-0 h-10 w-10 flex items-center justify-center rounded-lg bg-indigo-100 dark:bg-indigo-900/50 text-indigo-500">
                            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M4 4v5h5M20 19v-5h-5M5 19l4-4M15 9l4-4" />
                            </svg>
                        </div>
                        <div>
                            <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Last Profile Update</dt>
                            <dd class="mt-1 text-base text-gray-900 dark:text-gray-100">
                                {{ $user->updated_at->diffForHumans() }}
                            </dd>
                        </div>
                    </div>

                    <!-- Email Verification -->
                    <div class="flex items-start space-x-4">
                        <div
                            class="flex-shrink-0 h-10 w-10 flex items-center justify-center rounded-lg bg-indigo-100 dark:bg-indigo-900/50 text-indigo-500">
                            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                            </svg>
                        </div>
                        <div>
                            <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Email Verification</dt>
                            <dd class="mt-1 text-base text-gray-900 dark:text-gray-100">
                                @if ($user->hasVerifiedEmail())
                                    <span
                                        class="px-2 py-1 text-xs font-medium rounded-full bg-green-100 text-green-800 dark:bg-green-800 dark:text-green-100">
                                        Verified
                                    </span>
                                @else
                                    <span
                                        class="px-2 py-1 text-xs font-medium rounded-full bg-yellow-100 text-yellow-800 dark:bg-yellow-800 dark:text-yellow-100">
                                        Pending
                                    </span>
                                @endif
                            </dd>
                        </div>
                    </div>
                </dl>

                <!-- Divider -->
                <hr class="my-8 border-gray-200 dark:border-gray-700">

                <!-- About Me Section -->
                <div>
                    <h3 class="text-xl font-semibold text-gray-800 dark:text-gray-200 mb-4">About Me</h3>
                    <p class="text-gray-600 dark:text-gray-400 leading-relaxed">
                        {{ $user->bio ?? 'This user prefers to keep an air of mystery about them.' }}
                    </p>
                </div>

                <!-- Divider -->
                <hr class="my-8 border-gray-200 dark:border-gray-700">

                <!-- Activity Snapshot -->
                <div>
                    <h3 class="text-xl font-semibold text-gray-800 dark:text-gray-200 mb-4">Activity Snapshot</h3>
                    <div class="grid grid-cols-1 sm:grid-cols-3 gap-6">
                        <!-- Stat Card 1 -->
                        <div class="bg-gray-50 dark:bg-gray-700/50 p-5 rounded-xl flex items-center space-x-4">
                            <div
                                class="flex-shrink-0 h-12 w-12 flex items-center justify-center rounded-lg bg-blue-100 dark:bg-blue-900/50 text-blue-500">
                                <svg class="h-7 w-7" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                                </svg>
                            </div>
                            <div>
                                <p class="text-2xl font-bold text-gray-900 dark:text-gray-100">{{ $booksBorrowedCount }}</p>
                                <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Books Borrowing</p>
                            </div>
                        </div>

                        <!-- Stat Card 2 -->
                        <div class="bg-gray-50 dark:bg-gray-700/50 p-5 rounded-xl flex items-center space-x-4">
                            <div
                                class="flex-shrink-0 h-12 w-12 flex items-center justify-center rounded-lg bg-green-100 dark:bg-green-900/50 text-green-500">
                                <svg class="h-7 w-7" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor" aria-hidden="true">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                                </svg>
                            </div>
                            <div>
                                <p class="text-2xl font-bold text-gray-900 dark:text-gray-100">
                                    {{ $activeRentalsCount ?? 0 }}
                                <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Active Rentals</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection