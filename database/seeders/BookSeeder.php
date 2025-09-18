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

            'The Godfather',
'The Sicilian',
'The Last Don',
'Casino',
'Goodfellas',
'Donnie Brasco',
'American Tabloid',
'L.A. Confidential',
'The Big Nowhere',
'White Jazz',
'The Black Dahlia',
'In Cold Blood',
'Helter Skelter',
'The Silence of the Lambs',
'Hannibal',
'Red Dragon',
'Along Came a Spider',
'Kiss the Girls',
'Jack & Jill',
'The Lincoln Lawyer',
'The Brass Verdict',
'The Reversal',
'The Crossing',
'The Black Echo',
'The Black Ice',
'City of Bones',
'Angels Flight',
'Dark Sacred Night',
'The Poet',
'The Scarecrow',
'Blood Work',
'No Country for Old Men',
'The Friends of Eddie Coyle',
'Clockers',
'Mystic River',
'Gone Baby Gone',
'Shutter Island',
'Prayers for Rain'



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
                    'book_type_id' => 12, // Book Type
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
