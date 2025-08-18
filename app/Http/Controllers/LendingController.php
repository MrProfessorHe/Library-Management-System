<?php

namespace App\Http\Controllers;

use App\Models\Lending;
use Illuminate\Http\Request;
use App\Models\Book;

use Illuminate\Support\Facades\Auth;


class LendingController extends Controller
{
    /**
     * Display a listing of the resource.
     */

    public function index(Request $request)
    {
        $search = $request->search;

        $query = Lending::with('user', 'book');

        if ($search) {
            $query->whereHas('user', function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%");
            });
        }

        $allLendings = $query->get();

        return view('admin.lendings.index', [
            'pendingLendings' => $allLendings->where('status', 'pending'),
            'approvedLendings' => $allLendings->where('status', 'approved')->whereNull('returned_at'),
            'overdueLendings' => $allLendings->where('status', 'approved')
                ->where('return_at', '<', now())
                ->whereNull('returned_at'),
            'returnedLendings' => $allLendings->where('status', 'returned'),
        ]);
    }





    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'book_id' => 'required|exists:books,id',
            'user_id' => 'required|exists:users,id',
            'issued_at' => 'required|date',
            'return_at' => 'required|date|after:issued_at',
        ]);

        Lending::create($request->all());

        return redirect()->back()->with('success', 'Book issued successfully!');
    }




    public function requestBorrow(Book $book)
    {
        $userId = auth()->id();

        // Check if the user already borrowed or requested the same book
        $existing = Lending::where('book_id', $book->id)
            ->where('user_id', $userId)
            ->where(function ($query) {
                $query->whereNull('approved_at')   // pending
                    ->orWhereNull('return_at');   // not returned yet
            })
            ->first();

        if ($existing) {
            return redirect()->back()->with('error', 'You have already borrowed or requested this book.');
        }

        // Create a new request
        Lending::create([
            'book_id' => $book->id,
            'user_id' => $userId,
            'status' => 'pending',
            'issued_at' => null,
            'return_at' => null,
            'approved_at' => null,
        ]);

        return redirect()->back()->with('success', 'Your request has been sent to admin.');
    }

    public function reject(Lending $lending)
    {
        if ($lending->status !== 'pending') {
            return redirect()->back()->with('error', 'This request has already been handled.');
        }

        $lending->update([
            'status' => 'rejected',
        ]);

        return redirect()->back()->with('success', 'Lending request rejected.');
    }


    public function manage()
    {
        $lendings = Lending::with('book', 'user')->orderBy('created_at', 'desc')->get();
        return view('admin.manage', compact('lendings'));
    }

    public function approve(Lending $lending)
    {
        if ($lending->status !== 'pending') {
            return redirect()->back()->with('error', 'This request is already handled.');
        }

        $book = $lending->book;

        if ($book->quantity < 1) {
            return redirect()->back()->with('error', 'No available copies.');
        }

        $lending->update([
            'status' => 'approved',
            'approved_at' => now(),
            'issued_at' => now(),
            'return_at' => now()->addDays(7),
        ]);

        $book->decrement('quantity');

        return redirect()->back()->with('success', 'Book issued successfully.');
    }

    public function manageRequests(Request $request)
    {
        $search = $request->input('search');

        $lendings = Lending::with(['user.lendings', 'book'])
            ->when($search, function ($query) use ($search) {
                $query->whereHas('user', function ($q) use ($search) {
                    $q->where('name', 'like', "%$search%");
                });
            })
            ->where(function ($query) {
                $query->where('status', '!=', 'approved') // not approved OR
                    ->orWhere(function ($subQuery) {
                        $subQuery->where('status', 'approved')
                            ->where('approved_at', '>=', now()->subDay());
                    });
            })
            ->latest()
            ->get();

        return view('admin.manage', compact('lendings'));
    }






    /**
     * Display the specified resource.
     */
    public function show(Lending $lending)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Lending $lending)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Lending $lending)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Lending $lending)
    {
        //
    }
}
