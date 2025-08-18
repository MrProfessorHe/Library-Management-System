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

    public function bookType()
    {
        return $this->belongsTo(BookType::class);
    }

    public function language()
    {
        return $this->belongsTo(Language::class);
    }


    public function lendings()
    {
        return $this->hasMany(Lending::class);
    }
}
