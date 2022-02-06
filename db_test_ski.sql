-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 06, 2022 at 10:29 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_test_ski`
--
CREATE DATABASE IF NOT EXISTS `db_test_ski` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_test_ski`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_checklists`
--

DROP TABLE IF EXISTS `tb_checklists`;
CREATE TABLE `tb_checklists` (
  `id` int(11) NOT NULL,
  `object_domain` varchar(25) NOT NULL,
  `object_id` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `is_completed` varchar(5) NOT NULL DEFAULT 'false',
  `due` date DEFAULT NULL,
  `urgency` tinyint(1) NOT NULL,
  `completed_at` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `update_at` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_checklists`
--

INSERT INTO `tb_checklists` (`id`, `object_domain`, `object_id`, `description`, `is_completed`, `due`, `urgency`, `completed_at`, `last_update_by`, `update_at`, `created_at`) VALUES
(1, 'contact', '1', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-05 08:49:32'),
(4, 'contact', '2', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-05 12:39:33'),
(5, 'contact', '3', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-05 12:39:35'),
(6, 'contact', '4', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-05 12:39:37'),
(7, 'contact', '5', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-05 12:39:40'),
(8, 'contact', '5', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-05 12:48:54'),
(9, 'contact', '6', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:06:57'),
(10, 'contact', '7', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:06:59'),
(11, 'contact', '8', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:02'),
(12, 'contact', '9', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:04'),
(13, 'contact', '10', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:07'),
(14, 'contact', '11', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:09'),
(15, 'contact', '12', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:11'),
(16, 'contact', '13', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:15'),
(17, 'contact', '14', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:17'),
(18, 'contact', '15', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:19'),
(19, 'contact', '16', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:21'),
(20, 'contact', '17', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:24'),
(21, 'contact', '18', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:27'),
(22, 'contact', '19', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:31'),
(23, 'contact', '20', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:34'),
(24, 'contact', '21', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:47'),
(25, 'contact', '22', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:49'),
(26, 'contact', '23', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:54'),
(27, 'contact', '24', 'Need to verify this guy house.', 'false', NULL, 0, NULL, NULL, NULL, '2022-02-06 09:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `id_user` int(11) NOT NULL,
  `unique_id` varchar(15) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `birth_date` date NOT NULL,
  `role` tinyint(2) NOT NULL,
  `salt` varchar(12) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id_user`, `unique_id`, `full_name`, `email`, `password`, `phone`, `birth_date`, `role`, `salt`, `last_login`, `created_at`, `is_active`) VALUES
(2, 'u38NY2qjIpWu7mf', 'Kevin', 'kevin@gmail.com', '36H+X4g5P64v3723c3aba7d28db06d1ea4185e5af5a7', '0879182492', '2021-09-21', 1, '36H+X4g5P64v', '2022-02-04 08:42:51', '2022-02-04 06:43:43', 1),
(3, 'W8GGhyhYes44Uys', 'Lauren', 'lauren@gmail.com', 'V7mpjN+b/5kb59c2fa5493ea57ebc8d8a531481c7acc', '0800745634', '2021-09-20', 1, 'V7mpjN+b/5kb', '2022-02-05 08:44:36', '2022-02-05 08:44:03', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_checklists`
--
ALTER TABLE `tb_checklists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `unique_id` (`unique_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_checklists`
--
ALTER TABLE `tb_checklists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
