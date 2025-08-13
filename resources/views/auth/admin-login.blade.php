<x-guest-layout>
    <div class="w-full max-w-md mx-auto mt-8 px-6 py-6 bg-white dark:bg-gray-900 shadow-md rounded-lg">
        <!-- Header -->
        <div class="text-center mb-6">
            <h2 class="text-3xl font-bold text-gray-900 dark:text-gray-100 mb-2">
                Admin Login
            </h2>
            <p class="text-gray-600 dark:text-gray-400">
                Sign in to the admin panel
            </p>
        </div>

        <!-- Session Status -->
        <x-auth-session-status class="mb-4" :status="session('status')" />

        <form method="POST" action="{{ url('/admin/login') }}" class="space-y-6">
            @csrf

            <!-- Email Address -->
            <div>
                <x-input-label for="email" :value="__('Email')" class="text-gray-700 dark:text-gray-300 font-medium" />
                <x-text-input id="email"
                    class="block mt-2 w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-800 text-gray-900 dark:text-gray-100 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition duration-200"
                    type="email" name="email" required autofocus placeholder="Enter your admin email" />
                <x-input-error :messages="$errors->get('email')" class="mt-2" />
            </div>

            <!-- Password -->
            <div>
                <x-input-label for="password" :value="__('Password')"
                    class="text-gray-700 dark:text-gray-300 font-medium" />
                <x-text-input id="password"
                    class="block mt-2 w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-800 text-gray-900 dark:text-gray-100 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition duration-200"
                    type="password" name="password" required placeholder="Enter your password" />
                <x-input-error :messages="$errors->get('password')" class="mt-2" />
            </div>

            <!-- Submit Button -->
            <div class="pt-4">
                <x-primary-button class="w-full justify-center py-3 text-base font-semibold">
                    {{ __('Login as Admin') }}
                </x-primary-button>
            </div>

            <!-- Forgot password (optional) -->
            @if (app('router')->has('password.request'))
                <div class="text-right pt-2">
                    <a href="{{ route('password.request') }}"
                        class="text-sm text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 hover:underline transition-colors">
                        {{ __('Forgot password?') }}
                    </a>
                </div>
            @endif
        </form>
    </div>
</x-guest-layout>