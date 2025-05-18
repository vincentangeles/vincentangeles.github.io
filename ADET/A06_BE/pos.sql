-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2025 at 04:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryID` int(4) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `name`) VALUES
(1, 'Rice'),
(2, 'Dish (15.00)'),
(3, 'Dish (20.00)'),
(4, 'Dish (25.00)'),
(5, 'Dish (30.00)'),
(6, 'Dish (35.00)'),
(7, 'Dish (40.00)'),
(8, 'Dish (45.00)'),
(9, 'Dish (50.00)'),
(10, 'Dish (55.00)'),
(11, 'Drinks'),
(12, 'Today\'s Special');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` int(4) NOT NULL,
  `categoryID` int(4) NOT NULL,
  `name` varchar(40) NOT NULL,
  `isAvailable` varchar(6) NOT NULL DEFAULT 'true',
  `code` varchar(20) NOT NULL,
  `price` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `categoryID`, `name`, `isAvailable`, `code`, `price`) VALUES
(1, 1, 'Fried Rice', 'true', 'FR', 40),
(2, 1, 'Tinapa Rice', 'true', 'TR', 50),
(3, 1, 'Egg Rice', 'true', 'ER', 45),
(4, 1, 'Half Rice', 'true', 'HR ', 20),
(5, 11, 'Gulaman', 'true', 'GLMN', 60),
(6, 11, 'Iced Tea', 'true', 'ICDT', 60),
(7, 11, 'Lemonade', 'true', 'LMND', 60),
(8, 2, 'Egg', 'true', 'EGG', 15),
(9, 2, 'Hamonado', 'true', 'HMND', 15),
(10, 2, 'Longganisa', 'true', 'LNGS', 15),
(11, 2, 'Okoy', 'true', 'OKY', 15),
(12, 3, 'Gyoza', 'true', 'GYZ', 20),
(13, 3, 'Siomai', 'true', 'SMI', 20),
(14, 3, 'Shanghai', 'true', 'SHNG', 20),
(15, 3, 'Ham', 'true', 'HAM', 20),
(16, 3, 'Tuyo', 'true', 'TYO', 20),
(17, 4, 'Hotdog', 'true', 'HTDG', 25),
(18, 5, 'Tofu Togue', 'true', 'TFTG', 30),
(19, 5, 'Embutido', 'true', 'EBTD', 30),
(20, 6, 'Talong with Alamang', 'true', 'TAW', 35),
(21, 6, 'Omelette', 'true', 'OMLT', 35),
(22, 6, 'Mix Veggies', 'true', 'MV', 35),
(23, 6, 'Tokwa at Baboy', 'true', 'TKB', 35),
(24, 7, 'Sisig', 'true', 'SSG', 40),
(25, 7, 'Grilled Atay', 'true', 'GRDATY', 40),
(26, 8, 'Bangus', 'true', 'BNGS', 35),
(27, 8, 'Calamares', 'true', 'CLMRS', 45),
(28, 8, 'Chicken tapa', 'true', 'CHKTP', 45),
(29, 8, 'Tortang Talong', 'true', 'TRTTL', 45),
(30, 9, 'Pork Tapa', 'true', 'PRKTP', 50),
(31, 9, 'Savory Squid with Tofu', 'true', 'SSWT', 50),
(32, 9, 'Teriyaki', 'true', 'TRYK', 50),
(33, 10, 'Fish Fillet', 'true', 'FF', 55),
(34, 10, 'Beef Tapa', 'true', 'BFTP', 55),
(35, 10, 'Lechon Kawali', 'true', 'LCHKWL', 55),
(36, 12, 'Chicharon Bulaklak', 'true', 'CCHBLK', 65),
(37, 12, 'Grilled Liempo', 'true', 'GRDLMP', 65);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
