@extends('layouts.app')

@section('title', 'Edit User')

@section('content')
<div class="max-w-2xl mx-auto mt-10 p-6 bg-white dark:bg-gray-800 rounded-xl shadow text-gray-900 dark:text-gray-100">
    <h1 class="text-2xl font-bold mb-6">Edit User: {{ $user->name }}</h1>

    <form method="POST" action="{{ route('users.update', $user->id) }}">
        @csrf
        @method('PUT')

        <div class="mb-4">
            <label class="block mb-1 font-semibold">Name</label>
            <input type="text" name="name" value="{{ $user->name }}" required
                class="w-full px-4 py-2 border rounded-md dark:bg-gray-900 dark:text-white">
        </div>

        <div class="mb-4">
            <label class="block mb-1 font-semibold">Email</label>
            <input type="email" name="email" value="{{ $user->email }}" required
                class="w-full px-4 py-2 border rounded-md dark:bg-gray-900 dark:text-white">
        </div>

        <div class="mb-4">
            <label class="block mb-1 font-semibold">Role</label>
            <select name="role" class="w-full px-4 py-2 border rounded-md dark:bg-gray-900 dark:text-white">
                <option value="user" {{ $user->role === 'user' ? 'selected' : '' }}>User</option>
                <option value="admin" {{ $user->role === 'admin' ? 'selected' : '' }}>Admin</option>
            </select>
        </div>

        <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">
            Update
        </button>
    </form>
</div>
@endsection
