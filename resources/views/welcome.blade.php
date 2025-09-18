@extends('layouts.app')

@section('title', 'Library Home')

@section('content')
    <div class="bg-gray-100 dark:bg-gray-900 min-h-screen">
        <div class="max-w-9xl mx-auto px-3 sm:px-6 lg:px-10 py-8">

            <!-- Hero Section -->
            <div class="text-center mb-14">
                <h1 class="text-4xl md:text-5xl font-extrabold text-gray-900 dark:text-gray-100 mb-4">
                    Welcome to Oakwood Library
                </h1>
                <p class="text-lg md:text-xl text-gray-600 dark:text-gray-400 mb-8 max-w-3xl mx-auto">
                    Discover thousands of books — from timeless classics to modern bestsellers.
                    Start your reading journey today.
                </p>

                <!-- Search Form -->
                <form method="GET" action="{{ route('books.search') }}" autocomplete="off" class="max-w-2xl mx-auto">
                    <div
                        class="flex items-center bg-white dark:bg-gray-800 border-2 border-blue-300 dark:border-blue-600 rounded-2xl shadow-md focus-within:ring-4 focus-within:ring-blue-500/20 transition duration-200">

                        <!-- Search icon -->
                        <div class="pl-4 text-blue-500 dark:text-blue-300">
                            <svg class="w-6 h-6" fill="none" viewBox="0 0 20 20">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                            </svg>
                        </div>

                        <!-- Input -->
                        <input type="text" name="search" value="{{ request('search') }}"
                            placeholder="Search for books, authors, or genres..."
                            class="autocomplete=off flex-1 py-4 px-3 text-lg bg-transparent text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 border-0 border-l-0 border-r-0 focus:outline-none focus:ring-0" />

                        <!-- Button -->
                        <button type="submit"
                            class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 m-2 rounded-xl transition duration-200 shadow-md flex items-center gap-2">
                            <svg class="w-5 h-5" fill="none" viewBox="0 0 20 20">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                            </svg>
                            Search
                        </button>
                    </div>
                    @if(session()->has('error'))
                        <div class="max-w-2xl mx-auto mb-4">
                            <div id="error-box"
                                class="max-w-7xl mx-auto mt-8 p-4 bg-red-100 dark:bg-red-900/40 text-red-800 dark:text-red-300 border border-red-200 dark:border-red-800 rounded-lg shadow-sm">
                                {{ session('error') }}
                            </div>
                        </div>
                    @endif


                </form>

            </div>

            <!-- Book Categories -->
            <div class="space-y-12">

                <!-- Category Component -->
                @php
                    $categories = [
                        ['title' => 'Trending Books', 'data' => $trendingBooks, 'id' => 'trending-books', 'external' => true],
                        ['title' => 'Comics & Graphic Novels', 'data' => $comics, 'id' => 'comics-book'],
                        ['title' => 'Action & Adventure', 'data' => $action, 'id' => 'action-book'],
                        ['title' => 'Fiction Books', 'data' => $fiction, 'id' => 'fiction-book'],
                        ['title' => 'Horror Books', 'data' => $horror, 'id' => 'horror-book'],
                        ['title' => 'Thriller Books', 'data' => $thriller, 'id' => 'thriller-book']

                    ];
                @endphp

                @foreach($categories as $category)
                    <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg p-6 md:p-8">
                        <div class="flex items-center justify-between mb-6">
                            <h2 class="text-2xl font-bold text-gray-900 dark:text-gray-100">{{ $category['title'] }}</h2>
                            <a href="{{ route('books.search') }}"
                                class="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 font-medium hover:underline transition-colors">
                                View All →
                            </a>
                        </div>
                        <div class="relative group">
                            <button onclick="scrollToLeft('{{ $category['id'] }}')"
                                class="hidden group-hover:flex items-center justify-center absolute left-2 top-1/2 -translate-y-1/2 z-10 bg-gray-200 dark:bg-gray-700 hover:bg-gray-300 dark:hover:bg-gray-600 shadow-lg rounded-full w-10 h-10">
                                ‹
                            </button>

                            <div id="{{ $category['id'] }}-wrapper"
                                class="overflow-x-auto whitespace-nowrap px-4 no-scrollbar scroll-smooth">
                                <div id="{{ $category['id'] }}" class="inline-flex gap-4 py-2">
                                    @forelse ($category['data'] as $book)
                                                        <div
                                                            class="min-w-[160px] bg-white dark:bg-gray-700 rounded-xl shadow-md p-4 hover:-translate-y-2 hover:shadow-xl transition duration-300">
                                                            <a
                                                                href="{{ $category['external'] ?? false
                                        ? route('books.external.show', ['isbn' => $book['isbn']])
                                        : route('books.external.show', ['isbn' => $book->isbn, 'id' => $book->id ?? null]) }}">
                                                                <img src="{{ $book['thumbnail'] ?? $book->cover_image ?? 'https://dummyimage.com/150x200/cccccc/000000&text=No+Image' }}"
                                                                    alt="{{ $book['title'] ?? $book->title }}"
                                                                    class="w-32 h-auto mx-auto mb-4 rounded-md" />
                                                                <h3
                                                                    class="text-lg font-semibold text-gray-800 dark:text-white line-clamp-1 truncate w-40">
                                                                    {{ $book['title'] ?? $book->title }}
                                                                </h3>
                                                                <p class="text-sm text-gray-600 dark:text-gray-300 truncate w-36">
                                                                    {{ is_array($book['authors'] ?? null)
                                        ? implode(', ', $book['authors'])
                                        : ($book['author'] ?? 'Unknown Author') }}
                                                                </p>
                                                                @if(isset($book['description']))
                                                                    <p class="text-sm text-gray-500 dark:text-gray-200 truncate w-36">
                                                                        {{ \Illuminate\Support\Str::limit($book['description'], 100) }}
                                                                    </p>
                                                                @endif

                                                            </a>
                                                        </div>
                                    @empty
                                        <p class="text-gray-500 dark:text-gray-300">No books found.</p>
                                    @endforelse
                                </div>
                            </div>

                            <button onclick="scrollToRight('{{ $category['id'] }}')"
                                class="hidden group-hover:flex items-center justify-center absolute right-2 top-1/2 -translate-y-1/2 z-10 bg-gray-200 dark:bg-gray-700 hover:bg-gray-300 dark:hover:bg-gray-600 shadow-lg rounded-full w-10 h-10">
                                ›
                            </button>
                        </div>
                    </div>
                @endforeach

            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        function scrollToLeft(id) {
            document.getElementById(id + '-wrapper').scrollBy({ left: -300, behavior: 'smooth' });
        }
        function scrollToRight(id) {
            document.getElementById(id + '-wrapper').scrollBy({ left: 300, behavior: 'smooth' });
        }
    </script>
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