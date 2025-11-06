@extends('layouts.app')

@section('title', 'User Activity')

@section('content')
@php
    // Reusable date formatter: "DD Mon YYYY"
    $df = function ($d) {
        try { return $d ? \Carbon\Carbon::parse($d)->format('d M Y') : '—'; }
        catch (\Throwable $e) { return $d ?: '—'; }
    };
@endphp

<div class="max-w-6xl mx-auto mt-10 p-8 bg-white dark:bg-gray-800 rounded-xl shadow-lg text-gray-900 dark:text-gray-100">

    <div class="flex justify-between items-center mb-8">
        <h1 class="text-3xl font-extrabold tracking-tight">
            Activity for
            <span class="text-indigo-600 dark:text-indigo-400">{{ $user->name }}</span>
        </h1>
        <a href="{{ route('admin.users.index') }}"
           class="inline-flex items-center gap-2 bg-gray-700 hover:bg-gray-800 text-white px-5 py-2 rounded-lg font-semibold transition">
           <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
             <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
           </svg>
           Back
        </a>
    </div>

    {{-- Lendings --}}
    <section>
        <h2 class="text-2xl font-semibold mb-5 border-b border-gray-300 dark:border-gray-700 pb-2">📚 Lendings</h2>

        @if ($lendings->isEmpty())
            <p class="text-gray-500 dark:text-gray-400 italic">No lending records found.</p>
        @else
            <ul class="space-y-4">
                @foreach ($lendings as $lending)
                    @php
                        $status = strtolower($lending->status ?? '');
                        $statusClasses = match ($status) {
                            'approved' => 'bg-green-100 text-green-800 dark:bg-green-700 dark:text-green-100',
                            'pending'  => 'bg-yellow-100 text-yellow-800 dark:bg-yellow-700 dark:text-yellow-100',
                            'rejected' => 'bg-rose-100 text-rose-800 dark:bg-rose-700 dark:text-rose-100',
                            'returned' => 'bg-blue-100 text-blue-800 dark:bg-blue-700 dark:text-blue-100',
                            default    => 'bg-gray-200 text-gray-800 dark:bg-gray-700 dark:text-gray-100',
                        };

                        $hasReturnAt = !empty($lending->return_at);
                        $isOverdue   = !$lending->returned_at && $hasReturnAt && now()->greaterThan($lending->return_at);
                        $overdueDays = $isOverdue ? $lending->return_at->diffInDays(now()) : 0;

                        // Optional relations/columns (shown only if exist):
                        $approvedAt  = $lending->approved_at ?? $lending->issued_at; // prefer explicit approved_at
                        $approvedBy  = optional($lending->approvedBy ?? $lending->approver ?? null)->name;
                        $rejectedAt  = $lending->rejected_at ?? null;
                        $rejectedBy  = optional($lending->rejectedBy ?? null)->name;
                        $rejectNote  = $lending->reject_reason ?? $lending->remarks ?? null;
                    @endphp

                    <li class="bg-gray-50 dark:bg-gray-700 rounded-lg p-5 shadow-sm border border-gray-200 dark:border-gray-600 hover:shadow-md transition">
                        <div class="flex flex-wrap items-center justify-between gap-3 mb-3">
                            <p class="font-semibold">
                                <span class="text-gray-600 dark:text-gray-300">Book:</span>
                                <span class="text-indigo-600 dark:text-indigo-400">{{ $lending->book->title ?? 'N/A' }}</span>
                            </p>

                            {{-- Current Status Badge --}}
                            <span class="inline-flex items-center gap-1 px-2.5 py-1 rounded {{ $statusClasses }}">
                                @switch($status)
                                    @case('approved')
                                        <svg class="h-4 w-4" viewBox="0 0 24 24" fill="currentColor"><path d="M9 16.2 4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"/></svg>
                                        @break
                                    @case('pending')
                                        <svg class="h-4 w-4" viewBox="0 0 24 24" fill="currentColor"><path d="M12 8v5l4 2 .7-1.9-2.7-1.1V8z"/><path d="M12 2a10 10 0 1 0 .001 20.001A10 10 0 0 0 12 2Zm0 18a8 8 0 1 1 0-16 8 8 0 0 1 0 16Z"/></svg>
                                        @break
                                    @case('rejected')
                                        <svg class="h-4 w-4" viewBox="0 0 24 24" fill="currentColor"><path d="M18.3 5.71 12 12.01 5.7 5.7 4.29 7.11l6.29 6.29-6.3 6.3 1.42 1.41 6.3-6.29 6.29 6.29 1.41-1.41-6.29-6.29 6.29-6.29z"/></svg>
                                        @break
                                    @case('returned')
                                        <svg class="h-4 w-4" viewBox="0 0 24 24" fill="currentColor"><path d="M12 5V1L7 6l5 5V7c3.31 0 6 2.69 6 6a6 6 0 0 1-6 6c-2.97 0-5.43-2.17-5.91-5H4.06A8.003 8.003 0 0 0 20 13c0-4.42-3.58-8-8-8z"/></svg>
                                        @break
                                    @default
                                        <svg class="h-4 w-4" viewBox="0 0 24 24" fill="currentColor"><circle cx="12" cy="12" r="8"/></svg>
                                @endswitch
                                <span class="capitalize">{{ $status ?: 'unknown' }}</span>
                            </span>
                        </div>

                        <div class="grid gap-1 sm:grid-cols-2">
                            <p><strong>Issued At:</strong> {{ $df($lending->issued_at) }}</p>
                            <p><strong>Return At (Due):</strong> {{ $df($lending->return_at) }}</p>
                            <p>
                                <strong>Returned At:</strong>
                                @if ($lending->returned_at)
                                    <span class="inline-flex items-center gap-1 text-green-600 dark:text-green-300 font-semibold">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 inline" viewBox="0 0 24 24" fill="currentColor"><path d="M9 16.2 4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"/></svg>
                                        {{ $df($lending->returned_at) }}
                                    </span>
                                @else
                                    <span class="text-red-500 dark:text-red-400 font-semibold flex items-center gap-1">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 inline" viewBox="0 0 24 24" fill="currentColor"><path d="M18.3 5.71 12 12.01 5.7 5.7 4.29 7.11l6.29 6.29-6.3 6.3 1.42 1.41 6.3-6.29 6.29 6.29 1.41-1.41-6.29-6.29 6.29-6.29z"/></svg>
                                        Not Returned
                                    </span>
                                @endif
                            </p>

                            @if ($isOverdue)
                                <p>
                                    <strong>Overdue:</strong>
                                    <span class="inline-flex items-center gap-1 text-amber-600 dark:text-amber-300 font-semibold">
                                        <svg class="h-5 w-5" viewBox="0 0 24 24" fill="currentColor"><path d="M1 21h22L12 2 1 21zm12-3h-2v-2h2v2zm0-4h-2v-4h2v4z"/></svg>
                                        {{ $overdueDays }} {{ \Illuminate\Support\Str::plural('day', $overdueDays) }}
                                    </span>
                                </p>
                            @endif
                        </div>

                        {{-- Detailed timeline --}}
                        <div class="mt-4">
                            <h4 class="text-sm font-semibold text-gray-600 dark:text-gray-300 mb-2">Timeline</h4>
                            <ol class="relative border-l border-gray-200 dark:border-gray-600 ml-3 space-y-3">

                                {{-- Requested --}}
                                <li class="ml-4">
                                    <span class="absolute -left-[7px] mt-1 h-3 w-3 rounded-full bg-blue-500 ring-4 ring-blue-100 dark:ring-blue-900/40"></span>
                                    <div class="text-sm">
                                        <p class="font-medium">Requested</p>
                                        <p class="text-gray-500 dark:text-gray-400">
                                            {{ $df($lending->created_at) }}
                                            @if(optional($lending->user)->name)
                                                • by {{ $lending->user->name }}
                                            @endif
                                        </p>
                                    </div>
                                </li>

                                {{-- Approved / Issued --}}
                                @if($approvedAt)
                                    <li class="ml-4">
                                        <span class="absolute -left-[7px] mt-1 h-3 w-3 rounded-full bg-green-500 ring-4 ring-green-100 dark:ring-green-900/40"></span>
                                        <div class="text-sm">
                                            <p class="font-medium">Approved / Issued</p>
                                            <p class="text-gray-500 dark:text-gray-400">
                                                {{ $df($approvedAt) }}
                                                @if($approvedBy)
                                                    • by {{ $approvedBy }}
                                                @endif
                                            </p>
                                        </div>
                                    </li>
                                @endif

                                {{-- Due date --}}
                                @if($lending->return_at)
                                    <li class="ml-4">
                                        <span class="absolute -left-[7px] mt-1 h-3 w-3 rounded-full bg-amber-500 ring-4 ring-amber-100 dark:ring-amber-900/40"></span>
                                        <div class="text-sm">
                                            <p class="font-medium">Due</p>
                                            <p class="text-gray-500 dark:text-gray-400">{{ $df($lending->return_at) }}</p>
                                        </div>
                                    </li>
                                @endif

                                {{-- Returned --}}
                                @if($lending->returned_at)
                                    <li class="ml-4">
                                        <span class="absolute -left-[7px] mt-1 h-3 w-3 rounded-full bg-blue-600 ring-4 ring-blue-100 dark:ring-blue-900/40"></span>
                                        <div class="text-sm">
                                            <p class="font-medium">Returned</p>
                                            <p class="text-gray-500 dark:text-gray-400">{{ $df($lending->returned_at) }}</p>
                                        </div>
                                    </li>
                                @endif

                                {{-- Rejected --}}
                                @if($status === 'rejected' || $rejectedAt)
                                    <li class="ml-4">
                                        <span class="absolute -left-[7px] mt-1 h-3 w-3 rounded-full bg-rose-600 ring-4 ring-rose-100 dark:ring-rose-900/40"></span>
                                        <div class="text-sm">
                                            <p class="font-medium">Rejected</p>
                                            <p class="text-gray-500 dark:text-gray-400">
                                                {{ $df($rejectedAt ?? $lending->updated_at) }}
                                                @if($rejectedBy) • by {{ $rejectedBy }} @endif
                                                @if($rejectNote) • reason: {{ $rejectNote }} @endif
                                            </p>
                                        </div>
                                    </li>
                                @endif

                                {{-- Overdue marker (only if currently overdue) --}}
                                @if($isOverdue)
                                    <li class="ml-4">
                                        <span class="absolute -left-[7px] mt-1 h-3 w-3 rounded-full bg-amber-600 ring-4 ring-amber-100 dark:ring-amber-900/40"></span>
                                        <div class="text-sm">
                                            <p class="font-medium">Overdue</p>
                                            <p class="text-gray-500 dark:text-gray-400">
                                                {{ $overdueDays }} {{ \Illuminate\Support\Str::plural('day', $overdueDays) }}
                                                overdue as of {{ $df(now()) }}
                                            </p>
                                        </div>
                                    </li>
                                @endif
                            </ol>
                        </div>
                    </li>
                @endforeach
            </ul>

            <div class="mt-6">
                {{ $lendings->links() }}
            </div>
        @endif
    </section>

    {{-- Fines --}}
    <section class="mt-12">
        <h2 class="text-2xl font-semibold mb-5 border-b border-gray-300 dark:border-gray-700 pb-2">💰 Fines</h2>

        @if ($fines->isEmpty())
            <p class="text-gray-500 dark:text-gray-400 italic">No fine records found.</p>
        @else
            <ul class="space-y-4">
                @foreach ($fines as $fine)
                    <li class="bg-gray-50 dark:bg-gray-700 rounded-lg p-5 shadow-sm border border-gray-200 dark:border-gray-600 hover:shadow-md transition">
                        <p><strong>Book:</strong> <span class="text-indigo-600 dark:text-indigo-400">{{ $fine->lending->book->title ?? 'N/A' }}</span></p>
                        <p><strong>Amount:</strong> <span class="font-semibold">₹{{ number_format($fine->amount, 2) }}</span></p>
                        <p><strong>Status:</strong>
                            @if($fine->status === 'pending')
                                <span class="inline-block bg-yellow-200 text-yellow-800 dark:bg-yellow-700 dark:text-yellow-200 px-2 py-1 rounded font-semibold">Pending</span>
                            @else
                                <span class="inline-block bg-green-200 text-green-800 dark:bg-green-700 dark:text-green-200 px-2 py-1 rounded font-semibold">Paid</span>
                            @endif
                        </p>
                        <p><strong>Paid At:</strong> {{ $fine->paid_at ? $df($fine->paid_at) : 'Not Paid' }}</p>
                    </li>
                @endforeach
            </ul>

            <div class="mt-6">
                {{ $fines->links() }}
            </div>
        @endif
    </section>

</div>
@endsection
