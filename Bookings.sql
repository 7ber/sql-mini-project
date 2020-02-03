-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 03, 2020 at 07:11 AM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `country_club`
--

-- --------------------------------------------------------

--
-- Table structure for table `Bookings`
--

CREATE TABLE IF NOT EXISTS `Bookings` (
  `bookid` int(4) NOT NULL DEFAULT '0',
  `facid` int(1) DEFAULT NULL,
  `memid` int(2) DEFAULT NULL,
  `starttime` varchar(19) DEFAULT NULL,
  `slots` int(2) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Bookings`
--

INSERT INTO `Bookings` (`bookid`, `facid`, `memid`, `starttime`, `slots`) VALUES
(2, 6, 0, '2012-07-03 18:00:00', 2),
(9, 4, 0, '2012-07-04 15:00:00', 2),
(10, 4, 0, '2012-07-04 17:30:00', 2),
(11, 6, 0, '2012-07-04 12:30:00', 2),
(12, 6, 0, '2012-07-04 14:00:00', 2),
(17, 1, 0, '2012-07-05 17:30:00', 3),
(22, 6, 0, '2012-07-05 13:00:00', 2),
(26, 0, 0, '2012-07-06 08:00:00', 3),
(27, 0, 0, '2012-07-06 14:00:00', 3),
(37, 0, 0, '2012-07-07 12:30:00', 3),
(46, 4, 0, '2012-07-07 17:30:00', 2),
(47, 6, 0, '2012-07-07 08:30:00', 2),
(50, 6, 0, '2012-07-07 16:00:00', 2),
(61, 4, 0, '2012-07-08 11:00:00', 2),
(63, 4, 0, '2012-07-08 18:00:00', 2),
(64, 4, 0, '2012-07-08 19:30:00', 2),
(65, 6, 0, '2012-07-08 14:00:00', 2),
(66, 6, 0, '2012-07-08 18:30:00', 2),
(74, 1, 0, '2012-07-09 13:00:00', 3),
(77, 2, 0, '2012-07-09 19:00:00', 3),
(82, 6, 0, '2012-07-09 14:30:00', 2),
(84, 7, 0, '2012-07-09 18:30:00', 4),
(88, 0, 0, '2012-07-10 11:30:00', 3),
(89, 0, 0, '2012-07-10 16:00:00', 3),
(95, 4, 0, '2012-07-10 10:00:00', 2),
(97, 4, 0, '2012-07-10 15:00:00', 2),
(99, 5, 0, '2012-07-10 08:30:00', 2),
(100, 6, 0, '2012-07-10 14:30:00', 2),
(101, 6, 0, '2012-07-10 19:00:00', 2),
(104, 8, 0, '2012-07-10 11:30:00', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
