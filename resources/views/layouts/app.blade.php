<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Styles and Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>

<body class="bg-gray-100 dark:bg-gray-900 font-sans antialiased">
    {{-- Create a full screen layout --}}
    <div class="min-h-screen flex flex-col">

        {{-- ✅ Navigation stays on top --}}
        <header class="bg-gray-800 text-white shadow">
            @include('layouts.navigation')
        </header>

        {{-- ✅ Main content below navbar --}}
        <main class="flex-grow py-2 sm:px-2 lg:px-2 rounded-xl">
            @yield('content')
        </main>

    </div>

    @yield('scripts')

</body>

</html>
