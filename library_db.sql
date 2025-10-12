-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2025 at 05:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lending_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `days_overdue` int(11) NOT NULL,
  `status` enum('pending','paid','waived') NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fines`
--

INSERT INTO `fines` (`id`, `lending_id`, `user_id`, `amount`, `days_overdue`, `status`, `paid_at`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 76.00, 9, 'paid', '2025-09-16 09:56:40', 'Test fine inserted via seeder\nReminder sent on 2025-09-16 15:11:22', '2025-09-01 09:02:03', '2025-09-16 09:56:40'),
(2, 2, 4, 46.00, 2, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-09 09:02:03', '2025-09-11 09:02:03'),
(3, 3, 5, 97.00, 2, 'paid', '2025-10-12 14:30:46', 'Test fine inserted via seeder', '2025-09-09 09:02:03', '2025-10-12 14:30:46'),
(4, 4, 7, 92.00, 7, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-09 09:02:03', '2025-09-11 09:02:03'),
(5, 5, 8, 80.00, 3, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-05 09:02:03', '2025-09-11 09:02:03'),
(6, 6, 9, 71.00, 4, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-07 09:02:03', '2025-09-11 09:02:03'),
(7, 7, 10, 43.00, 8, 'waived', '2025-09-16 15:47:24', 'Test fine inserted via seeder', '2025-09-04 09:02:03', '2025-09-16 15:47:24'),
(8, 8, 11, 24.00, 2, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-05 09:02:03', '2025-09-11 09:02:03'),
(9, 9, 12, 45.00, 8, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-08 09:02:03', '2025-09-11 09:02:03'),
(10, 10, 13, 97.00, 9, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-03 09:02:03', '2025-09-11 09:02:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fines`
--
ALTER TABLE `fines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fines_lending_id_foreign` (`lending_id`),
  ADD KEY `fines_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fines`
--
ALTER TABLE `fines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fines`
--
ALTER TABLE `fines`
  ADD CONSTRAINT `fines_lending_id_foreign` FOREIGN KEY (`lending_id`) REFERENCES `lendings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fines_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
