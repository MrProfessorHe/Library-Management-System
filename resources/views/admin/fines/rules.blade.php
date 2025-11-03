@extends('layouts.app')

@section('content')
    <div class="py-12 bg-gray-100 dark:bg-gray-900 min-h-screen">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white dark:bg-gray-800 shadow-md sm:rounded-lg p-8">
                <div class="flex justify-between items-center mb-8">
                    <h2 class="text-3xl font-extrabold text-gray-900 dark:text-white tracking-tight">Fine Rules Management</h2>
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

                <!-- Create New Rule Form -->
                <div class="mb-8 bg-gray-50 dark:bg-gray-700 rounded-lg p-6 shadow-sm">
                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-4">Create New Fine Rule</h3>
                    <form action="{{ route('admin.fines.rules.create') }}" method="POST" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                        @csrf
                        
                        <div>
                            <label for="name" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Rule Name</label>
                            <input type="text" name="name" id="name" required
                                   class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:text-white"
                                   placeholder="e.g., Standard Late Fee">
                            @error('name')
                                <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        <div>
                            <label for="daily_rate" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Daily Rate (₹)</label>
                            <input type="number" name="daily_rate" id="daily_rate" step="0.01" min="0" required
                                   class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:text-white"
                                   placeholder="5.00">
                            @error('daily_rate')
                                <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        <div>
                            <label for="grace_period_days" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Grace Period (Days)</label>
                            <input type="number" name="grace_period_days" id="grace_period_days" min="0" required
                                   class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:text-white"
                                   placeholder="0">
                            @error('grace_period_days')
                                <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        <div>
                            <label for="max_fine" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Max Fine (₹)</label>
                            <input type="number" name="max_fine" id="max_fine" step="0.01" min="0"
                                   class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:text-white"
                                   placeholder="100.00">
                            @error('max_fine')
                                <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        <div class="md:col-span-2">
                            <label for="description" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Description</label>
                            <textarea name="description" id="description" rows="2"
                                      class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:text-white"
                                      placeholder="Description of this fine rule..."></textarea>
                            @error('description')
                                <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        <div class="flex items-center">
                            <input type="checkbox" name="is_active" id="is_active" value="1"
                                   class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                            <label for="is_active" class="ml-2 text-sm font-medium text-gray-700 dark:text-gray-300">
                                Set as active rule
                            </label>
                        </div>

                        <div class="flex items-end">
                            <button type="submit"
                                    class="w-full px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition-colors focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2">
                                Create Rule
                            </button>
                        </div>
                    </form>
                </div>

                <!-- Existing Rules Table -->
                <div class="overflow-x-auto">
                    <table class="min-w-full border border-gray-300 dark:border-gray-600 rounded-lg overflow-hidden">
                        <thead
                            class="bg-gray-100 dark:bg-gray-700 text-gray-600 dark:text-gray-300 uppercase text-xs font-semibold tracking-wide">
                            <tr>
                                <th class="px-6 py-3 text-left">Rule Name</th>
                                <th class="px-6 py-3 text-left">Daily Rate</th>
                                <th class="px-6 py-3 text-left">Grace Period</th>
                                <th class="px-6 py-3 text-left">Max Fine</th>
                                <th class="px-6 py-3 text-left">Status</th>
                                <th class="px-6 py-3 text-left">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
                            @foreach($rules as $rule)
                                <tr class="hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors duration-200">
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="text-sm font-semibold text-gray-900 dark:text-white">{{ $rule->name }}</div>
                                        @if($rule->description)
                                            <div class="text-xs text-gray-500 dark:text-gray-400 mt-1">{{ $rule->description }}</div>
                                        @endif
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-white">
                                        ₹{{ number_format($rule->daily_rate, 2) }}
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-white">
                                        {{ $rule->grace_period_days }} days
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-white">
                                        @if($rule->max_fine)
                                            ₹{{ number_format($rule->max_fine, 2) }}
                                        @else
                                            <span class="text-gray-400">No limit</span>
                                        @endif
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="inline-block px-3 py-1 rounded-full text-xs font-semibold
                                            @if($rule->is_active) bg-green-200 text-green-800 dark:bg-green-700 dark:text-green-200
                                            @else bg-gray-200 text-gray-800 dark:bg-gray-700 dark:text-gray-200 @endif">
                                            {{ $rule->is_active ? 'Active' : 'Inactive' }}
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                        <div class="flex flex-wrap gap-2 justify-start">
                                            <!-- Edit button with data attributes -->
                                            <button type="button" 
                                                    class="edit-rule-btn inline-flex items-center gap-1 px-3 py-1 bg-green-600 hover:bg-green-700 text-white rounded text-xs font-semibold transition"
                                                    data-rule-id="{{ $rule->id }}"
                                                    data-rule-name="{{ $rule->name }}"
                                                    data-rule-daily-rate="{{ $rule->daily_rate }}"
                                                    data-rule-grace-period="{{ $rule->grace_period_days }}"
                                                    data-rule-max-fine="{{ $rule->max_fine }}"
                                                    data-rule-description="{{ $rule->description }}"
                                                    data-rule-is-active="{{ $rule->is_active }}">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none"
                                                    viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        d="M11 5h2m-1 0v14m-7-7h14" />
                                                </svg>
                                                Edit
                                            </button>

                                            <form method="POST" action="{{ route('admin.fines.rules.delete', $rule) }}" class="inline">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" 
                                                        onclick="return confirm('Are you sure you want to delete this fine rule?')"
                                                        class="inline-flex items-center gap-1 px-3 py-1 bg-red-600 hover:bg-red-700 text-white rounded text-xs font-semibold transition">
                                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none"
                                                        viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                            d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                    </svg>
                                                    Delete
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                @if($rules->count() === 0)
                    <div class="text-center py-12">
                        <svg class="mx-auto h-16 w-16 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                        </svg>
                        <h3 class="mt-4 text-lg font-medium text-gray-900 dark:text-gray-100">No fine rules found</h3>
                        <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">Get started by creating your first fine rule.</p>
                    </div>
                @endif
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden z-50">
        <div class="relative top-20 mx-auto p-5 border w-full max-w-md shadow-lg rounded-md bg-white dark:bg-gray-800">
            <div class="mt-3">
                <h3 class="text-lg font-medium text-gray-900 dark:text-gray-100 mb-4">Edit Fine Rule</h3>
                
                <form id="editForm" method="POST">
                    @csrf
                    @method('PUT')
                    
                    <div class="space-y-4">
                        <div>
                            <label for="edit_name" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Rule Name</label>
                            <input type="text" name="name" id="edit_name" required
                                   class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:text-white">
                        </div>

                        <div>
                            <label for="edit_daily_rate" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Daily Rate (₹)</label>
                            <input type="number" name="daily_rate" id="edit_daily_rate" step="0.01" min="0" required
                                   class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:text-white">
                        </div>

                        <div>
                            <label for="edit_grace_period_days" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Grace Period (Days)</label>
                            <input type="number" name="grace_period_days" id="edit_grace_period_days" min="0" required
                                   class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:text-white">
                        </div>

                        <div>
                            <label for="edit_max_fine" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Max Fine (₹)</label>
                            <input type="number" name="max_fine" id="edit_max_fine" step="0.01" min="0"
                                   class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:text-white">
                        </div>

                        <div>
                            <label for="edit_description" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Description</label>
                            <textarea name="description" id="edit_description" rows="3"
                                      class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:text-white"></textarea>
                        </div>

                        <div class="flex items-center">
                            <input type="checkbox" name="is_active" id="edit_is_active" value="1"
                                   class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                            <label for="edit_is_active" class="ml-2 text-sm font-medium text-gray-700 dark:text-gray-300">
                                Set as active rule
                            </label>
                        </div>
                    </div>

                    <div class="flex items-center justify-between mt-6">
                        <button type="button" onclick="closeEditModal()"
                                class="px-4 py-2 bg-gray-300 hover:bg-gray-400 text-gray-800 text-sm font-medium rounded-lg transition-colors">
                            Cancel
                        </button>
                        <button type="submit"
                                class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium rounded-lg transition-colors">
                            Update Rule
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Simple JavaScript for modal functionality using data attributes
        document.addEventListener('DOMContentLoaded', function() {
            // Add click event to all edit buttons
            const editButtons = document.querySelectorAll('.edit-rule-btn');
            
            editButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const ruleId = this.getAttribute('data-rule-id');
                    const ruleName = this.getAttribute('data-rule-name');
                    const ruleDailyRate = this.getAttribute('data-rule-daily-rate');
                    const ruleGracePeriod = this.getAttribute('data-rule-grace-period');
                    const ruleMaxFine = this.getAttribute('data-rule-max-fine');
                    const ruleDescription = this.getAttribute('data-rule-description');
                    const ruleIsActive = this.getAttribute('data-rule-is-active');
                    
                    // Set form action
                    document.getElementById('editForm').action = `/admin/fines/rules/${ruleId}`;
                    
                    // Fill form fields
                    document.getElementById('edit_name').value = ruleName;
                    document.getElementById('edit_daily_rate').value = ruleDailyRate;
                    document.getElementById('edit_grace_period_days').value = ruleGracePeriod;
                    document.getElementById('edit_max_fine').value = ruleMaxFine;
                    document.getElementById('edit_description').value = ruleDescription || '';
                    document.getElementById('edit_is_active').checked = ruleIsActive === '1';
                    
                    // Show modal
                    document.getElementById('editModal').classList.remove('hidden');
                });
            });

            // Close modal when clicking outside
            const modal = document.getElementById('editModal');
            if (modal) {
                modal.addEventListener('click', function(e) {
                    if (e.target.id === 'editModal') {
                        closeEditModal();
                    }
                });
            }
        });

        function closeEditModal() {
            document.getElementById('editModal').classList.add('hidden');
        }
    </script>
@endsection