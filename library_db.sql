-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2025 at 07:09 PM
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
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `book_type_id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `isbn`, `cover_image`, `book_type_id`, `language_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'The Hobbit', 'J. R. R. Tolkien', '9780007322602', 'http://books.google.com/books/content?id=U799AY3yfqcC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 21, '2025-07-27 12:23:22', '2025-07-27 12:23:22'),
(2, 'Pride and Prejudice', 'Jane Austen', '9780881031218', 'http://books.google.com/books/content?id=ertAPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 18, 6, 18, '2025-07-27 12:23:23', '2025-07-27 12:23:23'),
(3, 'To Kill a Mockingbird', 'Harper Lee', '9780329001186', 'http://books.google.com/books/content?id=3t5dtAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 18, 6, 6, '2025-07-27 12:23:24', '2025-07-27 12:23:24'),
(4, '1984', 'George Orwell', '9781784043735', 'http://books.google.com/books/content?id=uyr8BAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 21, '2025-07-27 12:23:26', '2025-07-27 12:23:26'),
(5, 'The Great Gatsby', 'F. Scott Fitzgerald', '9780743246392', 'http://books.google.com/books/content?id=iXn5U2IzVH0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 25, '2025-07-27 12:23:27', '2025-07-27 12:23:27'),
(6, 'The Catcher in the Rye', 'J. D. Salinger', '9780241988794', 'http://books.google.com/books/content?id=mZunDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 7, '2025-07-27 12:23:31', '2025-07-27 12:23:31'),
(7, 'Little Women', 'Louisa May Alcott', '9781877527937', 'http://books.google.com/books/content?id=WMjHdhYI8F4C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 2, '2025-07-27 12:23:31', '2025-07-27 12:23:31'),
(8, 'Wuthering Heights in Plain and Simple English (Includes Study Guide, Complete Unabridged Book, Historical Context, Biography And', 'Emily Brontë', '9781621074564', 'http://books.google.com/books/content?id=S2Yvf-tWNdUC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 9, '2025-07-27 12:23:34', '2025-07-27 12:23:34'),
(9, 'The Fault in Our Stars', 'John Green', '9780141345642', 'http://books.google.com/books/content?id=Qk8n0olOX5MC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 6, '2025-07-27 12:23:36', '2025-07-27 12:23:36'),
(10, 'The Hunger Games', 'Suzanne Collins', '9781407133171', 'http://books.google.com/books/content?id=_zSzAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 13, '2025-07-27 12:23:37', '2025-07-27 12:23:37'),
(11, 'The Alchemist - 10th Anniversary Edition', 'Paulo Coelho', '9780061741241', 'http://books.google.com/books/content?id=FEL8DlqjYEkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 9, '2025-07-27 12:23:38', '2025-07-27 12:23:38'),
(12, 'The Kite Runner', 'Khaled Hosseini', '9781526634054', 'http://books.google.com/books/content?id=KUMIEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 3, '2025-07-27 12:23:40', '2025-07-27 12:23:40'),
(13, 'Life of Pi', 'Yann Martel', '9781350295704', 'http://books.google.com/books/content?id=O8ZaEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 12, '2025-07-27 12:23:41', '2025-07-27 12:23:41'),
(14, 'The Giver (HarperCollins Children’s Modern Classics)', 'Lois Lowry', '9780007369881', 'http://books.google.com/books/content?id=Y_db_7KZYEYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 22, '2025-07-27 12:23:42', '2025-07-27 12:23:42'),
(15, 'The Night Circus', 'Erin Morgenstern', '9781446468265', 'http://books.google.com/books/content?id=GwAWS6C33O4C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 1, '2025-07-27 12:23:44', '2025-07-27 12:23:44'),
(16, 'Where the Crawdads Sing', 'Delia Owens', '9781472154637', 'http://books.google.com/books/content?id=jVB1DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 8, '2025-07-27 12:23:47', '2025-07-27 12:23:47'),
(17, 'Circe', 'Madeline Miller', '9786020628950', 'http://books.google.com/books/content?id=GrGdDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 14, '2025-07-27 12:23:48', '2025-07-27 12:23:48'),
(18, 'The Midnight Library', 'Matt Haig', '9781786892713', 'http://books.google.com/books/content?id=M53SDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 9, '2025-07-27 12:23:49', '2025-07-27 12:23:49'),
(19, 'Eleanor Oliphant Is Completely Fine', 'Gail Honeyman', '9781432847685', 'http://books.google.com/books/content?id=56aFswEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 18, 6, 24, '2025-07-27 12:23:51', '2025-07-27 12:23:51'),
(20, 'A Man Called Ove', 'Fredrik Backman', '9781668010815', 'http://books.google.com/books/content?id=b2CZEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 1, '2025-07-27 12:23:52', '2025-07-27 12:23:52'),
(21, 'Verity', 'Colleen Hoover', '9781408726617', 'http://books.google.com/books/content?id=COdSEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 24, '2025-07-27 12:23:53', '2025-07-31 10:17:55'),
(22, 'It Ends With Us', 'Colleen Hoover', '9781471156274', 'http://books.google.com/books/content?id=KmbkCgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 8, '2025-07-27 12:23:55', '2025-07-27 12:23:55'),
(24, 'Before We Were Strangers', 'Renée Carlino', '9781501105777', 'http://books.google.com/books/content?id=FMAvBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 4, '2025-07-27 12:23:58', '2025-07-27 12:23:58'),
(25, 'The Silent Patient', 'Alex Michaelides', '9781409181644', 'http://books.google.com/books/content?id=a6NnDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 18, 6, 1, '2025-07-27 12:23:59', '2025-07-27 12:23:59'),
(54, 'The Bourne Identity', 'Robert Ludlum', '9781408221082', 'http://books.google.com/books/content?id=KYaERAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 1, 6, 20, '2025-07-27 12:29:59', '2025-07-27 12:29:59'),
(55, 'The Hunt for Red October', 'Tom Clancy', '9781101010365', 'http://books.google.com/books/content?id=xz2LhK79I3gC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 9, '2025-07-27 12:30:00', '2025-07-27 12:30:00'),
(56, 'The Da Vinci Code (Republish)', 'Dan Brown', '9786022911845', 'http://books.google.com/books/content?id=6-pmDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 2, '2025-07-27 12:30:01', '2025-07-27 12:30:01'),
(57, 'Angels & Demons', 'Dan Brown', '9781982122362', 'http://books.google.com/books/content?id=Rzi6DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 20, '2025-07-27 12:30:02', '2025-07-27 12:30:02'),
(58, 'The Girl with the Dragon Tattoo', 'Stieg Larsson', '9780307949493', 'http://books.google.com/books/content?id=KL-wtQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 1, 6, 1, '2025-07-27 12:30:03', '2025-07-27 12:30:03'),
(59, 'Killing Floor', 'Lee Child', '9781409084815', 'http://books.google.com/books/content?id=bmn-azxohRoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 15, '2025-07-27 12:30:03', '2025-07-27 12:30:03'),
(60, 'The Maze Runner', 'James Dashner', '9781908435484', 'http://books.google.com/books/content?id=yo5GBAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 24, '2025-07-27 12:30:06', '2025-07-27 12:30:06'),
(61, 'Catching Fire (Hunger Games, Book Two)', 'Suzanne Collins', '9780545227247', 'http://books.google.com/books/content?id=FN5wMOZKTYMC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 3, '2025-07-27 12:30:09', '2025-07-27 12:30:09'),
(62, 'Mockingjay (Hunger Games, Book Three)', 'Suzanne Collins', '9780545317801', 'http://books.google.com/books/content?id=Iw_gHtk4ghYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 1, '2025-07-27 12:30:10', '2025-07-27 12:30:10'),
(63, 'Divergent', 'Veronica Roth', '9780062077011', 'http://books.google.com/books/content?id=nv9lZM_0RI4C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 18, '2025-07-27 12:30:11', '2025-07-27 12:30:11'),
(64, 'Insurgent (Divergent Trilogy, Book 2)', 'Veronica Roth', '9780007537129', 'http://books.google.com/books/content?id=yYAlAAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 17, '2025-07-27 12:30:12', '2025-07-27 12:30:12'),
(65, 'Divergent (3) - Allegiant', 'Veronica Roth', '9780008167165', 'http://books.google.com/books/content?id=UC0pjgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 1, 6, 12, '2025-07-27 12:30:13', '2025-07-27 12:30:13'),
(66, 'I Am Number Four: The Lost Files: Six\'s Legacy', 'Pittacus Lore', '9780241959473', 'http://books.google.com/books/content?id=l_rQqbnrXQoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 2, '2025-07-27 12:30:13', '2025-07-27 12:30:13'),
(67, 'The 5th Wave', 'Rick Yancey', '9780606366403', 'http://books.google.com/books/content?id=6HrQrQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 1, 6, 24, '2025-07-27 12:30:15', '2025-07-27 12:30:15'),
(68, 'Red Queen', 'Victoria Aveyard', '9781409150732', 'http://books.google.com/books/content?id=EPO9BQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 11, '2025-07-27 12:30:15', '2025-07-27 12:30:15'),
(69, 'Prodigy', 'Marie Lu', '9789794338063', 'http://books.google.com/books/content?id=ElRlAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 19, '2025-07-27 12:30:17', '2025-07-27 12:30:17'),
(70, 'The Change Champion\'s Field Guide', 'Louis Carter, Roland L. Sullivan, Marshall Goldsmith, Dave Ulrich, Norm Smallwood', '9781118136263', 'http://books.google.com/books/content?id=1bUzAQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 15, '2025-07-27 12:30:18', '2025-07-27 12:30:18'),
(71, 'Steelheart', 'Brandon Sanderson', '9780449818398', 'http://books.google.com/books/content?id=gkcKun43kYYC&printsec=frontcover&img=1&zoom=1&source=gbs_api', 1, 6, 17, '2025-07-27 12:30:20', '2025-07-27 12:30:20'),
(72, 'Firefight', 'Brandon Sanderson', '9783641165826', 'http://books.google.com/books/content?id=iZxpCQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 16, '2025-07-27 12:30:20', '2025-07-27 12:30:20'),
(73, 'Interpretations of Calamity', 'K. Hewitt', '9781000698206', 'http://books.google.com/books/content?id=vMyxDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 5, '2025-07-27 12:30:21', '2025-07-27 12:30:21'),
(74, 'The Eye of the World', 'Robert Jordan', '9780356501529', 'http://books.google.com/books/content?id=1nUWywAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 1, 6, 12, '2025-07-27 12:30:23', '2025-07-27 12:30:23'),
(75, 'The Dark Tower I', 'Stephen King', '9781501143519', 'http://books.google.com/books/content?id=uagODAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 16, '2025-07-27 12:30:23', '2025-07-27 12:30:23'),
(76, 'Ender\'s Game', 'Orson Scott Card', '9781663628770', 'http://books.google.com/books/content?id=HoN2zQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 1, 6, 22, '2025-07-27 12:30:24', '2025-07-27 12:30:24'),
(77, 'Ready Player One', 'Ernest Cline', '9781446493830', 'http://books.google.com/books/content?id=8qs1-ypf7e0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 1, '2025-07-27 12:30:25', '2025-07-27 12:30:25'),
(78, 'Artemis to Actaeon; and Other Verses', 'Edith Wharton', '9783387032659', 'http://books.google.com/books/content?id=sI_VEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 1, '2025-07-27 12:30:26', '2025-07-27 12:30:26'),
(79, 'Reamde', 'Neal Stephenson', '9780857894182', 'http://books.google.com/books/content?id=wt5CNyJ_BaYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 7, '2025-07-27 12:30:26', '2025-07-27 12:30:26'),
(80, 'The Terminal List', 'Jack Carr', '9781982197346', 'http://books.google.com/books/content?id=qGVwEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 1, 6, 21, '2025-07-27 12:30:27', '2025-07-27 12:30:27'),
(81, 'Watchmen (2019 Edition)', 'Alan Moore', '9781779501837', 'http://books.google.com/books/content?id=EOObDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 17, '2025-07-27 12:32:27', '2025-07-27 12:32:27'),
(82, 'V for Vendetta as Cultural Pastiche', 'James R. Keller', '9781476604978', 'http://books.google.com/books/content?id=mnKNAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 9, '2025-07-27 12:32:29', '2025-07-27 12:32:29'),
(83, 'Batman: The Killing Joke Deluxe (New Edition)', 'Alan Moore, Brian Bolland, Mark Waid, John Higgins', '9781401294069', 'http://books.google.com/books/content?id=WtmuDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 12, '2025-07-27 12:32:30', '2025-07-27 12:32:30'),
(84, 'Batman', 'Frank Miller, Klaus Janson, Lynn Varley', '9780907610908', 'http://books.google.com/books/content?id=1PyjPwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 10, 6, 12, '2025-07-27 12:32:31', '2025-07-27 12:32:31'),
(85, 'Blue', 'Jeph Loeb', '9780785134466', 'http://books.google.com/books/content?id=COdbNwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 10, 6, 6, '2025-07-27 12:32:33', '2025-07-27 12:32:33'),
(86, 'X-Men', 'Chris Claremont', '9780785180012', 'http://books.google.com/books/content?id=mgs8cGBVq7QC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 16, '2025-07-27 12:32:34', '2025-07-27 12:32:34'),
(87, 'Battle Cry of Freedom', 'James M. McPherson', '9780195038637', 'http://books.google.com/books/content?id=a3nX48n4oeIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 6, '2025-07-27 12:32:36', '2025-07-27 12:32:36'),
(88, 'Infinity Gauntlet', 'Jim Starlin', '9780785170655', 'http://books.google.com/books/content?id=i6DxBJEkj5QC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 12, '2025-07-27 12:32:36', '2025-07-27 12:32:36'),
(89, 'Sandman Vol. 1: Preludes & Nocturnes 30th Anniversary Edition', 'Neil Gaiman', '9781401293949', 'http://books.google.com/books/content?id=ed11DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 20, '2025-07-27 12:32:38', '2025-07-27 12:32:38'),
(90, 'Saga Vol. 1', 'Brian K. Vaughan', '9781607067238', 'http://books.google.com/books/content?id=PbMWAgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 12, '2025-07-27 12:32:39', '2025-07-27 12:32:39'),
(91, 'Y: The Last Man Book One', 'Brian K. Vaughan', '9781401255619', 'http://books.google.com/books/content?id=5BA-BAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 15, '2025-07-27 12:32:40', '2025-07-27 12:32:40'),
(92, 'Out from Boneville', 'Jeff Smith', '9781417657803', 'http://books.google.com/books/content?id=pRaMAAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 10, 6, 3, '2025-07-27 12:32:42', '2025-07-27 12:32:42'),
(93, 'Persepolis', 'Marjane Satrapi', '9781473547421', 'http://books.google.com/books/content?id=g0s_DAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 13, '2025-07-27 12:32:44', '2025-07-27 12:32:44'),
(94, 'Maus II: A Survivor\'s Tale', 'Art Spiegelman', '9780679729778', 'http://books.google.com/books/content?id=NAK0KEGmqx0C&printsec=frontcover&img=1&zoom=1&source=gbs_api', 10, 6, 5, '2025-07-27 12:32:44', '2025-07-27 12:32:44'),
(95, 'Scott Pilgrim’s Precious Little Life: Volume 1 (Scott Pilgrim, Book 1)', 'Bryan Lee O’Malley', '9780007362998', 'http://books.google.com/books/content?id=2WBgVbzwZPMC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 4, '2025-07-27 12:32:45', '2025-07-27 12:32:45'),
(96, 'The Umbrella Academy Library Edition Volume 1: Apocalypse Suite', 'Gerard Way', '9781506715476', 'http://books.google.com/books/content?id=3r-rDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 8, '2025-07-27 12:32:46', '2025-07-27 12:32:46'),
(97, 'Black Holes', 'Derek J. Raine, Edwin George Thomas', '9781848163829', 'http://books.google.com/books/content?id=O3puAMw5U3UC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 18, '2025-07-27 12:32:47', '2025-07-27 12:32:47'),
(98, 'Frank Miller’s Sin City Volume 1: The Hard Goodbye 3rd Edition', 'Frank Miller', '9781593072933', NULL, 10, 6, 9, '2025-07-27 12:32:49', '2025-07-27 12:32:49'),
(99, 'Early Buddhist Architecture in Context', 'Akira Shimada', '9789004233263', 'http://books.google.com/books/content?id=pfUyAQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 10, '2025-07-27 12:32:51', '2025-07-27 12:32:51'),
(100, 'Kick-Ass 1, Band 1', 'Mark Millar', '9783957833006', 'http://books.google.com/books/content?id=MGB3DwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 10, 6, 25, '2025-07-27 12:32:54', '2025-07-27 12:32:54'),
(101, 'Batman: Year One (DC Black Label Edition)', 'FRANK. MILLER', '9781401291228', 'http://books.google.com/books/content?id=diDqvgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 10, 6, 19, '2025-07-27 12:32:55', '2025-07-27 12:32:55'),
(102, 'The Walking Dead Vol. 1', 'Robert Kirkman', '9781607065333', 'http://books.google.com/books/content?id=16aKYHVF7_cC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 5, '2025-07-27 12:32:57', '2025-07-27 12:32:57'),
(103, 'Ms. Marvel', 'G. Willow Wilson', '9780606388702', 'http://books.google.com/books/content?id=d_nzjwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 10, 6, 23, '2025-07-27 12:32:58', '2025-07-27 12:32:58'),
(104, 'Hawkeye Vol. 1', 'Matt Fraction', '9781302367749', 'http://books.google.com/books/content?id=Slfa87-x0S8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 2, '2025-07-27 12:33:00', '2025-07-27 12:33:00'),
(105, 'Batman: Hush 20th Anniversary Edition', 'Jeph Loeb', '9781779519153', 'http://books.google.com/books/content?id=P2GMEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 10, 6, 9, '2025-07-27 12:33:01', '2025-07-27 12:33:01'),
(106, 'All Star Superman: The Deluxe Edition', 'Grant Morrison', '9781779513441', 'http://books.google.com/books/content?id=HNmQEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 10, 6, 1, '2025-07-27 12:33:03', '2025-07-30 08:59:57'),
(107, 'Superman: Red Son (New Edition)', 'Mark Millar', '9781401294618', 'http://books.google.com/books/content?id=LZpPwwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 10, 6, 11, '2025-07-27 12:33:04', '2025-07-27 12:33:04'),
(108, 'Sapiens', 'Yuval Noah Harari', '9780062316103', 'http://books.google.com/books/content?id=FmyBAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 14, '2025-08-05 03:54:38', '2025-08-05 03:54:38'),
(109, 'A Brief History of Time', 'Stephen Hawking, Carl Sagan', '9780553346145', 'http://books.google.com/books/content?id=A9nWaIpeXhkC&printsec=frontcover&img=1&zoom=1&source=gbs_api', 14, 6, 3, '2025-08-05 03:54:40', '2025-08-05 03:54:40'),
(110, 'Thinking, Fast and Slow', 'Daniel Kahneman', '9780141918921', 'http://books.google.com/books/content?id=oV1tXT3HigoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 22, '2025-08-05 03:54:42', '2025-08-05 03:54:42'),
(111, 'The Selfish Gene', 'Richard Dawkins', '9780191537554', 'http://books.google.com/books/content?id=EJeHTt8hW7UC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 8, '2025-08-05 03:54:43', '2025-08-05 03:54:43'),
(112, 'Guns, Germs and Steel', 'Jared Diamond', '9781448180202', 'http://books.google.com/books/content?id=_BrB7kg19RgC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 24, '2025-08-05 03:54:44', '2025-08-05 03:54:44'),
(113, 'The Republic', 'Plato', '9781365362552', 'http://books.google.com/books/content?id=17juDAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 18, '2025-08-05 03:54:48', '2025-08-05 03:54:48'),
(114, 'The Art of War', 'Sun Tzu', '9780486425573', 'http://books.google.com/books/content?id=UTGnopblxt8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 11, '2025-08-05 03:54:52', '2025-08-05 03:54:52'),
(115, 'Man\'s Search For Meaning', 'Viktor E. Frankl', '9780671023379', 'http://books.google.com/books/content?id=W3q8R4dRZTwC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 8, '2025-08-05 03:54:53', '2025-08-05 03:54:53'),
(116, 'The Gene', 'Siddhartha Mukherjee', '9789386057051', 'http://books.google.com/books/content?id=A8syDAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 23, '2025-08-05 03:54:53', '2025-08-05 03:54:53'),
(117, 'The Immortal Life of Henrietta Lacks', 'Rebecca Skloot', '9781529014679', 'http://books.google.com/books/content?id=tzlqDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 7, '2025-08-05 03:54:54', '2025-08-05 03:54:54'),
(118, 'A People\'s History of the United States', 'Howard Zinn', '9780062466679', 'http://books.google.com/books/content?id=KBueCgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 4, '2025-08-05 03:54:55', '2025-08-05 03:54:55'),
(119, 'Outliers', 'Malcolm Gladwell', '9780141903491', 'http://books.google.com/books/content?id=ialrgIT41OAC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 22, '2025-08-05 03:54:56', '2025-08-05 03:54:56'),
(120, 'The Power of Habit', 'Charles Duhigg', '9780812981605', 'http://books.google.com/books/content?id=syiPEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 14, 6, 18, '2025-08-05 03:55:01', '2025-08-05 03:55:01'),
(121, 'Freakonomics', 'Steven D. Levitt, Stephen J. Dubner', '9780141928739', 'http://books.google.com/books/content?id=kxsQhM4D8uIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 3, '2025-08-05 03:55:02', '2025-08-05 03:55:02'),
(122, 'Why Nations Fail', 'Daron Acemoglu, James A. Robinson', '9781847654618', 'http://books.google.com/books/content?id=PLlOCUIAh88C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 20, '2025-08-05 03:55:04', '2025-08-05 03:55:04'),
(123, 'The Sixth Extinction', 'Elizabeth Kolbert', '9781408851210', 'http://books.google.com/books/content?id=wlnCAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 5, '2025-08-05 03:55:05', '2025-08-05 03:55:05'),
(124, 'Quiet', 'Susan Cain', '9780141970172', 'http://books.google.com/books/content?id=O6gZJa9kdlYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 15, '2025-08-05 03:55:05', '2025-08-05 03:55:05'),
(125, 'The Man Who Mistook His Wife For A Hat: And Other Clinical Tales', 'Oliver Sacks', '9780684853949', 'http://books.google.com/books/content?id=nc2dE9swe0sC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 9, '2025-08-05 03:55:06', '2025-08-05 03:55:06'),
(126, 'Grit (HBR Emotional Intelligence Series)', 'Harvard Business Review, Angela L. Duckworth, Misty Copeland, Shannon Huffman Polson, Tomas Chamorro-Premuzic', '9781647825621', 'http://books.google.com/books/content?id=Xh2rEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 13, '2025-08-05 03:55:07', '2025-08-05 03:55:07'),
(127, 'The Emperor of All Maladies', 'Siddhartha Mukherjee', '9781439181713', 'http://books.google.com/books/content?id=qT-5MLRkHBAC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 19, '2025-08-05 03:55:08', '2025-08-05 03:55:08'),
(128, 'The Road to Serfdom', 'Friedrich A. Von Hayek', '9781500345600', 'http://books.google.com/books/content?id=KCKCoAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 14, 6, 6, '2025-08-05 03:55:10', '2025-08-05 03:55:10'),
(129, 'How to Read a Book', 'Mortimer J. Adler, Charles Van Doren', '9781439144831', 'http://books.google.com/books/content?id=Z5PpkQadm5EC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 10, '2025-08-05 03:55:13', '2025-08-05 03:55:13'),
(130, 'The Double Helix', 'James D. Watson', '9780743219174', 'http://books.google.com/books/content?id=CESjmRQtfrUC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 10, '2025-08-05 03:55:15', '2025-08-05 03:55:15'),
(131, 'Thinking in Systems', 'Donella H. Meadows', '9781603580557', 'http://books.google.com/books/content?id=CpbLAgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 14, 6, 6, '2025-08-05 03:55:16', '2025-08-05 03:55:16'),
(132, 'Dracula', 'Bram Stoker', '9780439154116', 'http://books.google.com/books/content?id=08XecYXjw4IC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 18, '2025-08-19 09:40:52', '2025-08-19 09:40:52'),
(133, 'Frankenstein - Third Edition', 'Mary Shelley', '9781770483408', 'http://books.google.com/books/content?id=UQc52fOn3hUC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 23, '2025-08-19 09:40:53', '2025-08-19 09:40:53'),
(134, 'The Haunting of Hill House', 'Shirley Jackson', '9781479419449', 'http://books.google.com/books/content?id=LIJuDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 12, '2025-08-19 09:40:55', '2025-08-19 09:40:55'),
(135, 'The Exorcist', 'William Peter Blatty', '9780552156882', 'http://books.google.com/books/content?id=b1JMJphpm68C&printsec=frontcover&img=1&zoom=1&source=gbs_api', 22, 6, 24, '2025-08-19 09:40:55', '2025-08-19 09:40:55'),
(136, 'Pet Sematary', 'Stephen King', '9781848940857', 'http://books.google.com/books/content?id=A_v0eErRicIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 5, '2025-08-19 09:40:56', '2025-08-19 09:40:56'),
(137, 'The Shining', 'Stephen King', '9798217007691', 'http://books.google.com/books/content?id=QABREQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 5, '2025-08-19 09:40:57', '2025-08-19 09:40:57'),
(138, 'As You Like It', 'William Shakespeare', '9780521294126', 'http://books.google.com/books/content?id=5awT8bHsVuoC&printsec=frontcover&img=1&zoom=1&source=gbs_api', 22, 6, 14, '2025-08-19 09:40:58', '2025-08-19 09:40:58'),
(139, 'Carrie', 'Stephen King', '9780671039738', 'http://books.google.com/books/content?id=gm1_ZjzjEboC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 10, '2025-08-19 09:40:58', '2025-08-19 09:40:58'),
(140, '\'Salem\'s Lot', 'Stephen King', '9781848940819', 'http://books.google.com/books/content?id=7_4NgDQhtDYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 10, '2025-08-19 09:40:59', '2025-08-19 09:40:59'),
(141, 'Misery', 'Stephen King', '9780451169525', 'http://books.google.com/books/content?id=0ovrrHwi2JMC&printsec=frontcover&img=1&zoom=1&source=gbs_api', 22, 6, 20, '2025-08-19 09:41:00', '2025-08-19 09:41:00'),
(142, 'Hell House', 'Richard Matheson', '9781399605571', 'http://books.google.com/books/content?id=2gJnEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 18, '2025-08-19 09:41:00', '2025-08-19 09:41:00'),
(143, 'I Am Legend', 'Richard Matheson', '9781250242754', 'http://books.google.com/books/content?id=qCmmvwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 22, 6, 19, '2025-08-19 09:41:02', '2025-08-19 09:41:02'),
(144, 'Psycho', 'Robert Bloch', '9781471914447', 'http://books.google.com/books/content?id=vEXhAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 9, '2025-08-19 09:41:02', '2025-08-19 09:41:02'),
(145, 'The Silence of the Lambs', 'Thomas Harris', '9780749309428', 'http://books.google.com/books/content?id=WaWTGyEalqQC&printsec=frontcover&img=1&zoom=1&source=gbs_api', 22, 6, 23, '2025-08-19 09:41:04', '2025-08-19 09:41:04'),
(146, 'The Amityville Horror', 'Jay Anson', '9781416507697', 'http://books.google.com/books/content?id=NGADV7J25ggC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 4, '2025-08-19 09:41:05', '2025-08-19 09:41:05'),
(147, 'Something Wicked This Way Comes', 'Ray Bradbury', '9781473212046', 'http://books.google.com/books/content?id=TNTEoQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 22, 6, 23, '2025-08-19 09:41:05', '2025-08-19 09:41:05'),
(148, 'The Hellbound Heart', 'Clive Barker', '9780007382934', 'http://books.google.com/books/content?id=Vv4BT7UPe64C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 20, '2025-08-19 09:41:08', '2025-08-19 09:41:08'),
(149, 'Books of Blood Volume 1', 'Clive Barker', '9780751564020', 'http://books.google.com/books/content?id=_jY9CgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 19, '2025-08-19 09:41:08', '2025-08-19 09:41:08'),
(150, 'The Troop', 'Nick Cutter', '9781476717722', 'http://books.google.com/books/content?id=5xgHBAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 4, '2025-08-19 09:41:10', '2025-08-19 09:41:10'),
(151, 'The Ritual Process', 'Victor Turner, Roger Abrahams, Alfred Harris', '9781351474917', 'http://books.google.com/books/content?id=VywrDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 8, '2025-08-19 09:41:11', '2025-08-19 09:41:11'),
(152, 'Mexican Gothic', 'Silvia Moreno-Garcia', '9781432885380', 'http://books.google.com/books/content?id=Nwf1zQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 22, 6, 25, '2025-08-19 09:41:12', '2025-08-19 09:41:12'),
(153, 'Chilika', 'Soumen Ray', '9789350026236', 'http://books.google.com/books/content?id=p0w1zgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 22, 6, 11, '2025-08-19 09:41:13', '2025-08-19 09:41:13'),
(154, 'The Only Good Indians', 'Stephen Graham Jones', '9781982136468', 'http://books.google.com/books/content?id=aWsREAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 23, '2025-08-19 09:41:14', '2025-08-19 09:41:14'),
(155, 'Bird Box', 'Josh Malerman', '9780008319748', 'http://books.google.com/books/content?id=7CjxuQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 22, 6, 18, '2025-08-19 09:41:14', '2025-08-19 09:41:14'),
(156, 'House Of Leaves', 'Mark Z. Danielewski', '9781529943993', 'http://books.google.com/books/content?id=nqmq0AEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 22, 6, 6, '2025-08-19 09:41:16', '2025-08-19 09:41:16'),
(157, 'India\'s Most Haunted', 'K. Hari Kumar', '9789353573560', 'http://books.google.com/books/content?id=HlqwDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 8, '2025-08-19 09:41:17', '2025-08-19 09:41:17'),
(158, 'The Cabin at the End of the World', 'Paul Tremblay', '9780062679123', 'http://books.google.com/books/content?id=two3DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 24, '2025-08-19 09:41:17', '2025-08-19 09:41:17'),
(159, 'We Have Always Lived in the Castle', 'Shirley Jackson', '9780141927558', 'http://books.google.com/books/content?id=Z1mO-BwTiPIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 22, 6, 25, '2025-08-19 09:41:18', '2025-08-19 09:41:18'),
(160, 'The Book Thief', 'Marilyn Herbert', '9781897082584', NULL, 18, 6, 22, '2025-08-19 17:58:32', '2025-08-19 17:59:01'),
(190, 'Angels & Demons', 'Dan Brown', '9781416528654', 'http://books.google.com/books/content?id=N_2gqkJhnX0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 9, '2025-09-16 09:36:10', '2025-09-16 09:36:10'),
(191, 'INFERNO', 'DAN BROWN', '9789386175250', 'http://books.google.com/books/content?id=orEnDQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 6, '2025-09-16 09:36:10', '2025-09-16 09:36:10'),
(192, 'On the Origin of Species', 'Charles Darwin', '9780141931821', 'http://books.google.com/books/content?id=e3hwBxBTh24C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 5, '2025-09-16 09:36:11', '2025-09-16 09:36:11'),
(193, 'DIGITAL FORTRESS', 'DAN BROWN', '9789386454171', 'http://books.google.com/books/content?id=Y2c8DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 5, '2025-09-16 09:36:13', '2025-09-16 09:36:13'),
(194, 'The Bourne Supremacy', 'Robert Ludlum', '9781409121978', 'http://books.google.com/books/content?id=6EE-qFfmQu4C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 13, '2025-09-16 09:36:15', '2025-09-16 09:36:15'),
(195, 'The Bourne Ultimatum', 'Robert Ludlum', '9781409121985', 'http://books.google.com/books/content?id=ekmpjsu25poC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 16, '2025-09-16 09:36:15', '2025-09-16 09:36:15'),
(196, 'The Silence of the White City', 'Eva García Sáenz', '9781984898609', 'http://books.google.com/books/content?id=hjbGDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 10, '2025-09-16 09:36:16', '2025-09-16 09:36:16'),
(197, 'The Reversal', 'Michael Connelly', '9781409134084', 'http://books.google.com/books/content?id=dzUacLzXz2cC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 18, '2025-09-16 09:36:18', '2025-09-16 09:36:18'),
(198, 'The Lincoln Lawyer', 'Michael Connelly', '9781409116769', 'http://books.google.com/books/content?id=gH3h8sfyzv0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 2, '2025-09-16 09:36:18', '2025-09-16 09:36:18'),
(199, 'The Brass Verdict', 'Michael Connelly', '9781409106760', 'http://books.google.com/books/content?id=0X3SyDIT2bgC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 13, '2025-09-16 09:36:20', '2025-09-16 09:36:20'),
(200, 'Along Came a Spider', 'James Patterson', '9780007432325', 'http://books.google.com/books/content?id=y6A8YgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 48, 6, 12, '2025-09-16 09:36:21', '2025-09-16 09:36:21'),
(201, 'Kiss the Girls', 'James Patterson', '9781473539358', 'http://books.google.com/books/content?id=HUCgDQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 14, '2025-09-16 09:36:23', '2025-09-16 09:36:23'),
(202, 'The Girl Who Played with Fire', 'Stieg Larsson', '9780143198376', 'http://books.google.com/books/content?id=CreMEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 48, 6, 9, '2025-09-16 09:36:25', '2025-09-16 09:36:25'),
(203, 'The Snowman', 'Michael Morpurgo', '9780241352427', 'http://books.google.com/books/content?id=U_tQDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 22, '2025-09-16 09:36:28', '2025-09-16 09:36:28'),
(204, 'The Phantom of the Opera', 'Gaston Leroux', '9781904633792', 'http://books.google.com/books/content?id=jJoOC6HP7DMC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 9, '2025-09-16 09:36:29', '2025-09-16 09:36:29'),
(205, 'Knife Making', 'Dallin Fardons', '9791222457987', 'http://books.google.com/books/content?id=ajbcEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 13, '2025-09-16 09:36:31', '2025-09-16 09:36:31'),
(206, 'The Sinner', 'Kathleen O\'Brien', '9781426883552', 'http://books.google.com/books/content?id=sLTMYkFv7zEC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 23, '2025-09-16 09:36:35', '2025-09-16 09:36:35'),
(207, 'Vanished', 'Danielle Steel', '9780385306034', 'http://books.google.com/books/content?id=p2n3t0h-H7IC&printsec=frontcover&img=1&zoom=1&source=gbs_api', 48, 6, 3, '2025-09-16 09:36:35', '2025-09-16 09:36:35'),
(208, 'The Couple Next Door', 'Shari Lapena', '9781473541542', 'http://books.google.com/books/content?id=s744CwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 13, '2025-09-16 09:36:37', '2025-09-16 09:36:37'),
(209, 'A Stranger in the House', 'Kate William, Francine Pascal', '9780553503654', NULL, 48, 6, 18, '2025-09-16 09:36:37', '2025-09-16 09:36:37'),
(210, 'Not a Happy Family', 'Shari Lapena', '9780385700351', 'http://books.google.com/books/content?id=Z-geEQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 9, '2025-09-16 09:36:39', '2025-09-16 09:36:39'),
(211, 'The Last Mrs Parrish', 'Liv Constantine', '9780008272944', 'http://books.google.com/books/content?id=zt8sDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 18, '2025-09-16 09:36:40', '2025-09-16 09:36:40'),
(212, 'The Wife Between Us', 'Greer Hendricks, Sarah Pekkanen', '9781432847371', 'http://books.google.com/books/content?id=_jLktAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 48, 6, 22, '2025-09-16 09:36:41', '2025-09-16 09:36:41'),
(213, 'Behind Closed Doors', 'B. A. Paris', '9781489210470', 'http://books.google.com/books/content?id=RRWnDAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 48, 6, 18, '2025-09-16 09:36:42', '2025-09-16 09:36:42'),
(214, 'Breakdown', 'B. A. Paris', '9781510058330', 'http://books.google.com/books/content?id=8qN50AEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 48, 6, 4, '2025-09-16 09:36:44', '2025-09-16 09:36:44'),
(215, 'Lock Every Door', 'Riley Sager', '9781473568051', 'http://books.google.com/books/content?id=XQh1DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 4, '2025-09-16 09:36:44', '2025-09-16 09:36:44'),
(216, 'Home Before Dark', 'Riley Sager', '9781524745196', 'http://books.google.com/books/content?id=AraPEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 48, 6, 6, '2025-09-16 09:36:45', '2025-09-16 09:36:45'),
(218, 'Survive The Night', 'Anderson', '9781088174104', NULL, 48, 6, 9, '2025-09-16 09:36:47', '2025-09-16 09:36:47'),
(220, 'Final Girls, Feminism and Popular Culture', 'Katarzyna Paszkiewicz, Stacy Rusnak', '9783030315238', NULL, 48, 6, 23, '2025-11-05 15:22:27', '2025-11-05 15:22:27');

-- --------------------------------------------------------

--
-- Table structure for table `book_types`
--

CREATE TABLE `book_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_types`
--

INSERT INTO `book_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Action', NULL, NULL),
(2, 'Adventure', NULL, NULL),
(3, 'Anthology', NULL, NULL),
(4, 'Art', NULL, NULL),
(5, 'Autobiography', NULL, NULL),
(6, 'Biography', NULL, NULL),
(7, 'Business', NULL, NULL),
(8, 'Children\'s', NULL, NULL),
(9, 'Classic', NULL, NULL),
(10, 'Comics', NULL, NULL),
(11, 'Cookbook', NULL, NULL),
(12, 'Crime', NULL, NULL),
(13, 'Drama', NULL, NULL),
(14, 'Education', NULL, NULL),
(15, 'Encyclopedia', NULL, NULL),
(16, 'Essay', NULL, NULL),
(17, 'Fantasy', NULL, NULL),
(18, 'Fiction', NULL, NULL),
(19, 'Guide', NULL, NULL),
(20, 'Health', NULL, NULL),
(21, 'History', NULL, NULL),
(22, 'Horror', NULL, NULL),
(23, 'Humor', NULL, NULL),
(24, 'Journal', NULL, NULL),
(25, 'Literature', NULL, NULL),
(26, 'Mathematics', NULL, NULL),
(27, 'Memoir', NULL, NULL),
(28, 'Motivational', NULL, NULL),
(29, 'Mystery', NULL, NULL),
(30, 'Mythology', NULL, NULL),
(31, 'Non-Fiction', NULL, NULL),
(32, 'Philosophy', NULL, NULL),
(33, 'Poetry', NULL, NULL),
(34, 'Politics', NULL, NULL),
(35, 'Psychology', NULL, NULL),
(36, 'Reference', NULL, NULL),
(37, 'Religion', NULL, NULL),
(38, 'Romance', NULL, NULL),
(39, 'Satire', NULL, NULL),
(40, 'Science', NULL, NULL),
(41, 'Science Fiction', NULL, NULL),
(42, 'Self-help', NULL, NULL),
(43, 'Short Story', NULL, NULL),
(44, 'Spirituality', NULL, NULL),
(45, 'Sports', NULL, NULL),
(46, 'Technology', NULL, NULL),
(47, 'Textbook', NULL, NULL),
(48, 'Thriller', NULL, NULL),
(49, 'Travel', NULL, NULL),
(50, 'Young Adult', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-trending_books', 'a:15:{i:0;a:5:{s:4:\"isbn\";s:13:\"9780593158715\";s:5:\"title\";s:32:\"Atmosphere: A GMA Book Club Pick\";s:7:\"authors\";a:1:{i:0;s:19:\"Taylor Jenkins Reid\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=RqYtEQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:2330:\"GOOD MORNING AMERICA BOOK CLUB PICK • From the #1 New York Times bestselling author of The Seven Husbands of Evelyn Hugo and Daisy Jones & The Six comes an epic new novel set against the backdrop of the 1980s space shuttle program about the extraordinary lengths we go to live and love beyond our limits. The stunning hardcover of Atmosphere features beautiful endpapers and a premium dust jacket! “Thrilling . . . heartbreaking . . . uplifting . . . the fast-paced, emotionally charged story of one ambitious young woman, finding both her voice and her passion.”—Kristin Hannah, author of The Women “NASA? Space missions? The ’80s? This is a collection of all the things I love.”—Andy Weir, author of Project Hail Mary and The Martian Joan Goodwin has been obsessed with the stars for as long as she can remember. Thoughtful and reserved, Joan is content with her life as a professor of physics and astronomy at Rice University and as aunt to her precocious niece, Frances. That is, until she comes across an advertisement seeking the first women scientists to join NASA’s space shuttle program. Suddenly, Joan burns to be one of the few people to go to space. Selected from a pool of thousands of applicants in the summer of 1980, Joan begins training at Houston’s Johnson Space Center, alongside an exceptional group of fellow candidates: Top Gun pilot Hank Redmond and scientist John Griffin, who are kind and easygoing even when the stakes are highest; mission specialist Lydia Danes, who has worked too hard to play nice; warmhearted Donna Fitzgerald, who is navigating her own secrets; and Vanessa Ford, the magnetic and mysterious aeronautical engineer, who can fix any engine and fly any plane. As the new astronauts become unlikely friends and prepare for their first flights, Joan finds a passion and a love she never imagined. In this new light, Joan begins to question everything she thinks she knows about her place in the observable universe. Then, in December of 1984, on mission STS-LR9, it all changes in an instant. Fast-paced, thrilling, and emotional, Atmosphere is Taylor Jenkins Reid at her best: transporting readers to iconic times and places, creating complex protagonists, and telling a passionate and soaring story about the transformative power of love—this time among the stars.\";}i:1;a:5:{s:4:\"isbn\";s:13:\"9780593977057\";s:5:\"title\";s:40:\"Not Quite Dead Yet: A GMA Book Club Pick\";s:7:\"authors\";a:1:{i:0;s:13:\"Holly Jackson\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=JTBGEQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:1372:\"GOOD MORNING AMERICA BOOK CLUB PICK • The #1 New York Times bestselling author of A Good Girl’s Guide to Murder—now a hit Netflix series—returns with her first novel for adults: a twisty thriller about a young woman trying to solve her own murder. The stunning hardcover of Not Quite Dead features a custom-stamped case, beautiful endpapers, and a premium dust jacket! “This truly unique premise snowballs into a roller-coaster ride of page-turning suspense and knock-out twists!”—Freida McFadden, author of The Housemaid In seven days Jet Mason will be dead. Jet is the daughter of one of the wealthiest families in Woodstock, Vermont. Twenty-seven years old, she’s still waiting for her life to begin. I’ll do it later, she always says. She has time. Until Halloween night, when Jet is violently attacked by an unseen intruder. She suffers a catastrophic head injury. The doctor is certain that within a week, the injury will trigger a deadly aneurysm. Jet has never thought of herself as having enemies. But now she looks at everyone in a new light: her family, her former best friend turned sister-in-law, her ex-boyfriend. She has at most seven days, and as her condition deteriorates she has only her childhood friend Billy for help. But nevertheless, she’s absolutely determined to finally finish something: Jet is going to solve her own murder.\";}i:2;a:5:{s:4:\"isbn\";s:13:\"9780593832448\";s:5:\"title\";s:24:\"She Didn\'t See It Coming\";s:7:\"authors\";a:1:{i:0;s:12:\"Shari Lapena\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=CmgwEQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:1453:\"“Stunning. Fiendishly plotted with whiplash twists and turns — Shari Lapena is at the very top of her game here. [She Didn\'t See It Coming] might be my favorite yet!” —Lucy Foley, New York Times bestselling author of The Paris Apartment The new gripping novel from the New York Times bestselling author of The Couple Next Door When a beloved wife and mother disappears, a luxurious condo building transforms into a potential crime scene, and the investigation begins: can the detectives find her before it\'s too late? Bryden and Sam have it all: thriving careers, a smart apartment in a luxury condominium, supportive friends and a cherished daughter. The perfect life for the perfect couple. Then Sam receives a call at his office. Bryden – working from home that day – has failed to collect their daughter from daycare. Arriving home with their little girl, he finds his wife’s car in the underground garage. Upstairs in their apartment her laptop is open on the table, her cell phone nearby, her keys in their usual place in the hall. Except Bryden is nowhere to be seen. It’s as if she just walked out. How can she have disappeared from her own home? And did she even leave the building at all? With every minute that passes – and as questions swirl around their community – Bryden and Sam’s past seems a little less perfect, their condominium less safe, their friends, neighbors and relatives no longer quite so reliable . . .\";}i:3;a:5:{s:4:\"isbn\";s:13:\"9781464241765\";s:5:\"title\";s:30:\"The Deal (Collector\'s Edition)\";s:7:\"authors\";a:1:{i:0;s:12:\"Elle Kennedy\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=nTP_0AEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1239:\"This limited Collector\'s Edition printing will include a new hardcase design, printed edges, designed endpapers, and colored character art throughout of your fave OG hockey couple, Hannah and Garrett! ﻿She\'s about to make a deal with the college bad boy... Hannah Wells has finally found someone who turns her on. But while she might be confident in every other area of her life, she\'s carting around a full set of baggage when it comes to sex and seduction. If she wants to get her crush\'s attention, she\'ll have to step out of her comfort zone and make him take notice...even if it means tutoring the annoying, childish, cocky captain of the hockey team in exchange for a pretend date. ...and it\'s going to be oh so good. All Garrett Graham has ever wanted is to play professional hockey after graduation, but his plummeting GPA is threatening everything he\'s worked so hard for. If helping a sarcastic brunette make another guy jealous will help him secure his position on the team, he\'s all for it. But when one unexpected kiss leads to the wildest sex of both their lives, it doesn\'t take long for Garrett to realize that pretend isn\'t going to cut it. Now he just has to convince Hannah that the man she wants looks a lot like him.\";}i:4;a:5:{s:4:\"isbn\";s:13:\"9781668080979\";s:5:\"title\";s:15:\"You Belong Here\";s:7:\"authors\";a:1:{i:0;s:13:\"Megan Miranda\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=kNhpEQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:881:\"Memories fade, but on this campus, legacies are never forgotten…or forgiven. A new thriller from New York Times bestselling author Megan Miranda. Beckett Bowery never thought she’d return to Wyatt Valley, a picturesque college town in the Virginia mountains steeped in tradition. Her roots there were strong: Beckett’s parents taught at the college, and she never even imagined studying anywhere else—until a tragedy her senior year ended with two local men dead, and her roommate on the run, never to be seen again… For the last two decades, Beckett has done her best to keep her distance. Then her daughter, Delilah, secretly applies to Wyatt College and earns a full scholarship, and Beckett can only hope that her lingering fears are unfounded. But deep down she knows that Wyatt Valley has a long memory, and that the past isn’t the only dangerous thing in town…\";}i:5;a:5:{s:4:\"isbn\";s:13:\"9781982112820\";s:5:\"title\";s:10:\"My Friends\";s:7:\"authors\";a:1:{i:0;s:15:\"Fredrik Backman\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=SkM5EQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:586:\"Four teenagers form a deep friendship that offers them refuge from troubled home lives and inspires the creation of a mysterious painting. Twenty-five years later, Louisa, a young artist, inherits the artwork and sets out on a journey to uncover its origin. As she pieces together the story behind the painting and its creators--Joar, Ted, Ali, and the reclusive artist--Louisa discovers not only their lasting impact on one another but also how art and connection can change lives. Blending humor and emotional depth, Backman explores themes of friendship, healing, and self-discovery.\";}i:6;a:5:{s:4:\"isbn\";s:13:\"9781649377159\";s:5:\"title\";s:29:\"Onyx Storm (Standard Edition)\";s:7:\"authors\";a:1:{i:0;s:14:\"Rebecca Yarros\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=n9j9EAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:141:\"Get ready to fly or die in the breathtaking follow-up to Fourth Wing and Iron Flame from #1 New York Times bestselling author Rebecca Yarros.\";}i:7;a:5:{s:4:\"isbn\";s:13:\"9781668089330\";s:5:\"title\";s:12:\"Never Flinch\";s:7:\"authors\";a:1:{i:0;s:12:\"Stephen King\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=rSsyEQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1282:\"\"When the Buckeye City Police Department receives a disturbing letter from a person threatening to \'kill thirteen innocents and one guilty\' in \'an act of atonement for the needless death of an innocent man,\' Detective Izzy Jaynes has no idea what to think. Are fourteen citizens about to be slaughtered in an unhinged act of retribution? As the investigation unfolds, Izzy realizes that the letter writer is deadly serious, and she turns to her friend Holly Gibney for help. Meanwhile, controversial and outspoken women\'s rights activist Kate McKay is embarking on a multi-state lecture tour, drawing packed venues of both fans and detractors. Someone who vehemently opposes Kate\'s message of female empowerment is targeting her and disrupting her events. At first, no one is hurt, but the stalker is growing bolder, and Holly is hired to be Kate\'s bodyguard--a challenging task with a headstrong employer and a determined adversary driven by wrath and his belief in his own righteousness. Featuring a riveting cast of characters both old and new, including world-famous gospel singer Sista Bessie and an unforgettable villain addicted to murder, these twinned narratives converge in a chilling and spectacular conclusion--a feat of storytelling only Stephen King could pull off.\"--\";}i:8;a:5:{s:4:\"isbn\";s:13:\"9780316569934\";s:5:\"title\";s:19:\"The Hamptons Lawyer\";s:7:\"authors\";a:2:{i:0;s:15:\"James Patterson\";i:1;s:11:\"Mike Lupica\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=Lk__0AEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:554:\"Undefeated criminal defense attorney Jane Smith--known as the Hamptons Lawyer--never fails to make her case. The Hamptons on Long Island is known for its beautiful beaches, its luxury lifestyle--and its exclusive legal advice. When Jane Smith takes on a famous celebrity client, she\'s armed and ready: with brilliant arguments, hard evidence--and two Glocks. Yet she\'s chased down, shot at, and risks contempt of court. That\'s when mounting a legal defense turns into self-defense. Knowing every day in court could be her last, she\'s a survivor. For now.\";}i:9;a:5:{s:4:\"isbn\";s:13:\"9780593873922\";s:5:\"title\";s:20:\"Wrath of the Dragons\";s:7:\"authors\";a:1:{i:0;s:19:\"Olivia Rose Darling\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=wPoyEQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:1515:\"In the explosive sequel to the bestselling romantasy Fear the Flames, two fated lovers must unite against warring kingdoms to defend their home and crowns from those who wish to destroy them. Cayden Veles, renowned Demon Commander of Vareveth, overthrew the throne to save Elowen Atarah, the woman he searched for since childhood. Now he’s determined to fulfill his quest for revenge against her father, even if it means forcing the only person he’s ever wanted into a marriage of political convenience. Elowen Atarah has everything she thought she’d ever want. Finally reunited with her dragons, she now has an army to enact vengeance, but as events transpire, she begins contemplating if she wants more. As her father’s only living heir, the Imirath throne is her right and destiny. But fighting and winning a war will require trusting Cayden Veles, her partner in crime and now king to her queen; the man she both longs for and doubts, especially after opening her heart only to become a pawn in his game. Navigating the shifting allegiances amongst all the kingdoms of Ravaryn will require all their strategy and strength, with devastating and bloody attacks on one side and cutthroat diplomacy for alliances on the other. But Elowen and Cayden must find a way to stand strong within the power they’ve gained, or risk losing everything. Delving deeper into a vast and ever-changing world, Wrath of the Dragons will take you on a journey filled with epic battles and a tender, angsty love for the ages.\";}i:10;a:5:{s:4:\"isbn\";s:13:\"9781250899576\";s:5:\"title\";s:18:\"The Wedding People\";s:7:\"authors\";a:1:{i:0;s:13:\"Alison Espach\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=7tzYEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1283:\"A NEW YORK TIMES BESTSELLER A Today Show #ReadwithJenna Book Club Pick A propulsive and uncommonly wise novel about one unexpected wedding guest and the surprising people who help her start anew. It’s a beautiful day in Newport, Rhode Island, when Phoebe Stone arrives at the grand Cornwall Inn wearing a green dress and gold heels, not a bag in sight, alone. She\'s immediately mistaken by everyone in the lobby for one of the wedding people, but she’s actually the only guest at the Cornwall who isn’t here for the big event. Phoebe is here because she’s dreamed of coming for years—she hoped to shuck oysters and take sunset sails with her husband, only now she’s here without him, at rock bottom, and determined to have one last decadent splurge on herself. Meanwhile, the bride has accounted for every detail and every possible disaster the weekend might yield except for, well, Phoebe and Phoebe\'s plan—which makes it that much more surprising when the two women can’t stop confiding in each other. In turns absurdly funny and devastatingly tender, Alison Espach’s The Wedding People is ultimately an incredibly nuanced and resonant look at the winding paths we can take to places we never imagined—and the chance encounters it sometimes takes to reroute us.\";}i:11;a:5:{s:4:\"isbn\";s:13:\"9781668078181\";s:5:\"title\";s:14:\"Broken Country\";s:7:\"authors\";a:1:{i:0;s:17:\"Clare Leslie Hall\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=4VtMEQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:1458:\"“Stirring and mysterious…fires directly at the human heart and hits the mark.” —Delia Owens, New York Times bestselling author of Where the Crawdads Sing A love triangle unearths dangerous, deadly secrets from the past in this thrilling tale perfect for fans of The Paper Palace and Where the Crawdads Sing. “The farmer is dead. He is dead, and all anyone wants to know is who killed him.” Beth and her gentle, kind husband Frank are happily married, but their relationship relies on the past staying buried. But when Beth’s brother-in-law shoots a dog going after their sheep, Beth doesn’t realize that the gunshot will alter the course of their lives. For the dog belonged to none other than Gabriel Wolfe, the man Beth loved as a teenager—the man who broke her heart years ago. Gabriel has returned to the village with his young son Leo, a boy who reminds Beth very much of her own son, who died in a tragic accident. As Beth is pulled back into Gabriel’s life, tensions around the village rise and dangerous secrets and jealousies from the past resurface, this time with deadly consequences. Beth is forced to make a choice between the woman she once was, and the woman she has become. A sweeping love story with the pace and twists of a thriller, Broken Country is a novel of simmering passion, impossible choices, and explosive consequences that toggles between the past and present to explore the far-reaching legacy of first love.\";}i:12;a:5:{s:4:\"isbn\";s:13:\"9780063384217\";s:5:\"title\";s:13:\"An Inside Job\";s:7:\"authors\";a:1:{i:0;s:12:\"Daniel Silva\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=S8zw0AEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:618:\"#1 New York Times bestselling author Daniel Silva delivers another action-packed tale of high stakes international intrigue. Master novelist Daniel Silva has thrilled readers with twenty-four thoughtful and gripping spy novels featuring the \"much-loved Gabriel Allon\" (Booklist) and ingenious plots that have taken him around the globe and back--from the United States to Europe, Russia to the Middle East. Now, Silva returns with another blockbuster thriller, a powerhouse novel showcasing his superb skill and brilliant imagination that is a must read for both his multitudes of fans and growing legions of converts.\";}i:13;a:5:{s:4:\"isbn\";s:13:\"9781250333988\";s:5:\"title\";s:24:\"The Enchanted Greenhouse\";s:7:\"authors\";a:1:{i:0;s:16:\"Sarah Beth Durst\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=MCIZEQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1634:\"EXCLUSIVE DELUXE EDITION—a gorgeous hardcover edition featuring beautiful blue sprayed edges! New York Times bestselling author Sarah Beth Durst invites you to her new standalone novel nestled on a far-away island brimming with singing flowers, honey cakes, and honeyed love. The hardcover edition features beautiful sprayed edges. Terlu Perna broke the law because she was lonely. She cast a spell and created a magically sentient spider plant. As punishment, she was turned into a wooden statue and tucked away into an alcove in the North Reading Room of the Great Library of Alyssium. This should have been the end of her story . . . Yet one day, Terlu wakes in the cold of winter on a nearly-deserted island full of hundreds of magical greenhouses. She’s starving and freezing, and the only other human on the island is a grumpy gardener. To her surprise, he offers Terlu a place to sleep, clean clothes, and freshly baked honey cakes—at least until she’s ready to sail home. But Terlu can’t return home and doesn’t want to—the greenhouses are a dream come true, each more wondrous than the next. When she learns that the magic that sustains them is failing—causing the death of everything within them—Terlu knows she must help. Even if that means breaking the law again. This time, though, she isn’t alone. Assisted by the gardener and a sentient rose, Terlu must unravel the secrets of a long-dead sorcerer if she wants to save the island—and have a fresh chance at happiness and love. Funny, kind, and forgiving, The Enchanted Greenhouse is a story about giving second chances—to others and to yourself.\";}i:14;a:5:{s:4:\"isbn\";s:13:\"9780593441299\";s:5:\"title\";s:43:\"Great Big Beautiful Life: Reese\'s Book Club\";s:7:\"authors\";a:1:{i:0;s:11:\"Emily Henry\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=Ur8fEQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:2115:\"A REESE’S BOOK CLUB PICK ∙ AN INSTANT #1 NEW YORK TIMES BESTSELLER ∙ Two writers compete for the chance to tell the larger-than-life story of a woman with more than a couple of plot twists up her sleeve in this dazzling and sweeping novel from Emily Henry. As featured in The New York Times ∙ Rolling Stone ∙ People ∙ Good Morning America ∙ NPR ∙ Vogue ∙ The Cut ∙ USA Today ∙ Cosmopolitan ∙ Harper\'s Bazaar ∙ Marie Claire ∙ Glamour ∙ ELLE ∙ E! Online ∙ The New York Post ∙ Bustle ∙ Reader\'s Digest ∙ BBC ∙ PopSugar ∙ SheReads ∙ Paste ∙ and more! Alice Scott is an eternal optimist still dreaming of her big writing break. Hayden Anderson is a Pulitzer-prize winning human thundercloud. And they’re both on balmy Little Crescent Island for the same reason: to write the biography of a woman no one has seen in years—or at least to meet with the octogenarian who claims to be the Margaret Ives. Tragic heiress, former tabloid princess, and daughter of one of the most storied (and scandalous) families of the twentieth century. When Margaret invites them both for a one-month trial period, after which she’ll choose the person who’ll tell her story, there are three things keeping Alice’s head in the game. One: Alice genuinely likes people, which means people usually like Alice—and she has a whole month to win the legendary woman over. Two: She’s ready for this job and the chance to impress her perennially unimpressed family with a Serious Publication. Three: Hayden Anderson, who should have no reason to be concerned about losing this book, is glowering at her in a shaken-to-the core way that suggests he sees her as competition. But the problem is, Margaret is only giving each of them pieces of her story. Pieces they can’t swap to put together because of an ironclad NDA and an inconvenient yearning pulsing between them every time they’re in the same room. And it’s becoming abundantly clear that their story—just like the tale Margaret’s spinning—could be a mystery, tragedy, or love ballad . . . depending on who’s telling it.\";}}', 1754999236),
('oakwood-library-cache-0716d9708d321ffb6a00818614779e779925365c', 'i:1;', 1758013528),
('oakwood-library-cache-0716d9708d321ffb6a00818614779e779925365c:timer', 'i:1758013528;', 1758013528),
('oakwood-library-cache-1574bddb75c78a6fd2251d61e2993b5146201319', 'i:1;', 1755624430),
('oakwood-library-cache-1574bddb75c78a6fd2251d61e2993b5146201319:timer', 'i:1755624430;', 1755624430),
('oakwood-library-cache-9e6a55b6b4563e652a23be9d623ca5055c356940', 'i:1;', 1758013677),
('oakwood-library-cache-9e6a55b6b4563e652a23be9d623ca5055c356940:timer', 'i:1758013677;', 1758013677),
('oakwood-library-cache-b3f0c7f6bb763af1be91d9e74eabfeb199dc1f1f', 'i:1;', 1762360624),
('oakwood-library-cache-b3f0c7f6bb763af1be91d9e74eabfeb199dc1f1f:timer', 'i:1762360624;', 1762360624),
('oakwood-library-cache-trending_books', 'a:15:{i:0;a:5:{s:4:\"isbn\";s:13:\"9780385548984\";s:5:\"title\";s:9:\"The Widow\";s:7:\"authors\";a:1:{i:0;s:12:\"John Grisham\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=DG9REQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:1290:\"#1 New York Times bestselling author John Grisham is the acclaimed master of the legal thriller. Now, he’s back with his first-ever whodunit, even more suspenseful than his courtroom dramas, as a small-time lawyer accused of murder races to find the real killer to clear his name. “A classic, compulsive, taut and thrilling novel from one of the great storytellers of our time. The Widow is John Grisham at his irresistible, unforgettable best.”—Chris Whitaker, author of All the Colors of the Dark Simon Latch is a lawyer in rural Virginia, making just enough to pay his bills while his marriage slowly falls apart. Then into his office walks Eleanor Barnett, an elderly widow in need of a new will. Apparently, her husband left her a small fortune, and no one knows about it. Once he hooks the richest client of his career, Simon works quietly to keep her wealth under the radar. But soon her story begins to crack. When she is hospitalized after a car accident, Simon realizes that nothing is as it seems, and he finds himself on trial for a crime he swears he didn’t commit: murder. Simon knows he’s innocent. But he also knows the circumstantial evidence is against him, and he could spend the rest of his life behind bars. To save himself, he must find the real killer….\";}i:1;a:5:{s:4:\"isbn\";s:13:\"9780316563826\";s:5:\"title\";s:18:\"The Proving Ground\";s:7:\"authors\";a:1:{i:0;s:16:\"Michael Connelly\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=C9gd0QEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1347:\"From #1 New York Times bestselling author Michael Connelly, the Lincoln Lawyer is back with a case against an AI company whose product may have been responsible for the murder of a young girl. Following his \"resurrection walk\" and need for a new direction, Mickey Haller turns to public interest litigation, filing a civil lawsuit against an artificial intelligence company whose chatbot told a sixteen-year-old boy that it was okay for him to kill his ex-girlfriend for her disloyalty. Representing the victim\'s family, Mickey\'s case explores the mostly unregulated and exploding AI business and the lack of training guardrails. Along the way he joins up with a journalist named Jack McEvoy, who wants to be a fly on the wall during the trial in order to write a book about it. But Mickey puts him to work going through the mountain of printed discovery materials in the case. McEvoy\'s digging ultimate delivers the key witness, a whistleblower who has been too afraid to speak up. The case is fraught with danger because billions are at stake. It is said that machines became smarter than humans on the day in 1997 that IBM\'s Deep Blue defeated chess master Garry Kasparov with a gambit called \"the knight\'s sacrifice.\" Haller will take a similar gambit in court to defeat the mega forces of the AI industry lined up against him and his clients.\";}i:2;a:5:{s:4:\"isbn\";s:13:\"9781649378538\";s:5:\"title\";s:46:\"The Things Gods Break (Deluxe Limited Edition)\";s:7:\"authors\";a:1:{i:0;s:12:\"Abigail Owen\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=isk0EQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:321:\"Don\'t miss out on the stunning DELUXE LIMITED EDITION while supplies last. This breathtaking collectible is only available on a limited first print run in the U.S. and Canada only, a must-have for any book lover. The games continue in the highly anticipated and thrilling follow-up to The Games Gods Play by Abigail Owen.\";}i:3;a:5:{s:4:\"isbn\";s:13:\"9780385546898\";s:5:\"title\";s:21:\"The Secret of Secrets\";s:7:\"authors\";a:1:{i:0;s:9:\"Dan Brown\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=RswZ0QEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1147:\"The world\'s most celebrated thriller writer returns with his most stunning novel yet--a propulsive, twisty, thought-provoking masterpiece that will entertain readers as only Dan Brown can do. Robert Langdon, esteemed professor of symbology, travels to Prague to attend a groundbreaking lecture by Katherine Solomon--a prominent noetic scientist with whom he has recently begun a relationship. Katherine is on the verge of publishing an explosive book that contains startling discoveries about the nature of human consciousness and threatens to disrupt centuries of established belief. But a brutal murder catapults the trip into chaos, and Katherine suddenly disappears along with her manuscript. Langdon finds himself targeted by a powerful organization and hunted by a chilling assailant sprung from Prague\'s most ancient mythology. As the plot expands into London and New York, Langdon desperately searches for Katherine . . . and for answers. In a thrilling race through the dual worlds of futuristic science and mystical lore, he uncovers a shocking truth about a secret project that will forever change the way we think about the human mind.\";}i:4;a:5:{s:4:\"isbn\";s:13:\"9780593972700\";s:5:\"title\";s:10:\"Alchemised\";s:7:\"authors\";a:1:{i:0;s:8:\"SenLinYu\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=y0Y_EQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:1835:\"#1 NEW YORK TIMES BESTSELLER • In this riveting dark fantasy debut, a woman with missing memories fights to survive a war-torn world of necromancy and alchemy—and the man tasked with unearthing the deepest secrets of her past. This stunning hardcover edition features a deluxe jacket with gold foil on the front and a full-color illustration on the reverse, gorgeous designed endpapers, a gold foil case stamp, and, from acclaimed artist Avendell, a black-and-white interior illustration. “What is it you think you’re protecting in that brain of yours? The war is over. Holdfast is dead. The Eternal Flame extinguished. There’s no one left for you to save.” Once a promising alchemist, Helena Marino is now a prisoner—of war and of her own mind. Her Resistance friends and allies have been brutally murdered, her abilities suppressed, and the world she knew destroyed. In the aftermath of a long war, Paladia’s new ruling class of corrupt guild families and depraved necromancers, whose vile undead creatures helped bring about their victory, holds Helena captive. According to Resistance records, she was a healer of little importance within their ranks. But Helena has inexplicable memory loss of the months leading up to her capture, making her enemies wonder: Is she truly as insignificant as she appears, or are her lost memories hiding some vital piece of the Resistance’s final gambit? To uncover the memories buried deep within her mind, Helena is sent to the High Reeve, one of the most powerful and ruthless necromancers in this new world. Trapped on his crumbling estate, Helena’s fight—to protect her lost history and to preserve the last remaining shreds of her former self—is just beginning. For her prison and captor have secrets of their own . . . secrets Helena must unearth, whatever the cost.\";}i:5;a:5:{s:4:\"isbn\";s:13:\"9798217154043\";s:5:\"title\";s:6:\"Remain\";s:7:\"authors\";a:2:{i:0;s:15:\"Nicholas Sparks\";i:1;s:18:\"M. Night Shyamalan\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=o-dMEQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:2087:\"A one-of-a-kind novel that grapples with the supernatural mysteries of life, death, and human connection—an unprecedented collaboration between the globally bestselling author of love stories like The Notebook and the renowned writer and director of blockbuster thrillers like The Sixth Sense The stunning hardcover of Remain features a premium dust jacket, beautiful endpapers, and a deluxe case stamped with replica images of the authors’ signatures! These stamped “signatures” are reproduced in gold foil. When New York architect Tate Donovan arrives in Cape Cod to design his best friend’s summer home, he is hoping to make a fresh start. Recently discharged from an upscale psychiatric facility where he was treated for acute depression, he is still wrestling with the pain of losing his beloved sister. Sylvia’s deathbed revelation—that she can see spirits who are still tethered to the living world, a gift that runs in their family—sits uneasily with Tate, who struggles to believe in more than what reason can explain. But when he takes up residence at a historic bed-and-breakfast on the Cape, he encounters a beautiful young woman named Wren who will challenge every assumption he has about his logical and controlled world. Tate and Wren find themselves forging an immediate connection, one that neither has ever experienced before. But Tate gradually discovers that below the surface of Wren’s idyllic small-town life, hatred, jealousy, and greed are festering, threatening their fragile relationship just as it begins to blossom. Tate realizes that in order to free Wren from an increasingly desperate fate, he will need to unearth the truth about her past before time runs out . . . a quest that will make him doubt whether we can ever believe the stories we tell about ourselves, and the laws that govern our existence. Love—while transformative—can sometimes be frightening. A story about the power of transcendent emotion, Remain asks us all: Can love set us free not only from our greatest sorrows, but even from the boundaries of life and death?\";}i:6;a:5:{s:4:\"isbn\";s:13:\"9781538774700\";s:5:\"title\";s:36:\"Reese Witherspoon Harlan Coben Novel\";s:7:\"authors\";a:2:{i:0;s:17:\"Reese Witherspoon\";i:1;s:12:\"Harlan Coben\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=2v3k0AEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:230:\"The first collaborative novel by Oscar-winning actor, producer, New York Times bestselling author and Reese\'s Book Club/Hello Sunshine founder Reese Witherspoon and # 1 international bestselling author and TV creator Harlan Coben.\";}i:7;a:5:{s:4:\"isbn\";s:13:\"9781464260919\";s:5:\"title\";s:12:\"The Intruder\";s:7:\"authors\";a:1:{i:0;s:15:\"Freida McFadden\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=6_NT0QEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1039:\"There\'s someone at your front door - should you let them in? Find out in a riveting new thriller from global sensation and #1 New York Times bestselling author of The Housemaid, Freida McFadden! Who knows what the storm will blow in... Casey\'s cabin in the wilderness is not built for a hurricane. Her roof shakes, the lights flicker, and the tree outside her front door sways ominously in the wind. But she\'s a lot more worried about the girl she discovers lurking outside her kitchen window. She\'s young. She\'s alone. And she\'s covered in blood. The girl won\'t explain where she came from, or loosen her grip on the knife in her right hand. And when Casey makes a disturbing discovery in the middle of the night, things take a turn for the worse. The girl has a dark secret. One she\'ll kill to keep. And if Casey gets too close to the truth, she may not live to see the morning. In this taut, deadly tale of survival and desperation, #1 New York Times bestselling author Freida McFadden explores how far one girl will go to save herself.\";}i:8;a:5:{s:4:\"isbn\";s:13:\"9780062200600\";s:5:\"title\";s:11:\"King Sorrow\";s:7:\"authors\";a:1:{i:0;s:8:\"Joe Hill\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=BMkO0QEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1643:\"From #1 New York Times bestselling author Joe Hill, a chilling tale of modern-world dangers, dark academia, and the unexpected consequences of revenge as six friends dabble in the occult and are tragically, horrifyingly successful... calling forth an evil entity that demands regular human sacrifice. \"A brilliantly Faustian fable with a heart as huge as a dragon\'s, and a stinging twist in its tail. I devoured it.\" --Ruth Ware, New York Times bestselling author of The Woman in Suite 11 Arthur Oakes is a reader, a dreamer, and a student at Rackham College, Maine, renowned for its frosty winters, exceptional library, and beautiful buildings. But his idyll--and burgeoning romance with Gwen Underfoot--is shattered when a local drug dealer and her partner corner him into one of the worst crimes he can imagine: stealing rare books from the college library. Trapped and desperate, Arthur turns to his closest friends for comfort and help. Together they dream up a wild, fantastical scheme to free Arthur from the cruel trap in which he finds himself. Wealthy, irrepressible Colin Wren suggests using the unnerving Crane journal (bound in the skin of its author) to summon a dragon to do their bidding. The others--brave, beautiful Alison Shiner; the battling twins Donna and Donovan McBride; and brainy, bold Gwen--don\'t hesitate to join Colin in an effort to smash reality and bring a creature of the impossible into our world. But there\'s nothing simple about dealing with dragons, and their pact to save Arthur becomes a terrifying bargain in which the six must choose a new sacrifice for King Sorrow every year--or become his next meal.\";}i:9;a:5:{s:4:\"isbn\";s:13:\"9780062406682\";s:5:\"title\";s:5:\"Twice\";s:7:\"authors\";a:1:{i:0;s:11:\"Mitch Albom\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=aI4Q0QEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:227:\"\"What if you got to do everything in your life -twice? The heart of Mitch Albom\'s newest novel is a love story that dares to explore how our unchecked desires might mean losing what we\'ve had all along\"-- Provided by publisher.\";}i:10;a:5:{s:4:\"isbn\";s:13:\"9781400354764\";s:5:\"title\";s:18:\"The Christmas Ring\";s:7:\"authors\";a:1:{i:0;s:15:\"Karen Kingsbury\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=Y7Fr0QEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:2180:\"While searching for her family\'s missing Christmas ring, a military widow sparks a friendship with a handsome antiques dealer, who just might have the love and the lost heirloom she\'s been longing for. Vanessa Mayfield\'s great-grandfather discovered a beautiful gold and ruby ring buried in the dirt at Normandy on D-Day. It gave him hope when all hope seemed lost and came to be known as The Christmas Ring as it was passed down through the generations of their family. Years ago, though, Vanessa lost the ring shortly after becoming a military widow herself and has scoured antique stores ever since, hoping someone found it. After dropping her daughter Sadie off for college, the \"Christmas in July\" sale sign she sees passing through Marietta seems the perfect distraction before returning to her now-empty house. She doesn\'t find the ring, but she does find something completely unexpected: the co-owner of the store, Ben Miller, makes her smile in a way she hasn\'t since losing her husband. Their friendship blossoms throughout the fall, and as Christmas nears, it\'s clear that something more is developing. Unbeknownst to either of them, Ben\'s father, Howard, has purchased a box of antiques that happens to include Vanessa\'s missing heirloom Christmas ring. A ring secretly worth five figures and filled with a lifetime of Vanessa\'s memories. Ben\'s father has no idea the importance of the heirloom--he just knows it is by far the most valuable piece he will have ever sold--and he\'s making plans to sell it so he can finally travel the world. It is his Christmas diamond in the rough. As Vanessa works to pull off her annual Columbus Cares Christmas Military Dance, she\'s eager for Sadie to return home from college. But she hasn\'t told Sadie about Ben. Every time she tries, something stops them. But with Ben in town to help with final preparations for the dance, she can no longer put it off. When Ben learns the truth about his father\'s newfound treasure, he fears it will become a wedge that drives them completely apart. Can he convince his father to stop the sale of Vanessa\'s precious heirloom? Or this Christmas, will love become the actual diamond in the rough?\";}i:11;a:5:{s:4:\"isbn\";s:13:\"9780316567855\";s:5:\"title\";s:11:\"The Academy\";s:7:\"authors\";a:2:{i:0;s:16:\"Elin Hilderbrand\";i:1;s:17:\"Shelby Cunningham\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=RmsQ0QEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1887:\"#1 bestselling author Elin Hilderbrand teams up with her daughter, Shelby Cunningham, to deliver a dishy, page-turning novel following an intertwined cast of characters over the course of one drama-filled year at a New England boarding school. It\'s move-in day at Tiffin Academy and amidst the happy chaos of friends reuniting, selfies uploading, and cars unloading, shocking news arrives: America Today just ranked Tiffin the number two boarding school in the country. It\'s a seventeen-spot jump - was there a typo? The dorms need to be renovated, their sports teams always come in last place, and let\'s just say Tiffin students are known for being more social than academic. On the other hand, the campus is exquisite, class sizes are small, and the dining hall is run by an acclaimed New York chef. And they do have fun--lots of parties and school dances, and a piano man plays in the student lounge every Monday night. But just as the rarefied air of Tiffin is suffused with self-congratulation, the wheels begin to turn - and then they fall off the bus. One by one, scandalous blind items begin to appear on phones across Tiffin\'s campus, thanks to a new app called ZipZap, and nobody is safe. From Davi Banerjee, international influencer and resident queen bee, to Simone Bergeron, the new and surprisingly young history teacher, to Charley Hicks, a transfer student who seems determined not to fit in, to Cordelia Spooner, Admissions Director with a somewhat idiosyncratic methodology - everyone has something to hide. As if high school wasn\'t dramatic enough...As the year unfolds, bonds are forged and broken, secrets are shared and exposed, and the lives of Tiffin\'s students and staff are changed forever. The Academy is Elin Hilderbrand\'s fresh, buzzy take on boarding school life, and a thrilling new direction from one of America\'s most satisfying and popular storytellers.\";}i:12;a:5:{s:4:\"isbn\";s:13:\"9781649379290\";s:5:\"title\";s:38:\"Fourth Wing (Wing and Claw Collection)\";s:7:\"authors\";a:1:{i:0;s:14:\"Rebecca Yarros\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=6VVnEQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:2620:\"This stunning new edition of Fourth Wing features gorgeous stenciled edges designed to match Iron Flame and Onyx Storm—bringing all three books together in one striking visual set. Available as a limited first print run in the U.S. and Canada only. A #1 New York Times bestseller • TV series in development at MGM Amazon Studios with Michael B. Jordan’s Outlier Society • Amazon Best Books of the Year, #4 • Apple Best Books of the Year 2023 • Barnes & Noble Best Fantasy Book of 2023 • NPR “Books We Love” 2023 • Audible Best Books of 2023 • Hudson Book of the Year • Google Play Best Books of 2023 • Indigo Best Books of 2023 • Waterstones Book of the Year finalist • Goodreads Choice Award Winner • Newsweek Staffers’ Favorite Books of 2023 • Paste Magazine\'s Best Books of 2023 \"Suspenseful, sexy, and with incredibly entertaining storytelling, the first in Yarros\' Empyrean series will delight fans of romantic, adventure-filled fantasy.\" —Booklist, starred review \"Fourth Wing will have your heart pounding from beginning to end... A fantasy like you\'ve never read before.\" ―#1 New York Times bestselling author Jennifer L. Armentrout Enter the brutal and elite world of a war college for dragon riders from #1 New York Times bestselling author Rebecca Yarros Twenty-year-old Violet Sorrengail was supposed to enter the Scribe Quadrant, living a quiet life among books and history. Now, the commanding general—also known as her tough-as-talons mother—has ordered Violet to join the hundreds of candidates striving to become the elite of Navarre: dragon riders. But when you’re smaller than everyone else and your body is brittle, death is only a heartbeat away...because dragons don’t bond to “fragile” humans. They incinerate them. With fewer dragons willing to bond than cadets, most would kill Violet to better their own chances of success. The rest would kill her just for being her mother’s daughter—like Xaden Riorson, the most powerful and ruthless wingleader in the Riders Quadrant. She’ll need every edge her wits can give her just to see the next sunrise. Yet, with every day that passes, the war outside grows more deadly, the kingdom\'s protective wards are failing, and the death toll continues to rise. Even worse, Violet begins to suspect leadership is hiding a terrible secret. Friends, enemies, lovers. Everyone at Basgiath War College has an agenda—because once you enter, there are only two ways out: graduate or die. The Empyrean series is best enjoyed in order. Reading Order: Book #1 Fourth Wing Book #2 Iron Flame Book #3 Onyx Storm\";}i:13;a:5:{s:4:\"isbn\";s:13:\"9781649379399\";s:5:\"title\";s:37:\"Iron Flame (Wing and Claw Collection)\";s:7:\"authors\";a:1:{i:0;s:14:\"Rebecca Yarros\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=8VVnEQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:2220:\"This stunning new edition of Iron Flame features gorgeous stenciled edges designed to match Fourth Wing and Onyx Storm—bringing all three books together in one striking visual set. Available as a limited first print run in the U.S. and Canada only. Discover the instant #1 New York Times bestseller! TV series now in development at MGM Amazon Studios with Michael B. Jordan’s Outlier Society. Accolades for Fourth Wing Amazon Best Books of the Year, #4 • Apple Best Books of the Year 2023 • Barnes & Noble Best Fantasy Book of 2023 (Fourth Wing and Iron Flame) • NPR “Books We Love” 2023 • Audible Best Books of 2023 • Hudson Book of the Year • Google Play Best Books of 2023 • Indigo Best Books of 2023 • Waterstones Book of the Year finalist • Goodreads Choice Award, semi-finalist • Newsweek Staffers’ Favorite Books of 2023 • Paste Magazine\'s Best Books of 2023 “The first year is when some of us lose our lives. The second year is when the rest of us lose our humanity.” —Xaden Riorson Everyone expected Violet Sorrengail to die during her first year at Basgiath War College—Violet included. But Threshing was only the first impossible test meant to weed out the weak-willed, the unworthy, and the unlucky. Now the real training begins, and Violet’s already wondering how she’ll get through. It’s not just that it’s grueling and maliciously brutal, or even that it’s designed to stretch the riders’ capacity for pain beyond endurance. It’s the new vice commandant, who’s made it his personal mission to teach Violet exactly how powerless she is–unless she betrays the man she loves. Although Violet’s body might be weaker and frailer than everyone else’s, she still has her wits—and a will of iron. And leadership is forgetting the most important lesson Basgiath has taught her: Dragon riders make their own rules. But a determination to survive won’t be enough this year. Because Violet knows the real secret hidden for centuries at Basgiath War College—and nothing, not even dragon fire, may be enough to save them in the end. The Empyrean series is best enjoyed in order. Reading Order: Book #1 Fourth Wing Book #2 Iron Flame Book #3 Onyx Storm\";}i:14;a:5:{s:4:\"isbn\";s:13:\"9781649374189\";s:5:\"title\";s:35:\"Onyx Storm (Deluxe Limited Edition)\";s:7:\"authors\";a:1:{i:0;s:14:\"Rebecca Yarros\";}s:9:\"thumbnail\";s:58:\"https://dummyimage.com/150x200/cccccc/000000&text=No+Image\";s:11:\"description\";s:471:\"Preorder now and receive the stunning DELUXE LIMITED EDITION while supplies last―featuring gorgeous sprayed edges with stenciled artwork, as well as exclusive special design features. This incredible collectible is only available for a limited time, a must-have for any book lover while supplies last in the US and Canada only. Get ready to fly or die in the breathtaking follow-up to Fourth Wing and Iron Flame from #1 New York Times bestselling author Rebecca Yarros.\";}}', 1762373441);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(4, 4, 7, 92.00, 7, 'paid', '2025-11-03 17:36:11', 'Test fine inserted via seeder', '2025-09-09 09:02:03', '2025-11-03 17:36:11'),
(5, 5, 8, 80.00, 3, 'pending', NULL, 'Test fine inserted via seeder\nReminder sent on 2025-10-15 15:22:00', '2025-09-05 09:02:03', '2025-10-15 09:52:00'),
(6, 6, 9, 71.00, 4, 'pending', NULL, 'Test fine inserted via seeder\nReminder sent on 2025-10-15 15:21:22', '2025-09-07 09:02:03', '2025-10-15 09:51:22'),
(7, 7, 10, 43.00, 8, 'waived', '2025-09-16 15:47:24', 'Test fine inserted via seeder', '2025-09-04 09:02:03', '2025-09-16 15:47:24'),
(8, 8, 11, 24.00, 2, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-05 09:02:03', '2025-09-11 09:02:03'),
(9, 9, 12, 45.00, 8, 'paid', '2025-11-05 15:23:02', 'Test fine inserted via seeder', '2025-09-08 09:02:03', '2025-11-05 15:23:02'),
(10, 10, 13, 97.00, 9, 'paid', '2025-11-03 17:36:07', 'Test fine inserted via seeder', '2025-09-03 09:02:03', '2025-11-03 17:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `fine_rules`
--

CREATE TABLE `fine_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `daily_rate` decimal(8,2) NOT NULL,
  `grace_period_days` int(11) NOT NULL DEFAULT 0,
  `max_fine` decimal(8,2) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fine_rules`
--

INSERT INTO `fine_rules` (`id`, `name`, `daily_rate`, `grace_period_days`, `max_fine`, `is_active`, `description`, `created_at`, `updated_at`) VALUES
(19, 'Standard Late Fee', 5.00, 0, 100.00, 1, 'Standard late fee of ₹5 per day with maximum fine of ₹100', '2025-09-11 08:56:56', '2025-11-03 16:19:02'),
(20, 'Student Late Fee', 3.00, 1, 50.00, 1, 'Reduced late fee for students with 1-day grace period', '2025-09-11 08:56:56', '2025-09-11 08:56:56'),
(21, 'Premium Member Late Fee', 2.00, 2, 30.00, 0, 'Special rate for premium members with extended grace period', '2025-09-11 08:56:56', '2025-09-11 08:56:56');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Arabic', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(2, 'Bengali', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(3, 'Chinese (Cantonese)', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(4, 'Chinese (Mandarin)', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(5, 'Dutch', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(6, 'English', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(7, 'Farsi (Persian)', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(8, 'Filipino (Tagalog)', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(9, 'French', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(10, 'German', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(11, 'Greek', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(12, 'Gujarati', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(13, 'Hausa', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(14, 'Hebrew', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(15, 'Hindi', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(16, 'Indonesian', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(17, 'Italian', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(18, 'Japanese', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(19, 'Javanese', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(20, 'Kannada', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(21, 'Korean', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(22, 'Malay', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(23, 'Malayalam', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(24, 'Marathi', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(25, 'Nepali', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(26, 'Pashto', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(27, 'Polish', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(28, 'Portuguese', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(29, 'Punjabi', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(30, 'Romanian', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(31, 'Russian', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(32, 'Sanskrit', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(33, 'Sindhi', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(34, 'Sinhala', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(35, 'Spanish', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(36, 'Swahili', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(37, 'Tamil', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(38, 'Telugu', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(39, 'Thai', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(40, 'Turkish', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(41, 'Urdu', '2025-07-17 17:20:57', '2025-07-17 17:20:57'),
(42, 'Vietnamese', '2025-07-17 17:20:57', '2025-07-17 17:20:57');

-- --------------------------------------------------------

--
-- Table structure for table `lendings`
--

CREATE TABLE `lendings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `issued_at` date DEFAULT NULL,
  `return_at` date DEFAULT NULL,
  `returned_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `returned_to` bigint(20) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `renewal_count` int(11) NOT NULL DEFAULT 0,
  `last_renewed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lendings`
--

INSERT INTO `lendings` (`id`, `book_id`, `user_id`, `issued_at`, `return_at`, `returned_at`, `status`, `approved_at`, `created_at`, `updated_at`, `approved_by`, `returned_to`, `notes`, `renewal_count`, `last_renewed_at`) VALUES
(1, 107, 1, NULL, NULL, NULL, 'rejected', NULL, '2025-07-29 14:20:12', '2025-08-05 11:46:54', NULL, NULL, 'Rejected by Joel Raju on 2025-08-05 17:16:54', 0, NULL),
(2, 105, 1, NULL, NULL, NULL, 'rejected', NULL, '2025-07-29 14:29:35', '2025-08-05 07:33:05', NULL, NULL, 'Rejected by Joel Raju on 2025-08-05 13:03:05', 0, NULL),
(3, 106, 1, '2025-07-30', '2025-08-06', '2025-08-06 11:08:59', 'returned', '2025-07-30 08:59:57', '2025-07-30 08:40:45', '2025-08-06 11:08:59', NULL, 1, NULL, 0, NULL),
(4, 105, 4, NULL, NULL, NULL, 'rejected', NULL, '2025-07-30 09:13:55', '2025-07-31 10:29:40', NULL, NULL, NULL, 0, NULL),
(5, 21, 1, '2025-07-31', '2025-08-07', '2025-08-06 12:07:30', 'returned', '2025-07-31 10:17:55', '2025-07-31 10:17:31', '2025-08-06 12:07:30', NULL, 1, NULL, 0, NULL),
(6, 22, 1, '2025-08-05', '2025-08-19', '2025-08-06 12:07:35', 'returned', '2025-08-05 03:08:43', '2025-08-05 03:04:25', '2025-08-06 12:07:35', 1, 1, NULL, 0, NULL),
(7, 77, 1, '2025-08-06', '2025-08-20', NULL, 'rejected', NULL, '2025-08-06 12:11:07', '2025-08-06 12:19:46', NULL, NULL, 'Rejected by Joel Raju on 2025-08-06 17:49:46', 0, NULL),
(8, 74, 1, '2025-08-06', '2025-08-20', '2025-08-11 18:58:56', 'returned', '2025-08-06 12:19:41', '2025-08-06 12:11:36', '2025-08-11 18:58:56', 1, 1, NULL, 0, NULL),
(9, 106, 1, '2025-10-12', '2025-10-26', '2025-11-03 17:17:54', 'returned', '2025-10-12 14:30:36', '2025-08-11 19:16:19', '2025-11-03 17:17:54', 1, 17, NULL, 0, NULL),
(10, 76, 1, '2025-11-03', '2025-11-17', '2025-11-03 17:28:55', 'returned', '2025-11-03 17:18:02', '2025-08-11 19:26:35', '2025-11-03 17:28:55', 17, 17, NULL, 0, NULL),
(11, 105, 17, '2025-09-16', '2025-09-30', '2025-11-03 17:17:50', 'returned', '2025-09-16 17:06:50', '2025-09-16 15:43:13', '2025-11-03 17:17:50', 1, 17, NULL, 0, NULL),
(12, 104, 1, '2025-11-03', '2025-11-17', '2025-11-03 17:28:56', 'returned', '2025-11-03 17:18:03', '2025-09-16 15:45:05', '2025-11-03 17:28:56', 17, 17, NULL, 0, NULL),
(13, 74, 1, '2025-09-16', '2025-09-30', '2025-11-03 17:17:51', 'returned', '2025-09-16 17:06:42', '2025-09-16 16:49:41', '2025-11-03 17:17:51', 1, 17, NULL, 0, NULL),
(14, 105, 1, '2025-09-23', '2025-10-07', '2025-11-03 17:17:53', 'returned', '2025-09-23 10:04:20', '2025-09-16 16:50:48', '2025-11-03 17:17:53', 1, 17, NULL, 0, NULL),
(15, 22, 18, '2025-11-03', '2025-11-17', '2025-11-03 17:17:55', 'returned', '2025-11-03 17:04:51', '2025-11-03 16:33:20', '2025-11-03 17:17:55', 17, 17, NULL, 0, NULL),
(16, 215, 18, '2025-11-03', '2025-11-17', '2025-11-03 17:17:56', 'returned', '2025-11-03 17:15:33', '2025-11-03 17:06:41', '2025-11-03 17:17:56', 17, 17, NULL, 0, NULL),
(17, 158, 17, '2025-11-03', '2025-11-17', '2025-11-03 17:17:57', 'returned', '2025-11-03 17:15:49', '2025-11-03 17:15:40', '2025-11-03 17:17:57', 17, 17, NULL, 0, NULL),
(18, 154, 17, '2025-11-05', '2025-11-19', NULL, 'approved', '2025-11-05 15:19:25', '2025-11-05 14:26:39', '2025-11-05 15:19:25', 17, NULL, NULL, 0, NULL),
(19, 156, 1, NULL, NULL, NULL, 'rejected', NULL, '2025-11-05 14:34:15', '2025-11-05 15:19:27', NULL, NULL, 'Rejected by Admin on 2025-11-05 20:49:27', 0, NULL),
(20, 215, 1, NULL, NULL, NULL, 'rejected', NULL, '2025-11-05 14:49:09', '2025-11-05 15:19:29', NULL, NULL, 'Rejected by Admin on 2025-11-05 20:49:29', 0, NULL),
(21, 76, 18, NULL, NULL, NULL, 'rejected', NULL, '2025-11-05 15:02:23', '2025-11-05 15:19:30', NULL, NULL, 'Rejected by Admin on 2025-11-05 20:49:30', 0, NULL),
(22, 210, 1, NULL, NULL, NULL, 'rejected', NULL, '2025-11-05 15:10:35', '2025-11-05 15:19:28', NULL, NULL, 'Rejected by Admin on 2025-11-05 20:49:28', 0, NULL),
(23, 149, 17, NULL, NULL, NULL, 'rejected', NULL, '2025-11-05 15:14:47', '2025-11-05 15:19:29', NULL, NULL, 'Rejected by Admin on 2025-11-05 20:49:29', 0, NULL),
(24, 16, 18, '2025-11-05', '2025-11-19', NULL, 'approved', '2025-11-05 15:19:26', '2025-11-05 15:18:42', '2025-11-05 15:19:26', 17, NULL, NULL, 0, NULL),
(25, 150, 1, '2025-11-05', '2025-11-19', NULL, 'pending', NULL, '2025-11-05 15:23:38', '2025-11-05 15:23:38', NULL, NULL, NULL, 0, NULL),
(26, 77, 19, '2025-11-05', '2025-11-19', '2025-11-05 16:51:50', 'returned', '2025-11-05 16:47:40', '2025-11-05 16:36:17', '2025-11-05 16:51:50', 17, 17, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_17_150133_create_languages_table', 1),
(5, '2025_07_17_150134_create_book_types_table', 1),
(6, '2025_07_17_150135_create_books_table', 1),
(7, '2025_07_17_150135_create_members_table', 1),
(8, '2025_07_17_150136_create_lendings_table', 1),
(10, '2025_07_17_184835_add_role_to_users_table', 2),
(11, '2025_07_27_164247_add_cover_image_to_books_table', 3),
(13, '2025_07_29_154029_add_image_to_books_table', 4),
(14, '2025_07_29_191826_add_status_and_approved_at_to_lendings_table', 4),
(15, '2025_07_29_194909_make_issued_at_nullable_in_lendings_table', 5),
(16, '2025_08_02_114425_add_phone_and_address_to_users_table', 6),
(17, '2025_01_15_000001_create_fines_table', 7),
(18, '2025_01_15_000002_create_fine_rules_table', 7),
(19, '2025_01_15_000003_add_user_management_fields', 7),
(20, '2025_01_15_000004_add_lending_management_fields', 7),
(21, '2025_08_05_091206_update_max_books_allowed_default_in_users_table', 8),
(22, '2025_08_19_194330_create_api_books_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('pIDjIGTnWrZGuSAXQmRPplTYbQimBK8Wea52EZgV', 17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoid0cydHh3clp1eFVBRnlVa0gxOXo3SHVQQ1BRbzY0N1ZJMktWWG42SiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdCI7fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6NDY6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxNzt9', 1762365953);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `status` enum('active','blocked','pending') NOT NULL DEFAULT 'active',
  `blocked_at` timestamp NULL DEFAULT NULL,
  `block_reason` text DEFAULT NULL,
  `max_books_allowed` int(11) NOT NULL DEFAULT 5,
  `max_days_allowed` int(11) NOT NULL DEFAULT 14
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `status`, `blocked_at`, `block_reason`, `max_books_allowed`, `max_days_allowed`) VALUES
(1, 'Joel Raju', 'joelraju2005@gmail.com', '', '', '2025-07-17 12:53:51', '$2y$12$jZSvQO59UXs9xpphIMYd6uuCmzpUBSf94h4Bl3Nnw/2fHdep9.CNq', '', '2025-07-17 12:53:26', '2025-11-05 15:23:23', 'user', 'blocked', '2025-11-05 15:23:23', NULL, 3, 14),
(4, 'Joeta Raju', 'joeta202429@gmail.com', '', '', '2025-07-24 10:58:20', '$2y$12$ydx.xDOQW6szzD7kRjzFg.jZXDQ.ebMaoYQ7sXxoSXwpIiH979lF2', '2A3DXmWxlAWQg426et2b87Zh9nhvkycgqTXgrD2G1feWCZV5c2kZcDPkQxJS', '2025-07-24 10:56:10', '2025-09-16 15:44:55', 'user', 'active', NULL, NULL, 3, 14),
(5, 'Test User', 'test@example.com', '', '', '2025-07-27 11:56:22', '$2y$12$HtDu/ErrGiLObhf5Ko4JmOtTq7iJYS5cGD6hHRfAqhhB6GCTRq8E2', 'LJq19IRTui', '2025-07-27 11:56:22', '2025-08-06 10:33:22', 'user', 'active', NULL, NULL, 3, 14),
(7, 'Hello', 'hello@gamil.com', '', '', '2025-07-28 11:14:42', '$2y$12$mcSdw0UJfbCNfdfrqiyjPO1WEm0Gp94QCX2mwUkekhk0xlnDmd0DG', NULL, '2025-07-28 11:13:36', '2025-07-28 11:14:42', 'user', 'active', NULL, NULL, 3, 14),
(8, 'Luffy', 'luffy@gmail.com', '', '', NULL, '$2y$12$Ec7cS3mjKbWGgqNO9PHyNOUUYpvaS3gvRFxS0jZ96Dq5lybkrGyn.', NULL, '2025-07-31 12:34:33', '2025-07-31 12:34:33', 'user', 'active', NULL, NULL, 3, 14),
(9, 'zoro', 'zoro@gmail.com', '', '', NULL, '$2y$12$gDYo20YKF2749P/9HftBb.FqYDBu5BaefLjmWevb3VzVjr3sYC1MC', NULL, '2025-07-31 13:38:00', '2025-07-31 13:38:00', 'user', 'active', NULL, NULL, 3, 14),
(10, 'Nami', 'nami@gmail.com', '', '', '2025-07-31 13:43:25', '$2y$12$/kisafo/HnAyHInGqudGXO5IwUPrsGvSSA4fh8vacbbb3Dtr9cke2', NULL, '2025-07-31 13:42:56', '2025-07-31 13:43:25', 'user', 'active', NULL, NULL, 3, 14),
(11, 'hover', 'hover@gmail.com', '854731391', 'Akkunnath house, Edampaadam, Varapuzha', NULL, '$2y$12$kV8IcfnNQnJdKgRdjh/pBuSUP/X5LEu/JBc36VgIYmYzWh7ximOEK', NULL, '2025-08-02 06:22:45', '2025-08-02 06:22:45', 'user', 'active', NULL, NULL, 3, 14),
(12, 'hover', 'hovr@gmail.com', '854731391', 'Akkunnath house, Edampaadam, Varapuzha', '2025-08-02 06:25:06', '$2y$12$UW3C5bFu28x14pzDUOuQl.KP7U57wMf6T.Jc/r7VMpgl7C7cTcOdO', NULL, '2025-08-02 06:25:01', '2025-08-02 06:25:06', 'user', 'active', NULL, NULL, 3, 14),
(13, 'room', 'room@gmail.com', '8575757570', 'Akkunnath house, Edampaadam, Varapuzha', '2025-08-02 06:26:49', '$2y$12$chyhEmN7OTwW9jPmGCnTouYJQmHWUB.SS6DEoxGKFLFw1Fhm.AcaO', NULL, '2025-08-02 06:26:43', '2025-08-02 06:26:49', 'user', 'active', NULL, NULL, 3, 14),
(14, 'Akshy', 'akshy@gamail.com', '8544265652', 'Akkunnath house, Edampaadam, Varapuzha', '2025-08-05 03:24:56', '$2y$12$yIqHgsbgnoyn/OupjMHYAelGT0tgxKZxXlfVccJkcU3puAFb5rU/u', NULL, '2025-08-05 03:24:14', '2025-08-05 03:24:56', 'user', 'active', NULL, NULL, 3, 14),
(15, 'Roshen', 'roshen@gmail.com', '8758541254', 'Akkunnath house, Edampaadam, Varapuzha', '2025-08-05 04:05:18', '$2y$12$EYFjbNbWu8kPfuyV3Iz0jej8ESUDl3Kg.G343jewlMCspZ21GkiXO', NULL, '2025-08-05 04:05:12', '2025-08-05 04:05:18', 'user', 'active', NULL, NULL, 5, 14),
(16, 'Messi', 'messi@gmail.com', '8754985147', 'Akkunnath house, Edampaadam, Varapuzha', '2025-08-19 17:26:10', '$2y$12$GphfglBLDTVN0RMlVe6zy.x5jZ8L5/CRLc63dZx0dE5SbQaEk7wAW', NULL, '2025-08-19 17:25:23', '2025-08-19 17:26:10', 'user', 'active', NULL, NULL, 5, 14),
(17, 'Admin', 'admin@gmail.com', '9548521487', 'Admin', '2025-09-16 09:04:28', '$2y$12$4j5CVyENPRP5aBEL0m8F7uqVi0ubM5K4AzYKUMPV89QO1b7q1zGSq', NULL, '2025-09-16 09:03:46', '2025-09-18 08:26:57', 'admin', 'active', NULL, NULL, 5, 14),
(18, 'User', 'user@gamil.com', '8754842565', 'Hoee', '2025-09-16 09:06:57', '$2y$12$9wkWlI/gaItiRuV9nrrf2epZe2n9Yuw/VZs3BkyIFEDSrLt6CF3sO', NULL, '2025-09-16 09:06:44', '2025-11-05 16:13:29', 'user', 'active', NULL, NULL, 5, 14),
(19, 'Rajan', 'rajan@gmail.com', '8542165841', 'Rajanstan', '2025-11-05 16:36:04', '$2y$12$k.3m3e/DbQvEqnjg4g/aUOtkyAz7nuHrO4QUbR.7.D85wn1v9R8E2', NULL, '2025-11-05 16:35:33', '2025-11-05 16:36:04', 'user', 'active', NULL, NULL, 5, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `books_isbn_unique` (`isbn`),
  ADD KEY `books_book_type_id_foreign` (`book_type_id`),
  ADD KEY `books_language_id_foreign` (`language_id`);

--
-- Indexes for table `book_types`
--
ALTER TABLE `book_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fines`
--
ALTER TABLE `fines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fines_lending_id_foreign` (`lending_id`),
  ADD KEY `fines_user_id_foreign` (`user_id`);

--
-- Indexes for table `fine_rules`
--
ALTER TABLE `fine_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lendings`
--
ALTER TABLE `lendings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lendings_book_id_foreign` (`book_id`),
  ADD KEY `lendings_user_id_foreign` (`user_id`),
  ADD KEY `lendings_approved_by_foreign` (`approved_by`),
  ADD KEY `lendings_returned_to_foreign` (`returned_to`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `book_types`
--
ALTER TABLE `book_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fines`
--
ALTER TABLE `fines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fine_rules`
--
ALTER TABLE `fine_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `lendings`
--
ALTER TABLE `lendings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_book_type_id_foreign` FOREIGN KEY (`book_type_id`) REFERENCES `book_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `books_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fines`
--
ALTER TABLE `fines`
  ADD CONSTRAINT `fines_lending_id_foreign` FOREIGN KEY (`lending_id`) REFERENCES `lendings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fines_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lendings`
--
ALTER TABLE `lendings`
  ADD CONSTRAINT `lendings_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `lendings_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lendings_returned_to_foreign` FOREIGN KEY (`returned_to`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `lendings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
