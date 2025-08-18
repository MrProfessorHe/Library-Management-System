@extends('layouts.app')

@section('title', 'User Fine Details')

@section('content')
<div class="max-w-5xl mx-auto mt-10 p-6 bg-white dark:bg-gray-800 rounded-2xl shadow-lg text-gray-900 dark:text-gray-100 space-y-8">

    {{-- Header --}}
    <div class="flex justify-between items-center border-b border-gray-300 dark:border-gray-700 pb-4">
        <h1 class="text-3xl font-bold">Fines for {{ $user->name }}</h1>
        <a href="{{ route('admin.fines.index') }}"
           class="bg-gray-600 hover:bg-gray-700 text-white px-4 py-2 rounded-lg text-sm shadow transition">
            ← Back to Fines
        </a>
    </div>

    {{-- User Info --}}
    <div class="grid md:grid-cols-3 gap-6 bg-gray-50 dark:bg-gray-900 p-6 rounded-lg text-gray-700 dark:text-gray-300 font-semibold">
        <div><span class="font-semibold">Email:</span> <a href="mailto:{{ $user->email }}" class="underline hover:text-indigo-400">{{ $user->email }}</a></div>
        <div><span class="font-semibold">Total Pending Fines:</span> <span class="text-yellow-600 dark:text-yellow-400">₹{{ number_format($totalPending, 2) }}</span></div>
        <div><span class="font-semibold">Total Paid Fines:</span> <span class="text-green-600 dark:text-green-400">₹{{ number_format($totalPaid, 2) }}</span></div>
    </div>

    {{-- Pending Fines --}}
    <section>
        <h2 class="text-2xl font-semibold mb-6 border-b border-gray-300 dark:border-gray-700 pb-2">Pending Fines</h2>

        @forelse($pendingFines as $fine)
            <div class="border border-yellow-400 p-6 rounded-xl bg-yellow-50 dark:bg-yellow-900 mb-6 shadow-sm space-y-3">
                <div class="flex justify-between items-center">
                    <p class="text-lg font-semibold">{{ $fine->lending->book->title ?? 'N/A' }}</p>
                    <span class="bg-yellow-500 text-white px-3 py-1 text-xs rounded-full font-semibold uppercase tracking-wide">Pending</span>
                </div>
                <p><strong>Amount:</strong> ₹{{ number_format($fine->amount, 2) }}</p>

                <div class="flex flex-wrap gap-4 mt-4">
                    {{-- Mark as Paid --}}
                    <form action="{{ route('admin.fines.pay', $fine->id) }}" method="POST" class="inline">
                        @csrf
                        <button type="submit"
                            class="bg-green-600 hover:bg-green-700 text-white px-5 py-2 rounded-lg text-sm font-semibold shadow transition">
                            ✅ Mark as Paid
                        </button>
                    </form>

                    {{-- Waive Fine --}}
                    <form action="{{ route('admin.fines.waive', $fine->id) }}" method="POST"
                          onsubmit="return confirm('Are you sure you want to waive this fine?')"
                          class="inline">
                        @csrf
                        <button type="submit"
                            class="bg-red-600 hover:bg-red-700 text-white px-5 py-2 rounded-lg text-sm font-semibold shadow transition">
                            ❌ Waive Fine
                        </button>
                    </form>
                </div>
            </div>
        @empty
            <p class="text-center text-gray-500 dark:text-gray-400 italic">🎉 No pending fines!</p>
        @endforelse
    </section>

    {{-- Paid Fines --}}
    <section>
        <h2 class="text-2xl font-semibold mb-6 border-b border-gray-300 dark:border-gray-700 pb-2">Paid Fines</h2>

        @forelse($paidFines as $fine)
            <div class="border border-green-400 p-5 rounded-xl bg-green-50 dark:bg-green-900 mb-5 shadow-sm space-y-2">
                <div class="flex justify-between items-center">
                    <p class="text-lg font-semibold">{{ $fine->lending->book->title ?? 'N/A' }}</p>
                    <span class="bg-green-600 text-white px-3 py-1 text-xs rounded-full font-semibold uppercase tracking-wide">Paid</span>
                </div>
                <p><strong>Amount:</strong> ₹{{ number_format($fine->amount, 2) }}</p>
                <p><strong>Paid At:</strong> {{ \Carbon\Carbon::parse($fine->paid_at)->format('d M Y, h:i A') }}</p>
            </div>
        @empty
            <p class="text-center text-gray-500 dark:text-gray-400 italic">No paid fines found.</p>
        @endforelse
    </section>

</div>
@endsection
