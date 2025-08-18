@extends('layouts.app')

@vite(['resources/css/app.css', 'resources/js/app.js'])

@section('content')
<div class="bg-gray-100 dark:bg-gray-900 py-6">
    <div class="container mx-auto max-w-6xl text-gray-800 dark:text-gray-100 px-4">
        <h1 class="text-2xl font-bold mb-6 text-center">Books List</h1>

        @if (session('success'))
            <div class="mb-4 p-3 rounded-lg bg-green-100 text-green-800 text-center font-bold shadow-lg">
                {{ session('success') }}
            </div>
        @endif

        <button id="openBookModal"
            class="mb-4 px-4 py-2 bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-300 dark:focus:ring-blue-700 text-white font-bold rounded-lg shadow-lg transition duration-200 ease-in-out mx-auto block">
            <span class="inline-flex items-center gap-2 justify-center">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
                </svg>
                Add New Book
            </span>
        </button>

        <!-- Add Book Modal -->
        <div id="bookModal" class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-70 hidden">
            <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-2xl px-8 py-8 w-4/5 max-w-3xl max-h-[95vh] overflow-y-auto relative animate-fadeIn text-gray-800 dark:text-gray-100 sm:mx-2 mx-1 scrollbar-hide" style="scrollbar-width: none; -ms-overflow-style: none;">
                <button id="closeBookModal" class="absolute top-6 left-6 text-gray-400 hover:text-red-600 text-3xl font-bold transition">&#10005;</button>
                <h2 class="text-2xl font-bold mb-8 text-center">Add New Book</h2>
                <form action="{{ route('books.store') }}" method="POST" class="space-y-6">
                    @csrf
                    <div class="grid gap-6 mb-8">
                        @foreach([
                            ['title', 'Book Title', 'text', 'Enter book name...'],
                            ['author', 'Author', 'text', 'Enter author name...'],
                            ['isbn', 'ISBN', 'text', 'Enter ISBN number...'],
                            ['quantity', 'Quantity', 'number', 'Enter quantity...']
                            ] as [$id, $label, $type, $placeholder])
                            <div class="flex flex-col">
                                <label for="{{ $id }}-modal" class="mb-2 text-base font-semibold">{{ $label }}</label>
                                <input type="{{ $type }}" name="{{ $id }}" id="{{ $id }}-modal"
                                    class="bg-white dark:bg-gray-700 border border-gray-300 dark:border-gray-600 text-gray-800 dark:text-gray-100 text-base rounded-lg focus:ring-blue-500 focus:border-blue-500 w-full p-4"
                                    placeholder="{{ $placeholder }}" required />
                            </div>
                        @endforeach

                        <div class="flex flex-col">
                            <label for="language_id-modal" class="mb-2 text-base font-semibold">Language</label>
                            <select name="language_id" id="language_id-modal" required class="bg-white dark:bg-gray-700 border border-gray-300 dark:border-gray-600 text-gray-800 dark:text-gray-100 text-base rounded-lg focus:ring-blue-500 focus:border-blue-500 w-full p-4">
                                <option value="">Select Language</option>
                                @foreach($languages as $lang)
                                    <option value="{{ $lang->id }}" {{ old('language_id') == $lang->id ? 'selected' : '' }}>{{ $lang->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="flex flex-col">
                            <label for="book_type_id-modal" class="mb-2 text-base font-semibold">Book Category</label>
                            <select name="book_type_id" id="book_type_id-modal" required
                                class="bg-white dark:bg-gray-700 border border-gray-300 dark:border-gray-600 text-gray-800 dark:text-gray-100 text-base rounded-lg focus:ring-blue-500 focus:border-blue-500 w-full p-4">
                                    <option value="">Select Book Category</option>
                                     @foreach($types as $type)
                                    <option value="{{ $type->id }}" {{ old('book_type_id') == $type->id ? 'selected' : '' }}>{{ $type->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <button type="submit"
                        class="w-full bg-green-600 hover:bg-green-700 focus:ring-4 focus:ring-green-300 dark:focus:ring-green-700 text-white font-bold rounded-xl text-base px-6 py-4 shadow-lg transition">
                        <span class="inline-flex items-center gap-2 justify-center">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/>
                            </svg>
                            Add Book
                        </span>
                    </button>
                </form>
            </div>
        </div>

        <!-- Table -->
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-4 md:p-6 overflow-hidden">
            <!-- Search -->
            <!-- Search Form with Search & Clear Buttons -->
<form method="GET" action="{{ route('books.insertBook') }}" class="pb-3 flex flex-col md:flex-row md:items-center md:justify-between gap-4">
    <div class="relative w-full md:w-1/3">
        <input type="text" id="table-search" name="search"
            value="{{ request('search') }}"
            class="block pt-2 ps-10 text-lg text-gray-800 dark:text-gray-100 border border-blue-300 dark:border-blue-600 rounded-lg w-full bg-white dark:bg-gray-700 placeholder-gray-400 dark:placeholder-gray-300 focus:ring-blue-500 focus:border-blue-500 transition"
            placeholder="Search for books...">
        <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
            <svg class="w-5 h-5 text-blue-500 dark:text-blue-300" fill="none" viewBox="0 0 20 20">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
            </svg>
        </div>
    </div>

    <div class="flex gap-2">
        <!-- Search Button -->
        <button type="submit"
            class="px-5 py-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg shadow-md transition">
            Search
        </button>

        <!-- Clear Button -->
        <a href="{{ route('books.insertBook') }}"
            class="px-5 py-2 bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold rounded-lg shadow-md transition">
            Clear
        </a>
    </div>
</form>


            <!-- Books Table -->
            <div class="overflow-x-auto">
                <table class="min-w-full text-sm text-center text-gray-800 dark:text-gray-100 bg-white dark:bg-gray-900 rounded-lg border border-blue-300 shadow-lg">
                    <thead class="text-sm text-gray-100 uppercase bg-blue-600 dark:bg-blue-800">
    <tr>
        <th class="px-4 py-2 font-bold border-b border-blue-300">Index</th>
        <th class="px-4 py-2 font-bold border-b border-blue-300">Title</th>
        <th class="px-4 py-2 font-bold border-b border-blue-300">Author</th>
        <th class="px-4 py-2 font-bold border-b border-blue-300">ISBN</th>
        <th class="px-4 py-2 font-bold border-b border-blue-300">Category</th>
        <th class="px-4 py-2 font-bold border-b border-blue-300">Language</th>
        <th class="px-4 py-2 font-bold border-b border-blue-300">Quantity</th>
        <th class="px-4 py-2 font-bold border-b border-blue-300">Action</th>
    </tr>
</thead>

    <tbody>
    @foreach ($books as $book)
    <tr class="border-b border-blue-100 bg-white dark:bg-gray-800 hover:bg-blue-100 dark:hover:bg-gray-700 transition">
        <td class="px-4 py-3 font-semibold">{{ $loop->iteration }}</td>
        <td class="px-4 py-3 font-semibold">{{ $book->title }}</td>
        <td class="px-4 py-3 font-semibold">{{ $book->author }}</td>
        <td class="px-4 py-3 font-semibold">{{ $book->isbn }}</td>
        <td class="px-4 py-3 font-semibold">{{ optional($book->bookType)->name ?? 'N/A' }}</td>
        <td class="px-4 py-3 font-semibold">{{ optional($book->language)->name ?? 'N/A' }}</td>
        <td class="px-4 py-3 font-semibold">{{ $book->quantity }}</td>
        <td class="px-4 py-3">
            <div class="flex flex-col items-center space-y-2">
    <!-- Edit Button -->
    <a href="{{ route('books.edit', $book->id) }}"
       class="px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white font-semibold rounded-md shadow transition">
       Edit
    </a>

    <!-- Delete Button -->
    <form action="{{ route('books.destroy', $book->id) }}" method="POST"
          onsubmit="return confirm('Are you sure you want to delete this book?');">
        @csrf
        @method('DELETE')
        <button type="submit"
            class="px-4 py-2 bg-red-500 hover:bg-red-600 text-white font-semibold rounded-md shadow transition">
            Delete
        </button>
    </form>
</div>

        </td>
    </tr>
    @endforeach
</tbody>

                </table>
            </div>
        </div>

        <!-- Pagination -->
        <div class="mt-6 flex justify-center">{{ $books->links() }}</div>
    </div>
</div>
@endsection

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const openBtn = document.getElementById('openBookModal');
        const closeBtn = document.getElementById('closeBookModal');
        const modal = document.getElementById('bookModal');
        if (openBtn && closeBtn && modal) {
            openBtn.onclick = () => modal.classList.remove('hidden');
            closeBtn.onclick = () => modal.classList.add('hidden');
        }
    });
</script>

<style>
    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.95); }
        to { opacity: 1; transform: scale(1); }
    }
    .animate-fadeIn {
        animation: fadeIn 0.3s ease;
    }
    /* Hide scrollbars for all elements */
    *::-webkit-scrollbar {
        display: none;
    }
    * {
        -ms-overflow-style: none;
        scrollbar-width: none;
    }
</style>
