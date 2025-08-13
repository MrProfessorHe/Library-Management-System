@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')
<div class="bg-gray-100 dark:bg-gray-900 py-6">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        @if(auth()->user()->role === 'admin')
            <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6 md:p-8">
                <div class="flex items-center justify-between mb-6">
                    <h1 class="text-3xl font-bold text-gray-900 dark:text-gray-100">Members Overview</h1>
                    <div class="text-sm text-gray-500 dark:text-gray-400">
                        Total Members: {{ count($members) }}
                    </div>
                </div>

                <div class="overflow-x-auto">
                    <table class="min-w-full bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-700 rounded-lg shadow-sm">
                        <thead>
                            <tr class="bg-gray-50 dark:bg-gray-700 text-left">
                                <th class="px-6 py-4 text-sm font-semibold text-gray-900 dark:text-gray-100 uppercase tracking-wider">Name</th>
                                <th class="px-6 py-4 text-sm font-semibold text-gray-900 dark:text-gray-100 uppercase tracking-wider">Email</th>
                                <th class="px-6 py-4 text-sm font-semibold text-gray-900 dark:text-gray-100 uppercase tracking-wider">Total Requests</th>
                                <th class="px-6 py-4 text-sm font-semibold text-gray-900 dark:text-gray-100 uppercase tracking-wider">Approved</th>
                                <th class="px-6 py-4 text-sm font-semibold text-gray-900 dark:text-gray-100 uppercase tracking-wider">Currently Borrowed</th>
                                <th class="px-6 py-4 text-sm font-semibold text-gray-900 dark:text-gray-100 uppercase tracking-wider">Fine (₹)</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                            @foreach ($members as $member)
                                <tr class="hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
                                    <td class="px-6 py-4">
                                        <a href="{{ route('users.edit', ['user' => $member['id']]) }}"
                                           class="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 font-medium hover:underline transition-colors">
                                            {{ $member['name'] }}
                                        </a>
                                    </td>
                                    <td class="px-6 py-4 text-gray-700 dark:text-gray-300">{{ $member['email'] }}</td>
                                    <td class="px-6 py-4">
                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200">
                                            {{ $member['total_requests'] }}
                                        </span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200">
                                            {{ $member['approved'] }}
                                        </span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200">
                                            {{ $member['borrowed'] }}
                                        </span>
                                    </td>
                                    <td class="px-6 py-4">
                                        @if($member['fine'] > 0)
                                            <span class="text-red-600 dark:text-red-400 font-semibold">₹{{ $member['fine'] }}</span>
                                        @else
                                            <span class="text-green-600 dark:text-green-400 font-semibold">₹0</span>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        @else
            <div class="space-y-6">
                <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6 md:p-8">
                    <h1 class="text-3xl font-bold text-gray-900 dark:text-gray-100 mb-6">My Dashboard</h1>
                    
                    @if(isset($lendings) && $lendings->count() > 0)
                        <div class="mb-8">
                            <h2 class="text-xl font-semibold mb-4 text-gray-900 dark:text-gray-100">My Lendings</h2>
                            <div class="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
                                @foreach($lendings as $lending)
                                    <div class="bg-gray-50 dark:bg-gray-700 p-4 rounded-lg border border-gray-200 dark:border-gray-600 hover:shadow-md transition-shadow">
                                        <div class="flex justify-between items-start">
                                            <div class="flex-1">
                                                <h3 class="font-semibold text-gray-900 dark:text-gray-100 mb-2">{{ $lending->book->title }}</h3>
                                                <p class="text-sm text-gray-600 dark:text-gray-400 mb-1">
                                                    Status: 
                                                    @if($lending->status === 'pending')
                                                        <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200">
                                                            Pending
                                                        </span>
                                                    @elseif($lending->status === 'approved')
                                                        <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200">
                                                            Approved
                                                        </span>
                                                    @else
                                                        <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200">
                                                            {{ ucfirst($lending->status) }}
                                                        </span>
                                                    @endif
                                                </p>
                                                @if($lending->return_at)
                                                    <p class="text-sm text-gray-600 dark:text-gray-400">
                                                        Return Date: {{ $lending->return_at->format('M d, Y') }}
                                                    </p>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endif

                    @if(isset($overdue) && $overdue->count() > 0)
                        <div class="mb-8">
                            <h2 class="text-xl font-semibold mb-4 text-red-600 dark:text-red-400">Overdue Books</h2>
                            <div class="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
                                @foreach($overdue as $lending)
                                    <div class="bg-red-50 dark:bg-red-900/20 p-4 rounded-lg border border-red-200 dark:border-red-800">
                                        <div class="flex justify-between items-start">
                                            <div class="flex-1">
                                                <h3 class="font-semibold text-red-800 dark:text-red-200 mb-2">{{ $lending->book->title }}</h3>
                                                <p class="text-sm text-red-600 dark:text-red-400 mb-1">
                                                    Due: {{ $lending->return_at->format('M d, Y') }}
                                                </p>
                                                <p class="text-sm text-red-600 dark:text-red-400 mb-2">
                                                    Days Overdue: {{ now()->diffInDays($lending->return_at) }}
                                                </p>
                                                <p class="text-sm font-semibold text-red-700 dark:text-red-300">
                                                    Fine: ₹{{ now()->diffInDays($lending->return_at) * 10 }}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endif

                    @if((!isset($lendings) || $lendings->count() === 0) && (!isset($overdue) || $overdue->count() === 0))
                        <div class="text-center py-12">
                            <div class="mx-auto w-24 h-24 bg-gray-100 dark:bg-gray-700 rounded-full flex items-center justify-center mb-4">
                                <svg class="w-12 h-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.746 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                                </svg>
                            </div>
                            <p class="text-gray-600 dark:text-gray-400 text-lg">No lending history found.</p>
                            <p class="text-gray-500 dark:text-gray-500 text-sm mt-2">Start by browsing our book collection!</p>
                        </div>
                    @endif
                </div>
            </div>
        @endif
    </div>
</div>
@endsection
