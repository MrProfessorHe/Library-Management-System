<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    protected $fillable = [
        'title',
        'author',
        'isbn',
        'book_type_id',
        'language_id',
        'quantity',
    ];

    public function lendings()
    {
        return $this->hasMany(Lending::class);
    }

    // ✅ Add this
    public function type()
    {
        // books.book_type_id -> book_types.id
        return $this->belongsTo(\App\Models\BookType::class, 'book_type_id');
    }

    // (you likely already have this since language shows)
    public function language()
    {
        return $this->belongsTo(\App\Models\Language::class, 'language_id');
    }
}
