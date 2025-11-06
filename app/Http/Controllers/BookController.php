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
    // Fetch by ISBN (you can pass an API key if you have one)
    $response = Http::get("https://www.googleapis.com/books/v1/volumes", [
        'q'         => 'isbn:' . $isbn,
        'maxResults'=> 1,
        // 'key'    => env('GOOGLE_BOOKS_API_KEY'), // optional
    ]);

    $data = $response->json();
    $item = $data['items'][0] ?? null;

    // Try to find the local book from DB (id from route or by isbn)
    $localBook = null;
    if ($id) {
        $localBook = Book::find($id);
    } else {
        $localBook = Book::where('isbn', $isbn)->first();
    }

    if (!$item) {
        // If Google didn’t return anything, at least render local book if exists
        if ($localBook) {
            $book = [
                'id'            => null,
                'googleId'      => null,
                'title'         => $localBook->title ?? 'No Title',
                'authors'       => isset($localBook->author) ? array_map('trim', explode(',', $localBook->author)) : ['Unknown'],
                'description'   => 'No description available.',
                'thumbnail'     => 'https://dummyimage.com/300x420/cccccc/000000&text=No+Image',
                'publisher'     => $localBook->publisher ?? 'Unknown',
                'publishedDate' => $localBook->published_date ?? 'Unknown',
                'language'      => optional($localBook?->language)->name ?? 'Unknown',
                'categories'    => [$localBook?->type?->name ?? 'Unknown'],
                'averageRating' => null,
                'ratingsCount'  => null,
                'previewLink'   => null,
                'infoLink'      => null,
                'isbn'          => $localBook->isbn ?? null, // fallback from DB
            ];
            return view('books.show', compact('book', 'localBook'))
                   ->with('error', 'Could not fetch extra data from Google Books.');
        }

        abort(404, 'Book not found');
    }

    $volume      = $item;
    $volumeInfo  = $item['volumeInfo'] ?? [];
    $imageLinks  = $volumeInfo['imageLinks'] ?? [];

    // ✅ Extract a clean ISBN (ISBN_13 preferred, then ISBN_10)
    $isbnClean = $this->extractIsbn($volumeInfo['industryIdentifiers'] ?? []) ?: ($localBook->isbn ?? null);

    // Map unified $book array
    $book = [
        'id'            => $volume['id'] ?? null,                      // Google volume ID
        'googleId'      => $volume['id'] ?? null,
        'title'         => $localBook->title ?? ($volumeInfo['title'] ?? 'No Title'),
        'authors'       => isset($localBook->author)
                            ? array_map('trim', explode(',', $localBook->author))
                            : ($volumeInfo['authors'] ?? ['Unknown']),
        'description'   => $volumeInfo['description'] ?? 'No description available.',
        'thumbnail'     => $imageLinks['thumbnail']
                            ?? $imageLinks['smallThumbnail']
                            ?? 'https://dummyimage.com/300x420/cccccc/000000&text=No+Image',
        'publisher'     => $localBook->publisher ?? ($volumeInfo['publisher'] ?? 'Unknown'),
        'publishedDate' => $localBook->published_date ?? ($volumeInfo['publishedDate'] ?? 'Unknown'),
        'language'      => optional($localBook?->language)->name ?? ($volumeInfo['language'] ?? 'Unknown'),
        'categories'    => $volumeInfo['categories'] ?? (isset($localBook->type) ? [$localBook->type->name] : []),
        'averageRating' => $volumeInfo['averageRating'] ?? null,
        'ratingsCount'  => $volumeInfo['ratingsCount'] ?? null,
        'previewLink'   => $volumeInfo['previewLink'] ?? null,
        'infoLink'      => $volumeInfo['infoLink'] ?? null,
        'isbn'          => $isbnClean, // <-- IMPORTANT
    ];

    return view('books.show', compact('book', 'localBook'));
}

/**
 * Extracts a normalized ISBN from Google's industryIdentifiers array.
 * Prefers ISBN_13, falls back to ISBN_10, else tries to salvage a 10/13 char value.
 */
private function extractIsbn(array $industryIdentifiers): ?string
{
    if (empty($industryIdentifiers)) {
        return null;
    }

    $clean = function ($val) {
        return preg_replace('/[^0-9Xx]/', '', (string) $val); // allow X/x for ISBN-10
    };

    // Prefer ISBN_13
    foreach ($industryIdentifiers as $id) {
        if (strtoupper($id['type'] ?? '') === 'ISBN_13' && !empty($id['identifier'])) {
            return $clean($id['identifier']);
        }
    }
    // Then ISBN_10
    foreach ($industryIdentifiers as $id) {
        if (strtoupper($id['type'] ?? '') === 'ISBN_10' && !empty($id['identifier'])) {
            return $clean($id['identifier']);
        }
    }
    // Fallback: any 10/13-length identifier
    foreach ($industryIdentifiers as $id) {
        if (!empty($id['identifier'])) {
            $guess = $clean($id['identifier']);
            if (strlen($guess) === 13 || strlen($guess) === 10) {
                return $guess;
            }
        }
    }
    return null;
}

public function search(Request $request)
{
    $query = trim($request->input('search'));
    $category = $request->query('category'); // 👈 catch category from View All links

    // If "View All" category is clicked
    if ($category) {
        switch ($category) {
            case 'fiction-books':
                $localBooks = Book::where('book_type_id', 18)->latest()->paginate(20);
                break;

            case 'action-books':
                $localBooks = Book::where('book_type_id', 1)->latest()->paginate(20);
                break;

            case 'comics-books':
                $localBooks = Book::where('book_type_id', 10)->latest()->paginate(20);
                break;

            case 'horror-books':
                $localBooks = Book::where('book_type_id', 22)->latest()->paginate(20);
                break;

            case 'thriller-books':
                $localBooks = Book::where('book_type_id', 48)->latest()->paginate(20);
                break;

            case 'trending-books':
                // 🔎 For trending, you can either refetch from API or pass from cache (like WelcomeController)
                $localBooks = collect(); // empty since trending is API-only
                break;

            default:
                $localBooks = collect();
        }

        // For categories we don’t need external API
        $apiBooks = [];
        return view('books.search', compact('query', 'localBooks', 'apiBooks', 'category'));
    }

    // ✅ Prevent empty searches
    if (empty($query)) {
        return redirect()->back()->with('error', 'Please enter a search term.');
    }

    // 🔎 Normal DB search
    $localBooks = Book::where('title', 'like', "%{$query}%")
        ->orWhere('author', 'like', "%{$query}%")
        ->get();

    // 🔎 External API search
    $apiBooks = [];
    $response = Http::get('https://www.googleapis.com/books/v1/volumes', [
        'q' => $query,
        'key' => env('GOOGLE_BOOKS_API_KEY'),
        'maxResults' => 10
    ]);

    if ($response->successful()) {
        $apiBooksRaw = $response->json('items') ?? [];

        $apiBooks = collect($apiBooksRaw)->filter(function ($item) {
            $volume = $item['volumeInfo'] ?? [];
            $isbn = collect($volume['industryIdentifiers'] ?? [])->firstWhere('type', 'ISBN_13')['identifier']
                ?? collect($volume['industryIdentifiers'] ?? [])->firstWhere('type', 'ISBN_10')['identifier']
                ?? null;

            return $isbn !== null;
        })->values();
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
