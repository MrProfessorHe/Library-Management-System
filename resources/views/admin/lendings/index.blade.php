@extends('layouts.app')

@section('title', 'Manage Lending Requests')

@section('content')
<div class="max-w-7xl mx-auto mt-10 px-8 py-6 bg-white dark:bg-gray-800 shadow-md rounded-lg text-gray-900 dark:text-gray-100">
    <h1 class="text-4xl font-extrabold mb-8 text-gray-900 dark:text-indigo-400">
        📚 Manage Lending Requests
    </h1>

    {{-- Search Form --}}
    <form method="GET" action="{{ route('admin.lendings.index') }}" class="mb-8 max-w-lg">
        <div class="flex gap-2 flex-wrap">
            <input type="text" name="search" value="{{ request('search') }}" placeholder="Search by user name"
                   class="autocomplete=off flex-grow px-4 py-3 border border-gray-300 dark:border-gray-700 rounded-lg bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500 transition" />
            <button type="submit"
                    class="bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-400 text-white px-6 rounded-lg shadow font-semibold transition">
                Search
            </button>
            @if(request('search'))
                <a href="{{ route('admin.lendings.index') }}"
                   class="bg-gray-500 hover:bg-gray-600 focus:ring-4 focus:ring-gray-400 text-white px-6 rounded-lg shadow font-semibold transition flex items-center justify-center"
                   aria-label="Clear search">
                    Clear
                </a>
            @endif
        </div>
    </form>

    @php
        $sections = [
            ['title' => '📌 Pending Requests', 'data' => $pendingLendings, 'color' => 'yellow'],
            ['title' => '📘 Approved & Not Returned', 'data' => $approvedLendings, 'color' => 'blue'],
            ['title' => '⚠️ Overdue Books', 'data' => $overdueLendings, 'color' => 'red'],
            ['title' => '✅ Returned Books', 'data' => $returnedLendings, 'color' => 'green'],
        ];
    @endphp

    @foreach ($sections as $section)
        <section class="mb-12">
            <h2 class="text-2xl font-semibold mb-6 pb-2 border-b border-gray-300 dark:border-gray-700 text-gray-900 dark:text-gray-100">
                {{ $section['title'] }}
            </h2>

            @if ($section['data']->isEmpty())
                <p class="text-gray-500 dark:text-gray-400 italic">No records in this category.</p>
            @else
                <div class="space-y-6">
                    @foreach ($section['data'] as $index => $lending)
                        {{-- ================================================================ --}}
                        {{-- ============== CRITICAL FIX FOR TAILWIND COLORS ============== --}}
                        {{-- ================================================================ --}}
                        <div class="bg-white dark:bg-gray-900 rounded-xl shadow p-6 flex flex-col md:flex-row md:items-center md:justify-between gap-4 border
                            @switch($section['color'])
                                @case('yellow')
                                    border-yellow-300 dark:border-yellow-700
                                    @break
                                @case('blue')
                                    border-blue-300 dark:border-blue-700
                                    @break
                                @case('red')
                                    border-red-300 dark:border-red-700
                                    @break
                                @case('green')
                                    border-green-300 dark:border-green-700
                                    @break
                                @default
                                    border-gray-300 dark:border-gray-700
                            @endswitch
                        ">
                            <div class="flex-grow flex flex-col space-y-4 md:space-y-0 md:space-x-6 md:flex-row md:items-center">
                                <span class="font-semibold text-gray-500 dark:text-gray-400 w-8 text-center">{{ $index + 1 }}.</span>

                                <div class="min-w-[150px]">
                                    <p class="font-semibold text-gray-900 dark:text-gray-100">{{ $lending->user->name ?? 'N/A' }}</p>
                                    <p class="text-sm text-gray-500 dark:text-gray-400">User</p>
                                </div>

                                <div class="min-w-[200px]">
                                    <p class="font-semibold text-indigo-600 dark:text-indigo-400">{{ $lending->book->title ?? 'N/A' }}</p>
                                    <p class="text-sm text-gray-500 dark:text-gray-400">Book</p>
                                </div>

                                <div>
                                    <p class="font-semibold">{{ $lending->issued_at ? $lending->issued_at->format('M d, Y') : '-' }}</p>
                                    <p class="text-sm text-gray-500 dark:text-gray-400">Issued Date</p>
                                </div>

                                <div>
                                    <p class="font-semibold">
                                        @if ($section['color'] === 'green')
                                            {{ $lending->returned_at ? $lending->returned_at->format('M d, Y') : '-' }}
                                        @else
                                            {{ $lending->return_at ? $lending->return_at->format('M d, Y') : '-' }}
                                        @endif
                                    </p>
                                    {{-- Improved: Dynamic Label --}}
                                    <p class="text-sm text-gray-500 dark:text-gray-400">
                                        {{ $section['color'] === 'green' ? 'Returned Date' : 'Return By' }}
                                    </p>
                                </div>
                            </div>

                            <div class="flex flex-col items-stretch sm:items-end sm:flex-row gap-2 pt-4 md:pt-0 border-t md:border-0 border-gray-200 dark:border-gray-700">
                                <span class="inline-block text-center px-3 py-1 rounded-full text-sm font-semibold
                                    @if($lending->status === 'pending') bg-yellow-100 text-yellow-800 dark:bg-yellow-700 dark:text-yellow-200
                                    @elseif($lending->status === 'approved') bg-blue-100 text-blue-800 dark:bg-blue-700 dark:text-blue-200
                                    @elseif($lending->status === 'overdue') bg-red-100 text-red-800 dark:bg-red-700 dark:text-red-200
                                    @elseif($lending->status === 'returned') bg-green-100 text-green-800 dark:bg-green-700 dark:text-green-200
                                    @elseif($lending->status === 'rejected') bg-gray-100 text-gray-600 dark:bg-gray-700 dark:text-gray-300
                                    @else bg-gray-100 text-gray-800 dark:bg-gray-600 dark:text-gray-200
                                    @endif">
                                    {{ ucfirst($lending->status) }}
                                </span>

                                <div class="flex flex-wrap gap-2 justify-end">
                                    @if ($lending->status === 'pending')
                                        <form method="POST" action="{{ route('admin.lendings.approve', $lending->id) }}">
                                            @csrf
                                            <button type="submit" class="w-full text-center bg-green-600 hover:bg-green-700 focus:ring-4 focus:ring-green-400 text-white px-4 py-2 rounded-lg shadow transition font-semibold">
                                                Approve
                                            </button>
                                        </form>
                                        <form method="POST" action="{{ route('admin.lendings.reject', $lending->id) }}">
                                            @csrf
                                            <button type="submit" class="w-full text-center bg-red-600 hover:bg-red-700 focus:ring-4 focus:ring-red-400 text-white px-4 py-2 rounded-lg shadow transition font-semibold">
                                                Reject
                                            </button>
                                        </form>
                                    @elseif ($lending->status === 'approved' || $lending->status === 'overdue')
                                        <form method="POST" action="{{ route('admin.lendings.return', $lending->id) }}">
                                            @csrf
                                            <button type="submit" class="w-full text-center bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-400 text-white px-4 py-2 rounded-lg shadow transition font-semibold">
                                                Mark as Returned
                                            </button>
                                        </form>
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            @endif
        </section>
    @endforeach
</div>
@endsection