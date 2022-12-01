-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2022 at 11:05 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

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
-- Table structure for table `pto_record`
--

CREATE TABLE `pto_record` (
  `id` int(5) NOT NULL,
  `ownerID` int(5) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `ownerName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ptolist` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pto_record`
--

INSERT INTO `pto_record` (`id`, `ownerID`, `timestamp`, `ownerName`, `ptolist`) VALUES
(1, 1, '2022-11-05 13:23:34', 'michael_masry', '[{\"date\": \"12/4/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(17, 1, '2022-11-07 13:20:09', 'michael_masry', '[{\"date\": \"12/4/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}, {\"date\": \"12/10/2022\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}, {\"date\": \"12/14/2022\", \"title\": \"Other\", \"requester\": \"michael_masry\"}]'),
(18, 1, '2022-11-22 09:18:28', 'michael_masry', '[{\"date\": \"12/6/2022\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}, {\"date\": \"12/10/2022\", \"title\": \"Public\", \"requester\": \"michael_masry\"}, {\"date\": \"12/3/2022\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(20, 1, '2022-11-22 10:30:50', 'michael_masry', '[{\"date\": \"12/10/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}, {\"date\": \"12/8/2022\", \"title\": \"Avaya\", \"requester\": \"michael_masry\"}, {\"date\": \"12/5/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}, {\"date\": \"12/15/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(21, 1, '2022-11-28 08:59:17', 'michael_masry', '[{\"date\": \"12/9/2022\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(22, 1, '2022-11-28 09:00:51', 'michael_masry', '[{\"date\": \"12/24/2022\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(23, 1, '2022-11-28 09:03:18', 'michael_masry', '[{\"date\": \"12/31/2022\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(24, 1, '2022-11-28 12:16:20', 'michael_masry', '[{\"date\": \"12/8/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(25, 1, '2022-11-28 12:37:47', 'michael_masry', '[{\"date\": \"12/15/2022\", \"title\": \"Public\", \"requester\": \"michael_masry\"}, {\"date\": \"12/16/2022\", \"title\": \"Other\", \"requester\": \"michael_masry\"}]'),
(26, 1, '2022-11-28 14:21:18', 'michael_masry', '[{\"date\": \"12/8/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}, {\"date\": \"12/22/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]'),
(27, 1, '2022-11-29 13:56:09', 'michael_masry', '[{\"date\": \"12/7/2022\", \"title\": \"Avaya\", \"requester\": \"michael_masry\"}, {\"date\": \"12/3/2022\", \"title\": \"Public\", \"requester\": \"michael_masry\"}, {\"date\": \"12/17/2022\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}, {\"date\": \"12/24/2022\", \"title\": \"Other\", \"requester\": \"michael_masry\"}, {\"date\": \"12/31/2022\", \"title\": \"Saturday\", \"requester\": \"michael_masry\"}]'),
(28, 1, '2022-11-30 09:05:07', 'michael_masry', '[{\"date\": \"12/2/2022\", \"title\": \"Other\", \"requester\": \"michael_masry\"}, {\"date\": \"12/8/2022\", \"title\": \"Avaya\", \"requester\": \"michael_masry\"}]'),
(29, 1, '2022-11-30 09:08:44', 'michael_masry', '[{\"date\": \"12/7/2022\", \"title\": \"Avaya\", \"requester\": \"michael_masry\"}, {\"date\": \"12/3/2022\", \"title\": \"Public\", \"requester\": \"michael_masry\"}]'),
(30, 1, '2022-11-30 09:08:50', 'michael_masry', '[{\"date\": \"12/23/2022\", \"title\": \"PTO\", \"requester\": \"michael_masry\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `saturday_req`
--

CREATE TABLE `saturday_req` (
  `ID` int(11) NOT NULL,
  `date` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pool_a_level_1` int(1) DEFAULT NULL,
  `pool_a_level_2` int(1) DEFAULT NULL,
  `pool_b_level_1` int(1) DEFAULT NULL,
  `pool_b_level_2` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `saturday_req`
--

INSERT INTO `saturday_req` (`ID`, `date`, `pool_a_level_1`, `pool_a_level_2`, `pool_b_level_1`, `pool_b_level_2`) VALUES
(1, '3/12/2022', 0, 0, 0, 0),
(2, '10/12/2022', 1, 1, 2, 1),
(3, '17/12/2022', 1, 1, 2, 1),
(4, '24/12/2022', 0, 1, 2, 1),
(5, '31/12/2022', 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `id` int(11) NOT NULL,
  `nt_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `isMod` tinyint(1) NOT NULL,
  `pool` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(1) NOT NULL,
  `skill` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`id`, `nt_name`, `password`, `isMod`, `pool`, `level`, `skill`) VALUES
(1, 'michael_masry', '156', 0, '0', 0, 'file_system'),
(2, 'yasmin', '145', 1, NULL, 0, 'admin');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `pto_record`
--
ALTER TABLE `pto_record`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `saturday_req`
--
ALTER TABLE `saturday_req`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
