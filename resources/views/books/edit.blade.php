@extends('layouts.app')

@section('content')
    <div class="min-h-screen bg-gray-100 dark:bg-gray-900 flex items-center justify-center px-4">
        <div
            class="w-full max-w-4xl p-8 bg-blue-50 dark:bg-gray-800 rounded-2xl shadow-2xl text-gray-800 dark:text-gray-100">
            <h2 class="text-2xl font-bold mb-6 text-center">Edit Book</h2>

            <form action="{{ route('books.update', $book->id) }}" method="POST" class="grid gap-6 md:grid-cols-2">
                @csrf
                @method('PUT')

                <!-- Title -->
                <div>
                    <label for="title" class="block mb-2 text-sm font-semibold">Title</label>
                    <input type="text" name="title" id="title" value="{{ $book->title }}"
                        class="autocomplete=off w-full p-3 rounded-lg bg-white dark:bg-gray-700 border border-gray-300 dark:border-gray-600 focus:ring-2 focus:ring-blue-500 outline-none"
                        required>
                </div>

                <!-- Author -->
                <div>
                    <label for="author" class="block mb-2 text-sm font-semibold">Author</label>
                    <input type="text" name="author" id="author" value="{{ $book->author }}"
                        class="autocomplete=off w-full p-3 rounded-lg bg-white dark:bg-gray-700 border border-gray-300 dark:border-gray-600 focus:ring-2 focus:ring-blue-500 outline-none"
                        required>
                </div>

                <!-- ISBN -->
                <div>
                    <label for="isbn" class="block mb-2 text-sm font-semibold">ISBN</label>
                    <input type="text" name="isbn" id="isbn" value="{{ $book->isbn }}"
                        class="autocomplete=off w-full p-3 rounded-lg bg-white dark:bg-gray-700 border border-gray-300 dark:border-gray-600 focus:ring-2 focus:ring-blue-500 outline-none"
                        required>
                </div>

                <!-- Quantity -->
                <div>
                    <label for="quantity" class="block mb-2 text-sm font-semibold">Quantity</label>
                    <input type="number" name="quantity" id="quantity" value="{{ $book->quantity }}"
                        class="autocomplete=off autocomplete=off w-full p-3 rounded-lg bg-white dark:bg-gray-700 border border-gray-300 dark:border-gray-600 focus:ring-2 focus:ring-blue-500 outline-none"
                        required>
                </div>

                <!-- Language -->
                <div>
                    <label for="language_id" class="block mb-2 text-sm font-semibold">Language</label>
                    <select name="language_id"
                        class="w-full p-3 rounded-lg bg-white dark:bg-gray-700 border border-gray-300 dark:border-gray-600 focus:ring-2 focus:ring-blue-500 outline-none">
                        @foreach($languages as $lang)
                            <option value="{{ $lang->id }}" {{ $book->language_id == $lang->id ? 'selected' : '' }}>
                                {{ $lang->name }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <!-- Category -->
                <div>
                    <label for="book_type_id" class="block mb-2 text-sm font-semibold">Category</label>
                    <select name="book_type_id"
                        class="w-full p-3 rounded-lg bg-white dark:bg-gray-700 border border-gray-300 dark:border-gray-600 focus:ring-2 focus:ring-blue-500 outline-none">
                        @foreach($types as $type)
                            <option value="{{ $type->id }}" {{ $book->book_type_id == $type->id ? 'selected' : '' }}>
                                {{ $type->name }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <!-- Submit -->
                <div class="md:col-span-2 text-center mt-4 space-x-2">
                    <a href="{{ url()->previous() }}"
                        class="inline-block bg-gray-500 hover:bg-gray-600 text-white font-semibold px-6 py-3 rounded-xl shadow-md transition-all">
                        Back
                    </a>

                    <button type="submit"
                        class="inline-block bg-yellow-500 hover:bg-yellow-600 text-white font-semibold px-6 py-3 rounded-xl shadow-md transition-all">
                        Update Book
                    </button>
                </div>

        </div>
        </form>
    </div>
    </div>
@endsection

<style>
    /* Hide scrollbars for all elements */
    *::-webkit-scrollbar {
        display: none;
    }

    * {
        -ms-overflow-style: none;
        scrollbar-width: none;
    }
</style>