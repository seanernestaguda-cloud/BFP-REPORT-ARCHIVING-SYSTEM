-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2025 at 02:11 PM
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
(123, NULL, 'Bruce', '', 'Wayne', '2025-11-16', 'Gotham', 'batman', 'Male', '$2y$10$C6g/gtbYzAFSzDAwbQ5WbeVldi4SqWY/Cmopj11flxFGb206bupkK', 'Fire Safety and Prevention', '09777461096', 'staff', '2025-11-16 14:21:14', '2025-11-16 14:21:14', 0, 'not verified');

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
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fire_safety_inspection_certificate`
--
ALTER TABLE `fire_safety_inspection_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
