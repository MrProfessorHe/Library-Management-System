@extends('layouts.app')

@section('title', 'User Activity')

@section('content')
<div class="max-w-6xl mx-auto mt-10 p-8 bg-white dark:bg-gray-800 rounded-xl shadow-lg text-gray-900 dark:text-gray-100">

    <div class="flex justify-between items-center mb-8">
        <h1 class="text-3xl font-extrabold tracking-tight">Activity for <span class="text-indigo-600 dark:text-indigo-400">{{ $user->name }}</span></h1>
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
                    <li class="bg-gray-50 dark:bg-gray-700 rounded-lg p-5 shadow-sm border border-gray-200 dark:border-gray-600 hover:shadow-md transition">
                        <p><strong>Book:</strong> <span class="text-indigo-600 dark:text-indigo-400">{{ $lending->book->title ?? 'N/A' }}</span></p>
                        <p><strong>Issued At:</strong> {{ $lending->issued_at ? $lending->issued_at->format('d M Y') : '—' }}</p>
                        <p><strong>Return At:</strong> {{ $lending->return_at ? $lending->return_at->format('d M Y') : '—' }}</p>
                        <p><strong>Returned At:</strong> 
                            @if ($lending->returned_at)
                                <span class="inline-flex items-center gap-1 text-green-600 font-semibold">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                                    </svg>
                                    {{ $lending->returned_at->format('d M Y') }}
                                </span>
                            @else
                                <span class="text-red-500 font-semibold flex items-center gap-1">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                                    </svg>
                                    Not Returned
                                </span>
                            @endif
                        </p>
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
                        <p><strong>Paid At:</strong> {{ $fine->paid_at ? $fine->paid_at->format('d M Y') : 'Not Paid' }}</p>
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
