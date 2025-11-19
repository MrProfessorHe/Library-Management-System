<a id="readme-top"></a>

<!-- PROJECT LOGO -->
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

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#installation-guide">Installation Guide</a></li>
    <li><a href="#importing-library_db.sql-using-phpmyadmin">Importing <code>library_db.sql</code> using phpMyAdmin</a></li>
    <li><a href="#configuration">Configuration</a></li>
    <li><a href="#Mailpit-Installation-&-Configuration">Mailpit Installation & Configuration
</a></li>
    <li><a href="#user-roles">User Roles</a></li>
    <li><a href="#project-structure">Project Structure</a></li>
    <li><a href="#To-Login">To Login</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#credits">Credits</a></li>
  </ol>
</details>

---

## 🚀 About the Project

The **Library Management System** is a Laravel-based web application that helps manage:

- 📖 Books (internal & external via Google Books API)
- 👩‍💻 Users (Admin, Guest, Members)
- 🔄 Lending requests, approvals & rejections
- ⏳ Due dates & fine management
- 📊 Admin dashboards & reports

This system is designed for **schools, colleges, or public libraries** to simplify book lending workflows.

---

## ⚡ Features

- User authentication (Admin, Guest, Member)
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
git clone https://github.com/MrProfessorHe/Library-Management-System

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
```

---

## 🗄️ Importing `library_db.sql` using phpMyAdmin

1. **Open phpMyAdmin** in your browser (usually at `http://localhost/phpmyadmin`).
2. **Create a new database** (e.g., `library_db`).
3. Click on the new database in the left sidebar.
4. Go to the **Import** tab at the top.
5. Click **Choose File** and select the `library_db.sql` file from your project directory.
6. Click **Go** to import the database structure and data.
7. Update your `.env` file with the correct database name, username, and password.

Example `.env` settings:
```
DB_DATABASE=library_db
DB_USERNAME=root
DB_PASSWORD=
```

---

## ⚙️ Configuration

- Set your database credentials in `.env`
- Add API keys for Google Books and NYT(trending books fetching) in `.env`:
  ```
  GOOGLE_BOOKS_API_KEY=your_google_books_api_key
  NYT_API_KEY=your_nyt_api_key_here
  ```

---
## ✉️ Mailpit Installation & Configuration

### 1️⃣ Install Mailpit

- Install Mailpit - https://github.com/axllent/mailpit/releases
- Reffer youtube or google if get any trouble.
- Run Mailpit: 
  ```
  mailpit
  ```
- Mailpit runs at:
  ```
  SMTP: localhost:1025

  Inbox: http://localhost:8025
  ```
### 2️⃣ Configure Laravel
- In .env:
  ```
  MAIL_MAILER=smtp
  MAIL_HOST=localhost
  MAIL_PORT=1025
  MAIL_USERNAME=null
  MAIL_PASSWORD=null
  MAIL_ENCRYPTION=null
  MAIL_FROM_ADDRESS="library@example.com"
  MAIL_FROM_NAME="Library Management System"
  ```


## 👤 User Roles

- **Guest:** Access to only to welcome page
- **Admin:** Full access to all features
- **Member:** Browse, borrow, and return books

---

## 📂 Project Structure

- `app/` - Application logic (Controllers, Models, etc.)
- `resources/views/` - Blade templates for UI
- `routes/` - Route definitions
- `database/migrations/` - Database schema
- `database/seeders/` - Initial data
- `public/` - Public assets and entry point

---

## 🛅 To Login

### For User
- Path: `/login`
- Gmail: user@gmail.com
- Password: user1234

### For Admin
- Path: `/admin/login`
- Gmail: admin@gmail.com
- Password: admin123
---

## 📄 License

This project is open-source and available under the [MIT license](LICENSE).

---

## 🙏 Credits

Built with [Laravel](https://laravel.com/), [Tailwind CSS](https://tailwindcss.com/), and [MySQL](https://www.mysql.com/)