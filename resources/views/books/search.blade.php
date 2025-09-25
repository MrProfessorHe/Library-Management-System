@extends('layouts.app')

@section('title', 'Search Results')

@section('content')
    <div class="bg-gray-100 dark:bg-gray-900 py-6">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <!-- Search Header -->
            <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6 md:p-8 mb-8">
                <div class="flex items-center justify-between mb-6">
                    <div>
                        <h1 class="text-3xl font-bold text-gray-900 dark:text-gray-100 mb-2">
                            Search Results
                        </h1>
                        <p class="text-gray-600 dark:text-gray-400">
                            Found results for "<span
                                class="font-semibold text-blue-600 dark:text-blue-400">{{ $query }}</span>"
                        </p>
                    </div>
                    <div class="text-sm text-gray-500 dark:text-gray-400">
                        {{ count($localBooks) + count($apiBooks) }} results found
                    </div>
                </div>


                <!-- Search Form -->
                <form method="GET" action="{{ route('books.search') }}" autocomplete="off" class="max-w-2xl">
                    <div
                        class="flex items-center rounded-2xl overflow-hidden border-2 border-blue-300 dark:border-blue-600 bg-white dark:bg-gray-800 shadow-md w-full">

                        <!-- Left Icon -->
                        <div class="pl-4 flex items-center text-blue-500 dark:text-blue-300">
                            <svg class="w-5 h-5" fill="none" viewBox="0 0 20 20">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                            </svg>
                        </div>

                        <!-- Input -->
                        <input type="text" name="search" value="{{ $query }}"
                            placeholder="Search for books, authors, or genres..." class="autocomplete=off flex-1 py-3 px-3 text-lg bg-transparent
                           text-gray-900 dark:text-white
                           placeholder-gray-500 dark:placeholder-gray-400
                           focus:outline-none border-0">

                        <!-- Button -->
                        <div class=" inset-y-0 right-0 flex items-center pr-4">
                            <button type="submit"
                                class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg transition duration-200 shadow-md">
                                Search
                            </button>
                        </div>
                    </div>
                </form>
                @if(session()->has('error'))
                    <div class="mb-4">
                        <div id="error-box"
                            class="max-w-7xl mx-auto mt-8 p-4 bg-red-100 dark:bg-red-900/40 text-red-800 dark:text-red-300 border border-red-200 dark:border-red-800 rounded-lg shadow-sm">
                            {{ session('error') }}
                        </div>
                    </div>s
                @endif



            </div>

            <!-- Results Section -->
            <div class="space-y-8">
                <!-- Local Library Results -->
                @if(count($localBooks) > 0)
                    <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6 md:p-8">
                        <div class="flex items-center justify-between mb-6">
                            <h2 class="text-2xl font-bold text-gray-900 dark:text-gray-100 flex items-center">
                                <svg class="w-6 h-6 mr-2 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.746 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253">
                                    </path>
                                </svg>
                                From Our Library
                            </h2>
                            <span class="text-sm text-gray-500 dark:text-gray-400">
                                {{ count($localBooks) }} books available
                            </span>
                        </div>

                        <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-6">
                            @foreach ($localBooks as $book)
                                <div
                                    class="bg-gray-50 dark:bg-gray-700 rounded-lg shadow-md hover:shadow-xl transition-all duration-300 hover:-translate-y-1">
                                    <a href="{{ route('books.external.show', ['isbn' => $book->isbn, 'id' => $book->id ?? null]) }}"
                                        class="block p-4">
                                        <div class="aspect-[3/4] mb-3 overflow-hidden rounded-md">
                                            <img src="{{ $book->cover_image ?? 'https://dummyimage.com/150x200/cccccc/000000&text=No+Image' }}"
                                                class="w-full h-full object-cover hover:scale-105 transition-transform duration-300"
                                                alt="{{ $book->title }}">
                                        </div>
                                        <h3 class="font-semibold text-gray-900 dark:text-white text-sm mb-1 line-clamp-2">
                                            {{ $book->title }}
                                        </h3>
                                        <p class="text-xs text-gray-600 dark:text-gray-400 line-clamp-1">
                                            {{ $book->author }}
                                        </p>
                                        @if($book->quantity > 0)
                                            <p class="text-xs text-green-600 dark:text-green-400 mt-1 font-medium">
                                                Available: {{ $book->quantity }}
                                            </p>
                                        @else
                                            <p class="text-xs text-red-600 dark:text-red-400 mt-1 font-medium">
                                                Out of Stock
                                            </p>
                                        @endif
                                    </a>
                                </div>
                            @endforeach
                        </div>
                    </div>
                @endif

                <!-- External API Results -->
                @if(count($apiBooks) > 0)
                    <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6 md:p-8">
                        <div class="flex items-center justify-between mb-6">
                            <h2 class="text-2xl font-bold text-gray-900 dark:text-gray-100 flex items-center">
                                <svg class="w-6 h-6 mr-2 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9v-9m0-9v9"></path>
                                </svg>
                                From External Sources
                            </h2>
                            <span class="text-sm text-gray-500 dark:text-gray-400">
                                {{ count($apiBooks) }} books found
                            </span>
                        </div>

                        <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-6">
                            @foreach ($apiBooks as $item)
                                @php
                                    $volume = $item['volumeInfo'] ?? [];
                                    $image = $volume['imageLinks']['thumbnail'] ?? 'https://dummyimage.com/150x200/cccccc/000000&text=No+Image';
                                    $title = $volume['title'] ?? 'No title';
                                    $authors = implode(', ', $volume['authors'] ?? ['Unknown Author']);

                                    // Extract ISBN_13 or ISBN_10 if available
                                    $isbn = collect($volume['industryIdentifiers'] ?? [])->firstWhere('type', 'ISBN_13')['identifier']
                                        ?? collect($volume['industryIdentifiers'] ?? [])->firstWhere('type', 'ISBN_10')['identifier']
                                        ?? null;
                                @endphp

                                @if($isbn)
                                    <div
                                        class="bg-gray-50 dark:bg-gray-700 rounded-lg shadow-md hover:shadow-xl transition-all duration-300 hover:-translate-y-1">
                                        <a href="{{ route('books.external.show', ['isbn' => $isbn]) }}" class="block p-4">
                                            <div class="aspect-[3/4] mb-3 overflow-hidden rounded-md">
                                                <img src="{{ $image }}"
                                                    class="w-full h-full object-cover hover:scale-105 transition-transform duration-300"
                                                    alt="{{ $title }}" />
                                            </div>
                                            <h3 class="font-semibold text-gray-900 dark:text-white text-sm mb-1 line-clamp-2">
                                                {{ $title }}
                                            </h3>
                                            <p class="text-xs text-gray-600 dark:text-gray-400 line-clamp-1">
                                                {{ $authors }}
                                            </p>
                                        </a>
                                    </div>
                                @endif

                            @endforeach
                        </div>
                    </div>
                @endif

                <!-- No Results -->
                @if(count($localBooks) === 0 && count($apiBooks) === 0)
                    <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-12 text-center">
                        <div
                            class="mx-auto w-24 h-24 bg-gray-100 dark:bg-gray-700 rounded-full flex items-center justify-center mb-6">
                            <svg class="w-12 h-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                            </svg>
                        </div>
                        <h3 class="text-xl font-semibold text-gray-900 dark:text-gray-100 mb-2">
                            No books found
                        </h3>
                        <p class="text-gray-600 dark:text-gray-400 mb-6">
                            We couldn't find any books matching "{{ $query }}". Try different keywords or browse our collection.
                        </p>
                        <a href="{{ route('home') }}"
                            class="inline-flex items-center px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition duration-200">
                            Browse All Books
                        </a>
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection

<script>
    document.addEventListener("DOMContentLoaded", function () {
        let errorBox = document.getElementById("error-box");
        if (errorBox) {
            setTimeout(() => {
                errorBox.classList.add("opacity-0", "-translate-y-4"); // fade + slide up
            }, 3000); // start after 3s

            setTimeout(() => {
                errorBox.style.display = "none"; // fully remove after transition
            }, 3800); // matches duration
        }
    });
</script>