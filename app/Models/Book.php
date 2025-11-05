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
}
