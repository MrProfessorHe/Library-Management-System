@php
use Illuminate\Support\Str;
@endphp

@extends('layouts.app')

@section('title', $book['title'] ?? 'Book Details')

@section('content')
<div class="bg-slate-50 text-slate-800 dark:bg-slate-900 dark:text-slate-200 transition-colors duration-300">
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 md:py-4">

  <div class="mb-8">
    <a href="{{ url()->previous() }}" 
       class="inline-flex items-center gap-2 px-4 py-2 border border-slate-300 dark:border-slate-600 text-slate-600 dark:text-slate-300 rounded-lg hover:bg-slate-100 dark:hover:bg-slate-700 transition-colors duration-200 font-semibold">
      <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
        <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
      </svg>
      Back
    </a>
  </div>

  <div class="bg-white dark:bg-slate-800 rounded-2xl shadow-lg dark:shadow-2xl dark:shadow-black/20 border border-slate-200 dark:border-slate-700 grid grid-cols-1 lg:grid-cols-3">

    {{-- Left Column: Book Cover & Availability Status --}}
    <div class="p-8 lg:p-12 border-b lg:border-b-0 lg:border-r border-slate-200 dark:border-slate-700">
      <div class="space-y-6 sticky top-12">
        <div class="overflow-hidden rounded-lg shadow-md">
          <img src="{{ $book['thumbnail'] }}" alt="{{ $book['title'] }}"
               class="w-full h-auto object-contain bg-slate-100 dark:bg-slate-700" />
        </div>

        @if(isset($localBook) && $localBook)
          @if($localBook->quantity > 0)
            <div class="border-t border-slate-200 dark:border-slate-700 pt-6">
              <div class="flex items-center justify-between text-lg">
                <p class="font-bold text-green-600 dark:text-green-500">Available</p>
                <p class="text-slate-500 dark:text-slate-400">{{ $localBook->quantity }} copies</p>
              </div>

              <form action="{{ route('lendings.request', ['book' => $localBook->id]) }}" method="POST" class="mt-4">
                @csrf
                <button type="submit"
                  class="w-full py-3 px-5 bg-blue-600 hover:bg-blue-700 dark:bg-blue-500 dark:hover:bg-blue-600 focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-800 rounded-lg text-white font-semibold shadow-sm transition-colors duration-200">
                  Request to Borrow
                </button>
              </form>
            </div>
          @else
            <div class="border-t border-slate-200 dark:border-slate-700 pt-6">
              <p class="py-3 px-5 text-center bg-slate-100 dark:bg-slate-700 text-slate-500 dark:text-slate-400 rounded-lg font-medium">
                Not available for borrowing
              </p>
            </div>
          @endif
        @else
          <div class="border-t border-slate-200 dark:border-slate-700 pt-6">
            <p class="py-3 px-5 text-center bg-yellow-100 dark:bg-yellow-900/40 text-yellow-800 dark:text-yellow-400 rounded-lg font-medium">
              Not in our library stock
            </p>
          </div>
        @endif
      </div>
    </div>

    {{-- Right Column: All Book Information --}}
    <div class="lg:col-span-2 p-8 lg:p-12">
      <div class="space-y-8">

        {{-- Header: Title, Author, and Rating --}}
        <div class="pb-6 border-b border-slate-200 dark:border-slate-700">
          <h1 class="text-4xl md:text-5xl font-extrabold tracking-tight text-slate-900 dark:text-white mb-2">
            {{ $book['title'] }}
          </h1>
          <p class="text-xl text-slate-500 dark:text-slate-400 mb-4">
            by {{ implode(', ', $book['authors']) }}
          </p>

          @if (!empty($book['averageRating']))
            <div class="flex items-center gap-2">
              <div class="flex text-yellow-500 dark:text-yellow-400">
                @for ($i = 0; $i < round($book['averageRating']); $i++)
                  <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09 1.123-6.545L.49 6.91l6.562-.955L10 0l2.948 5.955 6.562.955-4.755 4.635 1.123 6.545z"/></svg>
                @endfor
                @for ($i = round($book['averageRating']); $i < 5; $i++)
                  <svg class="w-5 h-5 fill-current text-slate-300 dark:text-slate-600" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09 1.123-6.545L.49 6.91l6.562-.955L10 0l2.948 5.955 6.562.955-4.755 4.635 1.123 6.545z"/></svg>
                @endfor
              </div>
              <span class="text-slate-500 dark:text-slate-400 font-medium">
                {{ number_format($book['averageRating'], 1) }}
                <span class="text-slate-400 dark:text-slate-500">({{ $book['ratingsCount'] ?? 'N/A' }} reviews)</span>
              </span>
            </div>
          @endif
        </div>

        {{-- Details Section --}}
        <div>
          <h2 class="text-xl font-bold text-slate-900 dark:text-white mb-4">Book Details</h2>
          <dl class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-4 text-base">
            @if (!empty($book['publisher']))
              <div class="flex flex-col">
                <dt class="font-semibold text-slate-800 dark:text-slate-200">Publisher</dt>
                <dd class="text-slate-500 dark:text-slate-400">{{ $book['publisher'] }}</dd>
              </div>
            @endif
            @if (!empty($book['publishedDate']))
              <div class="flex flex-col">
                <dt class="font-semibold text-slate-800 dark:text-slate-200">Published Date</dt>
                <dd class="text-slate-500 dark:text-slate-400">{{ $book['publishedDate'] }}</dd>
              </div>
            @endif
            @if (!empty($book['language']))
               <div class="flex flex-col">
                <dt class="font-semibold text-slate-800 dark:text-slate-200">Language</dt>
                <dd class="text-slate-500 dark:text-slate-400">{{ strtoupper($book['language']) }}</dd>
              </div>
            @endif
            @if (!empty($book['isbn']))
              <div class="flex flex-col">
                <dt class="font-semibold text-slate-800 dark:text-slate-200">ISBN</dt>
                <dd class="text-slate-500 dark:text-slate-400">{{ $book['isbn'] }}</dd>
              </div>
            @endif
            @if (!empty($book['categories']))
              <div class="flex flex-col md:col-span-2">
                <dt class="font-semibold text-slate-800 dark:text-slate-200">Categories</dt>
                <dd class="text-slate-500 dark:text-slate-400">{{ implode(', ', $book['categories']) }}</dd>
              </div>
            @endif
          </dl>
        </div>

        {{-- Description Section --}}
        <div>
          <h2 class="text-xl font-bold text-slate-900 dark:text-white mb-4">Description</h2>
          <div class="prose prose-slate dark:prose-invert max-w-none text-slate-600 dark:text-slate-400 leading-relaxed">
            <p>{!! nl2br(e($book['description'])) !!}</p>
          </div>
        </div>

      </div>
    </div> </div> {{-- Flash Messages --}}
  @if (session('success'))
    <div class="max-w-7xl mx-auto mt-8 p-4 bg-green-100 dark:bg-green-900/40 text-green-800 dark:text-green-300 border border-green-200 dark:border-green-800 rounded-lg shadow-sm">
      {{ session('success') }}
    </div>
  @endif
  @if (session('error'))
    <div class="max-w-7xl mx-auto mt-8 p-4 bg-red-100 dark:bg-red-900/40 text-red-800 dark:text-red-300 border border-red-200 dark:border-red-800 rounded-lg shadow-sm">
      {{ session('error') }}
    </div>
  @endif

</div>
</div>
@endsection