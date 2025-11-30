-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2025 at 06:43 PM
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
(1, 'admin', NULL, 'create', 1, NULL, '2025-11-26 20:22:58', 'Created report: Fire at Matalams'),
(2, 'admin', NULL, 'create', 1, NULL, '2025-11-26 20:28:03', 'Created Fire Safety Inspection Report: Hardware Inspection 1'),
(3, 'me1', NULL, 'create', 2, NULL, '2025-11-27 00:04:02', 'Created report: Fire at Matalams'),
(4, 'me1', NULL, 'create', 2, NULL, '2025-11-27 00:06:28', 'Created Fire Safety Inspection Report: Hardware Inspection 1'),
(5, 'admin', NULL, 'download', 1, NULL, '2025-11-30 23:18:00', 'Download: Hardware Inspection 1'),
(6, 'admin', NULL, 'create', 3, NULL, '2025-11-30 23:52:21', 'Created Fire Safety Inspection Report: Inspection 1'),
(7, 'admin', NULL, 'delete', 1, NULL, '2025-12-01 00:01:12', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(8, 'admin', NULL, 'update', 3, NULL, '2025-12-01 00:10:43', 'Updated Fire Safety Inspection Report: Inspection 1'),
(9, 'admin', NULL, 'delete', 2, NULL, '2025-12-01 00:12:22', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(10, 'admin', NULL, 'delete', 3, NULL, '2025-12-01 00:12:26', 'Deleted Fire Safety Inspection Report: Inspection 1'),
(11, 'admin', NULL, 'create', 4, NULL, '2025-12-01 00:15:16', 'Created Fire Safety Inspection Report: Inspection 1'),
(12, 'admin', NULL, 'download', 4, NULL, '2025-12-01 00:15:20', 'Download: Inspection 1'),
(13, 'me1', NULL, 'create', 5, NULL, '2025-12-01 00:19:15', 'Created Fire Safety Inspection Report: Inspection 1'),
(14, 'me1', NULL, 'update', 2, NULL, '2025-12-01 00:20:13', 'Updated Fire Incident Report: Fire at Matalams'),
(15, 'me1', NULL, 'update', 5, NULL, '2025-12-01 00:22:15', 'Updated Fire Safety Inspection Report: Inspection 1'),
(16, 'sean', NULL, 'create', 6, NULL, '2025-12-01 00:28:49', 'Created Fire Safety Inspection Report: Inspection 1'),
(17, 'sean', NULL, 'create', 3, NULL, '2025-12-01 00:34:42', 'Created report: Fire at Patadon West Farm'),
(18, 'me1', NULL, 'create', 4, NULL, '2025-12-01 00:36:01', 'Created report: Fire at Patadon West Farm'),
(19, 'me1', NULL, 'create', 7, NULL, '2025-12-01 00:59:50', 'Created Fire Safety Inspection Report: Hardware Inspection 1'),
(20, 'me1', NULL, 'delete', 5, NULL, '2025-12-01 01:00:29', 'Deleted Fire Safety Inspection Report: Inspection 1'),
(21, 'me1', NULL, 'create', 8, NULL, '2025-12-01 01:01:17', 'Created Fire Safety Inspection Report: Mel & Jade'),
(22, 'me1', NULL, 'delete', 7, NULL, '2025-12-01 01:03:00', 'Deleted Fire Safety Inspection Report: Hardware Inspection 1'),
(23, 'me1', NULL, 'delete', 6, NULL, '2025-12-01 01:08:33', 'Deleted Fire Safety Inspection Report: Inspection 1'),
(24, 'sean', NULL, 'create', 9, NULL, '2025-12-01 01:10:39', 'Created Fire Safety Inspection Report: Mel & Jade'),
(25, 'sean', NULL, 'download', 9, NULL, '2025-12-01 01:13:22', 'Download: Mel & Jade'),
(26, 'sean', NULL, 'download', 9, NULL, '2025-12-01 01:14:13', 'Download: Mel & Jade'),
(27, 'sean', NULL, 'download', 9, NULL, '2025-12-01 01:14:31', 'Download: Mel & Jade'),
(28, 'sean', NULL, 'delete', 3, NULL, '2025-12-01 01:24:52', 'Deleted Report: Fire at Patadon West Farm'),
(29, 'sean', NULL, 'create', 5, NULL, '2025-12-01 01:25:23', 'Created report: Fire at Patadon West Farm'),
(30, 'me1', NULL, 'update', 8, NULL, '2025-12-01 01:30:59', 'Updated Fire Safety Inspection Report: Mel & Jade'),
(31, 'me1', NULL, 'update', 8, NULL, '2025-12-01 01:32:36', 'Updated Fire Safety Inspection Report: Mel & Jade'),
(32, 'me1', NULL, 'update', 9, NULL, '2025-12-01 01:34:59', 'Updated Fire Safety Inspection Report: Mel & Jade'),
(33, 'me1', NULL, 'create', 10, NULL, '2025-12-01 01:38:18', 'Created Fire Safety Inspection Report: Mel & Jade'),
(34, 'sean', NULL, 'create', 11, NULL, '2025-12-01 01:39:10', 'Created Fire Safety Inspection Report: Mel & Jade'),
(35, 'sean', NULL, 'download', 4, NULL, '2025-12-01 01:41:35', 'Download: Inspection 1');

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
(1, 'Fire at Matalams', 'Kibudoc', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-11-26 20:22:00', 'Warehouse', '', '', '1,000,000', 'Bomb explosion', 'admin', NULL, 'Sean Ernest Aguda', 'Team A', '20:22', '20:22', '2nd Alarm', 'Residential', '', '', '', '', 0, NULL),
(2, 'Fire at Matalams', 'Kibudoc', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-11-27 00:03:00', 'Warehouse', '', '', '1,000,000', 'Chemicals/LPG leaking', 'me1', 'Administrative', 'Sean Ernest Aguda', 'Team A', '00:03', '00:03', '2nd Alarm', 'Vehicular', '../uploads/1764519613_fire 1 - Copy.jpg', NULL, '', '', 0, NULL),
(3, 'Fire at Patadon West Farm', 'Kibudoc', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-12-01 00:34:00', 'Warehouse', '', '', '1,000,000', 'Airplane crash', 'sean', 'Administrative', 'Sean Ernest Aguda', 'Team A', '00:34', '00:34', '1st Alarm', 'Residential', '', '', '', '', 0, '2025-12-01 01:24:52'),
(4, 'Fire at Patadon West Farm', 'Kibudoc', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-12-01 00:35:00', 'Warehouse', '', '', '1,000,000', 'Airplane crash', 'me1', 'Administrative', 'Sean Ernest Aguda', 'Team A', '00:35', '00:35', '1st Alarm', 'Commercial', '', '', '', '', 0, NULL),
(5, 'Fire at Patadon West Farm', 'Kibudoc', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-12-01 01:25:00', 'Warehouse', '', '', '1,000,000', 'Airplane crash', 'sean', 'Administrative', 'Sean Ernest Aguda', 'Team A', '01:25', '01:25', '1st Alarm', 'Residential', '', '', '', '', 0, NULL);

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
  `fire_safety_inspection_certificate` varchar(255) DEFAULT NULL,
  `fire_safety_inspection_checklist` varchar(255) DEFAULT NULL,
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

INSERT INTO `fire_safety_inspection_certificate` (`id`, `permit_name`, `inspection_establishment`, `owner`, `inspection_address`, `inspection_date`, `establishment_type`, `inspection_purpose`, `fire_alarms`, `fire_extinguishers`, `emergency_exits`, `sprinkler_systems`, `fire_drills`, `exit_signs`, `electrical_wiring`, `emergency_evacuations`, `inspected_by`, `contact_person`, `contact_number`, `number_of_occupants`, `nature_of_business`, `number_of_floors`, `floor_area`, `classification_of_hazards`, `building_construction`, `possible_problems`, `hazardous_materials`, `application_form`, `proof_of_ownership`, `building_plans`, `fire_safety_inspection_certificate`, `fire_safety_inspection_checklist`, `occupancy_permit`, `business_permit`, `created_at`, `deleted_at`, `uploader`, `department`) VALUES
(1, 'Hardware Inspection 1', 'Matalam Hardware', 'Sean Ernest Aguda', 'Matalam Hardware', '2025-09-15', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda', 'Sean Ernest Aguda', '09777461096', 2, 'None', 5, '750', 'Class_A', 'concrete', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-26 12:28:03', '2025-12-01 00:01:12', 'admin', 'N/A'),
(2, 'Hardware Inspection 1', 'Matalam Hardware', 'Sean Ernest Aguda', 'Matalam Hardware', '2025-09-15', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda', 'Sean Ernest Aguda', '09777461096', 2, 'None', 5, '750', 'Class_B', 'concrete', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-26 16:06:28', '2025-12-01 00:12:22', 'me1', 'Administrative'),
(3, 'Inspection 1', 'Mel & Jade Buy & Sell', 'Mel & Jade', 'Poblacion, Matalam, Cotabato', '2025-09-15', 'commercial', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'John Doe', 'Mel & Jade', '09777461096', 10, 'Agriculture', 1, '750 sqm', 'Class_A', 'concrete', 'Narrow Road\r\nNo fire hydrants nearby', 'wood\r\nplastic\r\npaper', '../uploads/692c6c8387c57_Application Form (BFP).pdf', '../uploads/20251130165221_Proof of Ownership.pdf', '../uploads/20251130165221_Building Plans.pdf', '../uploads/20251130165221_FSIC-Sample.pdf', '../uploads/20251130165221_Fire-Safety-Inspection-Checklist.pdf', '../uploads/20251130165221_FSIC-Sample.pdf', '../uploads/20251130165221_Tax Assessment.pdf', '2025-11-30 15:52:21', '2025-12-01 00:12:26', 'admin', 'N/A'),
(4, 'Inspection 1', 'Mel & Jade Buy & Sell', 'Mel & Jade', 'Poblacion, Matalam, Cotabato', '2025-09-15', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'John Doe', 'Mel & Jade', '09777461096', 10, 'Agriculture', 1, '750 sqm', 'Class_A', 'concrete', 'Narrow Road\r\nNo Fire Hydrants Nearby', 'Wood\r\nPaper\r\nPlastic', '../uploads/20251130171516_Application Form (BFP).pdf', '../uploads/20251130171516_Proof of Ownership.pdf', '../uploads/20251130171516_Building Plans.pdf', '../uploads/20251130171516_FSIC-Sample.pdf', '../uploads/20251130171516_Fire-Safety-Inspection-Checklist.pdf', '../uploads/20251130171516_FSIC-Sample.pdf', '../uploads/20251130171516_Tax Assessment.pdf', '2025-11-30 16:15:16', NULL, 'admin', 'N/A'),
(5, 'Inspection 1', 'Mel & Jade Buy & Sell', 'Mel & Jade', 'Poblacion, Matalam, Cotabato', '2025-09-15', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'John Doe', 'Mel & Jade', '09777461096', 10, 'Agriculture', 1, '750 sqm', 'Class_A', 'concrete', 'none', 'wood', '../uploads/20251130171915_Application Form (BFP).pdf', '../uploads/20251130171915_Proof of Ownership.pdf', '../uploads/692c6f376d86f_Building Plans.pdf', '../uploads/20251130171915_FSIC-Sample.pdf', '../uploads/20251130171915_Fire-Safety-Inspection-Checklist.pdf', '../uploads/20251130171915_FSIC-Sample.pdf', '../uploads/20251130171915_Tax Assessment.pdf', '2025-11-30 16:19:15', '2025-12-01 01:00:29', 'me1', 'Administrative'),
(6, 'Inspection 1', 'Mel & Jade Buy & Sell', 'Mel & Jade', 'Poblacion, Matalam, Cotabato', '2025-09-15', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'John Doe', 'Mel & Jade', '09777461096', 10, 'Agriculture', 1, '750 sqm', 'Class_A', 'concrete', 'none', 'wood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-30 16:28:49', '2025-12-01 01:08:33', 'sean', 'Administrative'),
(7, 'Hardware Inspection 1', 'Matalam Hardware', 'Sean Ernest Aguda', 'Matalam Hardware', '2025-12-01', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda III', 'Sean Ernest Aguda', '09777461096', 2, 'None', 5, '750', 'Class_A', 'concrete', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-30 16:59:49', '2025-12-01 01:03:00', 'me1', 'Administrative'),
(8, 'Mel & Jade', 'Matalam Hardware', 'Jon ', 'Matalam Hardware', '2025-12-01', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda III', 'Jon', '09777461096', 2, 'None', 5, '750', 'Class_A', 'concrete', 'wood', 'wood', '../uploads/692c7fb4e45f9_Application Form (BFP).pdf', '../uploads/692c7f5302d57_Proof of Ownership.pdf', '../uploads/692c7f53031e9_Application Form (BFP).pdf', '../uploads/692c7f53038b7_FSIC-Sample.pdf', '../uploads/692c7f5303544_Fire-Safety-Inspection-Checklist.pdf', '../uploads/692c7f5303bd9_FSIC-Sample.pdf', '../uploads/692c7f5303f66_Tax Assessment.pdf', '2025-11-30 17:01:17', NULL, 'me1', 'Administrative'),
(9, 'Mel & Jade', 'Matalam Hardware', 'Jon ', 'Matalam Hardware', '2025-12-06', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda III', 'Jon', '09777461096', 2, 'None', 5, '750', 'Class_B', 'concrete', 'none', 'none\r\n', '../uploads/20251130181039_Application Form (BFP).pdf', '../uploads/20251130181039_Proof of Ownership.pdf', '../uploads/20251130181039_Building Plans.pdf', '../uploads/20251130181039_Fire-Safety-Inspection-Checklist.pdf', '../uploads/20251130181039_Fire-Safety-Inspection-Checklist.pdf', '../uploads/20251130181039_FSIC-Sample.pdf', '../uploads/20251130181039_Tax Assessment.pdf', '2025-11-30 17:10:39', NULL, 'sean', 'Administrative'),
(10, 'Mel & Jade', 'Matalam Hardware', 'Jon ', 'Matalam Hardware', '2025-12-01', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda III', 'Jon', '09777461096', 2, 'None', 5, '750', 'Class_B', 'concrete', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-30 17:38:18', NULL, 'me1', 'Administrative'),
(11, 'Mel & Jade', 'Matalam Hardware', 'Jon ', 'Matalam Hardware', '2025-12-01', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda III', 'Jon', '09777461096', 2, 'None', 5, '750', 'Class_A', 'concrete', '34', '45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-30 17:39:10', NULL, 'sean', 'Administrative');

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
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `system_name` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `system_name`, `contact_email`, `logo`, `about`) VALUES
(1, 'BUREAU OF FIRE PROTECTION REPORT ARCHIVING SYSTEM', 'admin@example.com', 'REPORT.png', '            <p>The Bureau of Fire Protection Archiving System is designed to securely manage, store, and retrieve official fire protection reports and documents. Our platform streamlines the archiving process, ensuring efficiency, accuracy, and accessibility for authorized personnel.</p><p><strong>Features:</strong><ul><li>Search and retrieve archived reports quickly</li><li>Create and manage new archive entries</li><li>Generate and export comprehensive reports</li><li>Role-based access for employees and administrators</li></ul></p><p>We are committed to providing a reliable and user-friendly system to support the Bureau of Fire Protection\\\'s mission of safeguarding lives and property.</p>\r\n');

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
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fire_safety_inspection_certificate`
--
ALTER TABLE `fire_safety_inspection_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `fire_types`
--
ALTER TABLE `fire_types`
  MODIFY `fire_types_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
