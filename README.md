<p align="center">
  <a href="https://laravel.com" target="_blank">
    <img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="300" alt="Laravel Logo">
  </a>
</p>

<h1 align="center">📚 Library Management System</h1>

<p align="center">
  <a href="#"><img src="https://img.shields.io/badge/Laravel-11-red" alt="Laravel"></a>
  <a href="#"><img src="https://img.shields.io/badge/MySQL-Database-blue" alt="MySQL"></a>
  <a href="#"><img src="https://img.shields.io/badge/PHP-8.2-purple" alt="PHP"></a>
  <a href="#"><img src="https://img.shields.io/badge/license-MIT-green" alt="License"></a>
</p>

---

## 🚀 About the Project
The **Library Management System** is a Laravel-based web application that helps manage:
- 📖 Books (internal & external via Google Books API)
- 👩‍💻 Users (Admin, Librarian, Members)
- 🔄 Lending requests, approvals & rejections
- ⏳ Due dates & fine management
- 📊 Admin dashboards & reports

This system is designed for **schools, colleges, or public libraries** to simplify book lending workflows.

---

## ⚡ Features
- User authentication (Admin, Librarian, Member)
- Search books (internal DB + Google Books API)
- Borrowing & lending system with approval/rejection
- Track overdue books & fines
- Role-based access control
- Admin management for users, books & fines

---

## 🛠️ Installation Guide

Follow these steps to install the project:

```bash
# 1. Clone the repository
git clone https://github.com/your-username/library-management-system.git

# 2. Navigate into the project folder
cd library-management-system

# 3. Install dependencies
composer install
npm install && npm run build

# 4. Copy .env file and configure DB & APP settings
cp .env.example .env

# 5. Generate app key
php artisan key:generate

# 6. Run migrations
php artisan migrate --seed

# 7. Start the local development server
php artisan serve
