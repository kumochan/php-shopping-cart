-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 28, 2011 at 08:36 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shoppingcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'thaotrinh', 'minh');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'bevegares'),
(2, 'cakes');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forename` varchar(50) NOT NULL,
  `surename` varchar(50) NOT NULL,
  `add1` varchar(50) NOT NULL,
  `add2` varchar(50) NOT NULL,
  `add3` varchar(50) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `registered` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `forename`, `surename`, `add1`, `add2`, `add3`, `postcode`, `phone`, `email`, `registered`) VALUES
(1, 'Craig', 'Tuckey', '19, The Grove', 'Ziggy Road', 'Smalltown', 'T3 TR4', '0123456789', 'craig@hissite.com', 1),
(2, 'Lee', 'Jordan', '19, Oak Street', 'Booth Road', 'Thistown', 'T1 FG3', '0987654321', 'lee@lee-tastic.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_addresses`
--

CREATE TABLE IF NOT EXISTS `delivery_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forename` varchar(50) NOT NULL,
  `surename` varchar(50) NOT NULL,
  `add1` varchar(50) NOT NULL,
  `add2` varchar(50) NOT NULL,
  `add3` varchar(50) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `delivery_addresses`
--


-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE IF NOT EXISTS `logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`id`, `customer_id`, `username`, `password`) VALUES
(1, 1, 'Craig', 'Tucker'),
(2, 2, 'Lee', 'Jordan');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `registered` int(11) NOT NULL,
  `delivery_add_id` int(11) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `session` varchar(50) NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `registered`, `delivery_add_id`, `payment_type`, `date`, `status`, `session`, `total`) VALUES
(5, 1, 1, 0, 1, '2011-10-24 10:59:32', 2, '', 1.8),
(6, 0, 0, 0, 0, '2011-10-24 11:08:57', 0, 'h7t4qmuq6ctnng7bb6ftt6sf90', 0),
(7, 0, 0, 0, 0, '2011-10-24 11:10:54', 0, 'nmdttp33msegmdms9kcciqpn80', 0),
(8, 0, 0, 0, 0, '2011-10-24 11:13:22', 0, 'd0bo85f3rk7aj6tg8lrpecju55', 0),
(9, 0, 0, 0, 0, '2011-10-24 12:21:47', 0, '3ju5ijs2nm5kpkv6ok5on42ge6', 2.99),
(10, 0, 0, 0, 0, '2011-10-24 12:34:48', 0, '1te1tr7bf71bemf4ti1qif8sq4', 3.6),
(11, 0, 0, 0, 0, '2011-10-24 22:07:43', 0, 'uvlmre629ijp95u5nigdvjpa27', 14.66),
(12, 0, 0, 0, 0, '2011-10-24 22:47:34', 0, 'afbanqf0rhc3e8gkd36umjc1u7', 41.86),
(13, 0, 0, 0, 0, '2011-10-25 15:48:56', 0, 'p0mij0fsrhaasnd93fvpetsnb3', 0.9);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 9, 1, 1),
(2, 10, 2, 4),
(3, 11, 1, 4),
(5, 11, 2, 3),
(7, 12, 1, 14),
(9, 5, 2, 2),
(10, 13, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` tinyint(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(30) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `cat_id`, `name`, `description`, `image`, `price`) VALUES
(1, 1, 'Best Bags', 'A quality pack of tea bags. 200 bags in each box.', '', 2.99),
(2, 1, 'Best Orange Jice', 'One gallon of quality squeezed orange juice.', 'bestorange-juice.jpg', 0.9);
