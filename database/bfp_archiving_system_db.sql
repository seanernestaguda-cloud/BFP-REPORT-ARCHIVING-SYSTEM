-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2025 at 05:02 AM
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
(1, 'admin123', NULL, 'delete', 17, NULL, '2025-12-07 10:48:47', 'Deleted Report: Fire at Matalams'),
(2, 'admin123', NULL, 'update', 19, NULL, '2025-12-07 11:47:17', 'Updated Fire Incident Report: Fire at Matalams'),
(3, 'admin123', NULL, 'create', 24, NULL, '2025-12-07 11:49:37', 'Created report: Fire at Matalams'),
(4, 'admin123', NULL, 'create', 25, NULL, '2025-12-07 11:50:18', 'Created report: Fire at Matalams'),
(5, 'admin123', NULL, 'create', 26, NULL, '2025-12-07 11:51:04', 'Created report: Fire at Matalams'),
(6, 'admin123', NULL, 'create', 27, NULL, '2025-12-07 11:51:53', 'Created report: Fire at Matalams'),
(7, 'admin123', NULL, 'update', 20, NULL, '2025-12-07 11:58:19', 'Updated Fire Incident Report: Fire at Matalam'),
(8, 'admin123', NULL, 'update', 20, NULL, '2025-12-07 11:59:25', 'Updated Fire Incident Report: Fire at Poblacion'),
(9, 'admin123', NULL, 'update', 20, NULL, '2025-12-07 11:59:44', 'Updated Fire Incident Report: Fire at Poblacion'),
(10, 'admin123', NULL, 'update', 19, NULL, '2025-12-07 12:00:29', 'Updated Fire Incident Report: Fire at Matalams');

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
(10, 'Fire at Matalams', 'Kibudoc', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-12-05 20:20:00', 'Warehouse', '', '', '1,000,000', 'Airplane crash', 'me1', 'Administrative', 'Sean Ernest Aguda', 'Team A', '20:20', '20:20', '1st Alarm', 'Residential', '../uploads/1764937277_fire 1 - Copy.jpg,../uploads/1764937277_fire 1.jpg,../uploads/1764937277_fire 2 - Copy.jpg,../uploads/1764937277_fire 2.jpg,../uploads/1764937277_fire3 - Copy.jpg,../uploads/1764937277_fire3.jpg', '../uploads/1764937277_Spot Investigation Report Sample.pdf', '../uploads/1764937277_progress_Progress Investigation Report.pdf', '../uploads/1764937277_final_Final Investigation Report.pdf', 0, '2025-12-05 21:12:38'),
(11, 'Fire at Dalapitan Apartment', 'Ilian', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-12-05 20:24:00', 'Warehouse', '', '', '1,000,000', 'Airplane crash', 'user', 'Operation', 'Sean Ernest Aguda', 'Team A', '20:24', '20:24', '1st Alarm', 'Residential', '../uploads/1764937522_fire 1 - Copy.jpg,../uploads/1764937522_fire 1.jpg,../uploads/1764937522_fire 2 - Copy.jpg,../uploads/1764937522_fire 2.jpg,../uploads/1764937522_fire3 - Copy.jpg,../uploads/1764937522_fire3.jpg', '../uploads/1764937522_Spot Investigation Report Sample.pdf', '../uploads/1764937522_progress_Progress Investigation Report.pdf', '../uploads/1764937522_final_Final Investigation Report.pdf', 0, NULL),
(12, 'Fire at Matalams', 'Kibudoc', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-12-05 21:11:00', 'Warehouse', '', '', '2,000', '', 'me1', 'Administrative', 'Sean Ernest Aguda', 'Team A', '21:11', '21:11', '1st Alarm', 'Commercial', '', '', '', '', 0, '2025-12-05 21:12:34'),
(13, 'Fire at Matalams', 'Kibudoc', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-12-05 21:12:00', 'Warehouse', '', '', '1,000,000', '', 'me1', 'Administrative', 'Sean Ernest Aguda', 'Team A', '21:12', '21:12', '1st Alarm', 'Residential', '', '', '', '', 0, '2025-12-05 21:15:39'),
(14, 'Fire at Matalams', 'Kibudoc', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-12-05 21:15:00', 'Warehouse', '', '', '1,000,000', 'Airplane crash', 'me1', 'Administrative', 'Sean Ernest Aguda', 'Team A', '21:15', '21:15', '1st Alarm', 'Residential', '../uploads/1764995271_fire 1 - Copy.jpg', '../uploads/1764995271_Application Form (BFP).pdf', '', '', 0, '2025-12-06 12:47:09'),
(15, 'Fire at Matalams', 'Kibudoc', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-12-05 21:16:00', 'Warehouse', '', '', '1,000,000.01', 'Airplane crash', 'me1', 'Administrative', 'Sean Ernest Aguda', 'Team A', '21:16', '21:16', '1st Alarm', 'Commercial', '', '', '', '', 0, '2025-12-06 12:59:27'),
(16, 'Fire at Matalams', 'Kibudoc', 'Matalam Hardware', 'Purok 5', 'Matalam', '2025-12-05 21:32:00', 'Warehouse', '', '', '1,000,000.00', '', 'me1', 'Administrative', 'Sean Ernest Aguda', 'Team A', '21:32', '21:32', '1st Alarm', 'Residential', '', '', '', '', 0, '2025-12-06 12:52:29'),
(17, 'Fire at Matalams', 'Arakan', 'Matalam Hardware', 'Purok 4', 'Matalam', '2025-12-05 21:42:00', 'Warehouse', '', '', '1,000,000', '', 'me1', 'Administrative', 'Sean Ernest Aguda', 'Team A', '21:42', '21:42', '1st Alarm', 'Residential', '', '', '', '', 0, '2025-12-07 10:48:47'),
(18, 'Fire at Matalams', 'Arakan', 'Matalam Hardware', 'Purok 4', 'Matalam', '2025-12-06 12:29:00', 'Warehouse', '', '', '1,000,000', 'Bomb explosion', 'me1', 'Administrative', 'Sean Ernest Aguda', 'Team A', '12:29', '12:29', '1st Alarm', 'Residential', '../uploads/1764995475_fire 1 - Copy.jpg', '../uploads/1764995475_Final Fire Investigation Report.pdf', '../uploads/1764998384_Progress Investigation Report.pdf', '../uploads/1764998384_Final Investigation Report.pdf', 0, NULL),
(19, 'Fire at Matalams', 'Arakan', 'Matalam Hardware', 'Purok 4', 'Matalam', '2025-12-06 12:35:00', 'Warehouse', '', '', '1,000,000', 'Electrical appliances', 'me1', 'Administrative', 'Sean Ernest Aguda', 'Team A', '12:35', '12:35', '1st Alarm', 'Vehicular', '', '', '', '', 0, NULL),
(20, 'Fire at Poblacion', 'Poblacion', 'Matalam Hardware', 'Purok 4', 'Matalam', '2025-12-06 13:32:00', 'Warehouse', '', '', '1,000,000', 'Chemicals/LPG leaking', 'user', 'Operation', 'Sean Ernest Aguda', 'Team B', '13:32', '13:32', '1st Alarm', 'Residential', '../uploads/1765079899_fire 1 - Copy.jpg,../uploads/1765079899_fire 1.jpg,../uploads/1765079899_fire 2 - Copy.jpg,../uploads/1765079899_fire 2.jpg,../uploads/1765079899_fire3 - Copy.jpg,../uploads/1765079899_fire3.jpg', '../uploads/1765079899_Spot Investigation Report Sample.pdf', '../uploads/1765079899_Progress Investigation Report.pdf', '../uploads/1765079899_Final Investigation Report.pdf', 0, NULL),
(21, 'Fire at Matalams', 'Arakan', 'Matalam Hardware', 'Purok 4', 'Matalam', '2025-12-06 20:26:00', 'Warehouses', '', '', '1,000,000', 'Airplane crash', 'admin123', 'Administrative', 'Sean Ernest Aguda', 'Team A', '20:26', '20:26', '1st Alarm', 'Residential', '../uploads/1765024028_fire 1 - Copy.jpg,../uploads/1765024028_fire 1.jpg,../uploads/1765024028_fire 2 - Copy.jpg,../uploads/1765024028_fire 2.jpg,../uploads/1765024028_fire3 - Copy.jpg,../uploads/1765024028_fire3.jpg', '../uploads/1765024028_Spot Investigation Report Sample.pdf', '../uploads/1765024028_Progress Investigation Report.pdf', '../uploads/1765024028_Final Investigation Report.pdf', 0, NULL),
(22, 'Fire at Arakan', 'Arakan', 'Matalam Hardware', 'Purok 4', 'Matalam', '2025-12-06 20:29:00', 'Warehouse', '', '', '1,000,000', '', 'admin123', 'Administrative', 'Sean Ernest Aguda', 'Team B', '20:29', '20:29', '1st Alarm', 'Residential', '', '', '', '', 0, NULL),
(23, 'Fire at Matalams', 'Arakan', 'Matalam Hardware', 'Purok 4', 'Matalam', '2025-12-06 22:28:00', 'Warehouse', '', '', '1,000,000', 'Airplane crash', 'admin', NULL, 'Sean Ernest Aguda', 'Team A', '22:28', '22:28', '1st Alarm', 'Residential', '', '', '', '', 0, '2025-12-06 23:20:17'),
(24, 'Fire at Matalams', 'Arakan', 'Matalam Hardware', 'Purok 4', 'Matalam', '2025-12-07 11:49:00', 'Warehouse', '', '', '1,000,000', '', 'admin123', 'Administrative', 'Sean Ernest Aguda', 'Team A', '11:49', '11:49', '1st Alarm', 'Commercial', '', '', '', '', 0, NULL),
(25, 'Fire at Matalams', 'Arakan', 'Matalam Hardware', 'Purok 4', 'Matalam', '2025-12-07 11:50:00', 'Warehouse', '', '', '1,000,000', 'Airplane crash', 'admin123', 'Administrative', 'Sean Ernest Aguda', 'Team A', '11:50', '11:50', '1st Alarm', 'Industrial', '', '', '', '', 0, NULL),
(26, 'Fire at Matalams', 'Arakan', 'Matalam Hardware', 'Purok 4', 'Matalam', '2025-12-07 11:50:00', 'Warehouse', '', '', '1,000,000', '', 'admin123', 'Administrative', 'Sean Ernest Aguda', 'Team A', '11:50', '11:50', '1st Alarm', 'Institutional', '', '', '', '', 0, NULL),
(27, 'Fire at Matalams', 'Arakan', 'Matalam Hardware', 'Purok 4', 'Matalam', '2025-12-07 11:51:00', 'Warehouse', '', '', '1,000,000', '', 'admin123', 'Administrative', 'Sean Ernest Aguda', 'Team A', '11:51', '11:51', '1st Alarm', 'Others', '', '', '', '', 0, NULL);

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
(4, 'Inspection 1', 'Mel & Jade Buy & Sell', 'Mel & Jade', 'Poblacion, Matalam, Cotabato', '2025-09-15', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'John Doe', 'Mel & Jade', '09777461096', 10, 'Agriculture', 1, '750 sqm', 'Class_A', 'concrete', 'Narrow Road\r\nNo Fire Hydrants Nearby', 'Wood\r\nPaper\r\nPlastic', '../uploads/20251130171516_Application Form (BFP).pdf', '../uploads/20251130171516_Proof of Ownership.pdf', '../uploads/20251130171516_Building Plans.pdf', '../uploads/20251130171516_FSIC-Sample.pdf', '../uploads/20251130171516_Fire-Safety-Inspection-Checklist.pdf', '../uploads/20251130171516_FSIC-Sample.pdf', '../uploads/20251130171516_Tax Assessment.pdf', '2025-11-30 16:15:16', NULL, 'admin', 'N/A'),
(8, 'Mel & Jade', 'Matalam Hardware', 'Jon ', 'Matalam Hardware', '2025-12-01', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda III', 'Jon', '09777461096', 2, 'None', 5, '750', 'Class_A', 'concrete', 'wood', 'wood', '../uploads/692c7fb4e45f9_Application Form (BFP).pdf', '../uploads/692c7f5302d57_Proof of Ownership.pdf', '../uploads/692c7f53031e9_Application Form (BFP).pdf', '../uploads/692c7f53038b7_FSIC-Sample.pdf', '../uploads/692c7f5303544_Fire-Safety-Inspection-Checklist.pdf', '../uploads/692c7f5303bd9_FSIC-Sample.pdf', '../uploads/692c7f5303f66_Tax Assessment.pdf', '2025-11-30 17:01:17', NULL, 'me1', 'Administrative'),
(9, 'Mel & Jade', 'Matalam Hardware', 'Jon ', 'Matalam Hardware', '2025-12-06', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda III', 'Jon', '09777461096', 2, 'None', 5, '750', 'Class_B', 'concrete', 'none', 'none\r\n', '../uploads/20251130181039_Application Form (BFP).pdf', '../uploads/20251130181039_Proof of Ownership.pdf', '../uploads/20251130181039_Building Plans.pdf', '../uploads/20251130181039_Fire-Safety-Inspection-Checklist.pdf', '../uploads/20251130181039_Fire-Safety-Inspection-Checklist.pdf', '../uploads/20251130181039_FSIC-Sample.pdf', '../uploads/20251130181039_Tax Assessment.pdf', '2025-11-30 17:10:39', NULL, 'sean', 'Administrative'),
(10, 'Mel & Jade', 'Matalam Hardware', 'Jon ', 'Matalam Hardware', '2025-12-01', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda III', 'Jon', '09777461096', 2, 'None', 5, '750', 'Class_B', 'concrete', '1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-30 17:38:18', '2025-12-06 19:08:38', 'me1', 'Administrative'),
(11, 'Mel & Jade', 'Matalam Hardware', 'Jon ', 'Matalam Hardware', '2025-12-01', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda', 'Jon', '09777461096', 2, 'None', 5, '750', 'Class_A', 'concrete', '34', '45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-30 17:39:10', NULL, 'sean', 'Administrative'),
(12, 'Mel & Jade', 'Matalam Hardware', 'Jon ', 'Matalam Hardware', '2025-12-01', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda III', 'Jon', '09777461096', 2, 'None', 5, '750', 'Class_B', 'concrete', 'Narrow Road', 'Wood', '../uploads/20251130184842_Application Form (BFP).pdf', '../uploads/20251130184842_Proof of Ownership.pdf', '../uploads/20251130184842_Building Plans.pdf', '../uploads/20251130184842_FSIC-Sample.pdf', '../uploads/20251130184842_Fire-Safety-Inspection-Checklist.pdf', '../uploads/20251130184842_FSIC-Sample.pdf', '../uploads/20251130184842_Tax Assessment.pdf', '2025-11-30 17:48:42', NULL, 'sean', 'Administrative'),
(13, 'Mel & Jade', 'Matalam Hardware', 'Jon ', 'Matalam Hardware', '2025-12-01', 'commercial', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda III', 'Jon', '1234567890', 2, 'None', 5, '750', 'Class_A', 'concrete', 'Narrow Road\r\nToo Many houses', 'Wood\r\npaper\r\nplastic', '../uploads/20251201133025_Application Form (BFP).pdf', '../uploads/20251201133025_Proof of Ownership.pdf', '../uploads/20251201133025_Building Plans.pdf', '../uploads/20251201133025_FSIC-Sample.pdf', '../uploads/20251201133025_Fire-Safety-Inspection-Checklist.pdf', '../uploads/20251201133025_FSIC-Sample.pdf', '../uploads/20251201133025_FSIC-Sample.pdf', '2025-12-01 12:30:25', NULL, 'admin', 'N/A'),
(14, 'Inspection 1', 'Matalam Hardware', 'Sean Ernest Aguda', 'Poblacion, Matalam, Cotabato', '2025-12-06', 'residential', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda III', 'Sean Ernest Aguda', '09777461096', 2, 'None', 5, '750 sqm', 'Class_A', 'concrete', 'Narrow Road', 'Wood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-06 06:00:58', NULL, 'user', 'Operation'),
(15, 'Inspection 1', 'Matalam Hardware', 'Sean Ernest Aguda', 'Poblacion, Matalam, Cotabato', '2025-12-06', 'commercial', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda III', 'Sean Ernest Aguda', '09777461096', 2, 'None', 5, '750 sqm', 'Class_A', 'concrete', 'None', 'wood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-06 06:19:42', '2025-12-06 14:41:20', 'me1', 'Administrative'),
(16, 'Inspection 2', 'Matalam Hardware', 'Sean Ernest Aguda', 'Poblacion, Matalam, Cotabato', '2025-12-06', 'industrial', 'routine', 0, 0, 0, 0, 0, 0, 0, 0, 'Sean Ernest Aguda III', 'Sean Ernest Aguda', '09777461096', 2, 'None', 5, '750 sqm', 'Class_A', 'concrete', 'none', 'wood\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-06 14:16:30', NULL, 'admin123', 'Administrative');

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
(125, '', 'User', 'User', 'User', '2025-12-05', 'Poblacion, Matalam, Cotabato', 'user', 'male', '$2y$10$tqn3wqfLZRH5kZ6Vzn2fy.BV25Dbr5mTZE6hV23iCNwkm85I72Dnu', 'Operation', '09777461096', 'staff', '2025-12-05 12:23:09', '2025-12-06 12:19:11', 0, 'verified'),
(127, '', 'admin123', 'admin123', 'admin123', '2025-12-06', 'admin', 'admin123', '', '$2y$10$OuHGKATpLL6g5f0/Q4XTV.gk5x63tveBLGWDbG6WnKASGkZRD/nCa', 'Administrative', '1234567890', 'admin', '2025-12-06 11:17:03', '2025-12-06 11:17:09', 0, 'verified'),
(128, '', 'John', '', 'Doe', '2025-12-06', 'USA', 'jdoe', '', '$2y$10$PuoteSQLM5D85o8rrwwOvOFqQDh86E08WAiJdFV4W.L89WLMsIdEu', 'Operation', '5112512', 'admin', '2025-12-06 11:26:54', '2025-12-06 11:49:44', 0, 'verified'),
(130, '', 'admin admin admin', '', 'admin', '2025-12-07', 'Matalam Hardware', 'admin456', '', '$2y$10$3MrJ0T0yaO.ud1WPe48xHuFT3fY6lT4mW60n.9Yt1REYzDFANOPsu', 'Administrative', '1234567890', 'admin', '2025-12-07 02:34:09', '2025-12-07 02:34:09', 0, 'not verified');

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
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `fire_safety_inspection_certificate`
--
ALTER TABLE `fire_safety_inspection_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
