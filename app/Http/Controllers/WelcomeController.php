<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use App\Models\Book;


class WelcomeController extends Controller
{
    public function index()
    {
        $fiction = Book::where('book_type_id', 18)->latest()->take(20)->get();
        $action = Book::where('book_type_id', 1)->latest()->take(20)->get();
        $comics = Book::where('book_type_id', 10)->latest()->take(20)->get();

        $trendingBooks = Cache::remember('trending_books', now()->addHours(6), function () {
            $nytApiKey = env('NYT_API_KEY');
            $googleApiKey = env('GOOGLE_BOOKS_API_KEY');

            $nytResponse = Http::get("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key={$nytApiKey}");

            if (!$nytResponse->successful()) {
                return [];
            }

            $results = $nytResponse->json()['results']['books'];
            $isbns = collect($results)->pluck('primary_isbn13')->filter()->take(15);

            $books = [];

            foreach ($isbns as $isbn) {
                $googleResponse = Http::get("https://www.googleapis.com/books/v1/volumes", [
                    'q' => 'isbn:' . $isbn,
                    'key' => $googleApiKey,
                ]);

                if ($googleResponse->successful()) {
                    $items = $googleResponse->json('items');
                    if (!empty($items)) {
                        $info = $items[0]['volumeInfo'];

                        $books[] = [
                            'isbn' => $isbn,
                            'title' => $info['title'] ?? 'No title',
                            'authors' => $info['authors'] ?? ['Unknown Author'],
                            'thumbnail' => $info['imageLinks']['thumbnail'] ?? 'https://dummyimage.com/150x200/cccccc/000000&text=No+Image',
                            'description' => $info['description'] ?? 'No description available.',
                        ];
                    }
                }
            }

            return $books;
        });

        return view('welcome', compact('fiction', 'action', 'comics', 'trendingBooks'));
    }
}
