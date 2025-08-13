@php
use Illuminate\Support\Str;
@endphp


@extends('layouts.app')

@section('title', $book['title'])

@section('content')
<div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 mt-16">

  <div class="bg-white dark:bg-gray-800 rounded-3xl shadow-2xl p-10 sm:p-14 grid grid-cols-1 md:grid-cols-3 gap-12">

    {{-- Book Cover + Request Button --}}
    <div class="sticky top-32 space-y-6">

      <div class="overflow-hidden rounded-2xl shadow-lg transform transition-transform hover:scale-105 cursor-pointer">
        <img src="{{ $book['thumbnail'] }}" alt="{{ $book['title'] }}" 
             class="w-full h-auto object-contain bg-gray-100 dark:bg-gray-700" />
      </div>

      @if(isset($localBook) && $localBook)
        @if($localBook->quantity > 0)
          <p class="text-green-600 font-semibold text-lg flex items-center gap-2">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" 
                 viewBox="0 0 24 24"><path d="M5 13l4 4L19 7"/></svg>
            Available: {{ $localBook->quantity }} copies
          </p>

          <form action="{{ route('lendings.request', ['book' => $localBook->id]) }}" method="POST" class="mt-4">
            @csrf
            <button type="submit"
              class="w-full py-3 bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-400 focus:ring-opacity-50 rounded-xl text-white font-bold shadow-lg transition">
              📚 Request to Borrow
            </button>
          </form>
        @else
          <p class="text-red-600 font-semibold flex items-center gap-2">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" 
                 viewBox="0 0 24 24"><path d="M18 6L6 18M6 6l12 12"/></svg>
            Not available for borrowing.
          </p>
        @endif
      @else
        <p class="text-yellow-500 font-semibold flex items-center gap-2">
          ⚠️ This book is not in our library stock.
        </p>
      @endif

    </div>

    {{-- Book Info --}}
    <div class="md:col-span-2 flex flex-col justify-between">
      <div>

        {{-- Title --}}
        <h1 class="text-4xl font-extrabold tracking-tight mb-4 text-gray-900 dark:text-gray-100">
          {{ $book['title'] }}
        </h1>

        {{-- Authors --}}
        <p class="text-xl text-gray-700 dark:text-gray-300 mb-6">
          <span class="font-semibold">By:</span> {{ implode(', ', $book['authors']) }}
        </p>

        {{-- Rating Stars --}}
        @if (!empty($book['averageRating']))
          <div class="flex items-center mb-6">
            @php
              $fullStars = floor($book['averageRating']);
              $halfStar = $book['averageRating'] - $fullStars >= 0.5;
              $emptyStars = 5 - $fullStars - ($halfStar ? 1 : 0);
            @endphp
            <div class="flex text-yellow-400">
              @for ($i = 0; $i < $fullStars; $i++)
                <svg class="w-6 h-6 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09 1.123-6.545L.49 6.91l6.562-.955L10 0l2.948 5.955 6.562.955-4.755 4.635 1.123 6.545z"/></svg>
              @endfor
              @if($halfStar)
                <svg class="w-6 h-6 fill-current" viewBox="0 0 20 20">
                  <defs><linearGradient id="halfGrad"><stop offset="50%" stop-color="currentColor" /><stop offset="50%" stop-color="transparent" /></linearGradient></defs>
                  <path fill="url(#halfGrad)" d="M10 15l-5.878 3.09 1.123-6.545L.49 6.91l6.562-.955L10 0l2.948 5.955 6.562.955-4.755 4.635 1.123 6.545z"/>
                </svg>
              @endif
              @for ($i = 0; $i < $emptyStars; $i++)
                <svg class="w-6 h-6 fill-gray-300 dark:fill-gray-600" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09 1.123-6.545L.49 6.91l6.562-.955L10 0l2.948 5.955 6.562.955-4.755 4.635 1.123 6.545z"/></svg>
              @endfor
            </div>
            <span class="ml-3 text-gray-600 dark:text-gray-400 text-lg font-medium">
              {{ number_format($book['averageRating'], 1) }}/5 ({{ $book['ratingsCount'] ?? 'N/A' }} reviews)
            </span>
          </div>
        @endif

        {{-- Metadata Grid --}}
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 text-gray-700 dark:text-gray-300 mb-8">
          @if (!empty($book['publisher']))
            <div class="flex items-center space-x-3">
              <svg class="w-5 h-5 text-blue-500 dark:text-blue-400" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                <path d="M12 20h9" /><path d="M3 20h6" /><path d="M7 4v16" /><path d="M7 4h7a2 2 0 0 1 2 2v2h-9v-4z" />
              </svg>
              <span><strong>Publisher:</strong> {{ $book['publisher'] }}</span>
            </div>
          @endif

          @if (!empty($book['publishedDate']))
            <div class="flex items-center space-x-3">
              <svg class="w-5 h-5 text-green-500 dark:text-green-400" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                <rect x="3" y="4" width="18" height="18" rx="2" ry="2" /><line x1="16" y1="2" x2="16" y2="6" /><line x1="8" y1="2" x2="8" y2="6" /><line x1="3" y1="10" x2="21" y2="10" />
              </svg>
              <span><strong>Published:</strong> {{ $book['publishedDate'] }}</span>
            </div>
          @endif

          @if (!empty($book['language']))
            <div class="flex items-center space-x-3">
              <svg class="w-5 h-5 text-purple-500 dark:text-purple-400" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                <path d="M12 2l7 7-7 7-7-7 7-7z" />
              </svg>
              <span><strong>Language:</strong> {{ strtoupper($book['language']) }}</span>
            </div>
          @endif

          @if (!empty($book['categories']))
            <div class="flex items-center space-x-3">
              <svg class="w-5 h-5 text-pink-500 dark:text-pink-400" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                <path d="M4 6h16M4 12h16M4 18h16" />
              </svg>
              <span><strong>Category:</strong> {{ implode(', ', $book['categories']) }}</span>
            </div>
          @endif

          @if (!empty($book['isbn']))
            <div class="flex items-center space-x-3">
              <svg class="w-5 h-5 text-yellow-500 dark:text-yellow-400" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                <path d="M12 8v8m4-4H8" />
              </svg>
              <span><strong>ISBN:</strong> {{ $book['isbn'] }}</span>
            </div>
          @endif
        </div>

        {{-- Description collapsible --}}
        <details class="bg-gray-50 dark:bg-gray-900 rounded-xl p-6 shadow-inner">
          <summary class="cursor-pointer text-lg font-semibold text-gray-800 dark:text-gray-200 mb-4 select-none">
            Description
            <svg class="inline-block w-5 h-5 ml-2 text-gray-600 dark:text-gray-400 transform transition-transform duration-300" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
              <polyline points="6 9 12 15 18 9" />
            </svg>
          </summary>
          <div class="mt-2 text-gray-700 dark:text-gray-300 leading-relaxed whitespace-pre-line text-base sm:text-lg max-h-96 overflow-y-auto scrollbar-thin scrollbar-thumb-gray-300 scrollbar-track-gray-100 dark:scrollbar-thumb-gray-600 dark:scrollbar-track-gray-700">
            {!! nl2br(e($book['description'])) !!}
          </div>
        </details>
      </div>
    </div>

  </div>

  {{-- Flash Messages --}}
  @if (session('success'))
    <div class="max-w-5xl mx-auto mt-12 p-5 bg-green-100 text-green-800 rounded-xl shadow-md">
      ✅ {{ session('success') }}
    </div>
  @endif

  @if (session('error'))
    <div class="max-w-5xl mx-auto mt-12 p-5 bg-red-100 text-red-800 rounded-xl shadow-md">
      ❗ {{ session('error') }}
    </div>
  @endif

  {{-- Back Link --}}
  <div class="max-w-5xl mx-auto mt-10">
    <a href="{{ url()->previous() }}" class="text-blue-600 dark:text-blue-400 hover:underline font-semibold text-lg flex items-center gap-2">
      <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
        <polyline points="15 18 9 12 15 6" />
      </svg>
      Back to Previous Page
    </a>
  </div>

</div>
@endsection
