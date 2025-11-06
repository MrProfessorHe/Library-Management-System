@extends('layouts.app')

@section('title', 'Library Home')

@section('content')
    <div class="bg-gray-100 dark:bg-gray-900 min-h-screen">
        <div class="max-w-screen-2xl mx-auto px-3 sm:px-6 lg:px-10 py-8">

            {{-- Hero Section --}}
            <div class="text-center mb-10 sm:mb-14">
                <h1 class="text-3xl sm:text-4xl md:text-5xl font-extrabold text-gray-900 dark:text-gray-100 mb-3 sm:mb-4 leading-tight">
                    Welcome to Oakwood Library
                </h1>
                <p class="text-base sm:text-lg md:text-xl text-gray-600 dark:text-gray-400 mb-6 sm:mb-8 max-w-3xl mx-auto">
                    Step into the world of stories, ideas, and imagination — where every book opens a new adventure.
                </p>

                {{-- Search Form --}}
                <form method="GET" action="{{ route('books.search') }}" autocomplete="off" class="max-w-2xl mx-auto">
                    <div
                        class="flex items-center bg-white dark:bg-gray-800 border-2 border-blue-300 dark:border-blue-600 rounded-2xl shadow-md focus-within:ring-4 focus-within:ring-blue-500/20 transition duration-200">
                        {{-- icon --}}
                        <div class="pl-4 text-blue-500 dark:text-blue-300">
                            <svg class="w-5 h-5 sm:w-6 sm:h-6" fill="none" viewBox="0 0 20 20">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                            </svg>
                        </div>

                        {{-- input --}}
                        <input
                            type="text"
                            name="search"
                            value="{{ request('search') }}"
                            placeholder="Search for books, authors, or genres..."
                            class="flex-1 py-3 sm:py-3.5 px-3 text-base sm:text-lg bg-transparent text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 border-0 focus:outline-none focus:ring-0" />

                        {{-- button --}}
                        <button type="submit"
                                class="bg-blue-600 hover:bg-blue-700 text-white px-3 sm:px-5 py-2 m-2 rounded-xl transition duration-200 shadow-md flex items-center gap-2">
                            <svg class="w-5 h-5" fill="none" viewBox="0 0 20 20">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                            </svg>
                            <span class="hidden xs:inline">Search</span>
                        </button>
                    </div>

                    @if(session()->has('error'))
                        <div class="max-w-2xl mx-auto mb-4">
                            <div id="error-box"
                                 class="mt-4 p-3 sm:p-4 bg-red-100 dark:bg-red-900/40 text-red-800 dark:text-red-300 border border-red-200 dark:border-red-800 rounded-lg shadow-sm transition-all">
                                {{ session('error') }}
                            </div>
                        </div>
                    @endif
                </form>
            </div>

            {{-- Categories --}}
            <div class="space-y-8 sm:space-y-12">
                @php
                    $categories = [
                        ['title' => 'Trending Books', 'data' => $trendingBooks, 'id' => 'trending-books', 'external' => true],
                        ['title' => 'Comics & Graphic Novels', 'data' => $comics, 'id' => 'comics-books'],
                        ['title' => 'Action & Adventure', 'data' => $action, 'id' => 'action-books'],
                        ['title' => 'Fiction Books', 'data' => $fiction, 'id' => 'fiction-books'],
                        ['title' => 'Horror Books', 'data' => $horror, 'id' => 'horror-books'],
                        ['title' => 'Thriller Books', 'data' => $thriller, 'id' => 'thriller-books'],
                    ];
                @endphp

                @foreach($categories as $category)
                    <section class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg p-4 sm:p-6 md:p-7">
                        <div class="flex items-center justify-between gap-4 mb-3 sm:mb-5">
                            <h2 class="text-lg sm:text-xl md:text-2xl font-bold text-gray-900 dark:text-gray-100">
                                {{ $category['title'] }}
                            </h2>

                            @if ($category['title'] !== 'Trending Books')
                                <a href="{{ route('books.search') }}?category={{ $category['id'] }}"
                                   class="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 text-sm sm:text-base font-medium hover:underline transition-colors">
                                    View All →
                                </a>
                            @endif
                        </div>

                        {{-- Mobile: grid (2–3 per row) - smaller cards --}}
                        <div class="md:hidden">
                            <div class="grid grid-cols-2 xs:grid-cols-3 gap-3">
                                @forelse ($category['data'] as $book)
                                    @php
                                        $title = $book['title'] ?? $book->title ?? 'Untitled';
                                        $thumb = $book['thumbnail'] ?? $book->cover_image ?? 'https://dummyimage.com/200x280/cccccc/000000&text=No+Image';
                                        $authors = is_array($book['authors'] ?? null)
                                            ? implode(', ', $book['authors'])
                                            : ($book['author'] ?? 'Unknown Author');
                                        $link = ($category['external'] ?? false)
                                            ? route('books.external.show', ['isbn' => $book['isbn'] ?? $book->isbn ?? ''])
                                            : route('books.external.show', ['isbn' => $book->isbn ?? $book['isbn'] ?? '', 'id' => $book->id ?? null]);
                                    @endphp

                                    <a href="{{ $link }}"
                                       class="group block rounded-xl bg-white dark:bg-gray-700 border border-gray-200 dark:border-gray-600 p-2.5 shadow-sm hover:shadow-md transition">
                                        <img src="{{ $thumb }}" alt="{{ $title }}" class="w-full h-36 object-cover rounded-md mb-2">
                                        <h3 class="text-[13px] font-semibold text-gray-800 dark:text-white line-clamp-2">{{ $title }}</h3>
                                        <p class="mt-1 text-[11px] text-gray-600 dark:text-gray-300 line-clamp-1">{{ $authors }}</p>
                                    </a>
                                @empty
                                    <p class="col-span-2 xs:col-span-3 text-gray-500 dark:text-gray-300">No books found.</p>
                                @endforelse
                            </div>
                        </div>

                        {{-- Desktop/Tablet: horizontal carousel with snap - smaller cards --}}
                        <div class="hidden md:block relative group/slider">
                            {{-- Left --}}
                            <button
                                onclick="scrollToLeft('{{ $category['id'] }}')"
                                aria-label="Scroll left"
                                class="pointer-events-none opacity-0 group-hover/slider:opacity-100 group-hover/slider:pointer-events-auto
                                       focus:opacity-100 focus:pointer-events-auto
                                       absolute left-2 top-1/2 -translate-y-1/2 z-10
                                       rounded-full w-10 h-10 grid place-items-center
                                       bg-white/90 text-blue-600 shadow-md ring-1 ring-blue-200
                                       hover:bg-white dark:bg-gray-900/80 dark:text-blue-300 dark:ring-blue-700
                                       transition duration-200">
                                ‹
                            </button>

                            <div id="{{ $category['id'] }}-wrapper"
                                 class="overflow-x-auto whitespace-nowrap px-2 sm:px-3 no-scrollbar scroll-smooth snap-x snap-mandatory">
                                <div id="{{ $category['id'] }}" class="inline-flex gap-3 py-1.5">
                                    @forelse ($category['data'] as $book)
                                        @php
                                            $title = $book['title'] ?? $book->title ?? 'Untitled';
                                            $thumb = $book['thumbnail'] ?? $book->cover_image ?? 'https://dummyimage.com/200x280/cccccc/000000&text=No+Image';
                                            $authors = is_array($book['authors'] ?? null)
                                                ? implode(', ', $book['authors'])
                                                : ($book['author'] ?? 'Unknown Author');
                                            $desc = $book['description'] ?? null;
                                            $link = ($category['external'] ?? false)
                                                ? route('books.external.show', ['isbn' => $book['isbn'] ?? $book->isbn ?? ''])
                                                : route('books.external.show', ['isbn' => $book->isbn ?? $book['isbn'] ?? '', 'id' => $book->id ?? null]);
                                        @endphp

                                        <div
                                            class="min-w-[150px] lg:min-w-[170px] bg-white dark:bg-gray-700 rounded-xl shadow-md p-3 hover:-translate-y-1 hover:shadow-lg transition duration-300 snap-start">
                                            <a href="{{ $link }}" class="block">
                                                <img src="{{ $thumb }}" alt="{{ $title }}"
                                                     class="w-28 lg:w-32 h-auto mx-auto mb-2 rounded-md">
                                                <h3 class="text-sm font-semibold text-gray-800 dark:text-white line-clamp-2 w-36 lg:w-40">
                                                    {{ $title }}
                                                </h3>
                                                <p class="text-xs text-gray-600 dark:text-gray-300 mt-0.5 truncate w-32 lg:w-36">
                                                    {{ $authors }}
                                                </p>
                                                @if($desc)
                                                    <p class="text-[11px] text-gray-500 dark:text-gray-200 mt-1 line-clamp-2 w-32 lg:w-36">
                                                        {{ \Illuminate\Support\Str::limit($desc, 100) }}
                                                    </p>
                                                @endif
                                            </a>
                                        </div>
                                    @empty
                                        <p class="text-gray-500 dark:text-gray-300 px-2">No books found.</p>
                                    @endforelse
                                </div>
                            </div>

                            {{-- Right --}}
                            <button
                                onclick="scrollToRight('{{ $category['id'] }}')"
                                aria-label="Scroll right"
                                class="pointer-events-none opacity-0 group-hover/slider:opacity-100 group-hover/slider:pointer-events-auto
                                       focus:opacity-100 focus:pointer-events-auto
                                       absolute right-2 top-1/2 -translate-y-1/2 z-10
                                       rounded-full w-10 h-10 grid place-items-center
                                       bg-white/90 text-blue-600 shadow-md ring-1 ring-blue-200
                                       hover:bg-white dark:bg-gray-900/80 dark:text-blue-300 dark:ring-blue-700
                                       transition duration-200">
                                ›
                            </button>

                            {{-- Edge fades (visual hint to scroll) --}}
                            <div class="pointer-events-none absolute inset-y-0 left-0 w-8 bg-gradient-to-r from-white dark:from-gray-800 to-transparent"></div>
                            <div class="pointer-events-none absolute inset-y-0 right-0 w-8 bg-gradient-to-l from-white dark:from-gray-800 to-transparent"></div>
                        </div>
                    </section>
                @endforeach
            </div>
        </div>
    </div>

    {{-- 🌿 Footer --}}
    <footer class="mt-12 bg-gray-900 dark:bg-gray-950 text-gray-300 dark:text-gray-400">
        <div class="max-w-screen-xl mx-auto px-6 py-10 sm:py-14 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8">
            <div>
                <h3 class="text-xl font-bold text-white mb-3">Oakwood Library</h3>
                <p class="text-sm leading-relaxed">
                    Explore. Learn. Inspire. Your digital gateway to thousands of books, journals, and stories.
                </p>
            </div>

            <div>
                <h4 class="text-lg font-semibold text-white mb-3">Quick Links</h4>
                <ul class="space-y-2">
                    <li><a href="{{ route('home') }}" class="hover:text-blue-400 transition">Home</a></li>
                    <li><a href="{{ route('books.search') }}" class="hover:text-blue-400 transition">Search Books</a></li>
                    <li><a href="{{ route('dashboard') }}" class="hover:text-blue-400 transition">Dashboard</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-lg font-semibold text-white mb-3">Resources</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="hover:text-blue-400 transition">About Us</a></li>
                    <li><a href="#" class="hover:text-blue-400 transition">Help & Support</a></li>
                    <li><a href="#" class="hover:text-blue-400 transition">Privacy Policy</a></li>
                </ul>
            </div>

            <div>
                <h4 id="contact-heading" class="text-lg font-semibold text-white mb-3">Contact Us</h4>

                <address class="not-italic text-sm space-y-1 text-gray-300">
                    <p class="flex items-start gap-2">
                        <span class="mt-[2px]">📍</span>
                        <span>Oakwood Library, Kerala, India</span>
                    </p>
                    <p class="flex items-start gap-2">
                        <span class="mt-[2px]">📧</span>
                        <a href="mailto:support@oakwoodlibrary.com"
                           class="hover:text-blue-400 transition underline-offset-2 hover:underline">
                            support@oakwoodlibrary.com
                        </a>
                    </p>
                    <p class="flex items-start gap-2">
                        <span class="mt-[2px]">📞</span>
                        <a href="tel:+919876543210"
                           class="hover:text-blue-400 transition underline-offset-2 hover:underline">
                            +91 98765 43210
                        </a>
                    </p>
                </address>

                <ul class="mt-4 flex items-center gap-3" aria-label="Social media">
                    <!-- Facebook -->
                    <li>
                        <a href="#" target="_blank" rel="noopener noreferrer"
                           class="inline-flex h-9 w-9 items-center justify-center rounded-full bg-white/5 text-gray-300 hover:text-blue-400 hover:bg-white/10 focus:outline-none focus:ring-2 focus:ring-blue-500 transition"
                           aria-label="Facebook" title="Facebook">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="h-5 w-5" viewBox="0 0 24 24">
                                <path d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 5 3.657 9.128 8.438 9.878v-6.987H7.898v-2.89h2.54V9.797c0-2.507 1.493-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.772-1.63 1.562v1.876h2.773l-.443 2.89h-2.33V21.88C18.343 21.128 22 17 22 12z"/>
                            </svg>
                        </a>
                    </li>

                    <!-- Twitter/X -->
                    <li>
                        <a href="#" target="_blank" rel="noopener noreferrer"
                           class="inline-flex h-9 w-9 items-center justify-center rounded-full bg-white/5 text-gray-300 hover:text-blue-400 hover:bg-white/10 focus:outline-none focus:ring-2 focus:ring-blue-500 transition"
                           aria-label="Twitter" title="Twitter">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="h-5 w-5" viewBox="0 0 24 24">
                                <path d="M19.633 7.997c.013.177.013.355.013.532 0 5.425-4.13 11.68-11.68 11.68-2.323 0-4.482-.678-6.298-1.844.323.038.633.05.968.05a8.228 8.228 0 0 0 5.102-1.757A4.114 4.114 0 0 1 4.48 13.7a5.189 5.189 0 0 0 .775.064c.37 0 .738-.05 1.084-.138a4.108 4.108 0 0 1-3.293-4.03v-.05a4.144 4.144 0 0 0 1.858.52A4.11 4.11 0 0 1 3.58 7.21a11.66 11.66 0 0 0 8.462 4.29 4.64 4.64 0 0 1-.102-.944A4.109 4.109 0 0 1 16.05 6a8.077 8.077 0 0 0 2.605-.995 4.1 4.1 0 0 1-1.806 2.27 8.228 8.228 0 0 0 2.36-.63 8.86 8.86 0 0 1-2.576 2.352z"/>
                            </svg>
                        </a>
                    </li>

                    <!-- Instagram -->
                    <li>
                        <a href="#" target="_blank" rel="noopener noreferrer"
                           class="inline-flex h-9 w-9 items-center justify-center rounded-full bg-white/5 text-gray-300 hover:text-blue-400 hover:bg-white/10 focus:outline-none focus:ring-2 focus:ring-blue-500 transition"
                           aria-label="Instagram" title="Instagram">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="h-5 w-5" viewBox="0 0 24 24">
                                <path d="M7 2C4.243 2 2 4.243 2 7v10c0 2.757 2.243 5 5 5h10c2.757 0 5-2.243 5-5V7c0-2.757-2.243-5-5-5H7zm10 2c1.654 0 3 1.346 3 3v10c0 1.654-1.346 3-3 3H7c-1.654 0-3-1.346-3-3V7c0-1.654 1.346-3 3-3h10zM12 7a5 5 0 1 0 0 10 5 5 0 0 0 0-10zm0 2a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm4.5-.75a1.25 1.25 0 1 0 0-2.5 1.25 1.25 0 0 0 0 2.5z"/>
                            </svg>
                        </a>
                    </li>
                </ul>
            </div>

        <div class="border-t border-gray-800 dark:border-gray-700 py-4 text-center text-sm text-gray-400">
            © {{ date('Y') }} Oakwood Library. All rights reserved.
        </div>
    </footer>
@endsection

@section('scripts')
<script>
  function scrollToLeft(id) {
    const el = document.getElementById(id + '-wrapper');
    if (el) el.scrollBy({ left: -320, behavior: 'smooth' });
  }
  function scrollToRight(id) {
    const el = document.getElementById(id + '-wrapper');
    if (el) el.scrollBy({ left: 320, behavior: 'smooth' });
  }

  // Auto-hide error box
  document.addEventListener("DOMContentLoaded", function () {
    const box = document.getElementById("error-box");
    if (!box) return;
    setTimeout(() => box.classList.add("opacity-0", "-translate-y-2"), 3000);
    setTimeout(() => (box.style.display = "none"), 3800);
  });
</script>
@endsection

{{-- Utility: hide scrollbars across browsers --}}
<style>
    .no-scrollbar::-webkit-scrollbar { display: none; }
    .no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }

    @media (min-width: 640px) {
        .xs\:grid-cols-3 { grid-template-columns: repeat(3, minmax(0, 1fr)); }
    }
</style>
    