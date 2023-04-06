-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2022 at 08:04 PM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBugs` ()   SELECT * FROM bugs$$

DELIMITER ;

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
(14, 'Dev', 'New', 'Test', 'unsolved', 'Bug was found during testing ', '1', 'Jeff', '2022-11-23 18:30:05', NULL, NULL, 2),
(15, 'Beta', 'reopened', 'Test', 'solved', 'this is a test', '2', 'Kris', '2022-11-23 18:31:44', NULL, NULL, 1),
(16, 'Beta', 'New', 'test', 'unsolved', 'This was found while beta testing', '1', 'Kamalesh', '2022-11-23 18:33:06', NULL, NULL, 3),
(17, 'Beta', 'New', 'test', 'unsolved', 'this is a test', '1', 'Kris', '2022-11-23 18:34:34', NULL, NULL, 0);

--
-- Triggers `bugs`
--
DELIMITER $$
CREATE TRIGGER `insertDefault` BEFORE INSERT ON `bugs` FOR EACH ROW set NEW.status ='unsolved'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `bug_id` bigint(20) NOT NULL,
  `USER_COMMENTS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `user_id`, `bug_id`, `USER_COMMENTS`) VALUES
(1, 1, 1, 'this is a test'),
(2, 2, 2, 'this is test pt 2 '),
(3, 2, 2, 'this is test pt 2 ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `email_address` varchar(20) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `job_tittle` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email_address`, `password`, `job_tittle`) VALUES
(1, 'John ', 'John@example.com', 'test@123', 'QA Tester');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bugs`
--
ALTER TABLE `bugs`
  ADD PRIMARY KEY (`bug_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bugs`
--
ALTER TABLE `bugs`
  MODIFY `bug_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
