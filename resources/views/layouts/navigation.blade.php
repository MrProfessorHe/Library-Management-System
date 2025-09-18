<nav x-data="{ open: false }" class="bg-white dark:bg-gray-800 border-b border-gray-100 dark:border-gray-700">
    <!-- Primary Navigation Menu -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">

        </div>
    </div>


</nav>


<nav x-data="{ open: false }"
    class="bg-white/80 dark:bg-gray-900/80 backdrop-blur-md shadow-md border-b border-gray-200 dark:border-gray-700 fixed w-full z-50 top-0">
    <div class="w-full mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <!-- Left section: Logo & Nav -->
            <div class="flex items-center space-x-6">
                <!-- Logo -->
                <a href="{{ route('home') }}"
                    class="flex items-center hover:opacity-90 transition-opacity duration-200">
                    <img src="{{ asset('images/BookLogoB.png') }}" alt="Library Logo" class="h-10 block dark:hidden">
                    <img src="{{ asset('images/BookLogoW.png') }}" alt="Library Logo" class="h-10 hidden dark:block">
                </a>

                <!-- Nav links -->
                <div class="hidden sm:flex space-x-6 items-center text-sm font-medium text-gray-600 dark:text-gray-300">
                    <x-nav-link :href="route('home')" :active="request()->routeIs('home')">
                        {{ __('Home') }}
                    </x-nav-link>

                    <x-nav-link :href="route('dashboard')" :active="request()->routeIs('dashboard')">
                        {{ __('Dashboard') }}
                    </x-nav-link>

                    @if(auth()->user() && (auth()->user()->role === 'admin' || auth()->user()->role === 'librarian'))
                        <x-nav-link :href="route('books.insertBook')" :active="request()->routeIs('books.insertBook', 'books.edit', 'books.update', 'books.create')">
                            {{ __('Manage Books') }}
                        </x-nav-link>
                        <x-nav-link :href="route('admin.lendings.index')" :active="request()->routeIs('admin.lendings.*')">
                            {{ __('Manage Lendings') }}
                        </x-nav-link>
                        <x-nav-link :href="route('admin.fines.index')" :active="request()->routeIs('admin.fines.*')">
                            {{ __('Manage Fines') }}
                        </x-nav-link>
                    @endif

                    @if(auth()->user() && auth()->user()->role === 'admin')
                        <x-nav-link :href="route('admin.users.index')" :active="request()->routeIs('admin.users.*')">
                            {{ __('User Management') }}
                        </x-nav-link>
                    @endif
                </div>
            </div>

            <!-- Right section: Auth/User -->
            <div class="hidden sm:flex items-center space-x-4">
                @auth
                    <x-dropdown align="right" width="48">
                        <x-slot name="trigger">
                            <button
                                class="flex items-center text-sm font-medium text-gray-700 dark:text-gray-200 hover:text-gray-900 dark:hover:text-white focus:outline-none">
                                <span>{{ auth()->user()->name }}</span>
                                <svg class="ms-1 h-4 w-4" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M5.5 7l4.5 4.5L14.5 7z" clip-rule="evenodd" />
                                </svg>
                            </button>
                        </x-slot>
                        <x-slot name="content">
                            <x-dropdown-link :href="route('profile.edit')">
                                {{ __('Profile') }}
                            </x-dropdown-link>
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <x-dropdown-link :href="route('logout')"
                                    onclick="event.preventDefault(); this.closest('form').submit();">
                                    {{ __('Log Out') }}
                                </x-dropdown-link>
                            </form>
                        </x-slot>
                    </x-dropdown>
                @else
                    <a href="{{ route('login') }}"
                        class="text-sm font-semibold text-gray-700 dark:text-gray-200 hover:text-blue-600 transition">
                        {{ __('Login') }}
                    </a>
                    <a href="{{ route('register') }}"
                        class="text-sm font-semibold text-gray-700 dark:text-gray-200 hover:text-blue-600 transition">
                        {{ __('Register') }}
                    </a>
                @endauth
            </div>

            <!-- Mobile Hamburger -->
            <div class="sm:hidden flex items-center">
                <button @click="open = ! open" class="text-gray-600 dark:text-gray-300 focus:outline-none">
                    <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path :class="{ 'hidden': open }" stroke-linecap="round" stroke-linejoin="round"
                            stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                        <path :class="{ 'hidden': !open }" stroke-linecap="round" stroke-linejoin="round"
                            stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </button>
            </div>
        </div>
    </div>

    <!-- Mobile Responsive Nav -->
    <div :class="{ 'block': open, 'hidden': !open }"
        class="sm:hidden bg-white dark:bg-gray-900 border-t border-gray-200 dark:border-gray-700 px-4 pt-4 pb-6 space-y-2 text-sm">
        <x-responsive-nav-link :href="route('dashboard')" :active="request()->routeIs('dashboard')">
            {{ __('Dashboard') }}
        </x-responsive-nav-link>

        @if(auth()->user() && (auth()->user()->role === 'admin' || auth()->user()->role === 'librarian'))
            <x-responsive-nav-link :href="route('books.insertBook')" :active="request()->routeIs('books.*')">
                {{ __('Manage Books') }}
            </x-responsive-nav-link>
            <x-responsive-nav-link :href="route('admin.lendings.index')" :active="request()->routeIs('admin.lendings.*')">
                {{ __('Manage Lendings') }}
            </x-responsive-nav-link>
            <x-responsive-nav-link :href="route('admin.fines.index')" :active="request()->routeIs('admin.fines.*')">
                {{ __('Manage Fines') }}
            </x-responsive-nav-link>
        @endif

        @if(auth()->user() && auth()->user()->role === 'admin')
            <x-responsive-nav-link :href="route('admin.users.index')" :active="request()->routeIs('admin.users.*')">
                {{ __('User Management') }}
            </x-responsive-nav-link>
        @endif

        @auth
            <x-responsive-nav-link :href="route('profile.edit')">
                {{ __('Profile') }}
            </x-responsive-nav-link>
            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <x-responsive-nav-link :href="route('logout')"
                    onclick="event.preventDefault(); this.closest('form').submit();">
                    {{ __('Log Out') }}
                </x-responsive-nav-link>
            </form>
        @else
            <x-responsive-nav-link :href="route('login')">
                {{ __('Login') }}
            </x-responsive-nav-link>
            <x-responsive-nav-link :href="route('register')">
                {{ __('Register') }}
            </x-responsive-nav-link>
        @endauth
    </div>
</nav>