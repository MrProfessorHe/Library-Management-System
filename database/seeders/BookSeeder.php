<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class BookSeeder extends Seeder
{
    public function run()
    {
        $titles = [
    'Sapiens: A Brief History of Humankind',
    'A Brief History of Time',
    'Thinking, Fast and Slow',
    'The Selfish Gene',
    'Guns, Germs, and Steel',
    'The Origin of Species',
    'Cosmos',
    'The Structure of Scientific Revolutions',
    'The Republic',
    'The Wealth of Nations',
    'The Art of War',
    'Man’s Search for Meaning',
    'The Gene: An Intimate History',
    'The Immortal Life of Henrietta Lacks',
    'A People’s History of the United States',
    'Outliers: The Story of Success',
    'The Black Swan',
    'The Power of Habit',
    'Freakonomics',
    'Why Nations Fail',
    'The Sixth Extinction',
    'Quiet: The Power of Introverts',
    'The Man Who Mistook His Wife for a Hat',
    'Grit: The Power of Passion and Perseverance',
    'The Emperor of All Maladies',
    'The Road to Serfdom',
    'A Short History of Nearly Everything',
    'How to Read a Book',
    'The Double Helix',
    'Thinking in Systems',

];


        $insertData = [];

        foreach ($titles as $searchTitle) {
            $response = Http::get('https://www.googleapis.com/books/v1/volumes', [
                'q' => 'intitle:' . $searchTitle,
                'maxResults' => 1,
                'key' => env('GOOGLE_BOOKS_API_KEY'),
            ]);

            if ($response->ok() && $items = $response->json('items')) {
                $info = $items[0]['volumeInfo'];

                // ✅ Only accept ISBN_13
                $isbn = collect($info['industryIdentifiers'] ?? [])
                            ->firstWhere('type', 'ISBN_13')['identifier'] ?? null;

                if (!$isbn) {
                    Log::warning('Skipped book due to missing ISBN_13', ['title' => $info['title'] ?? $searchTitle]);
                    continue;
                }

                // ✅ Skip duplicates
                $isbnExists = DB::table('books')->where('isbn', $isbn)->exists();
                if ($isbnExists) {
                    Log::info('Duplicate ISBN skipped', ['isbn' => $isbn, 'title' => $info['title']]);
                    continue;
                }

                $insertData[] = [
                    'title' => $info['title'] ?? $searchTitle,
                    'author' => isset($info['authors']) ? implode(', ', $info['authors']) : 'Unknown',
                    'isbn' => $isbn,
                    'book_type_id' => 14, // Assuming 14 is the ID for 'Book'
                    'language_id' => 6,
                    'quantity' => rand(1, 25),
                    'cover_image' => $info['imageLinks']['thumbnail'] ?? null,
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
            }

            if (count($insertData) >= 100) {
                break;
            }
        }

        if (!empty($insertData)) {
            DB::table('books')->insert($insertData);
        }
    }
}
