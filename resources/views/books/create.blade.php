<head>
    @vite("resources/css/app.css")
    
</head>



<h2 class="helo">Add New Book</h2>

<form action="{{ route('books.store') }}" method="POST">
    @csrf
    <input type="text" name="title" placeholder="Title"><br>
    <input type="text" name="author" placeholder="Author"><br>
    <label for="isbn">ISBN</label>
    <input type="text" name="isbn" id="isbn" value="{{ old('isbn') }}"><br>



    <!-- Type Dropdown -->
    <!-- Book Type -->
    <label for="book_type_id">Book Type</label>
    <select name="book_type_id" id="book_type_id" required>
        <option value="">-- Select Book Type --</option>
        @foreach($types as $type)
            <option value="{{ $type->id }}">{{ $type->name }}</option>
        @endforeach
    </select><br>

    <!-- Language -->
    <label for="language_id">Language</label>
    <select name="language_id" id="language_id" required>
        <option value="">-- Select Language --</option>
        @foreach($languages as $lang)
            <option value="{{ $lang->id }}">{{ $lang->name }}</option>
        @endforeach
    </select><br>

    <label>Quantity:</label>
    <input type="number" name="quantity" placeholder="Quantity"><br>

    <button type="submit">Add Book</button>

    @if($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

</form>