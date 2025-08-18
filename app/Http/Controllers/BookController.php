<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Book;
use App\Models\BookType;
use Illuminate\Support\Facades\Http;
use App\Models\Language;

class BookController extends Controller
{

    public function show($isbn)
    {
        return $this->showExternal($isbn);
    }


    public function showExternal($isbn, $id = null)
    {
        $response = Http::get("https://www.googleapis.com/books/v1/volumes", [
            'q' => 'isbn:' . $isbn,
        ]);

        $data = $response->json();

        if (empty($data['items'][0])) {
            abort(404, 'Book not found');
        }

        $volume = $data['items'][0]['volumeInfo'];

        // Try to find the local book from DB
        $localBook = null;
        if ($id) {
            $localBook = Book::find($id);
        } else {
            $localBook = Book::where('isbn', $isbn)->first();
        }

        // Prefer DB values if available
        $book = [
            'title'         => $localBook->title ?? $volume['title'] ?? 'No Title',
            'authors'       => isset($localBook->author) ? explode(',', $localBook->author) : ($volume['authors'] ?? ['Unknown']),
            'description'   => $volume['description'] ?? 'No description available.',
            'thumbnail'     => $volume['imageLinks']['thumbnail'] ?? 'https://dummyimage.com/150x200/cccccc/000000&text=No+Image',
            'publisher'     => $localBook->publisher ?? ($volume['publisher'] ?? 'Unknown'),
            'publishedDate' => $localBook->published_date ?? ($volume['publishedDate'] ?? 'Unknown'),
            'language'      => optional($localBook?->language)->name ?? ($volume['language'] ?? 'Unknown'),
            'category'      => optional($localBook?->type)->name ?? ($volume['categories'][0] ?? 'Unknown'),
            'id'            => $id,
        ];


        return view('books.show', compact('book', 'localBook'));
    }






    public function search(Request $request)
    {
        $query = $request->input('search');

        // Search from DB
        $localBooks = Book::where('title', 'like', "%{$query}%")
            ->orWhere('author', 'like', "%{$query}%")
            ->get();

        // Search from Google Books API
        $apiBooks = [];
        if ($query) {
            $response = Http::get('https://www.googleapis.com/books/v1/volumes', [
                'q' => $query,
                'key' => env('GOOGLE_BOOKS_API_KEY'),
                'maxResults' => 10
            ]);

            if ($response->successful()) {
                $apiBooks = $response->json('items') ?? [];
            }
        }

        return view('books.search', compact('query', 'localBooks', 'apiBooks'));
    }


    public function create()
    {
        $types = BookType::orderBy('name')->get();
        $languages = Language::orderBy('name')->get();

        return view('books.create', compact('types', 'languages'));
    }


    public function store(Request $request)
    {
        $request->validate([
            'title'        => 'required|string',
            'author'       => 'required|string',
            'isbn'         => 'required|string|unique:books,isbn',
            'book_type_id' => 'required|exists:book_types,id',
            'language_id'  => 'required|exists:languages,id',
            'quantity'     => 'required|integer|min:0',
        ]);

        Book::create([
            'title'        => $request->title,
            'author'       => $request->author,
            'isbn'         => $request->isbn,
            'book_type_id' => $request->book_type_id,
            'language_id'  => $request->language_id,
            'quantity'     => $request->quantity,
        ]);
        return redirect()->route('books.insertBook')->with('success', 'Book added successfully.');
    }


    public function edit($id)
    {
        $book = Book::findOrFail($id);
        $types = BookType::orderBy('name')->get();
        $languages = Language::orderBy('name')->get();

        return view('books.edit', compact('book', 'types', 'languages'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title'        => 'required|string',
            'author'       => 'required|string',
            'isbn'         => 'required|string|unique:books,isbn,' . $id,
            'book_type_id' => 'required|exists:book_types,id',
            'language_id'  => 'required|exists:languages,id',
            'quantity'     => 'required|integer|min:0',
        ]);

        $book = Book::findOrFail($id);

        $book->update([
            'title'        => $request->title,
            'author'       => $request->author,
            'isbn'         => $request->isbn,
            'book_type_id' => $request->book_type_id,
            'language_id'  => $request->language_id,
            'quantity'     => $request->quantity,
        ]);

        return redirect()->route('books.insertBook')->with('success', 'Book updated successfully.');
    }

    public function destroy($id)
    {
        $book = Book::findOrFail($id);
        $book->delete();
        return redirect()->route('books.insertBook')->with('success', 'Book deleted successfully.');
    }

    public function index(Request $request)
    {
        $query = Book::query();

        if ($request->has('search') && $request->search !== null) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('title', 'LIKE', "%{$search}%")
                    ->orWhere('author', 'LIKE', "%{$search}%")
                    ->orWhere('isbn', 'LIKE', "%{$search}%");
            });
        }

        $books = $query->latest()->paginate(20)->withQueryString();
        $types = BookType::all();
        $languages = Language::all();

        return view('books.insertBook', compact('books', 'types', 'languages'));
    }

    public function liveSearch(Request $request)
    {
        $search = $request->input('query');

        $books = Book::where('title', 'LIKE', "%{$search}%")
            ->orWhere('author', 'LIKE', "%{$search}%")
            ->orWhere('isbn', 'LIKE', "%{$search}%")
            ->latest()
            ->take(10) // Limit for speed
            ->get();

        return response()->json($books);
    }
}
