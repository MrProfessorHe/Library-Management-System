<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BookController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\UserController;
use App\Models\Book;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Http\Controllers\Admin\UserManagementController;
use App\Http\Controllers\WelcomeController;
use App\Http\Controllers\Admin\FineManagementController;
use App\Http\Controllers\Admin\LendingManagementController;
use App\Http\Controllers\Auth\AdminLoginController;
use App\Http\Controllers\Admin\FineReceiptController;


Route::get('/', [WelcomeController::class, 'index'])->name('home');
// Route::get('/', [WelcomeController::class, 'index'])->name('welcome');


Route::get('/admin/fines/{id}/receipt', [FineReceiptController::class, 'downloadReceipt'])
    ->name('admin.fines.receipt');

Route::get('/users/{user}/edit', [UserController::class, 'edit'])->name('users.edit');
Route::put('/users/{user}', [UserController::class, 'update'])->name('users.update');

Route::get('/admin/lendings', [App\Http\Controllers\Admin\LendingManagementController::class, 'index'])->name('admin.lendings.index');

// View Fines for a User
Route::get('/admin/users/{user}/fines', [UserManagementController::class, 'showFines'])->name('admin.users.fines');

Route::get('/admin/users/{user}/fines', [FineManagementController::class, 'userFines'])->name('fines.user');

Route::put('/lendings/{lending}/return', [LendingManagementController::class, 'markAsReturned'])->name('lendings.return');


Route::get('/books/external/{isbn}/{id?}', [BookController::class, 'showExternal'])->name('books.external.show');

//admin login
Route::get('/admin/login', [AdminLoginController::class, 'showLoginForm'])->name('admin.login');
Route::post('/admin/login', [AdminLoginController::class, 'login'])->name('admin.login.submit');


Route::get('/admin/lendings', [App\Http\Controllers\Admin\LendingManagementController::class, 'index'])
    ->name('admin.lendings.index'); // <-- this is the actual name


Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
});

Route::get('/books', [BookController::class, 'index'])->name('books.insertBook'); // ⚠️ REMOVE or RENAME
Route::post('/books', [BookController::class, 'store'])->name('books.store');


Route::resource('books', BookController::class);



Route::get('/user-list', [UserController::class, 'index'])->middleware(['auth'])->name('user.list');

Route::get('/search', [BookController::class, 'search'])->name('books.search');



Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});


Route::middleware(['auth'])->group(function () {
    Route::post('/lendings/request/{book}', [LendingManagementController::class, 'requestBorrow'])->name('lendings.request');
    Route::post('/lendings/{lending}/approve', [LendingManagementController::class, 'approve'])->name('lendings.approve');
    Route::post('/lendings/{lending}/reject', [LendingManagementController::class, 'reject'])->name('lendings.reject');

});

// Admin Routes
Route::middleware(['auth', 'role:admin,librarian'])->prefix('admin')->name('admin.')->group(function () {
    // User Management
    Route::get('/users', [App\Http\Controllers\Admin\UserManagementController::class, 'index'])->name('users.index');
    Route::get('/users/{user}', [App\Http\Controllers\Admin\UserManagementController::class, 'show'])->name('users.show');
    Route::get('/users/{user}/edit', [App\Http\Controllers\Admin\UserManagementController::class, 'edit'])->name('users.edit');
    Route::put('/users/{user}', [App\Http\Controllers\Admin\UserManagementController::class, 'update'])->name('users.update');
    Route::post('/users/{user}/block', [App\Http\Controllers\Admin\UserManagementController::class, 'block'])->name('users.block');
    Route::post('/users/{user}/unblock', [App\Http\Controllers\Admin\UserManagementController::class, 'unblock'])->name('users.unblock');
    Route::post('/users/{user}/role', [App\Http\Controllers\Admin\UserManagementController::class, 'assignRole'])->name('users.assign-role');
    Route::get('/users/{user}/activity', [App\Http\Controllers\Admin\UserManagementController::class, 'activity'])->name('users.activity');

    // Lending Management
    Route::get('/lendings', [App\Http\Controllers\Admin\LendingManagementController::class, 'index'])->name('lendings.index');
    Route::get('/lendings/{lending}', [App\Http\Controllers\Admin\LendingManagementController::class, 'show'])->name('lendings.show');
    
    Route::post('/lendings/{lending}/approve', [App\Http\Controllers\Admin\LendingManagementController::class, 'approve'])->name('lendings.approve');
    Route::post('/lendings/{lending}/reject', [App\Http\Controllers\Admin\LendingManagementController::class, 'reject'])->name('lendings.reject');
    Route::post('/lendings/{lending}/return', [App\Http\Controllers\Admin\LendingManagementController::class, 'markAsReturned'])->name('lendings.return');
    Route::post('/lendings/{lending}/renew', [App\Http\Controllers\Admin\LendingManagementController::class, 'renew'])->name('lendings.renew');
    Route::post('/lendings/{lending}/due-date', [App\Http\Controllers\Admin\LendingManagementController::class, 'setDueDate'])->name('lendings.set-due-date');
    Route::post('/lendings/{lending}/extend', [App\Http\Controllers\Admin\LendingManagementController::class, 'extendDueDate'])->name('lendings.extend');
    Route::post('/lendings/calculate-fines', [App\Http\Controllers\Admin\LendingManagementController::class, 'calculateFines'])->name('lendings.calculate-fines');

    // Fine Management
    Route::get('/fines', [App\Http\Controllers\Admin\FineManagementController::class, 'index'])->name('fines.index');
    Route::get('/fines/user/{user}', [App\Http\Controllers\Admin\FineManagementController::class, 'userFines'])->name('fines.user');
    Route::post('/fines/{fine}/pay', [App\Http\Controllers\Admin\FineManagementController::class, 'markAsPaid'])->name('fines.pay');
    Route::post('/fines/{fine}/waive', [App\Http\Controllers\Admin\FineManagementController::class, 'waive'])->name('fines.waive');
    Route::post('/fines/bulk-pay', [App\Http\Controllers\Admin\FineManagementController::class, 'bulkMarkAsPaid'])->name('fines.bulk-pay');
    Route::post('/fines/user/{user}/reminder', [App\Http\Controllers\Admin\FineManagementController::class, 'sendReminder'])->name('fines.reminder');
    Route::get('/fines/rules', [App\Http\Controllers\Admin\FineManagementController::class, 'fineRules'])->name('fines.rules');
    Route::post('/fines/rules', [App\Http\Controllers\Admin\FineManagementController::class, 'createFineRule'])->name('fines.rules.create');
    Route::put('/fines/rules/{rule}', [App\Http\Controllers\Admin\FineManagementController::class, 'updateFineRule'])->name('fines.rules.update');
    Route::delete('/fines/rules/{rule}', [App\Http\Controllers\Admin\FineManagementController::class, 'deleteFineRule'])->name('fines.rules.delete');
    Route::post('/fines/calculate-all', [App\Http\Controllers\Admin\FineManagementController::class, 'calculateAllFines'])->name('fines.calculate-all');
    Route::get('/fines/report', [App\Http\Controllers\Admin\FineManagementController::class, 'report'])->name('fines.report');
    Route::post('/fines/{fine}/mark-paid', [FineManagementController::class, 'markAsPaid'])->name('admin.fines.markPaid');
    

});

require __DIR__.'/auth.php';

// Show edit form
Route::get('/books/{id}/edit', [BookController::class, 'edit'])->name('books.edit');

// Update book (form submission)
Route::put('/books/{id}', [BookController::class, 'update'])->name('books.update');

Route::get('/books', [BookController::class, 'index'])->name('books.insertBook');

Route::get('/books/live-search', [BookController::class, 'liveSearch'])->name('books.liveSearch');



