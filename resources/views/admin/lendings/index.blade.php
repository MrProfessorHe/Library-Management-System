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
                    class="flex-grow px-4 py-3 border border-blue-500 dark:border-blue-700 rounded-lg bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500 transition" />
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
                <h2
                    class="text-2xl font-semibold mb-6 pb-2 border-b border-gray-300 dark:border-gray-700 text-gray-900 dark:text-gray-100">
                    {{ $section['title'] }}
                </h2>

                @if ($section['data']->isEmpty())
                    <p class="text-gray-500 dark:text-gray-400 italic">No records in this category.</p>
                @else
                    <div class="space-y-6">
                        @foreach ($section['data'] as $index => $lending)
                            <div
                                class="bg-white dark:bg-gray-900 rounded-xl shadow p-6 flex flex-col md:flex-row md:items-center md:justify-between gap-4 border border-{{ $section['color'] }}-300 dark:border-{{ $section['color'] }}-600">
                                <div class="flex flex-col space-y-1 md:space-y-0 md:space-x-6 md:flex-row md:items-center">
                                    <span class="font-semibold text-gray-700 dark:text-gray-300 min-w-[30px]">{{ $index + 1 }}</span>

                                    <div class="min-w-[150px]">
                                        <p class="font-semibold text-gray-900 dark:text-gray-100">{{ $lending->user->name ?? 'N/A' }}
                                        </p>
                                        <p class="text-sm text-gray-500 dark:text-gray-400">User</p>
                                    </div>

                                    <div class="min-w-[200px]">
                                        <p class="font-semibold text-indigo-600 dark:text-indigo-400">
                                            {{ $lending->book->title ?? 'N/A' }}</p>
                                        <p class="text-sm text-gray-500 dark:text-gray-400">Book</p>
                                    </div>

                                    <div>
                                        <p class="font-semibold">{{ $lending->issued_at ? $lending->issued_at->format('d-m-Y') : '-' }}
                                        </p>
                                        <p class="text-sm text-gray-500 dark:text-gray-400">Issued At</p>
                                    </div>

                                    <div>
                                        <p class="font-semibold">
                                            @if ($section['title'] === '✅ Returned Books')
                                                {{ $lending->returned_at ? $lending->returned_at->format('d-m-Y') : '-' }}
                                            @else
                                                {{ $lending->return_at ? $lending->return_at->format('d-m-Y') : '-' }}
                                            @endif
                                        </p>
                                        <p class="text-sm text-gray-500 dark:text-gray-400">Return By</p>
                                    </div>
                                </div>

                                <div
                                    class="flex flex-col items-start md:items-end space-y-3 md:space-y-0 md:space-x-4 md:flex-row md:gap-4 mt-3 md:mt-0">
                                    <span class="inline-block px-3 py-1 rounded-full text-sm font-semibold
                                                    @if($lending->status === 'pending') bg-yellow-100 text-yellow-800 dark:bg-yellow-700 dark:text-yellow-200
                                                    @elseif($lending->status === 'approved') bg-blue-100 text-blue-800 dark:bg-blue-700 dark:text-blue-200
                                                    @elseif($lending->status === 'overdue') bg-red-100 text-red-800 dark:bg-red-700 dark:text-red-200
                                                    @elseif($lending->status === 'returned') bg-green-100 text-green-800 dark:bg-green-700 dark:text-green-200
                                                    @elseif($lending->status === 'rejected') bg-gray-100 text-gray-600 dark:bg-gray-700 dark:text-gray-300
                                                    @else bg-yellow-100 text-yellow-800 dark:bg-yellow-700 dark:text-yellow-200
                                                    @endif
                                                    ">
                                        {{ ucfirst($lending->status) }}
                                    </span>

                                    <div class="flex flex-wrap gap-2">

                                        @if ($lending->status === 'pending')
                                            <form method="POST" action="{{ route('admin.lendings.approve', $lending->id) }}">
                                                @csrf
                                                <button type="submit"
                                                    class="bg-green-600 hover:bg-green-700 focus:ring-4 focus:ring-green-400 text-white px-4 py-2 rounded-lg shadow transition font-semibold">
                                                    Approve
                                                </button>
                                            </form>

                                            <form method="POST" action="{{ route('admin.lendings.reject', $lending->id) }}">
                                                @csrf
                                                <button type="submit"
                                                    class="bg-red-600 hover:bg-red-700 focus:ring-4 focus:ring-red-400 text-white px-4 py-2 rounded-lg shadow transition font-semibold">
                                                    Reject
                                                </button>
                                            </form>

                                        @elseif ($lending->status === 'approved' && is_null($lending->returned_at))
                                            <form method="POST" action="{{ route('admin.lendings.return', $lending->id) }}">
                                                @csrf
                                                <button type="submit"
                                                    class="bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-400 text-white px-4 py-2 rounded-lg shadow transition font-semibold">
                                                    Mark as Returned
                                                </button>
                                            </form>

                                        @elseif ($lending->status === 'returned')
                                            <span
                                                class="text-green-600 font-semibold px-4 py-2 border border-green-600 rounded-lg">Returned</span>

                                        @elseif ($lending->status === 'rejected')
                                            <span class="text-gray-500 italic px-4 py-2 border border-gray-400 rounded-lg">Rejected</span>

                                        @else
                                            <span class="text-yellow-600 px-4 py-2 border border-yellow-600 rounded-lg">Unknown
                                                Status</span>
                                        @endif

                                        @if ($section['title'] === '⚠️ Overdue Books')
                                            <a href="{{ route('fines.user', $lending->user_id) }}"
                                                class="bg-yellow-500 hover:bg-yellow-600 focus:ring-4 focus:ring-yellow-400 text-white px-4 py-2 rounded-lg shadow transition font-semibold">
                                                Check Fine
                                            </a>
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