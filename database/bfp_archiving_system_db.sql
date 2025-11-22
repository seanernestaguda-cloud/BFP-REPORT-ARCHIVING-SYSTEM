-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2025 at 08:07 AM
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
(1, 'admin', NULL, 'create', 1, NULL, '2025-11-18 21:25:03', 'Created Fire Safety Inspection Report: Hardware Inspection 1'),
(2, 'admin', NULL, 'download', 1, NULL, '2025-11-18 21:25:08', 'Download: Hardware Inspection 1'),
(3, 'admin', NULL, 'download', 1, NULL, '2025-11-18 21:26:18', 'Download: Hardware Inspection 1'),
(4, 'admin', NULL, 'download', 1, NULL, '2025-11-18 21:26:28', 'Download: Hardware Inspection 1'),
(5, 'admin', NULL, 'download', 1, NULL, '2025-11-18 21:26:41', 'Download: Hardware Inspection 1'),
(6, 'sean', NULL, 'download', 1, NULL, '2025-11-18 21:29:36', 'Download: Hardware Inspection 1'),
(7, 'admin', NULL, 'create', 1, NULL, '2025-11-20 12:46:17', 'Created report: Fire at Matalams'),
(8, 'sean', NULL, 'delete', 1, NULL, '2025-11-20 13:07:26', 'Deleted Report: Fire at Matalams'),
(9, 'sean', NULL, 'create', 2, NULL, '2025-11-20 13:20:00', 'Created report: Fire at Dalapitan Apartment'),
(10, 'batman', NULL, 'create', 3, NULL, '2025-11-20 13:25:59', 'Created report: Fire at Dalapitan Apartment'),
(11, 'batman', NULL, 'update', 3, NULL, '2025-11-20 13:26:17', 'Updated Fire Incident Report: Fire at Dalapitan Apartment'),
(12, 'sean', NULL, 'delete', 2, NULL, '2025-11-20 13:27:18', 'Deleted Report: Fire at Dalapitan Apartment'),
(13, 'sean', NULL, 'create', 4, NULL, '2025-11-20 13:28:07', 'Created report: Fire Incident at Matalam'),
(14, 'admin', NULL, 'create', 5, NULL, '2025-11-20 13:28:47', 'Created report: Fire at Matalams'),
(15, 'admin', NULL, 'update', 3, NULL, '2025-11-20 13:29:25', 'Updated Fire Incident Report: Fire at Dalapitan Apartment'),
(16, 'batman', NULL, 'create', 6, NULL, '2025-11-20 13:43:46', 'Created report: Fire at Dalapitan Apartment'),
(17, 'admin', NULL, 'delete', 3, NULL, '2025-11-20 13:50:16', 'Deleted Report: Fire at Dalapitan Apartment'),
(18, 'sean', NULL, 'create', 2, NULL, '2025-11-20 13:54:27', 'Created Fire Safety Inspection Report: Hardware Inspection 1'),
(19, 'sean', NULL, 'create', 3, NULL, '2025-11-20 13:59:51', 'Created Fire Safety Inspection Report: Hardware Inspection 1'),
(20, 'admin', NULL, 'delete', 2, NULL, '2025-11-20 14:00:10', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(21, 'admin', NULL, 'delete', 1, NULL, '2025-11-20 14:00:14', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(22, 'sean', NULL, 'create', 7, NULL, '2025-11-20 14:04:21', 'Created report: Fire Incident at Matalam'),
(23, 'sean', NULL, 'create', 8, NULL, '2025-11-20 14:06:05', 'Created report: Fire Incident at Matalam'),
(24, 'me1', NULL, 'create', 9, NULL, '2025-11-20 14:11:28', 'Created report: Fire at Matalams'),
(25, 'admin', NULL, 'delete', 8, NULL, '2025-11-20 14:11:49', 'Deleted Report: Fire Incident at Matalam'),
(26, 'admin', NULL, 'delete', 6, NULL, '2025-11-20 14:11:53', 'Deleted Report: Fire at Dalapitan Apartment'),
(27, 'admin', NULL, 'delete', 4, NULL, '2025-11-20 14:11:59', 'Delete Report: Fire Incident at Matalam'),
(28, 'admin', NULL, 'delete', 5, NULL, '2025-11-20 14:11:59', 'Delete Report: Fire at Matalams'),
(29, 'admin', NULL, 'delete', 7, NULL, '2025-11-20 14:11:59', 'Delete Report: Fire Incident at Matalam'),
(30, 'batman', NULL, 'create', 10, NULL, '2025-11-20 14:13:20', 'Created report: Fire at Dalapitan Apartment'),
(31, 'batman', NULL, 'create', 11, NULL, '2025-11-20 14:16:32', 'Created report: Fire at Dalapitan Apartment'),
(32, 'batman', NULL, 'create', 12, NULL, '2025-11-20 14:18:32', 'Created report: Fire at Dalapitan Apartment'),
(33, 'batman', NULL, 'create', 13, NULL, '2025-11-20 14:20:53', 'Created report: Fire at Dalapitan Apartment'),
(34, 'batman', NULL, 'create', 14, NULL, '2025-11-20 14:23:06', 'Created report: Fire at Dalapitan Apartment'),
(35, 'admin', NULL, 'delete', 9, NULL, '2025-11-20 14:24:27', 'Deleted Report: Fire at Matalams'),
(36, 'admin', NULL, 'delete', 10, NULL, '2025-11-20 14:29:57', 'Delete Report: Fire at Dalapitan Apartment'),
(37, 'admin', NULL, 'delete', 11, NULL, '2025-11-20 14:29:57', 'Delete Report: Fire at Dalapitan Apartment'),
(38, 'admin', NULL, 'delete', 12, NULL, '2025-11-20 14:29:57', 'Delete Report: Fire at Dalapitan Apartment'),
(39, 'admin', NULL, 'delete', 13, NULL, '2025-11-20 14:29:57', 'Delete Report: Fire at Dalapitan Apartment'),
(40, 'admin', NULL, 'delete', 14, NULL, '2025-11-20 14:29:57', 'Delete Report: Fire at Dalapitan Apartment'),
(41, 'admin', NULL, 'create', 15, NULL, '2025-11-20 14:31:01', 'Created report: Fire at Matalams'),
(42, 'sean', NULL, 'create', 16, NULL, '2025-11-20 14:31:39', 'Created report: Fire Incident at Manubuan'),
(43, 'admin', NULL, 'delete', 15, NULL, '2025-11-20 14:35:18', 'Deleted Report: Fire at Matalams'),
(44, 'admin', NULL, 'update', 16, NULL, '2025-11-20 14:46:24', 'Updated Fire Incident Report: Fire Incident at Manubuan'),
(45, 'sean', NULL, 'create', 4, NULL, '2025-11-20 14:50:24', 'Created Fire Safety Inspection Report: Hardware Inspection 1'),
(46, 'admin', NULL, 'create', 5, NULL, '2025-11-20 14:53:26', 'Created Fire Safety Inspection Report: Permit'),
(47, 'admin', NULL, 'create', 6, NULL, '2025-11-20 14:54:41', 'Created Fire Safety Inspection Report: Permit'),
(48, 'admin', NULL, 'create', 7, NULL, '2025-11-20 14:57:51', 'Created Fire Safety Inspection Report: Permit'),
(49, 'admin', NULL, 'delete', 6, NULL, '2025-11-20 14:57:56', 'Deleted Fire Safety Inspection Report: Permit'),
(50, 'admin', NULL, 'delete', 5, NULL, '2025-11-20 14:57:59', 'Deleted Fire Safety Inspection Report: Permit'),
(51, 'sean', NULL, 'create', 8, NULL, '2025-11-20 15:04:14', 'Created Fire Safety Inspection Report: Hardware Inspection 1');

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
(9, 'Fire at Matalams', 'Kibudoc', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-11-20 14:11:00', 'Warehouse', '', '', '1,000,000', 'Airplane crash', 'me1', 'Administrative', 'Sean Ernest Aguda', 'Team A', '14:11', '14:11', '1st Alarm', 'Residential', '', '', '', '', 0, '2025-11-20 14:24:27'),
(10, 'Fire at Dalapitan Apartment', 'Bato', 'Apartment Ave.', 'Purok 5', 'Matalam', '2025-11-20 14:13:00', 'Apartment', '', '', '18000', 'Lighted cigarette butt', 'batman', NULL, 'Carlos Dizon', 'Team E', '14:13', '14:13', '1st Alarm', 'Residential', '', '', '', '', 0, '2025-11-20 14:29:57'),
(11, 'Fire at Dalapitan Apartment', 'Lampayan', 'Apartment Ave.', 'Purok 5', 'Matalam', '2025-11-20 14:16:00', 'Apartment', '', '', '18000', 'Airplane crash', 'batman', 'Fire Safety and Prevention', 'Carlos Dizon', 'Team E', '14:16', '14:16', '1st Alarm', 'Residential', '', '', '', '', 0, '2025-11-20 14:29:57'),
(12, 'Fire at Dalapitan Apartment', 'Dalapitan', 'Apartment Ave.', 'Purok 5', 'Matalam', '2025-11-20 14:18:00', 'Apartment', '', '', '18000', 'Bomb explosion', 'batman', 'Fire Safety and Prevention', 'Carlos Dizon', 'Team E', '14:18', '14:18', '1st Alarm', 'Commercial', '', '', '', '', 0, '2025-11-20 14:29:57'),
(13, 'Fire at Dalapitan Apartment', 'Bangbang', 'Apartment Ave.', 'Purok 5', 'Matalam', '2025-11-20 14:20:00', 'Apartment', '', '', '18000', 'Bomb explosion', 'batman', NULL, 'Carlos Dizon', 'Team E', '14:20', '14:20', '1st Alarm', 'Residential', '', '', '', '', 0, '2025-11-20 14:29:57'),
(14, 'Fire at Dalapitan Apartment', 'Bangbang', 'Apartment Ave.', 'Purok 5', 'Matalam', '2025-11-20 14:22:00', 'Apartment', '', '', '18000', 'Airplane crash', 'batman', 'Fire Safety and Prevention', 'Carlos Dizon', 'Team E', '14:22', '14:22', '1st Alarm', 'Residential', '', '', '', '', 0, '2025-11-20 14:29:57'),
(15, 'Fire at Matalams', 'Kibudoc', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-11-20 14:30:00', 'Warehouse', '', '', '1,000,000', 'Bomb explosion', 'admin', NULL, 'Sean Ernest Aguda', 'Team A', '14:30', '14:30', '1st Alarm', 'Residential', '', '', '', '', 0, '2025-11-20 14:35:18'),
(16, 'Fire Incident at Manubuan', 'Central Malamote', 'Tuscano', 'Purok 2 Lovers', 'Kabacan', '2025-11-20 14:31:00', 'BFP', '', '', '10000', 'Airplane crash', 'sean', 'Administrative', 'Sean Ernest Aguda', 'Team B', '14:31', '14:31', '1st Alarm', 'Residential', '', '', '', '', 0, NULL);

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
  `deleted_at` datetime DEFAULT NULL,
  `uploader` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fire_safety_inspection_certificate`
--

INSERT INTO `fire_safety_inspection_certificate` (`id`, `permit_name`, `inspection_establishment`, `owner`, `inspection_address`, `inspection_date`, `establishment_type`, `inspection_purpose`, `fire_alarms`, `fire_extinguishers`, `emergency_exits`, `sprinkler_systems`, `fire_drills`, `exit_signs`, `electrical_wiring`, `emergency_evacuations`, `inspected_by`, `contact_person`, `contact_number`, `number_of_occupants`, `nature_of_business`, `number_of_floors`, `floor_area`, `classification_of_hazards`, `building_construction`, `possible_problems`, `hazardous_materials`, `application_form`, `proof_of_ownership`, `building_plans`, `fire_safety_equipment`, `evacuation_plan`, `fire_safety_personnel`, `fire_insurance_policy`, `occupancy_permit`, `business_permit`, `created_at`, `deleted_at`, `uploader`, `department`) VALUES
(3, 'Hardware Inspection 1', 'Matalam Hardware', 'Sean Ernest Aguda', 'Matalam Hardware', '2025-11-20', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda', 'Lourdes Garcia', '09777461096', 11, 'None', 2, '750', 'Class_B', 'concrete', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-20 05:59:51', NULL, 'sean', ''),
(4, 'Hardware Inspection 1', 'Matalam Hardware', 'Sean Ernest Aguda', 'Matalam Hardware', '2025-09-15', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda', 'Sean Ernest Aguda', '09777461096', 2, 'None', 5, '750', 'Class_A', 'concrete', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-20 06:50:24', NULL, 'sean', ''),
(5, 'Permit', '123', '123', 'Poblacion, Matalam, Cotabato', '2025-11-20', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda', 'Sean Ernest Aguda', '09777461096', 12, 'none', 5, '750 sqm', 'Class_A', 'concrete', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-20 06:53:26', '2025-11-20 14:57:59', '', ''),
(6, 'Permit', 'Matalam Hardware', '123', 'Poblacion, Matalam, Cotabato', '2025-11-20', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda', 'Sean Ernest Aguda', '09777461096', 12, 'none', 5, '750 sqm', 'Class_A', 'concrete', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-20 06:54:41', '2025-11-20 14:57:56', '', ''),
(7, 'Permit', 'Matalam Hardware', 'Sean Ernest Aguda', 'Poblacion, Matalam, Cotabato', '2025-11-20', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda', 'Sean Ernest Aguda', '09777461096', 12, 'none', 12, '750s', 'Class_A', 'concrete', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-20 06:57:51', NULL, 'admin', ''),
(8, 'Hardware Inspection 1', 'Matalam Hardware', 'Sean Ernest Aguda', 'Matalam Hardware', '2025-09-15', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda', 'Sean Ernest Aguda', '09777461096', 2, 'None', 5, '750', 'Class_A', 'concrete', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-20 07:04:14', NULL, 'sean', '');

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
(20, 'Others', 'Fires caused by various uncommon or undefined factors not covered in the listed categories.'),
(40, 'Electrical connection', 'Fires caused by faulty or poor electrical connections, resulting in overheating or sparks.');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL,
  `system_name` varchar(255) NOT NULL,
  `welcome_content` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(122, '68f734b6c1da1_one piece robin GIF.gif', 'Sean Ernest', '', 'Aguda', '2025-09-16', 'Poblacion, Matalam, Cotabato', 'sean', 'male', '$2y$10$hg2kkBOLvvQ63pOqXx4Wsue/czErzaYt/xaAOS/69bj1KOpL2seBy', 'Administrative', '09777461096', 'staff', '2025-09-16 14:28:48', '2025-10-21 07:22:30', 0, 'verified'),
(123, NULL, 'Bruce', '', 'Wayne', '2025-11-16', 'Gotham', 'batman', 'Male', '$2y$10$C6g/gtbYzAFSzDAwbQ5WbeVldi4SqWY/Cmopj11flxFGb206bupkK', 'Fire Safety and Prevention', '09777461096', 'staff', '2025-11-16 14:21:14', '2025-11-20 05:20:19', 0, 'verified'),
(124, '', 'Sean Ernest', '', 'Aguda', '2025-11-18', 'Poblacion, Matalam, Cotabato', 'me1', '', '$2y$10$tO7On2tNMf3DDHIWnKtpJOGHJJUJBE4uWVd9Tq7tiAznv462FpXQO', 'Administrative', '09777461096', 'admin', '2025-11-20 06:10:55', '2025-11-20 06:10:59', 0, 'verified');

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
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `fire_safety_inspection_certificate`
--
ALTER TABLE `fire_safety_inspection_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fire_types`
--
ALTER TABLE `fire_types`
  MODIFY `fire_types_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
