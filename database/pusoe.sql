-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2023 at 07:07 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pusoe`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2017-01-24 16:21:18', '21-06-2018 08:27:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Birthday', 'For Birthday', '2017-01-24 19:17:37', '30-01-2017 12:22:24 AM'),
(4, 'Wedding', 'For Wedding', '2017-01-24 19:19:32', ''),
(5, 'Anniversary', 'For Anniversary Celebrations', '2017-01-24 19:19:54', ''),
(6, 'Party', 'Party Cakes', '2017-02-20 19:18:52', ''),
(12, 'Farewell', 'For Farewell party', '2023-03-13 06:10:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(18, 10, '27', 1, '2023-03-13 07:22:52', 'Debit / Credit card', NULL),
(19, 12, '28', 4, '2023-08-13 15:54:45', 'Internet Banking', 'in Process'),
(20, 15, '27', 1, '2023-09-10 08:56:23', 'COD', NULL),
(21, 15, '28', 1, '2023-09-10 08:56:23', 'COD', NULL),
(22, 16, '27', 2, '2023-09-11 02:14:01', 'COD', NULL),
(23, 16, '23', 1, '2023-09-11 02:14:25', 'COD', NULL),
(24, 17, '27', 2, '2023-09-11 02:34:54', NULL, NULL),
(25, 17, '28', 1, '2023-09-11 02:34:54', NULL, NULL),
(26, 18, '27', 1, '2023-09-11 05:02:57', 'COD', NULL),
(27, 18, '28', 1, '2023-09-11 05:02:57', 'COD', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36'),
(5, 7, 'Delivered', 'Receive you product at our shop tomorrow morning', '2020-08-30 20:53:19'),
(6, 14, 'in Process', 'dfghjkl;', '2020-08-31 18:51:24'),
(7, 15, 'in Process', 'Wait For Delivery', '2020-08-31 19:36:53'),
(8, 14, 'Delivered', 'Delivered', '2020-08-31 19:46:36'),
(9, 13, 'in Process', 'WE weill process your order soon', '2020-08-31 19:49:06'),
(10, 16, 'in Process', 'in pr', '2023-03-13 03:58:46'),
(11, 19, 'in Process', 'your order is in process', '2023-08-13 15:56:13'),
(12, 12, 'Delivered', 'fd nfghbxfn', '2023-08-13 16:04:37');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(5, 23, 5, 4, 3, 'Nabin', 'cake dont value as price', 'bakwas', '2023-08-13 15:59:18');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(23, 3, 13, 'Boys Birthday  Cake', 'pusoe Bakers', 1500, 2000, 'This Cake is for boys having Birthdays\r\nweighs 1.5 Kg\r\nBrown Color', 'good.png', 'unnamed.jpg', '8f3daef6e15cd92a3b7439fb4089a465 (1).jpg', 200, 'In Stock', '2020-08-31 15:44:45', NULL),
(24, 4, 15, 'Premium Wedding Cake', 'pusoe Bakers', 2500, 3000, 'Wedding \r\nWeighs 3Kg\r\nBrown', '60195Photo_Apr_25_8_30_36_PM.jpg', 'Screenshot at 2020-08-30 21-38-31.png', 'testimonial.jpg', 300, 'In Stock', '2020-08-31 15:54:27', NULL),
(25, 6, 16, 'Party Cake', 'pusoe', 1800, 2000, 'Weighs 2KG\r\nBrown In Color\r\n', 'good.png', 'Screenshot at 2020-08-30 21-38-31.png', 'Screenshot at 2020-08-30 21-41-39.png', 200, 'In Stock', '2020-09-01 10:42:41', NULL),
(26, 5, 15, 'Annivessary Cake', 'pusoe', 2700, 3000, 'Weight 5Kgs\r\nColor Brown\r\nCustomized', 'image.jpeg', 'Real red velvet cake is not chocolate cake with food coloring.png', 'Pineapple Upside Down Cake Recipe.jpg', 300, 'In Stock', '2020-09-01 11:12:48', NULL),
(27, 3, 13, 'Birthday Cake', 'One Neo', 1200, 1500, 'Weighs 2Kgs\r\nBrown in Color\r\nCustomized name', 'image.jpeg', 'Best-Birthday-Cake-with-milk-chocolate-buttercream-SQUARE.jpg', 'black-forest-cake-thumb.jpg', 200, 'In Stock', '2020-09-01 16:06:28', NULL),
(28, 3, 13, 'Birthday Cake', 'Barsu Bakery', 2300, 2500, 'It is a cake', 'Cake_3.jpg', 'Cake_4.jpg', 'Cake_2.jpg', 50, 'In Stock', '2023-03-13 07:10:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pusoe_contactusinfo`
--

CREATE TABLE `pusoe_contactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pusoe_contactusinfo`
--

INSERT INTO `pusoe_contactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'Biratnagar, Morang', 'nabin@nabinpokhrel.com.np', '9806011878');

-- --------------------------------------------------------

--
-- Table structure for table `pusoe_employees`
--

CREATE TABLE `pusoe_employees` (
  `national_id` varchar(10) NOT NULL,
  `employee_name` varchar(50) NOT NULL,
  `birth_place` varchar(30) NOT NULL,
  `birth_date` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `department` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pusoe_employees`
--

INSERT INTO `pusoe_employees` (`national_id`, `employee_name`, `birth_place`, `birth_date`, `address`, `telephone`, `department`, `status`, `username`, `password`) VALUES
('123', 'abc', 'brt', '2005-03-02', 'brt', '1122', 'Leader', 'Outsourcing', 'abc', '81dc9bdb52d04dc');

-- --------------------------------------------------------

--
-- Table structure for table `pusoe_pages`
--

CREATE TABLE `pusoe_pages` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `detail` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pusoe_subscribers`
--

CREATE TABLE `pusoe_subscribers` (
  `id` int(11) NOT NULL,
  `SubscriberEmail` varchar(100) NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `ReviewMessage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pusoe_subscribers`
--

INSERT INTO `pusoe_subscribers` (`id`, `SubscriberEmail`, `PostingDate`, `ReviewMessage`) VALUES
(3, 'nabin@gmail.com', '2023-09-09 18:01:22', 'hey i love your services. You provides good facilities to the customers. I am totally satisfied by your service. please contact me on emaill or phone number at 9814569855'),
(12, 'npokhrel@gmail.com', '2023-09-09 20:33:11', 'Hey I am using Pusoe Bakers\r\n'),
(13, 'nabin1@gmail.com', '2023-09-10 05:26:34', 'gwdberbhcebrce'),
(14, 'ava@gmail.com', '2023-09-10 06:06:33', 'scav');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(13, 3, 'Customized name', '2020-08-31 15:31:04', '01-09-2020 01:53:23 PM'),
(14, 3, 'No Name', '2020-08-31 15:32:43', NULL),
(15, 5, 'Premium Quality', '2020-08-31 15:33:26', NULL),
(16, 4, 'Normal Quality', '2020-08-31 15:33:39', NULL),
(17, 5, 'Large', '2020-08-31 15:34:11', NULL),
(18, 5, 'Medium', '2020-08-31 15:34:21', NULL),
(19, 6, 'Large', '2020-08-31 15:34:33', NULL),
(20, 6, 'Medium', '2020-08-31 15:34:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(37, 'nabin@gmail.com', 0x3132372e302e302e3100000000000000, '2023-08-13 15:50:24', NULL, 1),
(38, 'utsav@user.com', 0x3132372e302e302e3100000000000000, '2023-08-13 16:09:17', NULL, 0),
(39, 'NABIN@GMAIL.COMv', 0x3a3a3100000000000000000000000000, '2023-08-17 15:26:37', NULL, 1),
(40, 'NABIN@GMAIL.COMv', 0x3a3a3100000000000000000000000000, '2023-08-18 18:14:38', NULL, 1),
(41, 'nabin@gmail.com', 0x3132372e302e302e3100000000000000, '2023-09-09 11:03:47', NULL, 1),
(42, 'nabin11@fas', 0x3132372e302e302e3100000000000000, '2023-09-10 06:06:56', NULL, 0),
(43, 'nabin@gmail.com', 0x3132372e302e302e3100000000000000, '2023-09-10 06:07:16', NULL, 1),
(44, 'nabin11@gmail.com', 0x3132372e302e302e3100000000000000, '2023-09-10 08:55:35', NULL, 1),
(45, 'nabin11@gmail.com', 0x3132372e302e302e3100000000000000, '2023-09-10 09:00:48', NULL, 1),
(46, 'nabin@gmail.com', 0x3132372e302e302e3100000000000000, '2023-09-10 09:27:39', NULL, 1),
(47, 'nabin@gmail.com', 0x3132372e302e302e3100000000000000, '2023-09-10 09:28:05', NULL, 1),
(48, 'nabin@gmail.com', 0x3132372e302e302e3100000000000000, '2023-09-11 01:26:23', NULL, 1),
(49, 'aga@gm.com', 0x3132372e302e302e3100000000000000, '2023-09-11 02:12:01', NULL, 1),
(50, 'abc@gmail.com', 0x3132372e302e302e3100000000000000, '2023-09-11 02:29:53', NULL, 0),
(51, 'abc@gmail.com', 0x3132372e302e302e3100000000000000, '2023-09-11 02:30:08', NULL, 1),
(52, 'nabin@gmail.com', 0x3132372e302e302e3100000000000000, '2023-09-11 03:25:22', NULL, 0),
(53, 'nabin@gmail.cok', 0x3132372e302e302e3100000000000000, '2023-09-11 05:02:43', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(12, 'nabin pokhrel', 'nabin@gmail.com', 12545, '21232f297a57a5a743894a0e4a801fc3', 'fbzd', 'f zd', 'z', 3215, 'dvszb', 'fbzdfb', 'zfbb fz', 1234, '2023-08-13 15:49:59', NULL),
(13, 'nabin', 'NABIN@GMAIL.COMv', 9862660560, 'b0baee9d279d34fa1dfd71aadb908c3f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-17 15:26:26', NULL),
(14, 'efgregrea', 'nabin1@gmail.com', 9811111111, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-09 11:16:04', NULL),
(15, '123', 'nabin11@gmail.com', 1234567890, '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-10 08:55:08', NULL),
(17, '123', 'abc@gmail.com', 6555254523, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-11 02:29:02', NULL),
(18, 'nabin pokhrel', 'nabin@gmail.cok', 2626220256, '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-11 05:02:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17'),
(5, 12, 23, '2023-09-10 09:27:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pusoe_contactusinfo`
--
ALTER TABLE `pusoe_contactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pusoe_pages`
--
ALTER TABLE `pusoe_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pusoe_subscribers`
--
ALTER TABLE `pusoe_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pusoe_contactusinfo`
--
ALTER TABLE `pusoe_contactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pusoe_pages`
--
ALTER TABLE `pusoe_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pusoe_subscribers`
--
ALTER TABLE `pusoe_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
