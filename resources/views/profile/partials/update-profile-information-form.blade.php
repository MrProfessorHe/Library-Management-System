<section>
    <!-- Back Button -->
    <div class="mb-6">
        <a href="{{ url()->previous() }}" 
           class="inline-flex items-center gap-2 px-4 py-2 border border-gray-300 dark:border-gray-600 text-gray-600 dark:text-gray-300 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 transition-colors duration-200 font-semibold">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
            </svg>
            Back
        </a>
    </div>

    <header>
        <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">
            {{ __('Profile Information') }}
        </h2>

        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
            {{ __("Update your account's profile information and email address.") }}
        </p>
    </header>

    <form id="send-verification" method="post" action="{{ route('verification.send') }}">
        @csrf
    </form>

    <form method="post" action="{{ route('profile.update') }}" class="mt-6 space-y-6">
        @csrf
        @method('patch')

        <!-- Name Field (Read-only) -->
        <div>
            <x-input-label for="name" :value="__('Name')" />
            <x-text-input 
                id="name" 
                name="name" 
                type="text" 
                class="mt-1 block w-full bg-gray-100 dark:bg-gray-700 cursor-not-allowed" 
                :value="old('name', $user->name)"
                readonly 
                disabled
            />
            <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">
                {{ __('Name cannot be changed. Please contact administrator.') }}
            </p>
        </div>

        <!-- Email Field (Read-only) -->
        <div>
            <x-input-label for="email" :value="__('Email')" />
            <x-text-input 
                id="email" 
                name="email" 
                type="email" 
                class="mt-1 block w-full bg-gray-100 dark:bg-gray-700 cursor-not-allowed" 
                :value="old('email', $user->email)" 
                readonly 
                disabled
            />
            <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">
                {{ __('Email cannot be changed. Please contact administrator.') }}
            </p>

            @if ($user instanceof \Illuminate\Contracts\Auth\MustVerifyEmail && !$user->hasVerifiedEmail())
                <div class="mt-4">
                    <p class="text-sm mt-2 text-gray-800 dark:text-gray-200">
                        {{ __('Your email address is unverified.') }}

                        <button form="send-verification"
                            class="underline text-sm text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-100 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:focus:ring-offset-gray-800">
                            {{ __('Click here to re-send the verification email.') }}
                        </button>
                    </p>

                    @if (session('status') === 'verification-link-sent')
                        <p class="mt-2 font-medium text-sm text-green-600 dark:text-green-400">
                            {{ __('A new verification link has been sent to your email address.') }}
                        </p>
                    @endif
                </div>
            @endif
        </div>

        <!-- Phone (Editable) -->
        <div>
            <x-input-label for="phone" :value="__('Phone')" />
            <x-text-input 
                id="phone" 
                name="phone" 
                type="text" 
                class="mt-1 block w-full" 
                :value="old('phone', $user->phone)" 
                required 
                autocomplete="tel" 
            />
            <x-input-error class="mt-2" :messages="$errors->get('phone')" />
        </div>

        <!-- Address (Editable) -->
        <div>
            <x-input-label for="address" :value="__('Address')" />
            <x-text-input 
                id="address" 
                name="address" 
                type="text" 
                class="mt-1 block w-full" 
                :value="old('address', $user->address)" 
                required 
                autocomplete="street-address" 
            />
            <x-input-error class="mt-2" :messages="$errors->get('address')" />
        </div>

        <div class="flex items-center gap-4">
            <x-primary-button>{{ __('Save') }}</x-primary-button>

            @if (session('status') === 'profile-updated')
                <p x-data="{ show: true }" x-show="show" x-transition x-init="setTimeout(() => show = false, 2000)"
                    class="text-sm text-gray-600 dark:text-gray-400">{{ __('Saved.') }}</p>
            @endif
        </div>
    </form>
</section>