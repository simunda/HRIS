-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2022 at 09:30 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_staff`
--
CREATE DATABASE IF NOT EXISTS `db_staff` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_staff`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_attendance`
--

CREATE TABLE `tb_attendance` (
  `id_attendance` int(10) NOT NULL,
  `month` date NOT NULL,
  `id_employee` int(13) NOT NULL,
  `no_coming` int(11) NOT NULL,
  `no_sick` int(11) NOT NULL,
  `no_permits` int(11) NOT NULL,
  `no_absent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_coopcut`
--

CREATE TABLE `tb_coopcut` (
  `id_coop` int(10) NOT NULL,
  `month` date NOT NULL,
  `id_employee` int(13) NOT NULL,
  `amountof_cut` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee`
--

CREATE TABLE `tb_employee` (
  `id_employee` int(13) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `placeof_birth` varchar(20) NOT NULL,
  `dayof_birth` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `religion` varchar(20) NOT NULL,
  `id_position` int(10) NOT NULL,
  `id_golongan` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `no_children` int(11) NOT NULL,
  `education` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_golongan`
--

CREATE TABLE `tb_golongan` (
  `id_golongan` int(10) NOT NULL,
  `family_allowance` int(11) NOT NULL,
  `children_allowance` int(11) NOT NULL,
  `meal_allowance` int(11) NOT NULL,
  `ix_overtime` int(11) NOT NULL,
  `health_insurance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_overtime`
--

CREATE TABLE `tb_overtime` (
  `id_overtime` int(10) NOT NULL,
  `month` date NOT NULL,
  `id_employee` int(13) NOT NULL,
  `overtime_hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_position`
--

CREATE TABLE `tb_position` (
  `id_position` int(11) NOT NULL,
  `position_name` varchar(30) NOT NULL,
  `functional_allowance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_salary`
--

CREATE TABLE `tb_salary` (
  `id_salary` int(10) NOT NULL,
  `id_position` int(10) NOT NULL,
  `id_golongan` int(10) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_attendance`
--
ALTER TABLE `tb_attendance`
  ADD PRIMARY KEY (`id_attendance`),
  ADD UNIQUE KEY `id_employee` (`id_employee`);

--
-- Indexes for table `tb_coopcut`
--
ALTER TABLE `tb_coopcut`
  ADD PRIMARY KEY (`id_coop`),
  ADD UNIQUE KEY `id_employee` (`id_employee`);

--
-- Indexes for table `tb_employee`
--
ALTER TABLE `tb_employee`
  ADD PRIMARY KEY (`id_employee`),
  ADD UNIQUE KEY `id_jabatan` (`id_position`),
  ADD UNIQUE KEY `id_golongan` (`id_golongan`);

--
-- Indexes for table `tb_golongan`
--
ALTER TABLE `tb_golongan`
  ADD PRIMARY KEY (`id_golongan`);

--
-- Indexes for table `tb_overtime`
--
ALTER TABLE `tb_overtime`
  ADD PRIMARY KEY (`id_overtime`),
  ADD UNIQUE KEY `id_employee` (`id_employee`);

--
-- Indexes for table `tb_position`
--
ALTER TABLE `tb_position`
  ADD PRIMARY KEY (`id_position`);

--
-- Indexes for table `tb_salary`
--
ALTER TABLE `tb_salary`
  ADD PRIMARY KEY (`id_salary`),
  ADD UNIQUE KEY `id_position` (`id_position`),
  ADD UNIQUE KEY `id_golongan` (`id_golongan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_attendance`
--
ALTER TABLE `tb_attendance`
  MODIFY `id_attendance` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_coopcut`
--
ALTER TABLE `tb_coopcut`
  MODIFY `id_coop` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_employee`
--
ALTER TABLE `tb_employee`
  MODIFY `id_employee` int(13) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_golongan`
--
ALTER TABLE `tb_golongan`
  MODIFY `id_golongan` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_overtime`
--
ALTER TABLE `tb_overtime`
  MODIFY `id_overtime` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_position`
--
ALTER TABLE `tb_position`
  MODIFY `id_position` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_salary`
--
ALTER TABLE `tb_salary`
  MODIFY `id_salary` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_attendance`
--
ALTER TABLE `tb_attendance`
  ADD CONSTRAINT `tb_attendance_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `tb_employee` (`id_employee`);

--
-- Constraints for table `tb_coopcut`
--
ALTER TABLE `tb_coopcut`
  ADD CONSTRAINT `tb_coopcut_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `tb_employee` (`id_employee`);

--
-- Constraints for table `tb_employee`
--
ALTER TABLE `tb_employee`
  ADD CONSTRAINT `tb_employee_ibfk_1` FOREIGN KEY (`id_golongan`) REFERENCES `tb_golongan` (`id_golongan`),
  ADD CONSTRAINT `tb_employee_ibfk_2` FOREIGN KEY (`id_position`) REFERENCES `tb_position` (`id_position`);

--
-- Constraints for table `tb_overtime`
--
ALTER TABLE `tb_overtime`
  ADD CONSTRAINT `tb_overtime_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `tb_employee` (`id_employee`);

--
-- Constraints for table `tb_salary`
--
ALTER TABLE `tb_salary`
  ADD CONSTRAINT `tb_salary_ibfk_1` FOREIGN KEY (`id_golongan`) REFERENCES `tb_golongan` (`id_golongan`),
  ADD CONSTRAINT `tb_salary_ibfk_2` FOREIGN KEY (`id_position`) REFERENCES `tb_position` (`id_position`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
