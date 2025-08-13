<div class="border-b border-gray-300 py-4">
    <div class="mb-2">
        <p><strong>User:</strong> {{ $lending->user->name }} ({{ $lending->user->email }})</p>
        <p><strong>Book:</strong> {{ $lending->book->title }}</p>
        <p><strong>Issued At:</strong> {{ $lending->issued_at ?? '—' }}</p>
        <p><strong>Return By:</strong> {{ $lending->return_at ?? '—' }}</p>
        <p><strong>Returned At:</strong> {{ $lending->returned_at ?? '—' }}</p>
        <p>
            <strong>Status:</strong>
            @if ($lending->status === 'pending')
                <span class="text-yellow-500">Pending</span>
            @elseif ($lending->status === 'approved')
                <span class="text-blue-500">Approved</span>
            @elseif ($lending->status === 'returned')
                <span class="text-green-500">Returned</span>
            @else
                <span class="text-red-500">{{ ucfirst($lending->status) }}</span>
            @endif
        </p>
    </div>

    {{-- Actions --}}
    <div class="flex space-x-2 mt-2">
        @if ($lending->status === 'pending')
            <form action="{{ route('admin.lendings.approve', $lending->id) }}" method="POST">
                @csrf
                <button class="px-3 py-2 bg-green-600 text-white rounded hover:bg-green-700">Approve</button>
            </form>
            <form action="{{ route('admin.lendings.reject', $lending->id) }}" method="POST"
                onsubmit="return confirm('Reject this request?')">
                @csrf
                <button class="px-3 py-2 bg-red-600 text-white rounded hover:bg-red-700">Reject</button>
            </form>
        @elseif ($lending->status === 'approved' && !$lending->returned_at)
            <form action="{{ route('admin.lendings.return', $lending->id) }}" method="POST">
                @csrf
                <button class="px-3 py-2 bg-indigo-600 text-white rounded hover:bg-indigo-700">Mark Returned</button>
            </form>
        @endif
    </div>
</div>
