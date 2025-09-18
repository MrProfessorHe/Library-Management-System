@extends('layouts.app')

@section('title', 'Manage Fines')

@section('content')
    <div class="max-w-7xl mx-auto mt-12 px-6">
        <div class="bg-white dark:bg-gray-800 p-10 rounded-2xl shadow-lg text-gray-900 dark:text-gray-100">

            <h1 class="text-4xl font-extrabold mb-8 tracking-tight text-gray-900 dark:text-indigo-400">
                📚 Fine Management
            </h1>

            {{-- Search & Filter --}}
            <form method="GET" action="{{ route('admin.fines.index') }}" class="mb-8">
                <div class="flex flex-wrap gap-4 items-center">
                    <input type="text" name="search" value="{{ request('search') }}"
                        placeholder="🔍 Search by name or email"
                        class="autocomplete=off w-full sm:w-64 px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg bg-gray-50 dark:bg-gray-900 text-gray-900 dark:text-gray-100 focus:outline-none focus:ring-2 focus:ring-indigo-500 transition" />

                    <select name="filter"
                        class="w-full sm:w-64 px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg bg-gray-50 dark:bg-gray-900 text-gray-900 dark:text-gray-100 transition">
                        <option value="">🎯 Filter by Fines</option>
                        <option value="pending" {{ request('filter') === 'pending' ? 'selected' : '' }}>Has Pending Fines
                        </option>
                        <option value="paid" {{ request('filter') === 'paid' ? 'selected' : '' }}>Has Paid Fines</option>
                        <option value="none" {{ request('filter') === 'none' ? 'selected' : '' }}>No Fines</option>
                    </select>

                    <button type="submit"
                        class="bg-indigo-600 hover:bg-indigo-700 text-white font-semibold px-6 py-3 rounded-lg shadow-md transition">
                        🔍 Filter
                    </button>

                    @if(request('search') || request('filter'))
                        <a href="{{ route('admin.fines.index') }}"
                            class="bg-gray-500 hover:bg-gray-600 text-white font-semibold px-6 py-3 rounded-lg shadow-md transition">
                            ❌ Clear
                        </a>
                    @endif
                </div>
            </form>

            {{-- Summary Cards --}}
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-8 mb-10">
                <div class="bg-gray-100 dark:bg-gray-900 p-6 rounded-2xl shadow flex flex-col items-center justify-center">
                    <p class="text-lg font-semibold text-gray-800 dark:text-gray-300 mb-2">💰 Total Pending Fines</p>
                    <p class="text-3xl font-extrabold text-gray-900 dark:text-gray-100">
                        ₹{{ number_format($totalPending, 2) }}
                    </p>
                </div>


                <div class="bg-green-50 dark:bg-green-900 p-6 rounded-2xl shadow flex flex-col items-center justify-center">
                    <p class="text-lg font-semibold text-green-700 dark:text-green-400 mb-2">✅ Total Paid Fines</p>
                    <p class="text-3xl font-extrabold text-green-800 dark:text-green-300">
                        ₹{{ number_format($totalPaid, 2) }}</p>
                </div>
            </div>

            {{-- Users Table --}}
            <h2
                class="text-3xl font-bold mb-6 border-b border-gray-300 dark:border-gray-700 pb-2 text-gray-900 dark:text-gray-100">
                👥 User Fines Summary
            </h2>

            @if ($users->isEmpty())
                <p class="text-center text-gray-500 dark:text-gray-400 py-8 text-lg">No users found with matching criteria.</p>
            @else
                <div class="overflow-x-auto rounded-lg shadow border border-gray-300 dark:border-gray-700">
                    <table class="min-w-full table-auto text-sm text-gray-900 dark:text-gray-100">
                        <thead class="bg-gray-100 dark:bg-gray-700 text-gray-700 dark:text-gray-300">
                            <tr>
                                <th class="text-left px-6 py-4 font-semibold">User</th>
                                <th class="text-left px-6 py-4 font-semibold">Pending Fines</th>
                                <th class="text-left px-6 py-4 font-semibold">Paid Fines</th>
                                <th class="text-left px-6 py-4 font-semibold">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                            @foreach ($users as $user)
                                <tr class="hover:bg-gray-50 dark:hover:bg-gray-800 transition">
                                    <td class="px-6 py-4 font-medium">{{ $user->name }}</td>
                                    <td class="px-6 py-4 text-yellow-700 dark:text-yellow-400 font-semibold">
                                        ₹{{ number_format($user->pending_fines_amount ?? 0, 2) }}</td>
                                    <td class="px-6 py-4 text-green-700 dark:text-green-400 font-semibold">
                                        ₹{{ number_format($user->paid_fines_amount ?? 0, 2) }}</td>
                                    <td class="px-6 py-4 flex flex-wrap gap-3">
                                        <a href="{{ route('admin.fines.user', $user->id) }}"
                                            class="bg-indigo-600 hover:bg-indigo-700 text-white px-5 py-2 rounded-md text-sm font-semibold shadow transition">
                                            View
                                        </a>
                                        <form method="POST" action="{{ route('admin.fines.reminder', $user->id) }}">
                                            @csrf
                                            <button type="submit"
                                                class="bg-yellow-500 hover:bg-yellow-600 text-white px-5 py-2 rounded-md text-sm font-semibold shadow transition">
                                                Reminder
                                            </button>
                                        </form>
                                        @if (($user->pending_fines_amount ?? 0) + ($user->paid_fines_amount ?? 0) > 0)
                                            <a href="{{ route('admin.fines.receipt', $user->id) }}" target="_blank"
                                                class="bg-green-600 hover:bg-green-700 text-white px-5 py-2 rounded-md text-sm font-semibold shadow transition">
                                                Print Receipt
                                            </a>
                                        @else
                                            <button onclick="alert('No fine or receipt available for this user.')"
                                                class="bg-gray-400 cursor-not-allowed text-white px-5 py-2 rounded-md text-sm font-semibold shadow transition">
                                                Print Receipt
                                            </button>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            @endif
        </div>
    </div>
@endsection