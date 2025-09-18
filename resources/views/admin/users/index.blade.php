@extends('layouts.app')

@section('content')
    <div class="py-12 bg-gray-100 dark:bg-gray-900 min-h-screen">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white dark:bg-gray-800 shadow-md sm:rounded-lg p-8">
                <div class="flex justify-between items-center mb-8">
                    <h2 class="text-3xl font-extrabold text-gray-900 dark:text-white tracking-tight">User Management</h2>
                    <div class="flex gap-3">
                        <a href="{{ route('admin.fines.index') }}"
                            class="inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-medium px-4 py-2 rounded-lg shadow transition">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M12 8c1.38 0 2.5 1.12 2.5 2.5S13.38 13 12 13s-2.5-1.12-2.5-2.5S10.62 8 12 8z" />
                                <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 18h16M4 12h16" />
                            </svg>
                            <span>Manage Fines</span>
                        </a>

                        <a href="{{ route('admin.lendings.index') }}"
                            class="inline-flex items-center gap-2 bg-green-600 hover:bg-green-700 text-white font-medium px-4 py-2 rounded-lg shadow transition">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M8 17l4 4 4-4m0-5v6a2 2 0 01-2 2H6a2 2 0 01-2-2v-6m16-2V7a2 2 0 00-2-2H6a2 2 0 00-2 2v2" />
                            </svg>
                            <span>Manage Lendings</span>
                        </a>
                </div>

            </div>

            @if(session('success'))
                <div class="mb-6 p-4 bg-green-100 border border-green-400 text-green-800 rounded-lg shadow-sm">
                    {{ session('success') }}
                </div>
            @endif

            @if(session('error'))
                <div class="mb-6 p-4 bg-red-100 border border-red-400 text-red-800 rounded-lg shadow-sm">
                    {{ session('error') }}
                </div>
            @endif

            <form method="GET" action="{{ route('admin.users.index') }}"
                class="mb-8 flex flex-wrap gap-4 items-center justify-between bg-gray-50 dark:bg-gray-700 p-6 rounded-lg shadow-sm">
                <input type="text" name="search" placeholder="Search name or email" value="{{ request('search') }}"
                    class="autocomplete=off flex-grow min-w-[200px] px-4 py-2 rounded border border-gray-300 dark:bg-gray-800 dark:text-white dark:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500" />

                <select name="role"
                    class="px-8 py-2 rounded border border-gray-300 dark:bg-gray-800 dark:text-white dark:border-gray-600 focus:outline-none  focus:ring-2 focus:ring-blue-500">
                    <option value="">All Roles</option>
                    <option value="admin" {{ request('role') == 'admin' ? 'selected' : '' }}>Admin</option>
                    <option value="user" {{ request('role') == 'user' ? 'selected' : '' }}>User</option>
                </select>

                <select name="status"
                    class="px-8 py-2 rounded border border-gray-300 dark:bg-gray-800 dark:text-white dark:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <option value="">All Statuses</option>
                    <option value="active" {{ request('status') == 'active' ? 'selected' : '' }}>Active</option>
                    <option value="blocked" {{ request('status') == 'blocked' ? 'selected' : '' }}>Blocked</option>
                </select>

                <div class="flex gap-3 flex-wrap">
                    <button type="submit"
                        class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-5 py-2 rounded-lg transition">
                        Filter
                    </button>

                    <a href="{{ route('admin.users.index') }}"
                        class="bg-gray-400 hover:bg-gray-500 text-white font-semibold px-5 py-2 rounded-lg transition">
                        Clear
                    </a>
                </div>
            </form>

            <div class="overflow-x-auto">
                <table class="min-w-full border border-gray-300 dark:border-gray-600 rounded-lg overflow-hidden">
                    <thead
                        class="bg-gray-100 dark:bg-gray-700 text-gray-600 dark:text-gray-300 uppercase text-xs font-semibold tracking-wide">
                        <tr>
                            <th class="px-6 py-3 text-left">User</th>
                            <th class="px-6 py-3 text-left">Role</th>
                            <th class="px-6 py-3 text-left">Status</th>
                            <th class="px-6 py-3 text-left">Current Books</th>
                            <th class="px-6 py-3 text-left">Pending Fines</th>
                            <th class="px-6 py-3 text-left">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
                        @foreach($users as $user)
                            <tr class="hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors duration-200">
                                <td class="px-6 py-4 whitespace-nowrap flex items-center gap-4">
                                    <div
                                        class="h-10 w-10 rounded-full bg-gradient-to-tr from-indigo-500 to-purple-600 flex items-center justify-center text-white font-semibold shadow-md">
                                        {{ strtoupper(substr($user->name, 0, 2)) }}
                                    </div>
                                    <div>
                                        <div class="text-sm font-semibold text-gray-900 dark:text-white">{{ $user->name }}</div>
                                        <div class="text-xs text-gray-500 dark:text-gray-400">{{ $user->email }}</div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="inline-block px-3 py-1 rounded-full text-xs font-semibold
                                            @if($user->role === 'admin') bg-red-200 text-red-800 dark:bg-red-700 dark:text-red-200
                                            @elseif($user->role === 'librarian') bg-blue-200 text-blue-800 dark:bg-blue-700 dark:text-blue-200
                                            @else bg-green-200 text-green-800 dark:bg-green-700 dark:text-green-200 @endif">
                                        {{ ucfirst($user->role) }}
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span
                                        class="inline-block px-3 py-1 rounded-full text-xs font-semibold
                                            @if($user->status === 'active') bg-green-200 text-green-800 dark:bg-green-700 dark:text-green-200
                                            @elseif($user->status === 'blocked') bg-red-200 text-red-800 dark:bg-red-700 dark:text-red-200
                                            @else bg-yellow-200 text-yellow-800 dark:bg-yellow-700 dark:text-yellow-200 @endif">
                                        {{ ucfirst($user->status) }}
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-white">
                                    {{ $user->lendings->where('status', 'approved')->whereNull('returned_at')->count() }}
                                    / {{ $user->max_books_allowed }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-white">
                                    ₹{{ number_format($user->fines->where('status', 'pending')->sum('amount'), 2) }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    <div class="flex flex-wrap gap-2 justify-start">
                                        <a href="{{ route('admin.users.show', $user) }}"
                                            class="inline-flex items-center gap-1 px-3 py-1 bg-blue-600 hover:bg-blue-700 text-white rounded text-xs font-semibold transition">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none"
                                                viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                    d="M15 12H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z" />
                                            </svg>
                                            View
                                        </a>

                                        <a href="{{ route('admin.users.edit', $user) }}"
                                            class="inline-flex items-center gap-1 px-3 py-1 bg-green-600 hover:bg-green-700 text-white rounded text-xs font-semibold transition">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none"
                                                viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                    d="M11 5h2m-1 0v14m-7-7h14" />
                                            </svg>
                                            Edit
                                        </a>

                                        <a href="{{ route('admin.users.activity', $user) }}"
                                            class="inline-flex items-center gap-1 px-3 py-1 bg-purple-600 hover:bg-purple-700 text-white rounded text-xs font-semibold transition">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none"
                                                viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4l3 3" />
                                            </svg>
                                            Activity
                                        </a>

                                        @if($user->status === 'active')
                                            <form method="POST" action="{{ route('admin.users.block', $user) }}">
                                                @csrf
                                                <button type="submit"
                                                    onclick="return confirm('Are you sure you want to block this user?')"
                                                    class="inline-flex items-center gap-1 px-3 py-1 bg-red-600 hover:bg-red-700 text-white rounded text-xs font-semibold transition">
                                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none"
                                                        viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                            d="M18 6L6 18M6 6l12 12" />
                                                    </svg>
                                                    Block
                                                </button>
                                            </form>
                                        @else
                                            <form method="POST" action="{{ route('admin.users.unblock', $user) }}">
                                                @csrf
                                                <button type="submit"
                                                    onclick="return confirm('Are you sure you want to unblock this user?')"
                                                    class="inline-flex items-center gap-1 px-3 py-1 bg-yellow-500 hover:bg-yellow-600 text-white rounded text-xs font-semibold transition">
                                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none"
                                                        viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                                                    </svg>
                                                    Unblock
                                                </button>
                                            </form>
                                        @endif
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            <div class="mt-8">
                {{ $users->links() }}
            </div>
        </div>
    </div>
    </div>
@endsection