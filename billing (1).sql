-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2020 at 12:26 PM
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
(4, 'HURTSAN', '2020-02-08 16:05:29'),
(6, 'UNCLE JOHN', '2020-02-10 12:55:47');

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
(6, 'ICE CREAM', '2020-02-10 12:54:22'),
(1, 'MILK', '2020-02-08 15:55:44'),
(7, 'PANNER BUTTER', '2020-02-10 12:55:17');

-- --------------------------------------------------------

--
-- Table structure for table `customer_master`
--

CREATE TABLE `customer_master` (
  `customer_id` int(20) NOT NULL,
  `customer_name` varchar(250) NOT NULL,
  `gst` varchar(20) NOT NULL,
  `address_1` varchar(250) NOT NULL,
  `address_2` varchar(250) NOT NULL,
  `address_3` varchar(250) NOT NULL,
  `address_4` varchar(100) NOT NULL,
  `added_by` varchar(30) NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_master`
--

CREATE TABLE `product_master` (
  `product_id` int(20) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  `product_barcode` bigint(20) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `p_rate` float NOT NULL,
  `s_rate` float NOT NULL,
  `uom` varchar(20) NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_master`
--

INSERT INTO `product_master` (`product_id`, `category_name`, `brand_name`, `product_barcode`, `product_name`, `p_rate`, `s_rate`, `uom`, `added_date`) VALUES
(6, 'BUTTER', 'AMUL', 544, 'aaaa', 100, 120, 'nos', '2020-02-13 00:00:00'),
(3, 'BUTTER', 'AMUL', 1111, 'vanila-100ml', 0, 0, 'nos', '2020-02-14 00:00:00'),
(8, 'BUTTER', 'ARUN', 4564654, 'bjbb', 100.5, 110.5, 'nos', '2020-02-20 00:00:00'),
(7, 'CREAM', 'HERITAGE', 12345678, 'abc', 11, 20, 'nos', '2020-02-13 00:00:00'),
(9, 'CREAM', 'AMUL', 1234567890123456789, 'aaaaa', 10.5, 10.78, 'nos', '2020-02-21 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_stock`
--

CREATE TABLE `product_stock` (
  `sno` int(20) NOT NULL,
  `document_no` int(20) NOT NULL,
  `entry_type` varchar(2) NOT NULL,
  `product_id` int(20) NOT NULL,
  `qty` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_bill`
--

CREATE TABLE `purchase_bill` (
  `pr_invoice_no` int(20) NOT NULL,
  `pr_invoice_date` date NOT NULL,
  `supplier_id` int(20) NOT NULL,
  `supplier_name` varchar(250) NOT NULL,
  `invoice_amount` double NOT NULL,
  `added_date` datetime NOT NULL,
  `note` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_bill_detail`
--

CREATE TABLE `purchase_bill_detail` (
  `pr_invoice_no` int(20) NOT NULL,
  `pr_invoice_date` date NOT NULL,
  `supplier_id` int(20) NOT NULL,
  `product_id` int(20) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `qty` int(20) NOT NULL,
  `p_rate` float NOT NULL,
  `total` double NOT NULL,
  `note` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_master`
--

CREATE TABLE `supplier_master` (
  `supplier_id` int(20) NOT NULL,
  `supplier_name` varchar(250) NOT NULL,
  `gst` varchar(20) NOT NULL,
  `address_1` varchar(250) NOT NULL,
  `address_2` varchar(250) NOT NULL,
  `address_3` varchar(250) NOT NULL,
  `address_4` varchar(100) NOT NULL,
  `added_by` varchar(30) NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `customer_master`
--
ALTER TABLE `customer_master`
  ADD PRIMARY KEY (`gst`),
  ADD UNIQUE KEY `customer_id` (`customer_id`),
  ADD UNIQUE KEY `customer_name` (`customer_name`);

--
-- Indexes for table `product_master`
--
ALTER TABLE `product_master`
  ADD PRIMARY KEY (`product_barcode`),
  ADD UNIQUE KEY `p_id` (`product_id`),
  ADD UNIQUE KEY `product_name` (`product_name`),
  ADD KEY `category_name` (`category_name`),
  ADD KEY `brand_name` (`brand_name`);

--
-- Indexes for table `product_stock`
--
ALTER TABLE `product_stock`
  ADD UNIQUE KEY `sno` (`sno`),
  ADD KEY `p_id` (`product_id`);

--
-- Indexes for table `purchase_bill`
--
ALTER TABLE `purchase_bill`
  ADD PRIMARY KEY (`pr_invoice_no`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `supplier_name` (`supplier_name`);

--
-- Indexes for table `purchase_bill_detail`
--
ALTER TABLE `purchase_bill_detail`
  ADD KEY `pr_invoice_no` (`pr_invoice_no`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `supplier_master`
--
ALTER TABLE `supplier_master`
  ADD PRIMARY KEY (`gst`),
  ADD UNIQUE KEY `customer_id` (`supplier_id`),
  ADD UNIQUE KEY `customer_name` (`supplier_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand_master`
--
ALTER TABLE `brand_master`
  MODIFY `brand_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_master`
--
ALTER TABLE `category_master`
  MODIFY `category_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_master`
--
ALTER TABLE `customer_master`
  MODIFY `customer_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_master`
--
ALTER TABLE `product_master`
  MODIFY `product_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_stock`
--
ALTER TABLE `product_stock`
  MODIFY `sno` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_bill`
--
ALTER TABLE `purchase_bill`
  MODIFY `pr_invoice_no` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_master`
--
ALTER TABLE `supplier_master`
  MODIFY `supplier_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_master`
--
ALTER TABLE `product_master`
  ADD CONSTRAINT `product_master_ibfk_1` FOREIGN KEY (`category_name`) REFERENCES `category_master` (`category_name`),
  ADD CONSTRAINT `product_master_ibfk_2` FOREIGN KEY (`brand_name`) REFERENCES `brand_master` (`brand_name`);

--
-- Constraints for table `product_stock`
--
ALTER TABLE `product_stock`
  ADD CONSTRAINT `product_stock_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_master` (`product_id`);

--
-- Constraints for table `purchase_bill`
--
ALTER TABLE `purchase_bill`
  ADD CONSTRAINT `purchase_bill_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_master` (`supplier_id`),
  ADD CONSTRAINT `purchase_bill_ibfk_2` FOREIGN KEY (`supplier_name`) REFERENCES `supplier_master` (`supplier_name`);

--
-- Constraints for table `purchase_bill_detail`
--
ALTER TABLE `purchase_bill_detail`
  ADD CONSTRAINT `purchase_bill_detail_ibfk_1` FOREIGN KEY (`pr_invoice_no`) REFERENCES `purchase_bill` (`pr_invoice_no`),
  ADD CONSTRAINT `purchase_bill_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_master` (`product_id`),
  ADD CONSTRAINT `purchase_bill_detail_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_master` (`supplier_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
