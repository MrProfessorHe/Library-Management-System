@extends('layouts.app')

@section('title', 'User Overview')

@section('content')
<div class="py-12">
    <div class="max-w-5xl mx-auto sm:px-6 lg:px-8">
        <div class="bg-white dark:bg-gray-800 p-10 shadow-xl sm:rounded-3xl border border-gray-200 dark:border-gray-700">

            <h2 class="text-4xl font-extrabold mb-10 text-gray-900 dark:text-white tracking-tight">
                User Overview
            </h2>

            {{-- User Info --}}
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-12">
                <div class="space-y-3">
                    <p class="text-gray-700 dark:text-gray-300"><span class="font-semibold">Name:</span> <span class="text-indigo-600 dark:text-indigo-400">{{ $user->name }}</span></p>
                    <p class="text-gray-700 dark:text-gray-300"><span class="font-semibold">Email:</span> <a href="mailto:{{ $user->email }}" class="text-blue-600 hover:underline dark:text-blue-400">{{ $user->email }}</a></p>
                    <p class="text-gray-700 dark:text-gray-300"><span class="font-semibold">Role:</span> <span class="capitalize">{{ ucfirst($user->role) }}</span></p>
                </div>
                <div class="space-y-3">
                    <p class="text-gray-700 dark:text-gray-300"><span class="font-semibold">Status:</span> 
                        <span class="inline-block px-2 py-1 rounded text-sm font-semibold
                        {{ $user->status === 'active' ? 'bg-green-100 text-green-800 dark:bg-green-800 dark:text-green-200' : 'bg-red-100 text-red-800 dark:bg-red-800 dark:text-red-200' }}">
                            {{ ucfirst($user->status) }}
                        </span>
                    </p>
                    <p class="text-gray-700 dark:text-gray-300"><span class="font-semibold">Pending Fines:</span> 
                        <span class="text-red-600 dark:text-red-400 font-semibold">₹{{ number_format($user->fines->where('status', 'pending')->sum('amount'), 2) }}</span>
                    </p>
                    <p class="text-gray-700 dark:text-gray-300"><span class="font-semibold">Books Borrowed:</span> 
                        <span class="font-semibold">{{ $user->lendings->where('status', 'approved')->whereNull('returned_at')->count() }}</span>
                    </p>
                </div>
            </div>

            {{-- Issued Books --}}
            <h3 class="text-3xl font-semibold text-gray-900 dark:text-white mb-6 border-b border-gray-300 dark:border-gray-700 pb-3 tracking-wide">
                📚 Issued Books
            </h3>

            @if($user->lendings->count() > 0)
                <div class="overflow-x-auto rounded-lg border border-gray-300 dark:border-gray-600 shadow-sm">
                    <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700 text-sm">
                        <thead class="bg-gray-100 dark:bg-gray-700 text-gray-700 dark:text-gray-300">
                            <tr>
                                <th class="px-5 py-4 text-left font-medium">#</th>
                                <th class="px-5 py-4 text-left font-medium">Book Title</th>
                                <th class="px-5 py-4 text-left font-medium">Issued At</th>
                                <th class="px-5 py-4 text-left font-medium">Return At</th>
                                <th class="px-5 py-4 text-left font-medium">Returned?</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
                            @foreach($user->lendings->sortByDesc('issued_at')->values() as $index => $lending)
                                <tr class="hover:bg-gray-50 dark:hover:bg-gray-700 transition">
                                    <td class="px-5 py-4 text-gray-900 dark:text-gray-200 font-semibold">{{ $index + 1 }}</td>
                                    <td class="px-5 py-4 text-gray-900 dark:text-gray-200">{{ $lending->book->title ?? 'N/A' }}</td>
                                    <td class="px-5 py-4 text-gray-900 dark:text-gray-200">{{ $lending->issued_at ? $lending->issued_at->format('d M Y') : '—' }}</td>
                                    <td class="px-5 py-4 text-gray-900 dark:text-gray-200">{{ $lending->return_at ? $lending->return_at->format('d M Y') : '—' }}</td>
                                    <td class="px-5 py-4 text-gray-900 dark:text-gray-200 font-semibold">
                                        @if($lending->returned_at)
                                            <span class="inline-flex items-center gap-1 text-green-600 dark:text-green-400">
                                                ✅ {{ $lending->returned_at->format('d M Y') }}
                                            </span>
                                        @else
                                            <span class="inline-flex items-center gap-1 text-red-600 dark:text-red-400">
                                                ❌ Not Returned
                                            </span>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            @else
                <p class="text-gray-600 dark:text-gray-400 mt-6 italic">No books issued by this user.</p>
            @endif

            {{-- Back Button --}}
            <div class="mt-10">
                <a href="{{ route('admin.users.index') }}" 
                   class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-xl shadow-lg transition font-semibold tracking-wide">
                    ← Back to User Management
                </a>
            </div>
        </div>
    </div>
</div>
@endsection
