@extends('layouts.app')

@section('title', 'User Overview')

@section('content')
<div class="py-10 sm:py-12 bg-gray-100 dark:bg-gray-900 min-h-screen">
  <div class="max-w-5xl mx-auto sm:px-6 lg:px-8">
    <div class="bg-white dark:bg-gray-800 p-6 sm:p-8 lg:p-10 shadow-xl sm:rounded-3xl border border-gray-200 dark:border-gray-700">

      <h2 class="text-3xl sm:text-4xl font-extrabold mb-8 sm:mb-10 text-gray-900 dark:text-white tracking-tight">
        User Overview
      </h2>

      {{-- User Info --}}
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6 sm:gap-8 mb-10 sm:mb-12">
        <div class="space-y-3">
          <p class="text-gray-700 dark:text-gray-300">
            <span class="font-semibold">Name:</span>
            <span class="text-indigo-600 dark:text-indigo-400 break-words">{{ $user->name }}</span>
          </p>
          <p class="text-gray-700 dark:text-gray-300">
            <span class="font-semibold">Email:</span>
            <a href="mailto:{{ $user->email }}" class="text-blue-600 hover:underline dark:text-blue-400 break-all">
              {{ $user->email }}
            </a>
          </p>
          <p class="text-gray-700 dark:text-gray-300">
            <span class="font-semibold">Role:</span>
            <span class="capitalize">{{ ucfirst($user->role) }}</span>
          </p>
        </div>

        <div class="space-y-3">
          <p class="text-gray-700 dark:text-gray-300">
            <span class="font-semibold">Status:</span>
            <span class="inline-block px-2 py-1 rounded text-sm font-semibold
              {{ $user->status === 'active'
                  ? 'bg-green-100 text-green-800 dark:bg-green-800 dark:text-green-200'
                  : 'bg-red-100 text-red-800 dark:bg-red-800 dark:text-red-200' }}">
              {{ ucfirst($user->status) }}
            </span>
          </p>

          <p class="text-gray-700 dark:text-gray-300">
            <span class="font-semibold">Pending Fines:</span>
            <span class="text-red-600 dark:text-red-400 font-semibold">
              ₹{{ number_format($user->fines->where('status', 'pending')->sum('amount'), 2) }}
            </span>
          </p>

          <p class="text-gray-700 dark:text-gray-300">
            <span class="font-semibold">Books Borrowed:</span>
            <span class="font-semibold">
              {{ $user->lendings->where('status', 'approved')->whereNull('returned_at')->count() }}
            </span>
          </p>
        </div>
      </div>

      {{-- Issued Books --}}
      <h3 class="text-2xl sm:text-3xl font-semibold text-gray-900 dark:text-white mb-5 sm:mb-6 border-b border-gray-300 dark:border-gray-700 pb-3 tracking-wide">
        📚 Issued Books
      </h3>

      @php
        // Sort: most recent issue first
        $lendings = $user->lendings->sortByDesc('issued_at')->values();

        // Small helpers
        $fmt = function ($d) {
          try { return $d ? \Carbon\Carbon::parse($d)->format('d M Y') : '—'; }
          catch (\Throwable $e) { return $d ?: '—'; }
        };
        $badge = function ($status) {
          $s = strtolower($status ?: '');
          return match ($s) {
            'approved' => 'bg-green-100 text-green-800 dark:bg-green-700 dark:text-green-100',
            'pending'  => 'bg-yellow-100 text-yellow-800 dark:bg-yellow-700 dark:text-yellow-100',
            'rejected' => 'bg-rose-100 text-rose-800 dark:bg-rose-700 dark:text-rose-100',
            'returned' => 'bg-blue-100 text-blue-800 dark:bg-blue-700 dark:text-blue-100',
            default    => 'bg-gray-200 text-gray-800 dark:bg-gray-700 dark:text-gray-100',
          };
        };
      @endphp

      @if($lendings->count() > 0)
        {{-- Desktop table --}}
        <div class="hidden md:block overflow-auto rounded-lg border border-gray-300 dark:border-gray-600 shadow-sm">
          <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700 text-sm">
            <thead class="bg-gray-100 dark:bg-gray-700 text-gray-700 dark:text-gray-300 sticky top-0 z-10">
              <tr>
                <th scope="col" class="px-5 py-3 text-left font-semibold w-12">#</th>
                <th scope="col" class="px-5 py-3 text-left font-semibold min-w-[220px]">Book Title</th>
                <th scope="col" class="px-5 py-3 text-left font-semibold w-28">Status</th>
                <th scope="col" class="px-5 py-3 text-left font-semibold w-36">Issued At</th>
                <th scope="col" class="px-5 py-3 text-left font-semibold w-36">Due (Return At)</th>
                <th scope="col" class="px-5 py-3 text-left font-semibold w-40">Returned</th>
                <th scope="col" class="px-5 py-3 text-left font-semibold w-28">Overdue</th>
              </tr>
            </thead>

            <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
              @foreach($lendings as $index => $lending)
                @php
                  $status = $lending->status ?? '';
                  $due = $lending->return_at;
                  $returned = $lending->returned_at;
                  $isOverdue = !$returned && $due && now()->gt($due);
                  $overdueDays = $isOverdue ? \Carbon\Carbon::parse($due)->diffInDays(now()) : 0;
                @endphp

                <tr class="hover:bg-gray-50 dark:hover:bg-gray-700 transition">
                  <td class="px-5 py-3 text-gray-900 dark:text-gray-200 font-semibold align-top">{{ $index + 1 }}</td>

                  <td class="px-5 py-3 text-gray-900 dark:text-gray-200 align-top">
                    <div class="font-medium">{{ $lending->book->title ?? 'N/A' }}</div>
                    @if(!empty($lending->book?->author))
                      <div class="text-xs text-gray-500 dark:text-gray-400">by {{ $lending->book->author }}</div>
                    @endif
                  </td>

                  <td class="px-5 py-3 align-top">
                    <span class="inline-block px-2 py-1 rounded text-xs font-semibold {{ $badge($status) }}">
                      {{ ucfirst($status ?? 'unknown') }}
                    </span>
                  </td>

                  <td class="px-5 py-3 text-gray-900 dark:text-gray-200 align-top">
                    {{ $fmt($lending->issued_at) }}
                  </td>

                  <td class="px-5 py-3 text-gray-900 dark:text-gray-200 align-top">
                    {{ $fmt($due) }}
                  </td>

                  <td class="px-5 py-3 text-gray-900 dark:text-gray-200 align-top">
                    @if($returned)
                      <span class="inline-flex items-center gap-1 text-green-600 dark:text-green-400 font-semibold">
                        <svg class="h-4 w-4" viewBox="0 0 24 24" fill="currentColor"><path d="M9 16.2 4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"/></svg>
                        {{ $fmt($returned) }}
                      </span>
                    @else
                      <span class="inline-flex items-center gap-1 text-red-600 dark:text-red-400 font-semibold">
                        <svg class="h-4 w-4" viewBox="0 0 24 24" fill="currentColor"><path d="M18.3 5.71 12 12.01 5.7 5.7 4.29 7.11l6.29 6.29-6.3 6.3 1.42 1.41 6.3-6.29 6.29 6.29 1.41-1.41-6.29-6.29 6.29-6.29z"/></svg>
                        Not Returned
                      </span>
                    @endif
                  </td>

                  <td class="px-5 py-3 align-top">
                    @if($isOverdue)
                      <span class="inline-flex items-center gap-1 text-amber-700 bg-amber-100 dark:text-amber-200 dark:bg-amber-700/40 px-2 py-0.5 rounded text-xs font-semibold">
                        <svg class="h-4 w-4" viewBox="0 0 24 24" fill="currentColor"><path d="M1 21h22L12 2 1 21zm12-3h-2v-2h2v2zm0-4h-2v-4h2v4z"/></svg>
                        {{ $overdueDays }} day{{ $overdueDays > 1 ? 's' : '' }}
                      </span>
                    @else
                      <span class="text-xs text-gray-500 dark:text-gray-400">—</span>
                    @endif
                  </td>
                </tr>
              @endforeach
            </tbody>
          </table>
        </div>

        {{-- Mobile cards --}}
        <div class="md:hidden space-y-4">
          @foreach($lendings as $index => $lending)
            @php
              $status = $lending->status ?? '';
              $due = $lending->return_at;
              $returned = $lending->returned_at;
              $isOverdue = !$returned && $due && now()->gt($due);
              $overdueDays = $isOverdue ? \Carbon\Carbon::parse($due)->diffInDays(now()) : 0;
            @endphp

            <div class="rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-800 p-4">
              <div class="flex items-start justify-between gap-3">
                <div>
                  <div class="text-xs text-gray-500 dark:text-gray-400">#{{ $index + 1 }}</div>
                  <div class="mt-0.5 text-base font-semibold text-gray-900 dark:text-white">
                    {{ $lending->book->title ?? 'N/A' }}
                  </div>
                  @if(!empty($lending->book?->author))
                    <div class="text-xs text-gray-500 dark:text-gray-400">by {{ $lending->book->author }}</div>
                  @endif
                </div>
                <span class="inline-block px-2 py-1 rounded text-xs font-semibold {{ $badge($status) }}">
                  {{ ucfirst($status ?: 'unknown') }}
                </span>
              </div>

              <div class="mt-3 grid grid-cols-2 gap-3 text-sm">
                <div class="rounded bg-gray-50 dark:bg-gray-700 p-2">
                  <div class="text-gray-500 dark:text-gray-300">Issued At</div>
                  <div class="font-medium text-gray-900 dark:text-white">
                    {{ $fmt($lending->issued_at) }}
                  </div>
                </div>
                <div class="rounded bg-gray-50 dark:bg-gray-700 p-2">
                  <div class="text-gray-500 dark:text-gray-300">Return At</div>
                  <div class="font-medium text-gray-900 dark:text-white">
                    {{ $fmt($due) }}
                  </div>
                </div>
              </div>

              <div class="mt-3 flex items-center justify-between">
                <div class="text-sm">
                  @if($returned)
                    <span class="inline-flex items-center gap-1 text-green-600 dark:text-green-400 font-semibold">
                      ✅ {{ $fmt($returned) }}
                    </span>
                  @else
                    <span class="inline-flex items-center gap-1 text-red-600 dark:text-red-400 font-semibold">
                      ❌ Not Returned
                    </span>
                  @endif
                </div>

                <div class="text-right">
                  @if($isOverdue)
                    <span class="inline-flex items-center gap-1 text-amber-700 bg-amber-100 dark:text-amber-200 dark:bg-amber-700/40 px-2 py-0.5 rounded text-xs font-semibold">
                      ⏰ {{ $overdueDays }} day{{ $overdueDays > 1 ? 's' : '' }} overdue
                    </span>
                  @else
                    <span class="text-xs text-gray-500 dark:text-gray-400">—</span>
                  @endif
                </div>
              </div>
            </div>
          @endforeach
        </div>
      @else
        <p class="text-gray-600 dark:text-gray-400 mt-6 italic">No books issued by this user.</p>
      @endif

      {{-- Back Button --}}
      <div class="mt-8 sm:mt-10">
        <a href="{{ route('admin.users.index') }}"
           class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-6 sm:px-8 py-3 rounded-xl shadow-lg transition font-semibold tracking-wide">
          ← Back to User Management
        </a>
      </div>

    </div>
  </div>
</div>
@endsection
