-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2025 at 05:13 PM
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
(217, 'Final Girls, Feminism and Popular Culture', 'Katarzyna Paszkiewicz, Stacy Rusnak', '9783030315238', 'http://books.google.com/books/content?id=dLzhDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 48, 6, 23, '2025-09-16 09:36:47', '2025-09-16 09:36:47'),
(218, 'Survive The Night', 'Anderson', '9781088174104', NULL, 48, 6, 9, '2025-09-16 09:36:47', '2025-09-16 09:36:47');

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
('oakwood-library-cache-9e6a55b6b4563e652a23be9d623ca5055c356940:timer', 'i:1758013677;', 1758013677);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('oakwood-library-cache-trending_books', 'a:15:{i:0;a:5:{s:4:\"isbn\";s:13:\"9781649379399\";s:5:\"title\";s:37:\"Iron Flame (Wing and Claw Collection)\";s:7:\"authors\";a:1:{i:0;s:14:\"Rebecca Yarros\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=8VVnEQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:2220:\"This stunning new edition of Iron Flame features gorgeous stenciled edges designed to match Fourth Wing and Onyx Storm—bringing all three books together in one striking visual set. Available as a limited first print run in the U.S. and Canada only. Discover the instant #1 New York Times bestseller! TV series now in development at MGM Amazon Studios with Michael B. Jordan’s Outlier Society. Accolades for Fourth Wing Amazon Best Books of the Year, #4 • Apple Best Books of the Year 2023 • Barnes & Noble Best Fantasy Book of 2023 (Fourth Wing and Iron Flame) • NPR “Books We Love” 2023 • Audible Best Books of 2023 • Hudson Book of the Year • Google Play Best Books of 2023 • Indigo Best Books of 2023 • Waterstones Book of the Year finalist • Goodreads Choice Award, semi-finalist • Newsweek Staffers’ Favorite Books of 2023 • Paste Magazine\'s Best Books of 2023 “The first year is when some of us lose our lives. The second year is when the rest of us lose our humanity.” —Xaden Riorson Everyone expected Violet Sorrengail to die during her first year at Basgiath War College—Violet included. But Threshing was only the first impossible test meant to weed out the weak-willed, the unworthy, and the unlucky. Now the real training begins, and Violet’s already wondering how she’ll get through. It’s not just that it’s grueling and maliciously brutal, or even that it’s designed to stretch the riders’ capacity for pain beyond endurance. It’s the new vice commandant, who’s made it his personal mission to teach Violet exactly how powerless she is–unless she betrays the man she loves. Although Violet’s body might be weaker and frailer than everyone else’s, she still has her wits—and a will of iron. And leadership is forgetting the most important lesson Basgiath has taught her: Dragon riders make their own rules. But a determination to survive won’t be enough this year. Because Violet knows the real secret hidden for centuries at Basgiath War College—and nothing, not even dragon fire, may be enough to save them in the end. The Empyrean series is best enjoyed in order. Reading Order: Book #1 Fourth Wing Book #2 Iron Flame Book #3 Onyx Storm\";}i:1;a:5:{s:4:\"isbn\";s:13:\"9781649379290\";s:5:\"title\";s:38:\"Fourth Wing (Wing and Claw Collection)\";s:7:\"authors\";a:1:{i:0;s:14:\"Rebecca Yarros\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=6VVnEQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:2620:\"This stunning new edition of Fourth Wing features gorgeous stenciled edges designed to match Iron Flame and Onyx Storm—bringing all three books together in one striking visual set. Available as a limited first print run in the U.S. and Canada only. A #1 New York Times bestseller • TV series in development at MGM Amazon Studios with Michael B. Jordan’s Outlier Society • Amazon Best Books of the Year, #4 • Apple Best Books of the Year 2023 • Barnes & Noble Best Fantasy Book of 2023 • NPR “Books We Love” 2023 • Audible Best Books of 2023 • Hudson Book of the Year • Google Play Best Books of 2023 • Indigo Best Books of 2023 • Waterstones Book of the Year finalist • Goodreads Choice Award Winner • Newsweek Staffers’ Favorite Books of 2023 • Paste Magazine\'s Best Books of 2023 \"Suspenseful, sexy, and with incredibly entertaining storytelling, the first in Yarros\' Empyrean series will delight fans of romantic, adventure-filled fantasy.\" —Booklist, starred review \"Fourth Wing will have your heart pounding from beginning to end... A fantasy like you\'ve never read before.\" ―#1 New York Times bestselling author Jennifer L. Armentrout Enter the brutal and elite world of a war college for dragon riders from #1 New York Times bestselling author Rebecca Yarros Twenty-year-old Violet Sorrengail was supposed to enter the Scribe Quadrant, living a quiet life among books and history. Now, the commanding general—also known as her tough-as-talons mother—has ordered Violet to join the hundreds of candidates striving to become the elite of Navarre: dragon riders. But when you’re smaller than everyone else and your body is brittle, death is only a heartbeat away...because dragons don’t bond to “fragile” humans. They incinerate them. With fewer dragons willing to bond than cadets, most would kill Violet to better their own chances of success. The rest would kill her just for being her mother’s daughter—like Xaden Riorson, the most powerful and ruthless wingleader in the Riders Quadrant. She’ll need every edge her wits can give her just to see the next sunrise. Yet, with every day that passes, the war outside grows more deadly, the kingdom\'s protective wards are failing, and the death toll continues to rise. Even worse, Violet begins to suspect leadership is hiding a terrible secret. Friends, enemies, lovers. Everyone at Basgiath War College has an agenda—because once you enter, there are only two ways out: graduate or die. The Empyrean series is best enjoyed in order. Reading Order: Book #1 Fourth Wing Book #2 Iron Flame Book #3 Onyx Storm\";}i:2;a:5:{s:4:\"isbn\";s:13:\"9780593972700\";s:5:\"title\";s:10:\"Alchemised\";s:7:\"authors\";a:1:{i:0;s:8:\"SenLinYu\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=y0Y_EQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:1802:\"In this riveting dark fantasy debut, a woman with missing memories fights to survive a war-torn world of necromancy and alchemy—and the man tasked with unearthing the deepest secrets of her past. This stunning hardcover edition features a deluxe jacket with gold foil on the front and a full-color illustration on the reverse, gorgeous designed endpapers, a gold foil case stamp, and, from acclaimed artist Avendell, a black-and-white interior illustration. “What is it you think you’re protecting in that brain of yours? The war is over. Holdfast is dead. The Eternal Flame extinguished. There’s no one left for you to save.” Once a promising alchemist, Helena Marino is now a prisoner—of war and of her own mind. Her Resistance friends and allies have been brutally murdered, her abilities suppressed, and the world she knew destroyed. In the aftermath of a long war, Paladia’s new ruling class of corrupt guild families and depraved necromancers, whose vile undead creatures helped bring about their victory, holds Helena captive. According to Resistance records, she was a healer of little importance within their ranks. But Helena has inexplicable memory loss of the months leading up to her capture, making her enemies wonder: Is she truly as insignificant as she appears, or are her lost memories hiding some vital piece of the Resistance’s final gambit? To uncover the memories buried deep within her mind, Helena is sent to the High Reeve, one of the most powerful and ruthless necromancers in this new world. Trapped on his crumbling estate, Helena’s fight—to protect her lost history and to preserve the last remaining shreds of her former self—is just beginning. For her prison and captor have secrets of their own . . . secrets Helena must unearth, whatever the cost.\";}i:3;a:5:{s:4:\"isbn\";s:13:\"9780385546898\";s:5:\"title\";s:21:\"The Secret of Secrets\";s:7:\"authors\";a:1:{i:0;s:9:\"Dan Brown\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=RswZ0QEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1147:\"The world\'s most celebrated thriller writer returns with his most stunning novel yet--a propulsive, twisty, thought-provoking masterpiece that will entertain readers as only Dan Brown can do. Robert Langdon, esteemed professor of symbology, travels to Prague to attend a groundbreaking lecture by Katherine Solomon--a prominent noetic scientist with whom he has recently begun a relationship. Katherine is on the verge of publishing an explosive book that contains startling discoveries about the nature of human consciousness and threatens to disrupt centuries of established belief. But a brutal murder catapults the trip into chaos, and Katherine suddenly disappears along with her manuscript. Langdon finds himself targeted by a powerful organization and hunted by a chilling assailant sprung from Prague\'s most ancient mythology. As the plot expands into London and New York, Langdon desperately searches for Katherine . . . and for answers. In a thrilling race through the dual worlds of futuristic science and mystical lore, he uncovers a shocking truth about a secret project that will forever change the way we think about the human mind.\";}i:4;a:5:{s:4:\"isbn\";s:13:\"9780593653258\";s:5:\"title\";s:22:\"The Impossible Fortune\";s:7:\"authors\";a:1:{i:0;s:13:\"Richard Osman\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=2jo2EQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:1010:\"The unmissable new mystery in the Thursday Murder Club series from #1 New York Times bestselling author Richard Osman, now streaming on Netflix Who\'s got time to think about murder when there\'s a wedding to plan? It’s been a quiet year for the Thursday Murder Club. Joyce is busy with table plans and first dances. Elizabeth is grieving. Ron is dealing with family troubles, and Ibrahim is still providing therapy to his favorite criminal. But when Elizabeth meets Nick, a wedding guest asking for her help, she finds the thrill of the chase is ignited once again. And when Nick disappears without a trace, his cagey business partner becomes the gang’s next stop. It seems the duo have something valuable—something worth killing for. Joyce’s daughter, Joanna, jumps into the fray to help the gang as they seek answers: Has someone kidnapped Nick? And what’s this uncrackable code they keep hearing about? Plunged back into action once more, can the four friends solve the puzzle and a murder in time?\";}i:5;a:5:{s:4:\"isbn\";s:13:\"9781668045879\";s:5:\"title\";s:13:\"Denied Access\";s:7:\"authors\";a:2:{i:0;s:11:\"Vince Flynn\";i:1;s:11:\"Don Bentley\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=DWODEQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:1656:\"“[A] callback to what makes Rapp such a special character, and a white-knuckle reminder of why this series remains the gold standard of the political thriller genre.” —The Real Book Spy Don Bentley completes the trilogy begun with American Assassin by taking Mitch Rapp back to his fledgling assassin days, picking up where Kill Shot ended, on a mission to save the woman he loves amid a CIA showdown with the Russian intelligence services in a new thriller from the author of Vince Flynn’s #1 New York Times bestselling series. The Central Intelligence Agency is in crisis. Following the collapse of the Soviet Union, Congress is questioning the organization’s necessity. Interim CIA director Thomas Stansfield must fight for his agency’s survival while explaining why the previous candidate for his job was found murdered in a French hotel—surrounded by booze, cash, and dead men. Worst yet, a brilliantly run sting operation in Moscow has resulted in the arrest of America’s most prized Russian asset and the expulsion of his CIA handler. With the CIA’s Moscow Station now paralyzed by the catastrophic intelligence failure, Stansfield seeks help from Mitch Rapp, a newly minted assassin in the secretive Orion program. But Rapp has problems of his own: when his Swiss girlfriend Greta’s grandfather receives a box containing the head of a former Cold War comrade along with a note promising that Greta’s head will be next, Rapp finds himself on the frontlines in a war between the American and Russian intelligence services. To protect the woman he loves and save the CIA from destruction, Rapp must be willing to risk everything.\";}i:6;a:5:{s:4:\"isbn\";s:13:\"9780316567855\";s:5:\"title\";s:11:\"The Academy\";s:7:\"authors\";a:2:{i:0;s:16:\"Elin Hilderbrand\";i:1;s:17:\"Shelby Cunningham\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=RmsQ0QEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1887:\"#1 bestselling author Elin Hilderbrand teams up with her daughter, Shelby Cunningham, to deliver a dishy, page-turning novel following an intertwined cast of characters over the course of one drama-filled year at a New England boarding school. It\'s move-in day at Tiffin Academy and amidst the happy chaos of friends reuniting, selfies uploading, and cars unloading, shocking news arrives: America Today just ranked Tiffin the number two boarding school in the country. It\'s a seventeen-spot jump - was there a typo? The dorms need to be renovated, their sports teams always come in last place, and let\'s just say Tiffin students are known for being more social than academic. On the other hand, the campus is exquisite, class sizes are small, and the dining hall is run by an acclaimed New York chef. And they do have fun--lots of parties and school dances, and a piano man plays in the student lounge every Monday night. But just as the rarefied air of Tiffin is suffused with self-congratulation, the wheels begin to turn - and then they fall off the bus. One by one, scandalous blind items begin to appear on phones across Tiffin\'s campus, thanks to a new app called ZipZap, and nobody is safe. From Davi Banerjee, international influencer and resident queen bee, to Simone Bergeron, the new and surprisingly young history teacher, to Charley Hicks, a transfer student who seems determined not to fit in, to Cordelia Spooner, Admissions Director with a somewhat idiosyncratic methodology - everyone has something to hide. As if high school wasn\'t dramatic enough...As the year unfolds, bonds are forged and broken, secrets are shared and exposed, and the lives of Tiffin\'s students and staff are changed forever. The Academy is Elin Hilderbrand\'s fresh, buzzy take on boarding school life, and a thrilling new direction from one of America\'s most satisfying and popular storytellers.\";}i:7;a:5:{s:4:\"isbn\";s:13:\"9780593498767\";s:5:\"title\";s:12:\"The Portrait\";s:7:\"authors\";a:1:{i:0;s:14:\"Danielle Steel\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=_RpEEQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:1752:\"A gifted portrait artist and a high-powered subject confront past wounds to embrace new love in this poignant novel by #1 New York Times bestselling author Danielle Steel. Devon Darcy’s reputation precedes her. As a highly sought-after portrait artist, she seems to have the ability to peer into the souls of her subjects and then capture them on canvas. But the world doesn’t know about the devastating losses she has endured, first as an orphan, then as a far-too-young widow. When entrepreneur Charles Mackenzie Taylor sees her at a New York gallery event, he is instantly haunted by her beauty and her talent. Having lost his mother when he was thirteen, and still living in the cold shadow of his late banker father’s disapproval, Charlie has given up on love. He’s resigned himself to a loveless marriage to avoid the inconvenience of divorce. But Devon awakens something in him across that crowded gallery, and she is in turn intrigued by Charlie. He approaches her to paint his portrait, and while her schedule is booked for many months before she can accommodate him, with the electricity between them palpable. When they encounter each other over the summer in the Hamptons, their connection deepens as they each release years of pent-up emotions and unfulfilled longing. But the ghosts of their pasts are not easily put to rest. Charlie wrestles with his fear of real intimacy for the first time in his life, while Devon struggles with her fear of abandonment. And after an accident endangers Devon’s career, they must decide together what their future holds. Danielle Steel’s sensitive portrait of two successful people who have built walls around themselves is a wise chronicle of the rocky path to true courage and connection.\";}i:8;a:5:{s:4:\"isbn\";s:13:\"9781638932109\";s:5:\"title\";s:14:\"Tourist Season\";s:7:\"authors\";a:1:{i:0;s:13:\"Brynne Weaver\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=lKZD0QEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1957:\"From #1 New York Times bestselling author Brynne Weaver comes a wickedly delicious new series where dark romantic comedy meets thrilling suspense—and where falling in love can be a killer. Welcome to Cape Carnage! Visit Once, Stay Forever. You can hide in the farthest reaches of the deepest hell, and I will still drag you out. Even the devil can’t save you from me. Cape Carnage is a seaside town of colorful houses, quirky shops, and an unusually high body count. But with tourists comes trouble, and Harper Starling won’t let anyone ruin her picture-perfect home. A skilled gardener with killer instincts, Harper protects her sanctuary at any cost—especially for her aging mentor with a fading memory. Troublesome tourists don’t check out of Carnage. They compost beneath Harper’s award-winning flowerbeds. But Nolan Rhodes isn’t your average tourist. Devilishly handsome, disarmingly charming, and skilled with a blade, Nolan is relentless in the pursuit of revenge. On every anniversary of the hit-and-run accident that fractured his life, Nolan slays another target. And he’s saved the best for last: the undeniably beautiful Harper Starling. The problem? Harper isn’t the monster he expected. And she won’t go down without a fight. When an amateur true crime investigator comes to Cape Carnage on the trail of a long-lost serial killer, Harper and Nolan strike an uneasy truce. If Nolan helps Harper protect her town, she’ll keep quiet about his hunting habits . . . for now. But their alliance soon spirals into obsession, one that threatens to shatter every secret in Carnage—including their fragile love. Tourist Season is a darkly funny, slow burn enemies-to-lovers romance where destruction and desire are balanced on the edge of a blade—and where love is the most dangerous battleground of all. Tropes: Small-town romance Fish out of water Grumpy/grumpy Forced proximity He falls first Touch her/him and die Groveling\";}i:9;a:5:{s:4:\"isbn\";s:13:\"9781649374189\";s:5:\"title\";s:35:\"Onyx Storm (Deluxe Limited Edition)\";s:7:\"authors\";a:1:{i:0;s:14:\"Rebecca Yarros\";}s:9:\"thumbnail\";s:58:\"https://dummyimage.com/150x200/cccccc/000000&text=No+Image\";s:11:\"description\";s:471:\"Preorder now and receive the stunning DELUXE LIMITED EDITION while supplies last―featuring gorgeous sprayed edges with stenciled artwork, as well as exclusive special design features. This incredible collectible is only available for a limited time, a must-have for any book lover while supplies last in the US and Canada only. Get ready to fly or die in the breathtaking follow-up to Fourth Wing and Iron Flame from #1 New York Times bestselling author Rebecca Yarros.\";}i:10;a:5:{s:4:\"isbn\";s:13:\"9781538772775\";s:5:\"title\";s:14:\"Circle of Days\";s:7:\"authors\";a:1:{i:0;s:11:\"Ken Follett\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=P47v0AEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1340:\"From the master of epic fiction comes the deeply human story of one of the world\'s greatest mysteries: the building of Stonehenge. A FLINT MINER WITH A GIFT Seft, a talented flint miner, walks the Great Plain in the high summer heat, to witness the rituals that signal the start of a new year. He is there to trade his stone at the Midsummer Fair, and to find Neen, the girl he loves. Her family live in prosperity and offer Seft an escape from his brutish father and brothers, within their herder community. A PRIESTESS WHO BELIEVES THE IMPOSSIBLE Joia, Neen\'s sister, is a priestess with a vision and an unmatched ability to lead. As a child, she watches the Midsummer ceremony, enthralled, and dreams of a miraculous new monument, raised from the biggest stones in the world. But trouble is brewing among the hills and woodlands of the Great Plain. A MONUMENT THAT WILL DEFINE A CIVILIZATION Joia\'s vision of a great stone circle, assembled by the divided tribes of the Plain, will inspire Seft and become their life\'s work. But as drought ravages the earth, mistrust grows between the herders, farmers and woodlanders - and an act of savage violence leads to open warfare . . . Truly ambitious in scope, Circle of Days invites you to join master storyteller Ken Follett in exploring one of the greatest mysteries of our age: Stonehenge.\";}i:11;a:5:{s:4:\"isbn\";s:13:\"9781250354921\";s:5:\"title\";s:20:\"What Stalks the Deep\";s:7:\"authors\";a:1:{i:0;s:13:\"T. Kingfisher\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=yK42EQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:516:\"The next novella in the New York Times bestselling Sworn Soldier series, featuring Alex Easton investigating the dark, mysterious depths of a coal mine in America Alex Easton does not want to visit America. They particularly do not want to visit an abandoned coal mine in West Virginia with a reputation for being haunted. But when their old friend Dr. Denton summons them to help find his lost cousin—who went missing in that very mine—well, sometimes a sworn soldier has to do what a sworn soldier has to do...\";}i:12;a:5:{s:4:\"isbn\";s:13:\"9780316597739\";s:5:\"title\";s:20:\"Crossroads of Ravens\";s:7:\"authors\";a:1:{i:0;s:17:\"Andrzej Sapkowski\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=T4xg0QEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1419:\"Andrzej Sapkowski\'s Witcher series is a global phenomenon with over thirty million copies sold and translated into over forty languages worldwide. Crossroads of Ravens is a new standalone novel following fantasy\'s most beloved monster hunter, Geralt of Rivia, on his first steps towards becoming a legend. Witchers are not born. They are made. Before he was the White Wolf or the Butcher of Blaviken, Geralt of Rivia was simply a fresh graduate of Kaer Morhen, stepping into a world that neither understands nor welcomes his kind. And when an act of naïve heroism goes gravely wrong, Geralt is only saved from the noose by Preston Holt, a grizzled witcher with a buried past and an agenda of his own. Under Holt\'s guiding hand, Geralt begins to learn what it truly means to walk the Path - to protect a world that fears him, and to survive in it on his own terms. But as the line between right and wrong begins to blur, Geralt must decide to become the monster everyone expects, or something else entirely. This is the story of how legends are made - and what they cost. Witcher Story Collections The Last Wish Sword of Destiny The Witcher Saga Blood of Elves The Time of Contempt Baptism of Fire The Tower of Swallows Lady of the Lake Standalone Witcher Novels Season of Storms Crossroads of Ravens The Hussite Trilogy The Tower of Fools Warriors of God Light Perpetual Translated from original Polish by David French\";}i:13;a:5:{s:4:\"isbn\";s:13:\"9780802165176\";s:5:\"title\";s:15:\"Heart the Lover\";s:7:\"authors\";a:1:{i:0;s:9:\"Lily King\";}s:9:\"thumbnail\";s:101:\"http://books.google.com/books/content?id=Udwc0QEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api\";s:11:\"description\";s:1952:\"\"Lily King has written another masterpiece. This book overflows with her brilliance and her heart. We are so lucky.\" --Emma Straub, New York Times bestselling author of This Time Tomorrow From the New York Times bestselling author of Writers & Lovers comes a magnificent and intimate new novel of desire, friendship, and the lasting impact of first love You knew I\'d write a book about you someday. Our narrator understands good love stories--their secrets and subtext, their highs and free falls. But her greatest love story, the one she lived, never followed the simple rules. In the fall of her senior year of college, she meets two star students from her 17th-Century Lit class: Sam and Yash. Best friends living off campus in the elegant house of a professor on sabbatical, the boys invite her into their intoxicating world of academic fervor, rapid-fire banter and raucous card games. They nickname her Jordan, and she quickly discovers the pleasures of friendship, love and her own intellectual ambition. But youthful passion is unpredictable, and soon she finds herself at the center of a charged and intricate triangle. As graduation comes and goes, choices made will alter these three lives forever. Decades later, the vulnerable days of Jordan\'s youth seem comfortably behind her. But when a surprise visit and unexpected news bring the past crashing into the present, she returns to a world she left behind and must confront the decisions and deceptions of her younger self. Written with the superb wit and emotional sensitivity fans and critics of Lily King have come to adore, Heart the Lover is a deeply moving love story that celebrates literature, forgiveness, and the transformative bonds that shape our lives. Wise, unforgettable, and with a delightful connective thread to Writers & Lovers, this is King at her very best, affirming her as a masterful chronicler of the human experience and one of the finest novelists at work today.\";}i:14;a:5:{s:4:\"isbn\";s:13:\"9781668057704\";s:5:\"title\";s:13:\"Widow\'s Point\";s:7:\"authors\";a:2:{i:0;s:15:\"Richard Chizmar\";i:1;s:12:\"W.H. Chizmar\";}s:9:\"thumbnail\";s:111:\"http://books.google.com/books/content?id=BWODEQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api\";s:11:\"description\";s:1824:\"New York Times bestselling author Richard Chizmar, “one of horror’s indispensable writers” (Paste), and his son W.H. Chizmar, critically acclaimed author of Them (hailed by New York Times bestselling author Josh Malerman as “one of the best debuts I’ve ever read”) present a riveting found footage narrative about doomed thrill-seekers trapped in a haunted lighthouse. “This is a bad place. I don’t think people are meant to live here.” Longtime residents of Harper’s Cove believe that something is wrong with the Widow’s Point Lighthouse. Some say it’s cursed. Others claim it’s haunted. Originally built in 1838, three workers were killed during the lighthouse’s construction, including one who mysteriously plunged to his death from the catwalk. That tragic accident was never explained, and it was just the beginning of the terror. In the decades that followed, nearly two dozen additional deaths occurred in or around the lighthouse including cold-blooded murder, suicide, unexplained accidents and disappearances, the slaughter of an entire family, and the inexplicable death of a Hollywood starlet who was filming a movie on the grounds. The lighthouse was finally shuttered tight in 1988 and a security fence was erected around the property. No one has been inside since. Until now. Told across two harrowing incidents from 2017 and 2025, those who enter the Widow’s Point Lighthouse searching for supernatural proof and the next big thing find themselves cut off from the outside world. And although no one has recently stepped foot inside the structure, they are not alone. In this remarkable collaboration, father and son writing team, Richard and W.H. Chizmar combine forces to tell a terrifying ghost story that will make you think twice about what’s waiting for you in the dark.\";}}', 1760299441);

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
(4, 4, 7, 92.00, 7, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-09 09:02:03', '2025-09-11 09:02:03'),
(5, 5, 8, 80.00, 3, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-05 09:02:03', '2025-09-11 09:02:03'),
(6, 6, 9, 71.00, 4, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-07 09:02:03', '2025-09-11 09:02:03'),
(7, 7, 10, 43.00, 8, 'waived', '2025-09-16 15:47:24', 'Test fine inserted via seeder', '2025-09-04 09:02:03', '2025-09-16 15:47:24'),
(8, 8, 11, 24.00, 2, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-05 09:02:03', '2025-09-11 09:02:03'),
(9, 9, 12, 45.00, 8, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-08 09:02:03', '2025-09-11 09:02:03'),
(10, 10, 13, 97.00, 9, 'pending', NULL, 'Test fine inserted via seeder', '2025-09-03 09:02:03', '2025-09-11 09:02:03');

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
(1, 'Standard Late Fee', 5.00, 0, 100.00, 1, 'Standard late fee of ₹5 per day with maximum fine of ₹100', '2025-08-02 13:50:15', '2025-08-02 13:50:15'),
(2, 'Student Late Fee', 3.00, 1, 50.00, 1, 'Reduced late fee for students with 1-day grace period', '2025-08-02 13:50:16', '2025-08-02 13:50:16'),
(3, 'Premium Member Late Fee', 2.00, 2, 30.00, 0, 'Special rate for premium members with extended grace period', '2025-08-02 13:50:16', '2025-08-02 13:50:16'),
(10, 'Standard Late Fee', 5.00, 0, 100.00, 1, 'Standard late fee of ₹5 per day with maximum fine of ₹100', '2025-08-05 10:08:36', '2025-08-05 10:08:36'),
(11, 'Student Late Fee', 3.00, 1, 50.00, 1, 'Reduced late fee for students with 1-day grace period', '2025-08-05 10:08:36', '2025-08-05 10:08:36'),
(12, 'Premium Member Late Fee', 2.00, 2, 30.00, 0, 'Special rate for premium members with extended grace period', '2025-08-05 10:08:36', '2025-08-05 10:08:36'),
(13, 'Standard Late Fee', 5.00, 0, 100.00, 1, 'Standard late fee of ₹5 per day with maximum fine of ₹100', '2025-08-05 11:46:20', '2025-08-05 11:46:20'),
(14, 'Student Late Fee', 3.00, 1, 50.00, 1, 'Reduced late fee for students with 1-day grace period', '2025-08-05 11:46:20', '2025-08-05 11:46:20'),
(15, 'Premium Member Late Fee', 2.00, 2, 30.00, 0, 'Special rate for premium members with extended grace period', '2025-08-05 11:46:20', '2025-08-05 11:46:20'),
(16, 'Standard Late Fee', 5.00, 0, 100.00, 1, 'Standard late fee of ₹5 per day with maximum fine of ₹100', '2025-08-05 11:46:27', '2025-08-05 11:46:27'),
(17, 'Student Late Fee', 3.00, 1, 50.00, 1, 'Reduced late fee for students with 1-day grace period', '2025-08-05 11:46:27', '2025-08-05 11:46:27'),
(18, 'Premium Member Late Fee', 2.00, 2, 30.00, 0, 'Special rate for premium members with extended grace period', '2025-08-05 11:46:27', '2025-08-05 11:46:27'),
(19, 'Standard Late Fee', 5.00, 0, 100.00, 1, 'Standard late fee of ₹5 per day with maximum fine of ₹100', '2025-09-11 08:56:56', '2025-09-11 08:56:56'),
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
(9, 106, 1, '2025-10-12', '2025-10-26', NULL, 'approved', '2025-10-12 14:30:36', '2025-08-11 19:16:19', '2025-10-12 14:30:36', 1, NULL, NULL, 0, NULL),
(10, 76, 1, '2025-08-12', '2025-08-26', NULL, 'pending', NULL, '2025-08-11 19:26:35', '2025-08-11 19:26:35', NULL, NULL, NULL, 0, NULL),
(11, 105, 17, '2025-09-16', '2025-09-30', NULL, 'approved', '2025-09-16 17:06:50', '2025-09-16 15:43:13', '2025-09-16 17:06:50', 1, NULL, NULL, 0, NULL),
(12, 104, 1, '2025-09-16', '2025-09-30', NULL, 'pending', NULL, '2025-09-16 15:45:05', '2025-09-16 15:45:05', NULL, NULL, NULL, 0, NULL),
(13, 74, 1, '2025-09-16', '2025-09-30', NULL, 'approved', '2025-09-16 17:06:42', '2025-09-16 16:49:41', '2025-09-16 17:06:42', 1, NULL, NULL, 0, NULL),
(14, 105, 1, '2025-09-23', '2025-10-07', NULL, 'approved', '2025-09-23 10:04:20', '2025-09-16 16:50:48', '2025-09-23 10:04:20', 1, NULL, NULL, 0, NULL);

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
('0kOHeW7DD3aXiO2BwXIEwMmprvHEgWyflrjUzBWq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkt3WmNjUG0zUHRKUUZXUG5Fcml4YzRoSmZ6cW9UWDh0bkRvcmViWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280984),
('12MfihHBU7r1R2BcYeo3251b9eR2peAsUChYEZdw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ01iQW1BeEl5b3hoa25Sa3RTSTVRb0RTc2taODQ0UmVDTkhkS2x6NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280874),
('1Er7w2Ra2Rfe0hyGWko8Jsc9EkzYeKkufGiQXCae', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRG5JNEs0aEVlSzRIQlhmU3BrZDRKSEMwemF3cGJ3Vzd5Nm56aXJtQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280106),
('1ixLE58X61UN8xCzuHOdemSZcGLbDRTxUkB7AE3g', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWhTREpGaXNjRzlLVWVrRWxuNVBqWVVSVkJYZVZxZ0w4SlBTWGpubyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279905),
('1V4BPakAGUkduSs3MFaHXETsSPZluwVde4FlrRPk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEE5Q0pBdWpDcThJTEc3QmlkT2NhNlZTS2Mzb1htUmNqOEdHZlJtSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760278569),
('2c1sGTXVG6oXJ5tZJeR781dlp48OGyg4uQY2qpDK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXFVTXRuRkNvZEZNQmpQYkRtMEcyUjNpTFNPREJsbUtKbU1FRmNWdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279836),
('2G4lrV3rWAKuyl91o6DoS6nN9T9eN2qSj6wqQoQ6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEZaYmZvRkh4djhhWjRPQTlyMEF0SzNsdXVSQmp3dlhZSTRQSWQybSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281187),
('3aN5hk8MYxmz6IuqfqRj03b4y7ZQuR4kdeMKdtwE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1A3c2tNSTZNejBHeThoWWJ5N1lBdnJpT3lsdGRySVlVamZoeThncSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279830),
('3iaUMSMQJZ0rgSOP2Dnruxg2ET2FPmj679lbzVY0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFhDMkk2T2hpS3BlM05YMDdTN0xkSXlBWlo4d0pZbWxqUGRGaUk0eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279843),
('3qIuAQ4UlPWcEVGVQbSWo3v3wGzksvTk0Kr0CwPX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEllWFZxVzVZTlhubVAzbnJUWUI0Uzd3aU5hOWtxOTViNVM3Q2E2RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280661),
('3WTXRxPNCtvAs6pdp5mUs5fnhBYA5jKRR89dKiYS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzI2bnJPOTFHMmxpdEhnSjhRQUYyeFpQMUFTSGhkejB4MFROeHlvSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279877),
('6YogXKPoiOSYyuq79ifFX35JNVXEKiQvOsEZYxaV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGpPb291U0xMMTExc3ZLdnVQbGZWaHB4NmVYM1llN2tHSGJGSWlxUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280826),
('7dW2uBYtIqnmEo1KhgFu8mgHbK8Di7Lv67eTWbLr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVk5rb0FXdGxqTG1rclN0WmF3ZnJmVmFORGdJdFdPUkptZlVuOVNjMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279783),
('8jujeTSSztmTrxU4gw7CDeKtvXeZNdAlYAykr8DF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXZjRTk2VkNkUmFKYXJ3ZllUNjRzNzlVcHFOQ2t1a3JFSDZnY3RDOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280851),
('97prM0Z8CrpbkRSdXI18dEwpcu9YeM5cbfx9iP1s', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1FlTjJYTVVlS2x3b0dZMHZBWVliT0gzYW4yS3JIc3FGbUEzVVF5TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280828),
('B1qlajjn8MuR4LOUMC8EgCnZU7sOtgE8CYPxJeyM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWJEOU90UVBrWUdoSGVkU2tKODBWV3JVT25YUnBPZTA4NjVVMWkyMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281120),
('Be2Q5STzuRVr6BaG3f7vlKssZzgKzMnPJ6QEmnAb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFRsYnkxRzIwUWFxTjdIQ3Y3bVF1V2xGNkRVSzF5S3EwT1I2R3NrQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279900),
('CFjCmrO3AO2K2JnnebsQJ6ozW0Hqcp44HFEJ8xP1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjIyYXpuRWlNQ0VpQzhoc0ZDVnVvTHp4ZFRTcHdaclhDdE1NWHA4eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279903),
('CrbH2DKVRJsfDIvidhcvtvK41VcOKW0fzN2OIqSK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkJCYVBwUEZNblVSSTVYSTRQMGIwSzA3b1RVanlETm1MQTRtZFAzYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280657),
('dP09JyVtRMeKnjki2CYUWNcGmnQRBDP6sspWxFs7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWtXQTlJcDFsN0VXQ0pPSUVsenJISFpMSzlvM1o2STdsVG11Z3k3OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281031),
('DZcDAViqzwK7vLykYsQUXW6iT2gowWA8UZOM5S9B', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0k2bFVzV3haZHc2Z2tOSjEzUTRIUE9rQnN2V2o3ZXduSHQ4dm9lQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281119),
('e233NV6N5052Q41ghRH0ifuciYIJWkjCe65pW1nt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTcyeGdBbXVvcGtFeVBLVEpzcTM1R01DSXU5bnBBZmFzemZuZUtURCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280867),
('eFFR7FdZxsxTMSOssu1Vtn15vdnlyavXFzkQVPfv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0tIWHk4WWVORDVtb3FjcFZYSFZEVTFWSWVVU3F5bWZ1NmgzWTF3UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760278608),
('EmAZJKx2Lnto3mYG0jKprmgr0oC9feHieLHzgfli', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnRzZExoUnhXaFJtelNuN2plR0t0QXFyenVNYWp3R1hJODN4YTByWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279840),
('eqfI4t4KiOJsymDi1oPL3GA9kgD52ObONWTUVa85', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWpTdTROUVZtd0tqcjJrc2ZvY0dac0dvc1o1VEdIbGNlMEZXWlZIMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280622),
('FIjkjqC1NMUKCOjR0ynDnBviwJfmfKH5MN7dckil', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlZTME5xUGh3aGJKa1BuWGFWZzZlcWtNeHR3MzV0QkhRN29ZdlIxMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280119),
('GhIb80jRtkJ4poHQU61LrYFrE5e8ESB81TpgLOL1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzFnMGx3MjZqZ09EUTdhdGJCbUdPcXFVRTZjaDNLV1BIVVhyaVJPcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279833),
('HiSbudRngyu1TF2wHPdrYtMMOKIRsjNogpYzGsdW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUxTQkF4U0lIVmlqcGZpenVSd21wSE1Ba0FSWjFQSFRtMXJwM0tFMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280865),
('Hly1vvJ7AVvKZI4y6LxLg7ZunzEvxFUZM7KNTAVi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnRyRnA0SkI0WjFtOUFxQnZrOEtwY1FQNUJ6M3pKZ1BZMU5WZVl5NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279857),
('I3jX1fLPBBErmee2uUEB9zx0fdn2vc5x6ALNusnq', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibzNWV1BIT0hEa1JtVHhRZVQ2ejB4Y3Zvcll5aVJUODhWMEVNUXdtWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1760281448),
('iiaWK8zgriPPP8kCnyPkQcqKzh5ZGxsQ9i3iu4Sh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFlPS2VaempGa3hObXU5a0FWcXhVU2thZXNBT1pGNUZWSWRTWUpTZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280723),
('IIQylEG4JYiDcu08z1BYDb1U2yD5rDRT0evTs1Wn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnh0bnZ0ZXZVU3pWbDloN2J2QTB5VkxMR2p4RE53RE02UWxKT2ZGNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281310),
('IoJc8ApUFfvo5XmaJOTgXpwY77t9TNRPJG6Cg8nZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHVpTTRTUzZqa3Y2NFA3U1BKeG45YjFmd2NRb1dySGhhT0k3NkFhNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280114),
('JaqzKxSbrSQCi9jB9LsUFz8FoyiSrmkqI4XfNev1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWIyVGJEV1BQZ00wVnViVFBmNjcwd2Nmc29oNjVIdWtROTZGVnh3MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280107),
('JkQNCjooFekPWW8pi3MUGLe9nUoNUfJTaeEikAzE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFRhSjRVV2s5YXFNcGRtc0V0a1BsMTdFWG9qYTh4OVZhdnMxN0c4TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280987),
('jZDHWg5vhuGkbfpjtXig9VeVTT9UvTnx7ozZYJxn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkRFUm8xbTVZVTJmWnFLcnAxTWJjWkFXeHZ3Wm9YWTBrZ05YYjFtZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280015),
('KsQfPZqJ5VeMXJwFQLeqdCukhML7Mt9pF9OXUFbB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTk90TTE4Y05XY2dmajc4em9JdEVwNG9Lb0VxeGpmcjZHSFhFZVNzMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280103),
('lAoNisBMTwK94zFW5dBEp1dbsbZPncdmzy6NlJwe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2NSbXVVbDlBTWFOUUhoN0J1NVRRdVNyblBhOXgydDRZNW9vYmYzQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279781),
('lCcRaPghzClbh6bOWaSJtOzhDyqRtqrA8cTVfgBP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUkzNmJtUHhuOUZlcXhxUVZiekhsT0w2MW4yclpyaDRMNUdaZmlJUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279791),
('lDI59ZYxIjTGpKTe89n417DIdjLV3IC0YZxBCaX9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmxhY3hnREV3eUliVWx5U0RCSHowSVFmWkZ0V0lkUjd0dXpWSmxMYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281293),
('LzPQauTGcREHBekmTFDuCimUmDCe9weSGgYA6oUZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWpTbkFqaVhmbXUwWmtua1cyUVZHM0dHODV0YnV2bWxHakxSWHkxSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281316),
('Mh3YD43vS6aLXXem8inwgRugMq8QK7lK52PEHwon', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicThrTVQ1U1RmUURnZkZpNmY0eXVWRHJpZ01TbzZHbDRKcGRRWTdsayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280727),
('mkyplYpVcS3zxopSG8arn3SGymbGuCty5FhalWYQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiME5ScUtZamNBOWhUMXZOTmkxY3NMQkhNYXlFTk1xMzd1MjJ5aVV0OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281190),
('mxFHF9W0Ot0LtKhOJI1eJoqkQrxIJwBZ6KWBzVHG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGZpVTdpbEU4R0wyRk5VV3dOdVlVYkV6a3RYUjFyNXhDQld0T3VQTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279885),
('N9KuqA0k4Xn4O2Qavne2zK4R2VOIXL0kLurdyvol', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUhCcTBJdUFacG5ZQzVMd05ZOVNCQmVmTFZ5WDRRbzc2Y0xuS01ScyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279896),
('nd4anxjqJZx7LvJef1a8b6jH06QreXWJNzG3YCLJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGlFRkNRQ0FUTG9rdlZ2S1Z3bWdablNZaG5xTG5raGJLZHo2UTlVViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280118),
('NISun9z3gCIHqJFtH8eVoqip1qoIMEOWnGebCdFp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3BmWWhBdlF2MU1vN1JHRUFEZmJuYVVGRHlLYVNsdzliYjZFb2Z0ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280115),
('Np4tZXjahR0vxHSJeIiannr3WmcHjVv9bDFS9uD8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1c3QVFVMkRGUWNqeTJBelFHV2JNVnZ3Um1FbHZuMG5rdFlMaGtGYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280001),
('NRthVxUqtsyrKckaiaQhi6qnxL3JtVIJ1YtPl2bj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0NyUFhtQ1luWWw2N2F6eTJUZTBLM1ZiallhcWdTOWdFYmNNbER0TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281086),
('oFUIiT40hD9ldlgHsvc5m0eBlCukOVGz7wCagSTB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTJkODN6V2Qwd0xrREpOWXJDdDVuY2ptNldOdXpjSnpPRTFKZURxVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280878),
('oiQuRB9MXCZKeXp3cxdGTOR17IwzjzNFyndbn556', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVldIN3hQam9iMjlvVVVXcHU1VjBmTWFkbGNvMjNMR0Y5a0l2ejh5MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281073),
('oqsAiAITUhJTRrGq3mO9abFbZh4vFxS8eFm3ErTG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkF4MWxhWHBkS2J5VXlXRzZzWFQzQUxZR1NwbE5JUldBcW9RZm5hTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281034),
('pxpS9HFSU3uZ0qkbdPUGEadr5oRuzE3IivZhHgKX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDZ4N1hMWUZGWUQ0cmY2YkEzcHhUTjZWMTJLZ0ZSWVdMVkxvTUxKdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280093),
('Rksesh0FpGKkuwpTGfqXu6dOdTeKgUtegBW647Qa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlhuYkJUODZCeTBTa2I1OUFmZ2RLVFRDbUFBWHVlODFOenJaWHNNYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280102),
('RuLk1yMUl1NPdQ4PV2SQPmKVPPCs9tCWshmQnql4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWo4b0thUTZCRER1Umt3aEZHeGN4NGJZNU5sUTZwVjFUNjJPYWppWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279839),
('skpHQHaLtCjTdKDm4jNsy9EKjdAaFjbSMi7sQCoC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTViQllVR3J5TThSOWdQNUQwbmt2SWFDVTNMcXh3ZjN4cm9JdHl2TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280629),
('sW0yjp9rk5gEETTAe35DSiDYIXNtder5pucI7RU1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXZ2cHNtMGRLUHB0UTl6YXhqUEtYWUdYOTM4dm9VT04zcGZ1YVp5cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280117),
('T0D9ro7bKnVnsVKK4Ti7kcuFglGcnuvSzmamU0bK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMG14Y0RoZklJbFJmcUphR05TQmZSMUdsdE41bmV3RjVIRkRiQmZHRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281298),
('tyGjXy4JojYV1wpELWvIkn32PEioqDgtEJEvN5rt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEEzWkJEdHZYWWZhOWR1TkdmTEpNR2w4a3VzZ2V2OG1LczJUUzRWWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760277847),
('ueBYz03X3hXnY8OXXTNuoy0PCph6PgD1S8Joaxse', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaE5XZGpBbkFIaUR6Vm5zZEJJaE9uTnc5R2dLTUFneWRQSWJHOXFkTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280093),
('UStAqH2LD5M6XTNN575xVLg3sZAfKJiVeWZWFOiv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjZVN3g5N1FQdENtUGo0WlZURjFLSkQ4WTVGdktMRk40aFV2UXcxUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280894),
('V1iEHuIbdxtZaopfspjHXDHfTmtdXdAItvPXoW1l', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUFNYlcxYzFPdG5rWEh5Q3A4czFKQWZ5OUxUaUtMSmxOOHdTVHJnWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280820),
('VEKhCdxavn1ggIGQlsCtlWBveGW39DMECyN0jdS4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3kya0tGZWdVcThxQkZmWlZnbHdtV3AyTDVMWjdYQjlIWEg3V0tVOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280896),
('vjpYY84PgG7Ii0WfZweEl6wPZgTL6dgJZeg0LC89', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaG5sWnBzR2E1U1d1Z1RDVnFxbUtwWkV3Y3NNd2Y0SjZ4cXhMV1lXZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280114),
('vOywi5NJPKaR7Ql6qSslqGk4XEmGsGOjOsbV3YXs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaU9vemY2N1lhcGltVVZYT09xRVJLbHRQUzV0bTNUNjJRald4Tlp2VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280848),
('vPQUZsAP7dKJY6dFImEM79htIQTWYLjQi7kjsPm0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEF0d3hrbksxbEdsaDl1Z1BocTZWdmg0bVpQZVVINkxCdnNJazBpayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281061),
('vs6Q38s0cvQJUeD9SqwQaKCdUNkQmlZrbtmI5uw1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiME5GVTZxMk0xc0NtdVpRVFJkRjhSemMwY0RRSGFYZXZRc0JaV0IwNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279727),
('W01kRAkwHmzT0dYB3Bvqh8JcsqUNyrAYGkv5QpnA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0M0N0JnUG5pazAzdWF6bm9NRU1uQktGTkJ0Z2l4YVRrMU9vVUNHVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760277861),
('WfhearAYPV2cmABhUeunVyOCvNSpaGHIWWtUJCOv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVB1R210dDNIemJUbmQ2NGQ1Y2U0bFI5Uzl3TDFJSnZPQW1Sb0R6cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760277856),
('Wu5ME3bjkye7mqaKb88aSXUCMMmppSanFPmYzNei', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOW0zZnU5UWFzTUdVZ2FCdGY5QmdhMURSMTFwdFNFdzZMQjZVdDdIWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280753),
('x0UFnVcwswIGtZtjdFdwesr1TZUxB1VCWTaOeLxk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFJ5U093em5xbTlySTBCd2NTcUk0S01NNDRIell5NndBTzBISG5CRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760279812),
('YMeV5SeDwD8HMqCU6M9lGPLaRCfzXPJUT52bjKjC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkU3OUsxNnAxRnM1TWtqZFhDRkNFVkRjdDhSdUxlTHZVWUJ5RDk1YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280011),
('YtzZIijJsaqPHaQQdH6j3laDnC5mfIIGDtQRx87D', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3V3WTBZRVN2aGlvSUF1Zk1lanlWVkZZUkJSbW1hVjZITUxuZVYwZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280816),
('YW1BZx9NaPT4v1EVTn8sa6PzygW3lUyNyUAEisvT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWE1WRFNyQThFZndCTTAwVGJpS3hzWDZzQ2ljNVp5YkU1SDdGZFZWdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760277847),
('ZHBYAf8Zy6N9Cf6m3mQWXns2Y2gIxqSdalZkEgwM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSE5td1diQ2FFaVBNeHBkV1lGYktaYmNPeU1HYmcxT0ROZk4wcXdYUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760281059),
('ZOwdjJPOnoPLvtpcu4GkCRl9AZN76CGLlLHXHbYY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.20.2 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFU0VlFKTXB3QWEwbUZRbThGZkFjb0F6ZHVSYUpvbDFBZ2ZYTXRVUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9saWJyYXJ5X21hbmFnZW1lbnQtZmluYWwudGVzdC8/aGVyZD1wcmV2aWV3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760280756);

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
(1, 'Joel Raju', 'joelraju2005@gmail.com', '', '', '2025-07-17 12:53:51', '$2y$12$jZSvQO59UXs9xpphIMYd6uuCmzpUBSf94h4Bl3Nnw/2fHdep9.CNq', '', '2025-07-17 12:53:26', '2025-07-17 13:19:12', 'admin', 'active', NULL, NULL, 3, 14),
(4, 'Joeta Raju', 'joeta202429@gmail.com', '', '', '2025-07-24 10:58:20', '$2y$12$ydx.xDOQW6szzD7kRjzFg.jZXDQ.ebMaoYQ7sXxoSXwpIiH979lF2', 'qMkw4XX57REBuMpUyESEJbnFbHi8jvrGWwJ1wppyX814U66nKlEpf449xl5z', '2025-07-24 10:56:10', '2025-09-16 15:44:55', 'user', 'active', NULL, NULL, 3, 14),
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
(18, 'User', 'user@gamil.com', '8754842565', 'Hoeelllll', '2025-09-16 09:06:57', '$2y$12$bBzBni5i8O2HRYXahXs4MOBoJ1Q8lhixdfbeeH6jrXit7zw5L0P4u', NULL, '2025-09-16 09:06:44', '2025-09-16 09:17:43', 'user', 'active', NULL, NULL, 5, 14);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
