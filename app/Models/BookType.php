<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BookType extends Model
{
    protected $table = 'book_types';
    protected $fillable = ['name'];
    // keep timestamps since your migration has them
}
