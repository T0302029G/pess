-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2022 at 05:11 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pessdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `incident_id` int(11) NOT NULL,
  `patrolcar_id` varchar(10) NOT NULL,
  `time_dispatched` datetime NOT NULL,
  `time_arrived` datetime DEFAULT NULL,
  `time_completed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dispatch`
--

INSERT INTO `dispatch` (`incident_id`, `patrolcar_id`, `time_dispatched`, `time_arrived`, `time_completed`) VALUES
(12, 'QX2222G', '2014-05-29 10:51:15', NULL, '2014-05-29 10:53:43'),
(13, 'QX2222G', '2014-05-29 10:59:42', NULL, NULL),
(14, 'QX4444P', '2014-05-29 11:10:57', NULL, NULL),
(15, 'QX4444P', '2022-03-10 13:46:00', NULL, '2022-03-10 14:08:00'),
(20, 'QX4444P', '2022-05-08 14:46:00', NULL, NULL),
(28, 'QX1234', '2022-05-05 14:24:49', NULL, NULL),
(29, 'QX4321R', '2022-05-05 14:35:06', NULL, NULL),
(30, 'QX4444P', '2022-05-05 15:08:42', NULL, NULL),
(31, 'QX4444P', '2022-05-05 15:19:46', NULL, NULL),
(32, 'QX4444P', '2022-05-05 15:19:59', NULL, NULL),
(33, 'QX1234', '2022-05-05 15:43:52', NULL, NULL),
(34, 'QX1234', '2022-05-06 11:11:39', NULL, NULL),
(36, 'QX4444P', '2022-05-08 15:58:06', NULL, NULL),
(37, 'QX4444P', '2022-05-08 15:59:48', NULL, NULL),
(38, 'QX1234', '2022-05-08 16:01:21', NULL, NULL),
(39, 'QX1234', '2022-05-08 16:17:43', NULL, '2022-05-08 16:08:00'),
(40, 'QX1234', '2022-05-08 20:13:12', NULL, NULL),
(41, 'QX4321R', '2022-05-08 20:33:58', NULL, NULL),
(42, 'QX4444P', '2022-05-08 20:35:20', NULL, NULL),
(43, 'QX45545', '2022-05-08 20:36:15', NULL, NULL),
(44, 'QX1234', '2022-05-08 21:00:05', NULL, NULL),
(44, 'QX4321R', '2022-05-08 21:00:05', NULL, NULL),
(44, 'QX4444P', '2022-05-08 21:00:05', NULL, NULL),
(45, 'QX45545', '2022-05-08 21:00:54', NULL, NULL),
(45, 'QX9999H', '2022-05-08 21:00:54', NULL, NULL),
(46, 'QX1234', '2022-05-08 21:02:53', NULL, NULL),
(46, 'QX4321R', '2022-05-08 21:02:53', NULL, NULL),
(47, 'QX1234', '2022-05-11 11:08:23', NULL, NULL),
(47, 'QX4444P', '2022-05-11 11:08:23', NULL, NULL),
(47, 'QX45545', '2022-05-11 11:08:23', NULL, NULL),
(47, 'QX9999H', '2022-05-11 11:08:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incident_id` int(11) NOT NULL,
  `caller_name` varchar(30) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `incident_type_id` varchar(3) NOT NULL,
  `incident_location` varchar(50) NOT NULL,
  `incident_desc` varchar(100) NOT NULL,
  `incident_status_id` varchar(1) NOT NULL,
  `time_called` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incident_id`, `caller_name`, `phone_number`, `incident_type_id`, `incident_location`, `incident_desc`, `incident_status_id`, `time_called`) VALUES
(6, 'Peter Leow', '81234567', '010', 'Junction of North Bridge Rd and Middle Rd', 'A bus collided with a Taxi 2 injuries.', '1', '2022-03-02 11:46:41'),
(8, 'qwerty', '12345678', '030', 'cck', 'querty', '3', '2022-03-02 11:46:41'),
(9, 'Peter Leow', '81234567', '', 'Junction of North Bridge Road and Middle Road', 'A bus collided with a taxt, 2 injuries', '3', '2022-03-10 18:57:10'),
(10, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision. 4 injuries.\r\n', '2', '2022-04-20 21:56:09'),
(11, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision.\r\n4 injuries.\r\n', '2', '2022-04-20 21:57:36'),
(12, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision.\r\n4 injuries.', '2', '2022-04-20 21:58:15'),
(13, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision. 4 injuries.', '2', '2022-04-20 21:59:54'),
(14, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision.\r\n4 injuries', '2', '2022-04-20 22:00:51'),
(15, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision. 4 injuries', '2', '2022-04-21 13:39:11'),
(16, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision. 4 injuries', '2', '2022-04-21 13:39:14'),
(17, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision. 4 injuries', '2', '2022-04-21 13:39:17'),
(18, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision. 4 injuries', '2', '2022-04-21 13:39:23'),
(19, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision. 4 injuries', '2', '2022-04-21 13:39:26'),
(20, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision. 4 injuries', '2', '2022-04-21 13:39:31'),
(21, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision. 4 injuries', '2', '2022-04-21 13:45:49'),
(22, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision. 4 injuries', '2', '2022-04-21 13:46:55'),
(23, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision. 4 injuries', '2', '2022-04-21 13:46:58'),
(24, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision. 4 injuries', '2', '2022-04-21 13:47:01'),
(25, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '', '2', '2022-04-21 14:20:59'),
(26, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '', '2', '2022-04-21 15:07:27'),
(27, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', '1 car, 1 taxi, and 1 bus collision. 4 injuries.', '2', '2022-04-22 10:13:53'),
(28, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'A car\r\n', '2', '2022-05-05 14:24:49'),
(29, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'A car\r\n', '2', '2022-05-05 14:35:06'),
(30, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'A car.\r\n', '2', '2022-05-05 15:08:42'),
(31, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'A car.\r\n', '2', '2022-05-05 15:19:46'),
(32, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'A car\r\n', '2', '2022-05-05 15:19:59'),
(33, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'A car', '2', '2022-05-05 15:43:52'),
(34, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'A car.', '2', '2022-05-06 11:11:39'),
(35, 'Peter Leow', '81234567', '', 'Junction of North Bridge Road and Middle Road', 'A bus coolided with a taxi, 2 injuries', '', '2022-05-08 15:49:46'),
(36, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'fire fire', '2', '2022-05-08 15:58:06'),
(37, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'fire fire', '2', '2022-05-08 15:59:48'),
(38, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'fire fire', '2', '2022-05-08 16:01:21'),
(39, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'rrrrr', '3', '2022-05-08 19:12:31'),
(40, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'sddddd', '2', '2022-05-08 20:13:12'),
(41, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'A car', '2', '2022-05-08 20:33:58'),
(42, 'Peter Loh', '91234567', '020', 'Toa Payoh', 'Riotting.', '2', '2022-05-08 20:35:20'),
(43, 'Peter Tan', '91234567', '030', 'Bukit Batok', 'Housebreaking.', '2', '2022-05-08 20:36:15'),
(44, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'A car', '2', '2022-05-08 21:00:05'),
(45, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'A car', '2', '2022-05-08 21:00:54'),
(46, 'Peter Leow', '91234567', '010', 'Ang Mo Kio', 'A car', '2', '2022-05-08 21:02:53'),
(47, 'Peter Chua', '91234567', '010', 'Toa Payoh', '', '2', '2022-05-11 11:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `incident_status`
--

CREATE TABLE `incident_status` (
  `incident__status_id` varchar(1) NOT NULL,
  `incident_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_status`
--

INSERT INTO `incident_status` (`incident__status_id`, `incident_status_desc`) VALUES
('1', 'Pending'),
('2', 'Dispatched'),
('3', 'Completed'),
('4', 'Duplicate');

-- --------------------------------------------------------

--
-- Table structure for table `incident_type`
--

CREATE TABLE `incident_type` (
  `incident_type_id` varchar(3) NOT NULL,
  `incident_type_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_type`
--

INSERT INTO `incident_type` (`incident_type_id`, `incident_type_desc`) VALUES
('010', 'Fire'),
('020', 'Riot'),
('030', 'Burglary'),
('040', 'Domestic Violent'),
('050', 'Fallen Tree'),
('060', 'Traffic Accident'),
('070', 'Load Shark'),
('999', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

CREATE TABLE `patrolcar` (
  `patrolcar_id` varchar(10) NOT NULL,
  `patrolcar_status_id` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcar_id`, `patrolcar_status_id`) VALUES
('QX1234', '1'),
('QX4321R', ''),
('QX4444P', '1'),
('QX45545', '1'),
('QX9999H', '1');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar_status`
--

CREATE TABLE `patrolcar_status` (
  `patrolcar_status_id` varchar(1) NOT NULL,
  `patrolcar_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcar_status`
--

INSERT INTO `patrolcar_status` (`patrolcar_status_id`, `patrolcar_status_desc`) VALUES
('1', 'Dispatched'),
('2', 'Patrol'),
('3', 'Free'),
('4', 'On-site'),
('5', 'NA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`incident_id`,`patrolcar_id`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incident_id`);

--
-- Indexes for table `incident_status`
--
ALTER TABLE `incident_status`
  ADD PRIMARY KEY (`incident__status_id`);

--
-- Indexes for table `incident_type`
--
ALTER TABLE `incident_type`
  ADD PRIMARY KEY (`incident_type_id`);

--
-- Indexes for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD PRIMARY KEY (`patrolcar_id`);

--
-- Indexes for table `patrolcar_status`
--
ALTER TABLE `patrolcar_status`
  ADD PRIMARY KEY (`patrolcar_status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incident_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
