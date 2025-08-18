@if ($paginator->hasPages())
    <div class="flex justify-center">
        <nav role="navigation" aria-label="{{ __('Pagination Navigation') }}"
             class="flex flex-col sm:flex-row justify-between items-center w-full max-w-4xl px-4 py-4 bg-gray-100 dark:bg-gray-900 rounded-lg shadow-md space-y-4 sm:space-y-0 sm:space-x-6">

            {{-- Mobile Navigation --}}
            <div class="flex justify-between w-full sm:hidden">
                {{-- Previous --}}
                @if ($paginator->onFirstPage())
                    <span class="inline-flex items-center px-4 py-2 text-sm text-gray-500 bg-white border border-gray-300 rounded-md cursor-not-allowed dark:bg-gray-800 dark:text-gray-600 dark:border-gray-600">
                        {!! __('pagination.previous') !!}
                    </span>
                @else
                    <a href="{{ $paginator->previousPageUrl() }}"
                       class="inline-flex items-center px-4 py-2 text-sm text-gray-700 bg-white border border-gray-300 rounded-md hover:bg-gray-200 dark:bg-gray-800 dark:text-gray-300 dark:border-gray-600 dark:hover:bg-gray-700">
                        {!! __('pagination.previous') !!}
                    </a>
                @endif

                {{-- Next --}}
                @if ($paginator->hasMorePages())
                    <a href="{{ $paginator->nextPageUrl() }}"
                       class="inline-flex items-center px-4 py-2 text-sm text-gray-700 bg-white border border-gray-300 rounded-md hover:bg-gray-200 dark:bg-gray-800 dark:text-gray-300 dark:border-gray-600 dark:hover:bg-gray-700">
                        {!! __('pagination.next') !!}
                    </a>
                @else
                    <span class="inline-flex items-center px-4 py-2 text-sm text-gray-500 bg-white border border-gray-300 rounded-md cursor-not-allowed dark:bg-gray-800 dark:text-gray-600 dark:border-gray-600">
                        {!! __('pagination.next') !!}
                    </span>
                @endif
            </div>

            {{-- Desktop Info + Links --}}
            <div class="hidden sm:flex flex-col sm:flex-row sm:items-center sm:justify-between w-full gap-4">
                {{-- Showing Info --}}
                <div class="text-sm text-gray-600 dark:text-gray-400">
                    {!! __('Showing') !!}
                    @if ($paginator->firstItem())
                        <span class="font-medium">{{ $paginator->firstItem() }}</span>
                        {!! __('to') !!}
                        <span class="font-medium">{{ $paginator->lastItem() }}</span>
                    @else
                        {{ $paginator->count() }}
                    @endif
                    {!! __('of') !!}
                    <span class="font-medium">{{ $paginator->total() }}</span>
                    {!! __('results') !!}
                </div>

                {{-- Pagination Links --}}
                <div class="flex items-center space-x-1">
                    {{-- Previous Button --}}
                    @if ($paginator->onFirstPage())
                        <span class="px-2 py-2 text-sm text-gray-400 bg-white border border-gray-300 rounded-l-md dark:bg-gray-800 dark:border-gray-600">
                            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 11-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
                            </svg>
                        </span>
                    @else
                        <a href="{{ $paginator->previousPageUrl() }}"
                           class="px-2 py-2 text-sm text-gray-700 bg-white border border-gray-300 rounded-l-md hover:bg-gray-200 dark:bg-gray-800 dark:text-gray-300 dark:border-gray-600 dark:hover:bg-gray-700">
                            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 11-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
                            </svg>
                        </a>
                    @endif

                    {{-- Page Numbers --}}
                    @foreach ($elements as $element)
                        {{-- Dots --}}
                        @if (is_string($element))
                            <span class="px-4 py-2 text-sm text-gray-500 bg-white border border-gray-300 dark:bg-gray-800 dark:border-gray-600">
                                {{ $element }}
                            </span>
                        @endif

                        {{-- Page Numbers --}}
                        @if (is_array($element))
                            @foreach ($element as $page => $url)
                                @if ($page == $paginator->currentPage())
                                    <span class="px-4 py-2 text-sm font-medium text-white bg-blue-500 border border-blue-600 rounded-md dark:bg-blue-600 dark:border-blue-500">
                                        {{ $page }}
                                    </span>
                                @else
                                    <a href="{{ $url }}"
                                       class="px-4 py-2 text-sm text-gray-700 bg-white border border-gray-300 hover:bg-gray-200 dark:bg-gray-800 dark:text-gray-300 dark:border-gray-600 dark:hover:bg-gray-700 rounded-md">
                                        {{ $page }}
                                    </a>
                                @endif
                            @endforeach
                        @endif
                    @endforeach

                    {{-- Next Button --}}
                    @if ($paginator->hasMorePages())
                        <a href="{{ $paginator->nextPageUrl() }}"
                           class="px-2 py-2 text-sm text-gray-700 bg-white border border-gray-300 rounded-r-md hover:bg-gray-200 dark:bg-gray-800 dark:text-gray-300 dark:border-gray-600 dark:hover:bg-gray-700">
                            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" />
                            </svg>
                        </a>
                    @else
                        <span class="px-2 py-2 text-sm text-gray-400 bg-white border border-gray-300 rounded-r-md dark:bg-gray-800 dark:border-gray-600">
                            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" />
                            </svg>
                        </span>
                    @endif
                </div>
            </div>
        </nav>
    </div>
@endif
