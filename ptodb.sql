-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2022 at 11:31 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ptodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE `month` (
  `id` int(11) NOT NULL,
  `date` text NOT NULL,
  `pto` int(11) NOT NULL,
  `public` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`id`, `date`, `pto`, `public`) VALUES
(1, '1/17/2023', 0, 0),
(2, '1/19/2023', 0, 0),
(3, '1/18/2023', 0, 0),
(4, '1/20/2023', 0, 0),
(5, '1/2/2023', 6, 6),
(6, '1/9/2023', 6, 7),
(7, '1/3/2023', 3, 3),
(8, '1/11/2023', 7, 8),
(9, '1/12/2023', 8, 7);

-- --------------------------------------------------------

--
-- Table structure for table `pto_record`
--

CREATE TABLE `pto_record` (
  `id` int(5) NOT NULL,
  `ownerID` int(5) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `ownerName` varchar(20) NOT NULL,
  `ptolist` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pto_record`
--

INSERT INTO `pto_record` (`id`, `ownerID`, `timestamp`, `ownerName`, `ptolist`) VALUES
(1, 1, '2022-11-05 13:23:34', 'michael_masry', '[{\"date\": \"12/4/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(17, 1, '2022-11-07 13:20:09', 'michael_masry', '[{\"date\": \"12/4/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}, {\"date\": \"12/10/2022\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}, {\"date\": \"12/14/2022\", \"title\": \"Other\", \"requester\": \"michael_masry\"}]'),
(18, 1, '2022-11-22 09:18:28', 'michael_masry', '[{\"date\": \"12/6/2022\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}, {\"date\": \"12/10/2022\", \"title\": \"Public\", \"requester\": \"michael_masry\"}, {\"date\": \"12/3/2022\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(22, 1, '2022-11-28 09:00:51', 'michael_masry', '[{\"date\": \"12/24/2022\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(23, 1, '2022-11-28 09:03:18', 'michael_masry', '[{\"date\": \"12/31/2022\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(24, 1, '2022-11-28 12:16:20', 'michael_masry', '[{\"date\": \"12/8/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(25, 1, '2022-11-28 12:37:47', 'michael_masry', '[{\"date\": \"12/15/2022\", \"title\": \"Public\", \"requester\": \"michael_masry\"}, {\"date\": \"12/16/2022\", \"title\": \"Other\", \"requester\": \"michael_masry\"}]'),
(26, 1, '2022-11-28 14:21:18', 'michael_masry', '[{\"date\": \"12/8/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}, {\"date\": \"12/22/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(27, 1, '2022-11-29 13:56:09', 'michael_masry', '[{\"date\": \"12/7/2022\", \"title\": \"Avaya\", \"requester\": \"michael_masry\"}, {\"date\": \"12/3/2022\", \"title\": \"Public\", \"requester\": \"michael_masry\"}, {\"date\": \"12/17/2022\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}, {\"date\": \"12/24/2022\", \"title\": \"Other\", \"requester\": \"michael_masry\"}, {\"date\": \"12/31/2022\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(28, 1, '2022-11-30 09:05:07', 'michael_masry', '[{\"date\": \"12/2/2022\", \"title\": \"Other\", \"requester\": \"michael_masry\"}, {\"date\": \"12/8/2022\", \"title\": \"Avaya\", \"requester\": \"michael_masry\"}]'),
(29, 1, '2022-11-30 09:08:44', 'michael_masry', '[{\"date\": \"12/7/2022\", \"title\": \"Avaya\", \"requester\": \"michael_masry\"}, {\"date\": \"12/3/2022\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(31, 1, '2022-12-05 08:23:51', 'michael_masry', '[{\"date\": \"1/5/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(33, 1, '2022-12-05 08:29:54', 'michael_masry', '[{\"date\": \"1/10/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}, {\"date\": \"1/11/2023\", \"title\": \"Other\", \"requester\": \"michael_masry\"}]'),
(38, 1, '2022-12-06 08:25:03', 'michael_masry', '[{\"date\": \"1/14/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(45, 1, '2022-12-06 08:34:49', 'michael_masry', '[{\"date\": \"1/7/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(46, 1, '2022-12-06 08:35:41', 'michael_masry', '[{\"date\": \"1/14/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(47, 1, '2022-12-06 08:36:45', 'michael_masry', '[{\"date\": \"1/7/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(48, 1, '2022-12-06 08:37:23', 'michael_masry', '[{\"date\": \"1/21/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(49, 1, '2022-12-06 09:25:18', 'michael_masry', '[{\"date\": \"1/14/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(51, 1, '2022-12-06 09:58:18', 'michael_masry', '[{\"date\": \"1/21/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(68, 1, '2022-12-07 08:49:31', 'michael_masry', '[{\"date\": \"1/28/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(69, 1, '2022-12-07 08:50:49', 'michael_masry', '[{\"date\": \"1/28/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(70, 1, '2022-12-07 08:54:58', 'michael_masry', '[{\"date\": \"1/21/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(71, 1, '2022-12-07 08:56:56', 'michael_masry', '[{\"date\": \"1/21/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(72, 1, '2022-12-07 08:57:39', 'michael_masry', '[{\"date\": \"1/21/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(84, 1, '2022-12-12 08:58:56', 'michael_masry', '[{\"date\": \"1/21/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(85, 1, '2022-12-12 11:14:31', 'michael_masry', '[{\"date\": \"1/21/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}, {\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}, {\"date\": \"1/11/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(87, 1, '2022-12-13 08:46:39', 'michael_masry', '[{\"date\": \"1/7/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}, {\"date\": \"1/21/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(88, 1, '2022-12-13 08:46:46', 'michael_masry', '[{\"date\": \"1/7/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}, {\"date\": \"1/21/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(89, 1, '2022-12-13 14:13:04', 'michael_masry', '[{\"date\": \"1/7/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(90, 1, '2022-12-13 14:26:13', 'michael_masry', '[{\"date\": \"1/28/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(91, 1, '2022-12-13 14:28:25', 'michael_masry', '[{\"date\": \"1/21/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(92, 1, '2022-12-13 14:28:48', 'michael_masry', '[{\"date\": \"1/21/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(93, 1, '2022-12-13 14:33:13', 'michael_masry', '[{\"date\": \"1/1/2023\", \"title\": \"Avaya\", \"requester\": \"michael_masry\"}, {\"date\": \"1/14/2023\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(94, 1, '2022-12-14 10:22:46', 'michael_masry', '[{\"date\": \"1/5/2023\", \"title\": \"Avaya\", \"requester\": \"michael_masry\"}]'),
(97, 1, '2022-12-14 10:50:20', 'michael_masry', '[{\"date\": \"1/10/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(98, 1, '2022-12-14 10:50:44', 'michael_masry', '[{\"date\": \"1/15/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(99, 1, '2022-12-14 10:53:02', 'michael_masry', '[{\"date\": \"1/17/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(100, 1, '2022-12-14 11:07:42', 'michael_masry', '[{\"date\": \"1/17/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(101, 1, '2022-12-14 11:10:39', 'michael_masry', '[{\"date\": \"1/17/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(102, 1, '2022-12-14 11:12:24', 'michael_masry', '[{\"date\": \"1/17/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(103, 1, '2022-12-14 11:12:24', 'michael_masry', '[]'),
(104, 1, '2022-12-14 11:13:43', 'michael_masry', '[{\"date\": \"1/17/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(105, 1, '2022-12-14 11:15:14', 'michael_masry', '[{\"date\": \"1/17/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(106, 1, '2022-12-14 11:16:33', 'michael_masry', '[{\"date\": \"1/17/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(107, 1, '2022-12-14 11:17:37', 'michael_masry', '[{\"date\": \"1/17/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(108, 1, '2022-12-14 11:17:52', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(109, 1, '2022-12-14 11:18:24', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(110, 1, '2022-12-14 11:18:37', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(111, 1, '2022-12-14 12:32:27', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(112, 1, '2022-12-14 12:32:39', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(113, 1, '2022-12-14 12:34:49', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(114, 1, '2022-12-14 12:34:53', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(115, 1, '2022-12-14 12:34:56', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(116, 1, '2022-12-14 12:37:34', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(117, 1, '2022-12-14 12:37:38', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(118, 1, '2022-12-14 12:37:43', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(119, 1, '2022-12-14 12:37:47', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(120, 1, '2022-12-14 12:37:52', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(121, 1, '2022-12-14 12:40:16', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(122, 1, '2022-12-14 12:40:20', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(123, 1, '2022-12-14 12:40:26', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(124, 1, '2022-12-14 12:42:40', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(125, 1, '2022-12-14 12:43:19', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(126, 1, '2022-12-14 12:43:23', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(127, 1, '2022-12-14 12:43:27', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(128, 1, '2022-12-14 12:43:31', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(129, 1, '2022-12-14 12:44:21', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(130, 1, '2022-12-14 12:44:25', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(131, 1, '2022-12-14 12:44:29', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(132, 1, '2022-12-14 12:47:09', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(133, 1, '2022-12-14 12:47:14', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(134, 1, '2022-12-14 12:47:18', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(135, 1, '2022-12-14 12:53:04', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(136, 1, '2022-12-14 12:53:09', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(137, 1, '2022-12-14 12:53:15', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(138, 1, '2022-12-14 12:56:09', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(139, 1, '2022-12-14 12:56:13', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(140, 1, '2022-12-14 12:56:18', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(141, 1, '2022-12-14 13:30:02', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(142, 1, '2022-12-14 13:30:32', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(143, 1, '2022-12-14 13:32:28', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(144, 1, '2022-12-14 13:32:46', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(145, 1, '2022-12-14 13:34:21', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(146, 1, '2022-12-14 13:34:25', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(147, 1, '2022-12-14 13:34:29', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(148, 1, '2022-12-14 13:34:33', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(149, 1, '2022-12-14 13:34:37', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(150, 1, '2022-12-14 13:34:41', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(151, 1, '2022-12-14 13:34:48', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(152, 1, '2022-12-14 13:34:51', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(153, 1, '2022-12-14 13:37:07', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(154, 1, '2022-12-14 13:41:48', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(155, 1, '2022-12-14 13:41:51', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(156, 1, '2022-12-14 13:41:58', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(157, 1, '2022-12-14 13:45:09', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(158, 1, '2022-12-14 13:46:30', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(159, 1, '2022-12-14 13:46:35', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(160, 1, '2022-12-14 14:01:57', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(161, 1, '2022-12-14 14:03:10', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(162, 1, '2022-12-14 14:07:22', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(163, 1, '2022-12-14 14:08:45', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(164, 1, '2022-12-14 14:08:51', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(165, 1, '2022-12-14 14:11:20', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(166, 1, '2022-12-14 14:11:24', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(167, 1, '2022-12-14 14:11:32', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(168, 1, '2022-12-14 14:12:05', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(169, 1, '2022-12-14 14:12:12', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(170, 1, '2022-12-14 14:13:08', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(171, 1, '2022-12-14 14:15:34', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(172, 1, '2022-12-14 18:06:37', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(173, 1, '2022-12-14 18:06:44', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(174, 1, '2022-12-14 18:07:25', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(175, 1, '2022-12-14 18:09:27', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(176, 1, '2022-12-14 18:10:29', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(177, 1, '2022-12-14 18:10:33', 'michael_masry', '[{\"date\": \"1/19/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(178, 1, '2022-12-14 18:15:27', 'michael_masry', '[{\"date\": \"1/20/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(179, 1, '2022-12-14 18:15:32', 'michael_masry', '[{\"date\": \"1/20/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(180, 1, '2022-12-14 18:15:37', 'michael_masry', '[{\"date\": \"1/20/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(181, 1, '2022-12-14 18:15:43', 'michael_masry', '[{\"date\": \"1/20/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(182, 1, '2022-12-14 18:15:48', 'michael_masry', '[{\"date\": \"1/20/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(183, 1, '2022-12-14 18:15:53', 'michael_masry', '[{\"date\": \"1/20/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(184, 1, '2022-12-14 18:15:57', 'michael_masry', '[{\"date\": \"1/20/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(185, 1, '2022-12-14 18:16:02', 'michael_masry', '[{\"date\": \"1/20/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(186, 1, '2022-12-14 18:27:26', 'michael_masry', '[{\"date\": \"1/2/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(187, 1, '2022-12-14 18:28:04', 'michael_masry', '[{\"date\": \"1/2/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(188, 1, '2022-12-14 18:29:03', 'michael_masry', '[{\"date\": \"1/2/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(189, 1, '2022-12-14 18:29:09', 'michael_masry', '[{\"date\": \"1/2/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(190, 1, '2022-12-14 18:31:03', 'michael_masry', '[{\"date\": \"1/2/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(191, 1, '2022-12-14 18:37:03', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(192, 1, '2022-12-14 18:44:10', 'michael_masry', '[{\"date\": \"1/2/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(193, 1, '2022-12-14 18:46:45', 'michael_masry', '[{\"date\": \"1/2/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(194, 1, '2022-12-14 18:46:55', 'michael_masry', '[{\"date\": \"1/9/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(195, 1, '2022-12-14 18:47:15', 'michael_masry', '[{\"date\": \"1/18/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(196, 1, '2022-12-18 07:39:30', 'michael_masry', '[{\"date\": \"1/20/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(197, 1, '2022-12-18 07:39:48', 'michael_masry', '[{\"date\": \"1/9/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(198, 1, '2022-12-18 08:48:54', 'michael_masry', '[{\"date\": \"1/3/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(199, 1, '2022-12-18 08:52:07', 'michael_masry', '[{\"date\": \"1/3/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(200, 1, '2022-12-18 08:52:22', 'michael_masry', '[{\"date\": \"1/3/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(201, 1, '2022-12-18 08:56:32', 'michael_masry', '[{\"date\": \"1/3/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(202, 1, '2022-12-18 08:56:52', 'michael_masry', '[{\"date\": \"1/2/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(203, 1, '2022-12-18 08:57:04', 'michael_masry', '[{\"date\": \"1/9/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(204, 1, '2022-12-18 08:57:16', 'michael_masry', '[{\"date\": \"1/17/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(205, 1, '2022-12-18 09:00:57', 'michael_masry', '[{\"date\": \"1/3/2023\", \"title\": \"Public\", \"requester\": null}]'),
(206, 1, '2022-12-18 09:02:02', 'michael_masry', '[{\"date\": \"1/3/2023\", \"title\": \"PTO\", \"requester\": null}]'),
(207, 1, '2022-12-18 09:02:50', 'michael_masry', '[{\"date\": \"1/3/2023\", \"title\": \"PTO\", \"requester\": null}]'),
(208, 1, '2022-12-18 09:04:44', 'michael_masry', '[{\"date\": \"1/3/2023\", \"title\": \"Public\", \"requester\": null}]'),
(209, 1, '2022-12-18 09:06:26', 'michael_masry', '[{\"date\": \"1/3/2023\", \"title\": \"PTO\", \"requester\": null}]'),
(210, 1, '2022-12-18 09:06:42', 'michael_masry', '[{\"date\": \"1/3/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(211, 1, '2022-12-18 09:13:01', 'michael_masry', '[{\"date\": \"1/11/2023\", \"title\": \"Avaya\", \"requester\": null}]'),
(212, 1, '2022-12-18 09:13:40', 'michael_masry', '[{\"date\": \"1/11/2023\", \"title\": \"Avaya\", \"requester\": null}]'),
(213, 1, '2022-12-18 09:14:10', 'michael_masry', '[{\"date\": \"1/12/2023\", \"title\": \"Other\", \"requester\": \"michael_masry\"}]'),
(214, 1, '2022-12-18 09:16:19', 'michael_masry', '[]'),
(215, 1, '2022-12-18 10:51:36', 'michael_masry', '[{\"date\": \"1/5/2023\", \"title\": \"Avaya\", \"requester\": \"michael_masry\"}]'),
(216, 1, '2022-12-21 09:16:09', 'michael_masry', '[{\"date\": \"1/11/2023\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}, {\"date\": \"1/12/2023\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `saturday_req`
--

CREATE TABLE `saturday_req` (
  `ID` int(11) NOT NULL,
  `date` text DEFAULT NULL,
  `pool_a_level_1` int(1) DEFAULT NULL,
  `pool_a_level_2` int(1) DEFAULT NULL,
  `pool_b_level_1` int(1) DEFAULT NULL,
  `pool_b_level_2` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `saturday_req`
--

INSERT INTO `saturday_req` (`ID`, `date`, `pool_a_level_1`, `pool_a_level_2`, `pool_b_level_1`, `pool_b_level_2`) VALUES
(2, '1/7/2023', 1, 0, 2, 1),
(4, '1/14/2023', 0, 1, 0, 2),
(5, '1/21/2023', 2, 0, 1, 1),
(9, '1/28/2023', 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `id` int(11) NOT NULL,
  `nt_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `isMod` tinyint(1) NOT NULL,
  `pool` int(1) DEFAULT NULL,
  `level` int(1) NOT NULL,
  `skill` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`id`, `nt_name`, `password`, `isMod`, `pool`, `level`, `skill`) VALUES
(1, 'michael_masry', '156', 0, 0, 1, 'file_system'),
(2, 'yasmin', '145', 1, NULL, 0, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pto_record`
--
ALTER TABLE `pto_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saturday_req`
--
ALTER TABLE `saturday_req`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `month`
--
ALTER TABLE `month`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pto_record`
--
ALTER TABLE `pto_record`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `saturday_req`
--
ALTER TABLE `saturday_req`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
