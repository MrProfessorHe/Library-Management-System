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

            'The Da Vinci Code',
            'Angels & Demons',
            'Inferno',
            'Origin',
            'Digital Fortress',
            'The Bourne Identity',
            'The Bourne Supremacy',
            'The Bourne Ultimatum',
            'The Silence of the White City',
            'The Reversal',
            'The Lincoln Lawyer',
            'The Brass Verdict',
            'Along Came a Spider',
            'Kiss the Girls',
            'Jack & Jill',
            'The Girl with the Dragon Tattoo',
            'The Girl Who Played with Fire',
            'The Girl Who Kicked the Hornet\'s Nest',
            'The Snowman',
            'Phantom',
            'Knife',
            'The Surgeon',
            'The Apprentice',
            'The Sinner',
            'Vanished',
            'The Couple Next Door',
            'A Stranger in the House',
            'Not a Happy Family',
            'The Last Mrs. Parrish',
            'The Wife Between Us',
            'Behind Closed Doors',
            'The Breakdown',
            'Lock Every Door',
            'Home Before Dark',
            'Final Girls',
            'Survive the Night'


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
                    'book_type_id' => 48, // Book Type
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
