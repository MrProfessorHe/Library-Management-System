<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;

class FetchTrendingBooks extends Command
{
    protected $signature = 'books:fetch-trending';
    protected $description = 'Fetch trending books from NYT & Google API and cache them';

    public function handle()
    {
        $nytApiKey = env('NYT_API_KEY');
        $googleApiKey = env('GOOGLE_BOOKS_API_KEY');

        $nytResponse = Http::get("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key={$nytApiKey}");

        if (!$nytResponse->successful()) {
            $this->error('NYT API request failed.');
            return;
        }

        $results = $nytResponse->json()['results']['books'] ?? [];
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

        Cache::put('trending_books', $books, now()->addHours(6));

        $this->info('Trending books fetched & cached successfully.');
    }
}
