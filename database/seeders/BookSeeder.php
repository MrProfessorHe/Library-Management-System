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

    'Dracula',
    'Frankenstein',
    'The Haunting of Hill House',
    'The Exorcist',
    'Pet Sematary',
    'The Shining',
    'It',
    'Carrie',
    'Salem\'s Lot',
    'Misery',
    'Hell House',
    'I Am Legend',
    'Psycho',
    'The Silence of the Lambs',
    'The Amityville Horror',
    'Something Wicked This Way Comes',
    'Ghost Story',
    'The Hellbound Heart',
    'Books of Blood',
    'The Girl Next Door',
    'The Troop',
    'The Ritual',
    'Mexican Gothic',
    'The Fisherman',
    'The Only Good Indians',
    'Bird Box',
    'House of Leaves',
    'Haunted',
    'The Cabin at the End of the World',
    'We Have Always Lived in the Castle'

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
                    'book_type_id' => 22, // Book Type
                    'language_id' => 6, //language
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
