-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2020 at 12:26 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `billing`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand_master`
--

CREATE TABLE `brand_master` (
  `brand_id` int(20) NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand_master`
--

INSERT INTO `brand_master` (`brand_id`, `brand_name`, `added_date`) VALUES
(1, 'AMUL', '2020-02-08 16:00:28'),
(2, 'ARUN', '2020-02-08 16:00:36'),
(5, 'HERITAGE', '2020-02-08 16:06:02'),
(4, 'HURTSAN', '2020-02-08 16:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `category_master`
--

CREATE TABLE `category_master` (
  `category_id` int(20) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_master`
--

INSERT INTO `category_master` (`category_id`, `category_name`, `added_date`) VALUES
(5, 'BUTTER', '2020-02-08 16:04:22'),
(3, 'CREAM', '2020-02-08 15:58:39'),
(2, 'GEE', '2020-02-08 15:58:34'),
(6, 'ICE CREAM', '2020-02-08 16:04:50'),
(1, 'MILK', '2020-02-08 15:55:44'),
(7, 'PANNER', '2020-02-08 16:08:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand_master`
--
ALTER TABLE `brand_master`
  ADD PRIMARY KEY (`brand_name`),
  ADD UNIQUE KEY `brand_id` (`brand_id`);

--
-- Indexes for table `category_master`
--
ALTER TABLE `category_master`
  ADD PRIMARY KEY (`category_name`),
  ADD UNIQUE KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand_master`
--
ALTER TABLE `brand_master`
  MODIFY `brand_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category_master`
--
ALTER TABLE `category_master`
  MODIFY `category_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
