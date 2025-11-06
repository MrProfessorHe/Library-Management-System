@php
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;
@endphp

@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')
<div class="bg-gray-100 dark:bg-gray-900 py-6">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        @if(auth()->user()->role === 'admin')
            {{-- ===== Admin Dashboard ===== --}}
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
            {{-- ===== User Dashboard ===== --}}
            <div class="space-y-6">
                <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6 md:p-8">
                    <h1 class="text-3xl font-bold text-gray-900 dark:text-gray-100 mb-6">My Dashboard</h1>

                    @php
                        $recentLendings  = isset($lendings) ? $lendings->where('created_at', '>=', now()->subMonths(3))->sortByDesc('created_at') : collect();
                        $activeLendings  = $recentLendings->where('status', '!=', 'returned');
                        $booksOnHand = isset($lendings)
                            ? $lendings->where('status', 'approved')->whereNull('returned_at')->sortBy('return_at')
                            : collect();
                    @endphp

                    {{-- Active Lendings --}}
                    @if($activeLendings->count() > 0)
                        <div class="mb-8">
                            <div class="flex items-center justify-between mb-4">
                                <h2 class="text-xl font-semibold text-gray-900 dark:text-gray-100">My Active Lendings</h2>
                                <span class="text-sm text-gray-500 dark:text-gray-400">Last 3 months</span>
                            </div>
                            <div class="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
                                @foreach($activeLendings as $lending)
                                    <div class="bg-gray-50 dark:bg-gray-700 p-4 rounded-lg border border-gray-200 dark:border-gray-600 hover:shadow-md transition-shadow">
                                        <h3 class="font-semibold text-gray-900 dark:text-gray-100 mb-2 truncate">{{ $lending->book->title }}</h3>
                                        <p class="text-sm text-gray-600 dark:text-gray-400 mb-1">Status:
                                            <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium
                                                {{ $lending->status === 'approved' ? 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200' :
                                                   ($lending->status === 'pending' ? 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200' :
                                                   'bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200') }}">
                                                {{ ucfirst($lending->status) }}
                                            </span>
                                        </p>
                                        @if($lending->issued_at)
                                            <p class="text-sm text-gray-600 dark:text-gray-400 mb-1">Issued: {{ $lending->issued_at->format('M d, Y') }}</p>
                                        @endif
                                        @if($lending->return_at && $lending->status !== 'returned')
                                            <p class="text-sm text-gray-600 dark:text-gray-400 mb-1">Due Date: {{ $lending->return_at->format('M d, Y') }}</p>
                                        @endif
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endif

                    {{-- 📚 Books on Hand --}}
                    @if($booksOnHand->count() > 0)
                        <div class="mb-8">
                            <div class="flex items-center justify-between mb-4">
                                <h2 class="text-xl font-semibold text-gray-900 dark:text-gray-100">Books on Hand</h2>
                                <span class="text-sm text-gray-500 dark:text-gray-400">{{ $booksOnHand->count() }} {{ Str::plural('book', $booksOnHand->count()) }}</span>
                            </div>

                            <div class="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
                                @foreach($booksOnHand as $lending)
                                    @php
                                        $due = $lending->return_at;
                                        $daysLeft = $due ? now()->startOfDay()->diffInDays($due->copy()->startOfDay(), false) : null;
                                        $isOverdue = isset($daysLeft) && $daysLeft < 0;
                                    @endphp

                                    <div class="bg-gray-50 dark:bg-gray-700 p-4 rounded-lg border border-gray-200 dark:border-gray-600 hover:shadow-md transition-shadow">
                                        <div class="flex items-start gap-3">
                                            {{-- Cover --}}
                                            <div class="w-14 h-20 bg-gray-100 dark:bg-gray-700 rounded overflow-hidden flex-shrink-0">
                                                @if(optional($lending->book)->cover_image)
                                                    <img src="{{ $lending->book->cover_image }}" alt="{{ $lending->book->title }}" class="w-full h-full object-cover">
                                                @else
                                                    <div class="w-full h-full flex items-center justify-center text-[10px] text-gray-400">No Image</div>
                                                @endif
                                            </div>

                                            {{-- Info --}}
                                            <div class="flex-1 min-w-0">
                                                <h3 class="font-semibold text-gray-900 dark:text-gray-100 truncate">
                                                    {{ optional($lending->book)->title ?? 'Unknown Title' }}
                                                </h3>

                                                @if($due)
                                                    <p class="text-sm mt-1">
                                                        <span class="text-gray-600 dark:text-gray-400">Due:</span>
                                                        <span class="{{ $isOverdue ? 'text-red-600 dark:text-red-400 font-semibold' : 'text-gray-800 dark:text-gray-200' }}">
                                                            {{ $due->format('M d, Y') }}
                                                        </span>
                                                    </p>

                                                    <p class="text-xs mt-1">
                                                        @if($daysLeft < 0)
                                                            @php $n = abs($daysLeft); @endphp
                                                            <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200">
                                                                Overdue by {{ $n }} {{ Str::plural('day', $n) }}
                                                            </span>
                                                        @elseif($daysLeft === 0)
                                                            <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200">
                                                                Due today
                                                            </span>
                                                        @else
                                                            <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200">
                                                                {{ $daysLeft }} {{ Str::plural('day', $daysLeft) }} left
                                                            </span>
                                                        @endif
                                                    </p>
                                                @endif

                                                {{-- Quick Actions --}}
                                                <div class="mt-3 flex flex-wrap gap-2">
                                                    @if(Route::has('lendings.renew'))
                                                        <form method="POST" action="{{ route('lendings.renew', ['lending' => $lending->id]) }}">
                                                            @csrf
                                                            <button
                                                                class="px-3 py-1.5 rounded-md text-sm font-medium
                                                                    border border-blue-500 text-blue-700 bg-white
                                                                    hover:bg-blue-50 active:bg-blue-100
                                                                    dark:border-blue-400 dark:text-blue-200 dark:bg-transparent
                                                                    dark:hover:bg-blue-400/10 dark:active:bg-blue-400/20
                                                                    focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500
                                                                    focus-visible:ring-offset-2 focus-visible:ring-offset-white
                                                                    dark:focus-visible:ring-offset-gray-800 transition">
                                                                Renew
                                                            </button>
                                                        </form>
                                                    @endif

                                                    @if(Route::has('lendings.return'))
                                                        <form method="POST" action="{{ route('lendings.return', ['lending' => $lending->id]) }}">
                                                            @csrf
                                                            <button
                                                                class="px-3 py-1.5 rounded-md text-sm font-medium
                                                                    border border-gray-500 text-gray-800 bg-white
                                                                    hover:bg-gray-50 active:bg-gray-100
                                                                    dark:border-gray-400 dark:text-gray-100 dark:bg-transparent
                                                                    dark:hover:bg-gray-700/50 dark:active:bg-gray-700/70
                                                                    focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-gray-400
                                                                    focus-visible:ring-offset-2 focus-visible:ring-offset-white
                                                                    dark:focus-visible:ring-offset-gray-800 transition">
                                                                Mark as Returned
                                                            </button>
                                                        </form>
                                                    @endif

                                                    @if(optional($lending->book)->isbn)
                                                        <a href="{{ route('books.external.show', ['isbn' => $lending->book->isbn, 'id' => $lending->book->id ?? null]) }}"
                                                        class="px-3 py-1.5 rounded-md text-sm font-medium
                                                                border border-violet-500 text-violet-700 bg-white
                                                                hover:bg-violet-50 active:bg-violet-100
                                                                dark:border-violet-400 dark:text-violet-200 dark:bg-transparent
                                                                dark:hover:bg-violet-400/10 dark:active:bg-violet-400/20
                                                                focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-violet-500
                                                                focus-visible:ring-offset-2 focus-visible:ring-offset-white
                                                                dark:focus-visible:ring-offset-gray-800 transition">
                                                            View
                                                        </a>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endif

                    {{-- Overdue Books --}}
                    @php
                        $activeOverdue = isset($lendings) ? $lendings->where('status', 'approved')
                                                            ->whereNull('returned_at')
                                                            ->where('return_at', '<', now())
                                                            ->sortByDesc('return_at') : collect();
                    @endphp

                    @if($activeOverdue->count() > 0)
                        <div class="mb-8">
                            <h2 class="text-xl font-semibold mb-4 text-red-600 dark:text-red-400">Overdue Books</h2>
                            <div class="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
                                @foreach($activeOverdue as $lending)
                                    <div class="bg-red-50 dark:bg-red-900/20 p-4 rounded-lg border border-red-200 dark:border-red-800">
                                        <h3 class="font-semibold text-red-800 dark:text-red-200 mb-2">{{ $lending->book->title }}</h3>
                                        <p class="text-sm text-red-600 dark:text-red-400 mb-1">
                                            Due: {{ $lending->return_at->format('M d, Y') }}
                                        </p>
                                        <p class="text-sm text-red-600 dark:text-red-400 mb-1">
                                            Days Overdue: {{ floor($lending->return_at->diffInDays(now())) }}
                                        </p>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endif

                    {{-- Recently Returned --}}
                    @php
                        $returnedBooks = isset($lendings) ? $lendings->where('status', 'returned')
                                                         ->where('created_at', '>=', now()->subMonths(3))
                                                         ->sortByDesc('returned_at') : collect();
                    @endphp

                    @if($returnedBooks->count() > 0)
                        <div class="mb-8">
                            <h2 class="text-xl font-semibold text-gray-900 dark:text-gray-100 mb-4">Recently Returned Books</h2>
                            <div class="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
                                @foreach($returnedBooks as $lending)
                                    <div class="bg-green-50 dark:bg-green-900/20 p-4 rounded-lg border border-green-200 dark:border-green-800">
                                        <h3 class="font-semibold text-green-800 dark:text-green-200 mb-2">{{ $lending->book->title }}</h3>
                                        <p class="text-sm text-green-600 dark:text-green-400 mb-1">Returned: {{ $lending->returned_at->format('M d, Y') }}</p>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endif

                    {{-- Empty State --}}
                    @if($activeLendings->isEmpty() && $booksOnHand->isEmpty() && $activeOverdue->isEmpty() && $returnedBooks->isEmpty())
                        <div class="text-center py-12">
                            <div class="mx-auto w-24 h-24 bg-gray-100 dark:bg-gray-700 rounded-full flex items-center justify-center mb-4">
                                <svg class="w-12 h-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.746 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                                </svg>
                            </div>
                            <p class="text-gray-600 dark:text-gray-400 text-lg">No recent lending history found.</p>
                            <p class="text-gray-500 dark:text-gray-500 text-sm mt-2">Start by browsing our book collection!</p>
                        </div>
                    @endif
                </div>
            </div>
        @endif
    </div>
</div>
@endsection
