-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2025 at 04:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bfp_archiving_system_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `log_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`log_id`, `username`, `user_type`, `action`, `report_id`, `id`, `timestamp`, `details`) VALUES
(1, 'sean', NULL, 'restore', 17, NULL, '2025-09-08 19:55:34', 'Restored: Fire at Manubuan Store'),
(2, 'sean', NULL, 'restore', 19, NULL, '2025-09-08 20:01:55', 'Restored: Fire at Marbel Market'),
(3, 'sean', NULL, 'delete', 36, NULL, '2025-09-08 20:02:16', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(4, 'sean', NULL, 'restore', NULL, 36, '2025-09-08 20:02:21', 'Restored: Hardware Inspection 1'),
(5, 'sean', NULL, 'delete', 17, NULL, '2025-09-08 20:02:36', 'Deleted Report: Fire at Manubuan Store'),
(6, 'sean', NULL, 'restore', 17, NULL, '2025-09-08 20:02:40', 'Restored: Fire at Manubuan Store'),
(7, 'sean', NULL, 'delete', 17, NULL, '2025-09-08 20:04:39', 'Deleted Report: Fire at Manubuan Store'),
(8, 'sean', NULL, 'delete', 36, NULL, '2025-09-08 20:04:41', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(9, 'sean', NULL, 'delete', 19, NULL, '2025-09-08 20:08:06', 'Deleted Report: Fire at Marbel Market'),
(10, 'sean', NULL, 'create', 37, NULL, '2025-09-08 20:08:18', 'Created Fire Safety Inspection Report: Hardware Inspection 1'),
(11, 'sean', NULL, 'delete', 37, NULL, '2025-09-08 20:08:25', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(12, 'sean', NULL, 'delete', 20, NULL, '2025-09-08 20:08:46', 'Deleted Report: Fire at Minamaing School'),
(13, 'batman', NULL, 'create', 79, NULL, '2025-09-08 20:12:21', 'Created report: Warehouse Fire in Central Malamote'),
(14, 'batman', NULL, 'create', 38, NULL, '2025-09-08 20:13:52', 'Created Fire Safety Inspection Report: Permit'),
(15, 'batman', NULL, 'delete', 38, NULL, '2025-09-08 20:14:57', 'Deleted Fire Safety Inspection Report: Permit'),
(16, 'batman', NULL, 'delete', 21, NULL, '2025-09-08 20:16:39', 'Deleted Report: Fire at Natutungan Gas Station'),
(17, 'sean', NULL, 'create', 39, NULL, '2025-09-08 20:18:04', 'Created Fire Safety Inspection Report: Hardware Inspection 1'),
(18, 'batman', NULL, 'delete', 39, NULL, '2025-09-08 20:18:18', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(19, 'sean', NULL, 'restore', NULL, 39, '2025-09-08 20:18:30', 'Restored: Hardware Inspection 1'),
(20, 'batman', NULL, 'download', 39, NULL, '2025-09-08 20:18:37', 'Downloaded Fire Safety Inspection Certificate ID: 39'),
(21, 'batman', NULL, 'download', 39, NULL, '2025-09-08 20:19:39', 'Download: Hardware Inspection 1'),
(22, 'batman', NULL, 'update', 22, NULL, '2025-09-08 20:19:58', 'Updated report: Fire at New Bugasong Rice Mill'),
(23, 'batman', NULL, 'update', 39, NULL, '2025-09-08 20:22:13', 'Updated Fire Safety Inspection Report: Hardware Inspection 1'),
(24, 'sean', NULL, 'update', 22, NULL, '2025-09-08 20:24:02', 'Updated Fire Incident Report: Fire at New Bugasong Rice Mill'),
(25, 'batman', NULL, 'update', 22, NULL, '2025-09-08 20:24:16', 'Updated Fire Incident Report: Fire at New Bugasong Rice Mill'),
(26, 'sean', NULL, 'delete', 20, NULL, '2025-09-08 20:50:06', 'Deleted Report: Fire at Minamaing School'),
(27, 'sean', NULL, 'delete', 39, NULL, '2025-09-08 20:50:08', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(28, 'sean', NULL, 'restore', 20, NULL, '2025-09-08 20:50:16', 'Bulk restored Incident Report ID 20'),
(29, 'sean', NULL, 'restore', NULL, 39, '2025-09-08 20:50:16', 'Bulk restored Inspection Certificate ID 39'),
(30, 'sean', NULL, 'delete', 20, NULL, '2025-09-08 21:05:19', 'Deleted Report: Fire at Minamaing School'),
(31, 'sean', NULL, 'delete', 39, NULL, '2025-09-08 21:05:21', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(32, 'sean', NULL, 'delete', 20, NULL, '2025-09-08 21:06:42', 'Deleted Report: Fire at Minamaing School'),
(33, 'sean', NULL, 'delete', 39, NULL, '2025-09-08 21:06:44', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(34, 'sean', NULL, 'delete', 39, NULL, '2025-09-08 21:07:20', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(35, 'sean', NULL, 'delete', 20, NULL, '2025-09-08 21:08:49', 'Deleted Report: Fire at Minamaing School'),
(36, 'sean', NULL, 'delete', 39, NULL, '2025-09-08 21:23:40', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(37, 'sean', NULL, 'delete', 21, NULL, '2025-09-08 21:23:43', 'Deleted Report: Fire at Natutungan Gas Station'),
(38, 'sean', NULL, 'restore', 21, NULL, '2025-09-08 21:27:20', 'Restored: Fire at Natutungan Gas Station'),
(39, 'sean', NULL, 'delete', 21, NULL, '2025-09-08 21:27:30', 'Deleted Report: Fire at Natutungan Gas Station'),
(40, 'sean', NULL, 'Deleted Fire Incident Report', 21, NULL, '2025-09-08 21:37:10', 'Delete Report: Fire at Natutungan Gas Station'),
(41, 'sean', NULL, 'delete', 22, NULL, '2025-09-08 21:37:38', 'Deleted Report: Fire at New Bugasong Rice Mill'),
(42, 'sean', NULL, 'delete', 39, NULL, '2025-09-08 21:37:43', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(43, 'sean', NULL, 'restore', 22, NULL, '2025-09-08 21:37:51', 'Restored: Fire at New Bugasong Rice Mill'),
(44, 'sean', NULL, 'delete', 22, NULL, '2025-09-08 21:40:38', 'Deleted Report: Fire at New Bugasong Rice Mill'),
(45, 'sean', NULL, 'delete', 23, NULL, '2025-09-08 21:41:06', 'Deleted Report: Fire at New Pandan Apartment'),
(46, 'sean', NULL, 'delete', 23, NULL, '2025-09-08 21:42:14', 'Deleted Report: Fire at New Pandan Apartment'),
(47, 'sean', NULL, 'delete', 24, NULL, '2025-09-08 21:44:29', 'Deleted Report: Fire at Patadon West Farm'),
(48, 'sean', NULL, 'delete', 25, NULL, '2025-09-08 21:44:34', 'Deleted Report: Fire at Poblacion Store'),
(49, 'sean', NULL, 'create', 40, NULL, '2025-09-08 21:44:48', 'Created Fire Safety Inspection Report: Hardware Inspection 1'),
(50, 'sean', NULL, 'delete', 40, NULL, '2025-09-08 21:44:55', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(51, 'sean', NULL, 'delete', 24, NULL, '2025-09-08 21:45:13', 'Deleted Report: Fire at Patadon West Farm'),
(52, 'sean', NULL, 'delete', 25, NULL, '2025-09-08 21:45:16', 'Deleted Report: Fire at Poblacion Store'),
(53, 'sean', NULL, 'download', 40, NULL, '2025-09-08 21:45:18', 'Download: Hardware Inspection 1'),
(54, 'sean', NULL, 'delete', 40, NULL, '2025-09-08 21:45:20', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(55, 'sean', NULL, 'restore', 24, NULL, '2025-09-08 21:45:30', 'Restored: Fire at Patadon West Farm'),
(56, 'sean', NULL, 'restore', NULL, 40, '2025-09-08 21:45:42', 'Restored: Hardware Inspection 1'),
(57, 'sean', NULL, 'Deleted Fire Incident Report', 24, NULL, '2025-09-08 21:46:15', 'Delete Report: Fire at Patadon West Farm'),
(58, 'sean', NULL, 'Deleted Fire Incident Report', 26, NULL, '2025-09-08 21:46:15', 'Delete Report: Fire at Salvacion Church'),
(59, 'sean', NULL, 'delete', 27, NULL, '2025-09-08 21:46:53', 'Delete Report: Fire at Santa Maria Market'),
(60, 'sean', NULL, 'delete', 28, NULL, '2025-09-08 21:46:53', 'Delete Report: Fire at Sarayan School'),
(61, 'sean', NULL, 'restore', 24, NULL, '2025-09-08 21:48:11', 'Restored Incident Report ID: 24'),
(62, 'sean', NULL, 'restore', 26, NULL, '2025-09-08 21:48:11', 'Restored Incident Report ID: 26'),
(63, 'sean', NULL, 'restore', 27, NULL, '2025-09-08 21:48:11', 'Restored Incident Report ID: 27'),
(64, 'sean', NULL, 'restore', 28, NULL, '2025-09-08 21:48:11', 'Restored Incident Report ID: 28'),
(65, 'sean', NULL, 'delete', 40, NULL, '2025-09-08 21:48:58', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(66, 'sean', NULL, 'delete', 24, NULL, '2025-09-08 21:49:01', 'Deleted Report: Fire at Patadon West Farm'),
(67, 'sean', NULL, 'delete', 26, NULL, '2025-09-08 21:49:05', 'Deleted Report: Fire at Salvacion Church'),
(68, 'sean', NULL, 'restore', 24, NULL, '2025-09-08 21:49:08', 'Restored Incident Report ID: '),
(69, 'sean', NULL, 'restore', 26, NULL, '2025-09-08 21:49:08', 'Restored Incident Report ID: '),
(70, 'sean', NULL, 'restore', NULL, 40, '2025-09-08 21:49:08', 'Restored Inspection Certificate ID: '),
(71, 'sean', NULL, 'delete', 40, NULL, '2025-09-08 21:52:05', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(72, 'sean', NULL, 'delete', 24, NULL, '2025-09-08 21:52:08', 'Deleted Report: Fire at Patadon West Farm'),
(73, 'sean', NULL, 'restore', 24, NULL, '2025-09-08 21:52:13', 'Restored Incident Report: Fire at Patadon West Farm (ID: 24)'),
(74, 'sean', NULL, 'restore', NULL, 40, '2025-09-08 21:52:13', 'Restored Inspection Certificate: Hardware Inspection 1 (ID: 40)'),
(75, 'sean', NULL, 'delete', 40, NULL, '2025-09-08 21:52:35', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(76, 'sean', NULL, 'delete', 24, NULL, '2025-09-08 21:52:37', 'Deleted Report: Fire at Patadon West Farm'),
(77, 'sean', NULL, 'restore', 24, NULL, '2025-09-08 21:52:42', 'Restored Incident Report: Fire at Patadon West Farm'),
(78, 'sean', NULL, 'restore', NULL, 40, '2025-09-08 21:52:42', 'Restored Inspection Certificate: Hardware Inspection 1'),
(79, 'batman', NULL, 'Deleted Fire Incident Report', 24, NULL, '2025-09-08 22:06:49', 'Delete Report: Fire at Patadon West Farm'),
(80, 'batman', NULL, 'Deleted Fire Incident Report', 26, NULL, '2025-09-08 22:06:49', 'Delete Report: Fire at Salvacion Church'),
(81, 'batman', NULL, 'Deleted Fire Incident Report', 27, NULL, '2025-09-08 22:06:49', 'Delete Report: Fire at Santa Maria Market'),
(82, 'sean', NULL, 'delete', 28, NULL, '2025-09-08 22:07:15', 'Delete Report: Fire at Sarayan School'),
(83, 'sean', NULL, 'delete', 29, NULL, '2025-09-08 22:07:15', 'Delete Report: Fire at Taculen Gas Station'),
(84, 'sean', NULL, 'delete', 30, NULL, '2025-09-08 22:07:15', 'Delete Report: Fire at Taguranao Rice Mill'),
(85, 'sean', NULL, 'delete', 40, NULL, '2025-09-08 22:07:24', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(86, 'sean', NULL, 'restore', 24, NULL, '2025-09-08 22:08:18', 'Restored Incident Report: Fire at Patadon West Farm'),
(87, 'sean', NULL, 'restore', 26, NULL, '2025-09-08 22:08:18', 'Restored Incident Report: Fire at Salvacion Church'),
(88, 'sean', NULL, 'restore', 27, NULL, '2025-09-08 22:08:18', 'Restored Incident Report: Fire at Santa Maria Market'),
(89, 'sean', NULL, 'restore', 28, NULL, '2025-09-08 22:08:18', 'Restored Incident Report: Fire at Sarayan School'),
(90, 'sean', NULL, 'restore', 29, NULL, '2025-09-08 22:08:18', 'Restored Incident Report: Fire at Taculen Gas Station'),
(91, 'sean', NULL, 'restore', 30, NULL, '2025-09-08 22:08:18', 'Restored Incident Report: Fire at Taguranao Rice Mill'),
(92, 'sean', NULL, 'restore', NULL, 40, '2025-09-08 22:08:18', 'Restored Inspection Certificate: Hardware Inspection 1'),
(93, 'sean', NULL, 'create', 41, NULL, '2025-09-08 22:08:29', 'Created Fire Safety Inspection Report: Hardware Inspection 1'),
(94, 'sean', NULL, 'delete', 40, NULL, '2025-09-08 22:08:37', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(95, 'sean', NULL, 'delete', 41, NULL, '2025-09-08 22:08:37', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(96, 'sean', NULL, 'restore', NULL, 40, '2025-09-08 22:08:43', 'Restored Inspection Certificate: Hardware Inspection 1'),
(97, 'sean', NULL, 'restore', NULL, 41, '2025-09-08 22:08:43', 'Restored Inspection Certificate: Hardware Inspection 1'),
(98, 'batman', NULL, 'delete', 28, NULL, '2025-09-08 22:08:54', 'Delete Report: Fire at Sarayan School'),
(99, 'batman', NULL, 'delete', 29, NULL, '2025-09-08 22:08:54', 'Delete Report: Fire at Taculen Gas Station'),
(100, 'batman', NULL, 'delete', 30, NULL, '2025-09-08 22:08:54', 'Delete Report: Fire at Taguranao Rice Mill'),
(101, 'batman', NULL, 'delete', 40, NULL, '2025-09-08 22:09:07', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(102, 'batman', NULL, 'delete', 41, NULL, '2025-09-08 22:09:07', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(103, 'sean', NULL, 'restore', 28, NULL, '2025-09-08 22:09:25', 'Restored Incident Report: Fire at Sarayan School'),
(104, 'sean', NULL, 'restore', 29, NULL, '2025-09-08 22:09:25', 'Restored Incident Report: Fire at Taculen Gas Station'),
(105, 'sean', NULL, 'restore', 30, NULL, '2025-09-08 22:09:25', 'Restored Incident Report: Fire at Taguranao Rice Mill'),
(106, 'sean', NULL, 'restore', NULL, 40, '2025-09-08 22:09:25', 'Restored Inspection Certificate: Hardware Inspection 1'),
(107, 'sean', NULL, 'restore', NULL, 41, '2025-09-08 22:09:25', 'Restored Inspection Certificate: Hardware Inspection 1'),
(108, 'batman', NULL, 'delete', 24, NULL, '2025-09-08 22:10:19', 'Deleted Report: Fire at Patadon West Farm'),
(109, 'sean', NULL, 'restore', 24, NULL, '2025-09-08 22:10:53', 'Restored: Fire at Patadon West Farm');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, '[value-2]', '[value-3]'),
(2, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `barangays`
--

CREATE TABLE `barangays` (
  `barangay_name` varchar(100) NOT NULL,
  `barangay_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangays`
--

INSERT INTO `barangays` (`barangay_name`, `barangay_id`) VALUES
('New Alimodian', 8),
('Bangbang', 10),
('Bato', 11),
('Central Malamote', 12),
('Dalapitan', 13),
('Estado', 14),
('Ilian', 15),
('Kabulacan', 16),
('Kibia', 17),
('Kibudoc', 18),
('Kidama', 19),
('Kilada', 20),
('Lampayan', 21),
('Latagan', 22),
('Linao', 23),
('Lower Malamote', 24),
('Manubuan', 25),
('Manupal', 26),
('Marbel', 27),
('Minamaing', 28),
('Natutungan', 29),
('New Bugasong', 30),
('New Pandan', 31),
('Patadon West', 32),
('Poblacion', 33),
('Salvacion', 34),
('Santa Maria', 35),
('Sarayan', 36),
('Taculen', 37),
('Taguranao', 38),
('Tamped (Tampad)', 39),
('New Abra', 40),
('Pinamaton', 41),
('Arakan', 44);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `departments_id` int(11) NOT NULL,
  `departments` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`departments_id`, `departments`) VALUES
(3, 'Administrative'),
(4, 'Operation'),
(5, 'Fire Safety and Prevention');

-- --------------------------------------------------------

--
-- Table structure for table `fire_incident_reports`
--

CREATE TABLE `fire_incident_reports` (
  `report_id` int(11) NOT NULL,
  `report_title` varchar(255) NOT NULL,
  `fire_location` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `purok` varchar(255) DEFAULT NULL,
  `municipality` varchar(255) DEFAULT NULL,
  `incident_date` datetime NOT NULL,
  `establishment` varchar(255) DEFAULT NULL,
  `victims` text DEFAULT NULL,
  `firefighters` text DEFAULT NULL,
  `property_damage` varchar(100) DEFAULT NULL,
  `fire_types` varchar(255) DEFAULT NULL,
  `uploader` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `caller_name` varchar(255) DEFAULT NULL,
  `responding_team` varchar(255) DEFAULT NULL,
  `arrival_time` varchar(50) DEFAULT NULL,
  `fireout_time` varchar(50) DEFAULT NULL,
  `alarm_status` varchar(100) DEFAULT NULL,
  `occupancy_type` varchar(100) DEFAULT NULL,
  `documentation_photos` text DEFAULT NULL,
  `narrative_report` text DEFAULT NULL,
  `progress_report` text DEFAULT NULL,
  `final_investigation_report` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fire_incident_reports`
--

INSERT INTO `fire_incident_reports` (`report_id`, `report_title`, `fire_location`, `street`, `purok`, `municipality`, `incident_date`, `establishment`, `victims`, `firefighters`, `property_damage`, `fire_types`, `uploader`, `department`, `caller_name`, `responding_team`, `arrival_time`, `fireout_time`, `alarm_status`, `occupancy_type`, `documentation_photos`, `narrative_report`, `progress_report`, `final_investigation_report`, `deleted`, `deleted_at`) VALUES
(24, 'Fire at Patadon West Farm', 'Patadon West', 'Farm Road', 'Purok 4', 'Matalam', '2025-09-24 06:50:00', 'Farm', 'None', 'Team X', '12000', 'Spontaneous combustion', 'admin', 'Operation', 'Josefina Cruz', 'Team X', '06:55:00', '07:30:00', '1st Alarm', 'Agricultural', '', NULL, '', NULL, 0, NULL),
(26, 'Fire at Salvacion Church', 'Salvacion', 'Church Road', 'Purok 6', 'Matalam', '2025-09-26 11:10:00', 'Church', 'None', 'Team Z', '30000', 'Lightning', 'admin', 'Operation', 'Sofia Lim', 'Team Z', '11:15:00', '12:00:00', '1st Alarm', 'Religious', '', NULL, '', NULL, 0, NULL),
(27, 'Fire at Santa Maria Market', 'Santa Maria', 'Market Road', 'Purok 7', 'Matalam', '2025-09-27 13:10:00', 'Public Market', 'None', 'Team AA', '15000', 'Electrical appliances', 'admin', 'Operation', 'Pedro Ramos', 'Team AA', '13:15:00', '13:50:00', '1st Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(28, 'Fire at Sarayan School', 'Sarayan', 'School St.', 'Purok 8', 'Matalam', '2025-09-28 15:00:00', 'School', 'None', 'Team BB', '10000', 'Lighted cigarette butt', 'admin', 'Fire Safety and Prevention', 'Ana Lopez', 'Team BB', '15:05:00', '15:40:00', '1st Alarm', 'Educational', '', NULL, '', NULL, 0, NULL),
(29, 'Fire at Taculen Gas Station', 'Taculen', 'Highway', 'Purok 9', 'Matalam', '2025-09-29 17:30:00', 'Gas Station', '1 injured', 'Team CC', '80000', 'Chemicals/LPG leaking', 'admin', 'Operation', 'Carlos Dizon', 'Team CC', '17:35:00', '18:20:00', '2nd Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(30, 'Fire at Taguranao Rice Mill', 'Taguranao', 'Mill Road', 'Purok 10', 'Matalam', '2025-09-30 19:15:00', 'Rice Mill', 'None', 'Team DD', '25000', 'Mechanical collision', 'admin', 'Operation', 'Liza Reyes', 'Team DD', '19:20:00', '20:00:00', '1st Alarm', 'Industrial', '', NULL, '', NULL, 0, NULL),
(31, 'Fire at Tamped (Tampad) Apartment', 'Tamped (Tampad)', 'Mabini St.', 'Purok 1', 'Matalam', '2025-10-01 21:40:00', 'Apartment', '3 injured', 'Team EE', '40000', 'Open flame due to torch or sulo', 'admin', 'Operation', 'Mark Villanueva', 'Team EE', '21:45:00', '22:30:00', '2nd Alarm', 'Residential', '', NULL, '', NULL, 0, NULL),
(32, 'Fire at New Abra Farm', 'New Abra', 'Farm Road', 'Purok 2', 'Matalam', '2025-10-02 07:50:00', 'Farm', 'None', 'Team FF', '12000', 'Spontaneous combustion', 'admin', 'Operation', 'Josefina Cruz', 'Team FF', '07:55:00', '08:30:00', '1st Alarm', 'Agricultural', '', NULL, '', NULL, 0, NULL),
(33, 'Fire at Pinamaton Store', 'Pinamaton', 'Main St.', 'Purok 3', 'Matalam', '2025-10-03 10:25:00', 'Store', 'None', 'Team GG', '9000', 'Electrical machineries', 'admin', 'Operation', 'Ricardo Gomez', 'Team GG', '10:30:00', '11:00:00', '1st Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(34, 'Fire at Arakan Church', 'Arakan', 'Church Road', 'Purok 4', 'Matalam', '2025-10-04 12:10:00', 'Church', 'None', 'Team HH', '30000', 'Lightning', 'admin', 'Operation', 'Sofia Lim', 'Team HH', '12:15:00', '13:00:00', '1st Alarm', 'Religious', '', NULL, '', NULL, 0, NULL),
(35, 'Fire at New Alimodian Warehouse', 'New Alimodian', 'Warehouse Rd.', 'Purok 5', 'Matalam', '2025-10-05 08:30:00', 'Warehouse', 'None', 'Team II', '12000', 'Electrical connection', 'admin', 'Operation', 'Juan Dela Cruz', 'Team II', '08:35:00', '09:10:00', '1st Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(36, 'Fire at Bangbang House', 'Bangbang', 'Bonifacio Ave.', 'Purok 6', 'Matalam', '2025-10-06 10:15:00', 'House', '2 injured', 'Team JJ', '18000', 'Open flame due to unattended cooking/stove', 'admin', 'Operation', 'Maria Santos', 'Team JJ', '10:20:00', '11:00:00', '2nd Alarm', 'Residential', '', NULL, '', NULL, 0, NULL),
(37, 'Fire at Bato School', 'Bato', 'School St.', 'Purok 7', 'Matalam', '2025-10-07 12:45:00', 'School', 'None', 'Team KK', '9000', 'Lighted cigarette butt', 'admin', 'Fire Safety and Prevention', 'Ana Lopez', 'Team KK', '12:50:00', '13:30:00', '1st Alarm', 'Educational', '', NULL, '', NULL, 0, NULL),
(38, 'Fire at Central Malamote Gas Station', 'Central Malamote', 'Highway', 'Purok 8', 'Matalam', '2025-10-08 14:00:00', 'Gas Station', '1 injured', 'Team LL', '35000', 'Chemicals/LPG leaking', 'admin', 'Operation', 'Carlos Dizon', 'Team LL', '14:05:00', '14:40:00', '2nd Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(39, 'Fire at Dalapitan Rice Mill', 'Dalapitan', 'Mill Road', 'Purok 9', 'Matalam', '2025-10-09 16:30:00', 'Rice Mill', 'None', 'Team MM', '22000', 'Mechanical collision', 'admin', 'Operation', 'Liza Reyes', 'Team MM', '16:35:00', '17:20:00', '1st Alarm', 'Industrial', '', NULL, '', NULL, 0, NULL),
(40, 'Fire at Estado Apartment', 'Estado', 'Mabini St.', 'Purok 10', 'Matalam', '2025-10-10 18:15:00', 'Apartment', '3 injured', 'Team NN', '40000', 'Open flame due to torch or sulo', 'admin', 'Operation', 'Mark Villanueva', 'Team NN', '18:20:00', '19:00:00', '2nd Alarm', 'Residential', '', NULL, '', NULL, 0, NULL),
(41, 'Fire at Ilian Farm', 'Ilian', 'Farm Road', 'Purok 1', 'Matalam', '2025-10-11 20:40:00', 'Farm', 'None', 'Team OO', '11000', 'Spontaneous combustion', 'admin', 'Operation', 'Josefina Cruz', 'Team OO', '20:45:00', '21:30:00', '1st Alarm', 'Agricultural', '', NULL, '', NULL, 0, NULL),
(42, 'Fire at Kabulacan Store', 'Kabulacan', 'Main St.', 'Purok 2', 'Matalam', '2025-10-12 06:50:00', 'Store', 'None', 'Team PP', '8000', 'Electrical machineries', 'admin', 'Operation', 'Ricardo Gomez', 'Team PP', '06:55:00', '07:30:00', '1st Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(43, 'Fire at Kibia Church', 'Kibia', 'Church Road', 'Purok 3', 'Matalam', '2025-10-13 09:25:00', 'Church', 'None', 'Team QQ', '30000', 'Lightning', 'admin', 'Operation', 'Sofia Lim', 'Team QQ', '09:30:00', '10:00:00', '1st Alarm', 'Religious', '', NULL, '', NULL, 0, NULL),
(44, 'Fire at Kibudoc Market', 'Kibudoc', 'Market Road', 'Purok 4', 'Matalam', '2025-10-14 11:10:00', 'Public Market', 'None', 'Team RR', '15000', 'Electrical appliances', 'admin', 'Operation', 'Pedro Ramos', 'Team RR', '11:15:00', '12:00:00', '1st Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(45, 'Fire at Kidama School', 'Kidama', 'School St.', 'Purok 5', 'Matalam', '2025-10-15 13:10:00', 'School', 'None', 'Team SS', '10000', 'Lighted cigarette butt', 'admin', 'Fire Safety and Prevention', 'Ana Lopez', 'Team SS', '13:15:00', '13:50:00', '1st Alarm', 'Educational', '', NULL, '', NULL, 0, NULL),
(46, 'Fire at Kilada Gas Station', 'Kilada', 'Highway', 'Purok 6', 'Matalam', '2025-10-16 15:00:00', 'Gas Station', '1 injured', 'Team TT', '80000', 'Chemicals/LPG leaking', 'admin', 'Operation', 'Carlos Dizon', 'Team TT', '15:05:00', '15:40:00', '2nd Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(47, 'Fire at Lampayan Rice Mill', 'Lampayan', 'Mill Road', 'Purok 7', 'Matalam', '2025-10-17 17:30:00', 'Rice Mill', 'None', 'Team UU', '25000', 'Mechanical collision', 'admin', 'Operation', 'Liza Reyes', 'Team UU', '17:35:00', '18:20:00', '1st Alarm', 'Industrial', '', NULL, '', NULL, 0, NULL),
(48, 'Fire at Latagan Apartment', 'Latagan', 'Mabini St.', 'Purok 8', 'Matalam', '2025-10-18 19:15:00', 'Apartment', '3 injured', 'Team VV', '40000', 'Open flame due to torch or sulo', 'admin', 'Operation', 'Mark Villanueva', 'Team VV', '19:20:00', '20:00:00', '2nd Alarm', 'Residential', '', NULL, '', NULL, 0, NULL),
(49, 'Fire at Linao Farm', 'Linao', 'Farm Road', 'Purok 9', 'Matalam', '2025-10-19 21:40:00', 'Farm', 'None', 'Team WW', '12000', 'Spontaneous combustion', 'admin', 'Operation', 'Josefina Cruz', 'Team WW', '21:45:00', '22:30:00', '1st Alarm', 'Agricultural', '', NULL, '', NULL, 0, NULL),
(50, 'Fire at Lower Malamote Store', 'Lower Malamote', 'Main St.', 'Purok 10', 'Matalam', '2025-10-20 07:50:00', 'Store', 'None', 'Team XX', '9000', 'Electrical machineries', 'admin', 'Operation', 'Ricardo Gomez', 'Team XX', '07:55:00', '08:30:00', '1st Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(51, 'Fire at Manubuan Church', 'Manubuan', 'Church Road', 'Purok 1', 'Matalam', '2025-10-21 10:25:00', 'Church', 'None', 'Team YY', '30000', 'Lightning', 'admin', 'Operation', 'Sofia Lim', 'Team YY', '10:30:00', '11:00:00', '1st Alarm', 'Religious', '', NULL, '', NULL, 0, NULL),
(52, 'Fire at Manupal Market', 'Manupal', 'Market Road', 'Purok 2', 'Matalam', '2025-10-22 12:10:00', 'Public Market', 'None', 'Team ZZ', '15000', 'Electrical appliances', 'admin', 'Operation', 'Pedro Ramos', 'Team ZZ', '12:15:00', '13:00:00', '1st Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(53, 'Fire at Marbel School', 'Marbel', 'School St.', 'Purok 3', 'Matalam', '2025-10-23 14:10:00', 'School', 'None', 'Team AAA', '10000', 'Lighted cigarette butt', 'admin', 'Fire Safety and Prevention', 'Ana Lopez', 'Team AAA', '14:15:00', '14:50:00', '1st Alarm', 'Educational', '', NULL, '', NULL, 0, NULL),
(54, 'Fire at Minamaing Gas Station', 'Minamaing', 'Highway', 'Purok 4', 'Matalam', '2025-10-24 16:00:00', 'Gas Station', '1 injured', 'Team BBB', '80000', 'Chemicals/LPG leaking', 'admin', 'Operation', 'Carlos Dizon', 'Team BBB', '16:05:00', '16:40:00', '2nd Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(55, 'Fire at Natutungan Rice Mill', 'Natutungan', 'Mill Road', 'Purok 5', 'Matalam', '2025-10-25 18:30:00', 'Rice Mill', 'None', 'Team CCC', '25000', 'Mechanical collision', 'admin', 'Operation', 'Liza Reyes', 'Team CCC', '18:35:00', '19:20:00', '1st Alarm', 'Industrial', '', NULL, '', NULL, 0, NULL),
(56, 'Fire at New Bugasong Apartment', 'New Bugasong', 'Mabini St.', 'Purok 6', 'Matalam', '2025-10-26 20:15:00', 'Apartment', '3 injured', 'Team DDD', '40000', 'Open flame due to torch or sulo', 'admin', 'Operation', 'Mark Villanueva', 'Team DDD', '20:20:00', '21:00:00', '2nd Alarm', 'Residential', '', NULL, '', NULL, 0, NULL),
(57, 'Fire at New Pandan Farm', 'New Pandan', 'Farm Road', 'Purok 7', 'Matalam', '2025-10-27 22:40:00', 'Farm', 'None', 'Team EEE', '12000', 'Spontaneous combustion', 'admin', 'Operation', 'Josefina Cruz', 'Team EEE', '22:45:00', '23:30:00', '1st Alarm', 'Agricultural', '', NULL, '', NULL, 0, NULL),
(58, 'Fire at Patadon West Store', 'Patadon West', 'Main St.', 'Purok 8', 'Matalam', '2025-10-28 06:50:00', 'Store', 'None', 'Team FFF', '9000', 'Electrical machineries', 'admin', 'Operation', 'Ricardo Gomez', 'Team FFF', '06:55:00', '07:30:00', '1st Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(59, 'Fire at Poblacion Church', 'Poblacion', 'Church Road', 'Purok 9', 'Matalam', '2025-10-29 09:25:00', 'Church', 'None', 'Team GGG', '30000', 'Lightning', 'admin', 'Operation', 'Sofia Lim', 'Team GGG', '09:30:00', '10:00:00', '1st Alarm', 'Religious', '', NULL, '', NULL, 0, NULL),
(60, 'Fire at Salvacion Market', 'Salvacion', 'Market Road', 'Purok 10', 'Matalam', '2025-10-30 11:10:00', 'Public Market', 'None', 'Team HHH', '15000', 'Electrical appliances', 'admin', 'Operation', 'Pedro Ramos', 'Team HHH', '11:15:00', '12:00:00', '1st Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(61, 'Fire at Santa Maria School', 'Santa Maria', 'School St.', 'Purok 1', 'Matalam', '2025-10-31 13:10:00', 'School', 'None', 'Team III', '10000', 'Lighted cigarette butt', 'admin', 'Fire Safety and Prevention', 'Ana Lopez', 'Team III', '13:15:00', '13:50:00', '1st Alarm', 'Educational', '', NULL, '', NULL, 0, NULL),
(62, 'Fire at Sarayan Gas Station', 'Sarayan', 'Highway', 'Purok 2', 'Matalam', '2025-11-01 15:00:00', 'Gas Station', '1 injured', 'Team JJJ', '80000', 'Chemicals/LPG leaking', 'admin', 'Operation', 'Carlos Dizon', 'Team JJJ', '15:05:00', '15:40:00', '2nd Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(63, 'Fire at Taculen Rice Mill', 'Taculen', 'Mill Road', 'Purok 3', 'Matalam', '2025-11-02 17:30:00', 'Rice Mill', 'None', 'Team KKK', '25000', 'Mechanical collision', 'admin', 'Operation', 'Liza Reyes', 'Team KKK', '17:35:00', '18:20:00', '1st Alarm', 'Industrial', '', NULL, '', NULL, 0, NULL),
(64, 'Fire at Taguranao Apartment', 'Taguranao', 'Mabini St.', 'Purok 4', 'Matalam', '2025-11-03 19:15:00', 'Apartment', '3 injured', 'Team LLL', '40000', 'Open flame due to torch or sulo', 'admin', 'Operation', 'Mark Villanueva', 'Team LLL', '19:20:00', '20:00:00', '2nd Alarm', 'Residential', '', NULL, '', NULL, 0, NULL),
(65, 'Fire at Tamped (Tampad) Farm', 'Tamped (Tampad)', 'Farm Road', 'Purok 5', 'Matalam', '2025-11-04 21:40:00', 'Farm', 'None', 'Team MMM', '12000', 'Spontaneous combustion', 'admin', 'Operation', 'Josefina Cruz', 'Team MMM', '21:45:00', '22:30:00', '1st Alarm', 'Agricultural', '', NULL, '', NULL, 0, NULL),
(66, 'Fire at New Abra Store', 'New Abra', 'Main St.', 'Purok 6', 'Matalam', '2025-11-05 07:50:00', 'Store', 'None', 'Team NNN', '9000', 'Electrical machineries', 'admin', 'Operation', 'Ricardo Gomez', 'Team NNN', '07:55:00', '08:30:00', '1st Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(67, 'Fire at Pinamaton Church', 'Pinamaton', 'Church Road', 'Purok 7', 'Matalam', '2025-11-06 10:25:00', 'Church', 'None', 'Team OOO', '30000', 'Lightning', 'admin', 'Operation', 'Sofia Lim', 'Team OOO', '10:30:00', '11:00:00', '1st Alarm', 'Religious', '', NULL, '', NULL, 0, NULL),
(68, 'Fire at Arakan Market', 'Arakan', 'Market Road', 'Purok 8', 'Matalam', '2025-11-07 12:10:00', 'Public Market', 'None', 'Team PPP', '15000', 'Electrical appliances', 'admin', 'Operation', 'Pedro Ramos', 'Team PPP', '12:15:00', '13:00:00', '1st Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(69, 'Warehouse Fire in Central Malamote', 'Central Malamote', 'Rizal St.', 'Purok 5', 'Matalam', '2025-08-10 14:20:00', 'Warehouse', 'None', 'Team B', '50000', 'Electrical connection', 'admin', 'Operation', 'Juan Dela Cruz', 'Team B', '14:25:00', '15:10:00', '2nd Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(70, 'Residential Fire in Linao', 'Linao', 'Bonifacio Ave.', 'Purok 3', 'Matalam', '2025-08-11 09:45:00', 'House', '2 injured', 'Team C', '20000', 'Open flame due to unattended cooking/stove', 'admin', 'Operation', 'Maria Santos', 'Team C', '09:50:00', '10:30:00', '1st Alarm', 'Residential', '', NULL, '', NULL, 0, NULL),
(71, 'Fire at Kidama Market', 'Kidama', 'Market Road', 'Purok 1', 'Matalam', '2025-08-12 16:10:00', 'Public Market', 'None', 'Team D', '15000', 'Electrical appliances', 'admin', 'Operation', 'Pedro Ramos', 'Team D', '16:15:00', '16:50:00', '1st Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(72, 'Fire Incident at New Pandan School', 'New Pandan', 'School St.', 'Purok 2', 'Matalam', '2025-08-13 13:00:00', 'School', 'None', 'Team E', '10000', 'Lighted cigarette butt', 'admin', 'Fire Safety and Prevention', 'Ana Lopez', 'Team E', '13:05:00', '13:40:00', '1st Alarm', 'Educational', '', NULL, '', NULL, 0, NULL),
(73, 'Fire at Dalapitan Gas Station', 'Dalapitan', 'Highway', 'Purok 4', 'Matalam', '2025-08-14 18:30:00', 'Gas Station', '1 injured', 'Team F', '80000', 'Chemicals/LPG leaking', 'admin', 'Operation', 'Carlos Dizon', 'Team F', '18:35:00', '19:20:00', '2nd Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(74, 'Fire at Patadon West Rice Mill', 'Patadon West', 'Mill Road', 'Purok 6', 'Matalam', '2025-08-15 07:15:00', 'Rice Mill', 'None', 'Team G', '25000', 'Mechanical collision', 'admin', 'Operation', 'Liza Reyes', 'Team G', '07:20:00', '08:00:00', '1st Alarm', 'Industrial', '', NULL, '', NULL, 0, NULL),
(75, 'Fire at Poblacion Apartment', 'Poblacion', 'Mabini St.', 'Purok 7', 'Matalam', '2025-08-16 22:40:00', 'Apartment', '3 injured', 'Team H', '40000', 'Open flame due to torch or sulo', 'admin', 'Operation', 'Mark Villanueva', 'Team H', '22:45:00', '23:30:00', '2nd Alarm', 'Residential', '', NULL, '', NULL, 0, NULL),
(76, 'Fire at New Abra Farm', 'New Abra', 'Farm Road', 'Purok 8', 'Matalam', '2025-08-17 05:50:00', 'Farm', 'None', 'Team I', '12000', 'Spontaneous combustion', 'admin', 'Operation', 'Josefina Cruz', 'Team I', '05:55:00', '06:30:00', '1st Alarm', 'Agricultural', '', NULL, '', NULL, 0, NULL),
(77, 'Fire at Arakan Store', 'Arakan', 'Main St.', 'Purok 9', 'Matalam', '2025-08-18 11:25:00', 'Store', 'None', 'Team J', '9000', 'Electrical machineries', 'admin', 'Operation', 'Ricardo Gomez', 'Team J', '11:30:00', '12:00:00', '1st Alarm', 'Commercial', '', NULL, '', NULL, 0, NULL),
(78, 'Fire at Bangbang Church', 'Bangbang', 'Church Road', 'Purok 10', 'Matalam', '2025-08-19 15:10:00', 'Church', 'None', 'Team K', '30000', 'Lightning', 'admin', 'Operation', 'Sofia Lim', 'Team K', '15:15:00', '16:00:00', '1st Alarm', 'Religious', '', NULL, '', NULL, 0, NULL),
(79, 'Warehouse Fire in Central Malamote', 'Linao', 'Tuscano', 'Purok 2 Lovers', 'Matalam', '2025-09-08 20:12:00', 'BFP', '', '', '10000', 'Airplane crash', 'batman', NULL, 'Sean Ernest Aguda', 'Team A', '20:12', '20:12', '1st Alarm', 'Residential', '', '', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fire_safety_inspection_certificate`
--

CREATE TABLE `fire_safety_inspection_certificate` (
  `id` int(11) NOT NULL,
  `permit_name` varchar(255) NOT NULL,
  `inspection_establishment` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `inspection_address` varchar(255) NOT NULL,
  `inspection_date` date NOT NULL,
  `establishment_type` varchar(50) NOT NULL,
  `inspection_purpose` varchar(50) NOT NULL,
  `fire_alarms` tinyint(1) DEFAULT 0,
  `fire_extinguishers` tinyint(1) DEFAULT 0,
  `emergency_exits` tinyint(1) DEFAULT 0,
  `sprinkler_systems` tinyint(1) DEFAULT 0,
  `fire_drills` tinyint(1) DEFAULT 0,
  `exit_signs` tinyint(1) DEFAULT 0,
  `electrical_wiring` tinyint(1) DEFAULT 0,
  `emergency_evacuations` tinyint(1) DEFAULT 0,
  `inspected_by` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `contact_number` varchar(50) NOT NULL,
  `number_of_occupants` int(11) NOT NULL,
  `nature_of_business` varchar(255) NOT NULL,
  `number_of_floors` int(11) NOT NULL,
  `floor_area` varchar(100) NOT NULL,
  `classification_of_hazards` varchar(50) NOT NULL,
  `building_construction` varchar(255) NOT NULL,
  `possible_problems` text DEFAULT NULL,
  `hazardous_materials` text DEFAULT NULL,
  `application_form` varchar(255) DEFAULT NULL,
  `proof_of_ownership` varchar(255) DEFAULT NULL,
  `building_plans` varchar(255) DEFAULT NULL,
  `fire_safety_equipment` varchar(255) DEFAULT NULL,
  `evacuation_plan` varchar(255) DEFAULT NULL,
  `fire_safety_personnel` varchar(255) DEFAULT NULL,
  `fire_insurance_policy` varchar(255) DEFAULT NULL,
  `occupancy_permit` varchar(255) DEFAULT NULL,
  `business_permit` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fire_safety_inspection_certificate`
--

INSERT INTO `fire_safety_inspection_certificate` (`id`, `permit_name`, `inspection_establishment`, `owner`, `inspection_address`, `inspection_date`, `establishment_type`, `inspection_purpose`, `fire_alarms`, `fire_extinguishers`, `emergency_exits`, `sprinkler_systems`, `fire_drills`, `exit_signs`, `electrical_wiring`, `emergency_evacuations`, `inspected_by`, `contact_person`, `contact_number`, `number_of_occupants`, `nature_of_business`, `number_of_floors`, `floor_area`, `classification_of_hazards`, `building_construction`, `possible_problems`, `hazardous_materials`, `application_form`, `proof_of_ownership`, `building_plans`, `fire_safety_equipment`, `evacuation_plan`, `fire_safety_personnel`, `fire_insurance_policy`, `occupancy_permit`, `business_permit`, `created_at`, `deleted_at`) VALUES
(40, 'Hardware Inspection 1', 'Matalam Hardware', 'Sean Ernest Aguda', 'Matalam Hardware', '2025-09-06', 'commercial', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda', 'Sean Ernest Aguda', '09777461096', 2, 'None', 5, '750', 'Class_A', 'concrete', 'none', 'wood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-08 13:44:48', NULL),
(41, 'Hardware Inspection 1', 'Matalam Hardware', 'Sean Ernest Aguda', 'Matalam Hardware', '2025-09-06', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda', 'Sean Ernest Aguda', '09777461096', 2, 'None', 5, '750', 'Class_A', 'concrete', 'none', 'wood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-08 14:08:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fire_types`
--

CREATE TABLE `fire_types` (
  `fire_types_id` int(11) NOT NULL,
  `fire_types` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fire_types`
--

INSERT INTO `fire_types` (`fire_types_id`, `fire_types`, `description`) VALUES
(1, 'Electrical connection', 'Fires caused by faulty or poor electrical connections, resulting in overheating or sparks.'),
(2, 'Electrical appliances', 'Fires due to malfunctioning or damaged electrical appliances, like faulty wiring or overheating.'),
(3, 'Electrical machineries', 'Fires originating from electrical machinery malfunction, including motor failures or wiring issues.'),
(4, 'Spontaneous combustion', 'Fires occurring without external ignition, usually due to chemical reactions or organic material heating up internally.'),
(5, 'Open flame due to unattended cooking/stove', 'Fires caused by stoves or cooking appliances left unattended, leading to overheating or flare-ups.'),
(6, 'Open flame due to torch or sulo', 'Fires caused by unattended torches or makeshift open flame sources, like a sulo (bin).'),
(7, 'Open flame due to unattended lighted candle or gasera', 'Fires from candles or lamps left unattended, igniting nearby combustible materials.'),
(8, 'LPG explosion due to direct flame contact or static electricity', 'Explosions caused by LPG gas coming into contact with a flame or igniting from static electricity.'),
(9, 'Lighted cigarette butt', 'Fires caused by discarded or improperly handled cigarette butts igniting combustible materials.'),
(10, 'Chemicals/LPG leaking', 'Fires from chemicals or LPG leaking and igniting due to external sparks, heat, or other sources.'),
(11, 'Pyrotechnics', 'Fires caused by the improper handling or malfunctioning of fireworks or other pyrotechnic devices.'),
(12, 'Lighted matchstick or lighter', 'Fires caused by igniting combustible materials with a matchstick or lighter.'),
(13, 'Incendiary device/mechanism or ignited flammable liquids', 'Fires intentionally caused by a device or flammable liquids used to start a fire.'),
(14, 'Lightning', 'Fires started by a lightning strike, igniting flammable materials in its path.'),
(15, 'Open flame', 'Fires originating from open flames in uncontrolled environments, including candles, bonfires, or other ignition sources.'),
(16, 'Mechanical collision', 'Fires caused by mechanical impacts or friction, such as vehicle crashes or industrial machinery failure.'),
(17, 'Airplane crash', 'Fires resulting from an airplane crash, typically due to fuel ignition or damage to electrical systems.'),
(18, 'Bomb explosion', 'Fires caused by explosions from bombs or similar devices, causing widespread damage and ignition.'),
(19, 'Under investigation', 'Fires where the exact cause is not yet determined, pending further investigation.'),
(20, 'Others', 'Fires caused by various uncommon or undefined factors not covered in the listed categories.'),
(40, 'Electrical connection', 'Fires caused by faulty or poor electrical connections, resulting in overheating or sparks.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` text NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `birthday` date NOT NULL,
  `address` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `contact` varchar(255) NOT NULL,
  `user_type` enum('admin','staff') NOT NULL DEFAULT 'staff',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verified` tinyint(1) DEFAULT 0,
  `status` varchar(255) DEFAULT 'not verified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `avatar`, `first_name`, `middle_name`, `last_name`, `birthday`, `address`, `username`, `gender`, `password`, `department`, `contact`, `user_type`, `created_at`, `updated_at`, `verified`, `status`) VALUES
(120, '68b919a552a56_thumb2-batman-minimal-superheroes-black-background.jpg', 'Sean Ernest', 'Pamonag', 'Aguda', '2025-09-04', 'Poblacion, Matalam, Cotabato', 'sean', 'male', '$2y$10$QEiPb7BTjm/3Z81bfpKw8.mnPQ5PsIeyrnmVRAQbaqqB8EFVSMFBq', 'Operation', '09777461097', 'admin', '2025-09-04 04:29:05', '2025-09-04 04:46:29', 0, 'verified'),
(121, '68bbd66c02b4c_batman.jpg', 'Bruce', '', 'Wayne', '2025-09-06', 'Gotham', 'batman', 'Male', '$2y$10$POaPg7oLMomNCLoBWKxjSu/5DDbWKeapjYQNN9zFXs/OLp/sqoTJq', 'Fire Safety and Prevention', '09777461096', 'staff', '2025-09-06 06:28:58', '2025-09-06 06:36:28', 0, 'verified');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barangays`
--
ALTER TABLE `barangays`
  ADD PRIMARY KEY (`barangay_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`departments_id`);

--
-- Indexes for table `fire_incident_reports`
--
ALTER TABLE `fire_incident_reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `fire_safety_inspection_certificate`
--
ALTER TABLE `fire_safety_inspection_certificate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fire_types`
--
ALTER TABLE `fire_types`
  ADD PRIMARY KEY (`fire_types_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `barangays`
--
ALTER TABLE `barangays`
  MODIFY `barangay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `departments_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fire_incident_reports`
--
ALTER TABLE `fire_incident_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `fire_safety_inspection_certificate`
--
ALTER TABLE `fire_safety_inspection_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `fire_types`
--
ALTER TABLE `fire_types`
  MODIFY `fire_types_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
