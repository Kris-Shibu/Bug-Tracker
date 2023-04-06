-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2022 at 07:23 PM
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
-- Database: `bug_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

CREATE TABLE `bugs` (
  `bug_id` bigint(20) NOT NULL,
  `environment` varchar(20) DEFAULT NULL,
  `bug_type` varchar(10) NOT NULL,
  `project_name` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `summary` varchar(50) DEFAULT NULL,
  `priority` varchar(10) DEFAULT NULL,
  `opened_by` varchar(20) DEFAULT NULL,
  `opened_dateTIME` timestamp NULL DEFAULT current_timestamp(),
  `closed_by` varchar(20) DEFAULT NULL,
  `closed_dateTIME` datetime DEFAULT NULL,
  `created_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bugs`
--

INSERT INTO `bugs` (`bug_id`, `environment`, `bug_type`, `project_name`, `status`, `summary`, `priority`, `opened_by`, `opened_dateTIME`, `closed_by`, `closed_dateTIME`, `created_by`) VALUES
(10, 'Beta', 'New', 'Kris', 'unsolved', 'Bug was found while testing login page.', '1', 'Kris', NULL, NULL, NULL, 1),
(11, 'Production', 'New', 'Test', 'unsolved', 'Bug was found while testing dashboard', '1', 'Jeff', NULL, NULL, NULL, 2),
(12, 'Production', 'New', 'Test', 'solved', 'Bug was found while testing dashboard', '1', 'shibu', NULL, NULL, NULL, 5),
(13, 'Production', 'New', 'Test', 'unsolved', 'Bug was found while testing dashboard', '1', 'shibu v kurian', '2022-11-23 18:20:54', NULL, NULL, 7);

--
-- Triggers `bugs`
--
DELIMITER $$
CREATE TRIGGER `insertDefault` BEFORE INSERT ON `bugs` FOR EACH ROW set NEW.status ='unsolved'
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bugs`
--
ALTER TABLE `bugs`
  ADD PRIMARY KEY (`bug_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bugs`
--
ALTER TABLE `bugs`
  MODIFY `bug_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
