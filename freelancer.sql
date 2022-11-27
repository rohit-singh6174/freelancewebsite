-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2022 at 07:06 AM
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
-- Database: `freelancer`
--

-- --------------------------------------------------------

--
-- Table structure for table `approved_freelancing`
--

CREATE TABLE `approved_freelancing` (
  `id` int(11) NOT NULL,
  `stud_name` varchar(40) NOT NULL,
  `stud_email` varchar(40) NOT NULL,
  `title` varchar(255) NOT NULL,
  `company` varchar(40) NOT NULL,
  `location` varchar(20) NOT NULL,
  `freelance` varchar(20) NOT NULL,
  `workmod` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `duration` varchar(40) NOT NULL,
  `stipend` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `completed_freelancing`
--

CREATE TABLE `completed_freelancing` (
  `id` int(11) NOT NULL,
  `stud_name` varchar(40) NOT NULL,
  `stud_email` varchar(40) NOT NULL,
  `title` varchar(255) NOT NULL,
  `company` varchar(40) NOT NULL,
  `location` varchar(20) NOT NULL,
  `freelance` varchar(20) NOT NULL,
  `workmod` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `completion_date` date NOT NULL,
  `stipend` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `completion_certificate`
--

CREATE TABLE `completion_certificate` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `title` varchar(255) NOT NULL,
  `company` varchar(40) NOT NULL,
  `freelance` varchar(20) NOT NULL,
  `workmod` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `completion_date` date NOT NULL,
  `stipend` varchar(40) NOT NULL,
  `pdf` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `completion_certificate`
--

INSERT INTO `completion_certificate` (`id`, `name`, `email`, `title`, `company`, `freelance`, `workmod`, `start_date`, `completion_date`, `stipend`, `pdf`) VALUES
(1, 'Rohit Singh', 'rohit1.singh@vit.edu.in', 'Blog Web Using MERN Stack', 'Cisco', 'Web Development', 'Online', '2022-10-26', '2022-10-27', '2022-10-27', 'certificate1.pdf'),
(2, 'Rohit Singh', 'rohit1.singh@vit.edu.in', 'E-Commerce Web App Using MERN Stack', 'Cisco', 'Web Development', 'Online', '2022-10-28', '2022-10-27', '2022-10-27', 'certificate2.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_freelancing`
--

CREATE TABLE `enrolled_freelancing` (
  `id` int(11) NOT NULL,
  `stud_name` varchar(40) NOT NULL,
  `stud_email` varchar(40) NOT NULL,
  `pdf` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `company` varchar(40) NOT NULL,
  `location` varchar(20) NOT NULL,
  `freelance` varchar(20) NOT NULL,
  `workmod` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `duration` varchar(40) NOT NULL,
  `stipend` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `freelancing`
--

CREATE TABLE `freelancing` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `company` varchar(40) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `skillrequired` varchar(100) NOT NULL,
  `criteria` varchar(100) NOT NULL,
  `location` varchar(20) NOT NULL,
  `freelance` varchar(20) NOT NULL,
  `workmod` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `duration` varchar(40) NOT NULL,
  `stipend` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `freelancing`
--

INSERT INTO `freelancing` (`id`, `title`, `company`, `description`, `skillrequired`, `criteria`, `location`, `freelance`, `workmod`, `start_date`, `duration`, `stipend`) VALUES
(1, 'Blog Web Using MERN Stack', 'Cisco', 'Full-stack Blog project application using Node.js, Express, React, and MongoDB along with ES6+. We will start with a blank text editor and end with a deployed full-stack application. This course includes...\r\n\r\nBuilding an extensive backend API with Node.js & Express\r\n\r\nExtensive API testing with Postman\r\n\r\nIntegrating React with our backend in an elegant way, creating a great workflow\r\n\r\nBuilding our frontend to work with the API\r\n\r\nGet and Post Request using MongoDB', 'HTML,CSS, JavaScript, React.js, Node.js, Express.js and Mongodb', 'BE / BTech', 'Mumbai City', 'Web Development', 'Online', '2022-10-26', '1 Month', '15000'),
(2, 'E-Commerce Web App Using MERN Stack', 'Cisco', 'Fully Functional E-commerce website using MERN Stack.\r\n\r\n\r\n\r\nIn this course, we will use four powerful technologies: React (Frontend), Node.js (Backend runtime environment), Express (Backend Framework), and MongoDB (Database).\r\n\r\n\r\n\r\nWe are also going to use Redux for state management, stipe to handle our payments, Cloudinary to handle our images, and follow the best practices to implement Authentication & Authorization.', 'HTML,CSS, JavaScript, React.js, Node.js, Express.js and Mongodb', 'BE / BTech', 'Mumbai City', 'Web Development', 'Online', '2022-10-28', '2 Month', '20000');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `companyname` varchar(40) NOT NULL,
  `location` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `email`, `phone`, `companyname`, `location`, `username`, `password`) VALUES
(1, 'Rohit Singh', 'rohitsingh@hotmail.com', 9167882452, 'Cisco', 'Mumbai City', 'rohit_6174', '$2b$12$aWFS.64.XKGCntxNIDtxz.QuBEhLkzaB6DEAnu9ZSplBzJuqAwyN6');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `location` varchar(20) NOT NULL,
  `college` varchar(40) NOT NULL,
  `department` varchar(40) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `phone`, `location`, `college`, `department`, `username`, `password`) VALUES
(1, 'Rohit Singh', 'rohit1.singh@vit.edu.in', 9167882452, 'Mumbai City', 'Vidyalankar Institute of Technology', 'Information Technology', 'rohit_6174', '$2b$12$Mg7MQBswbTjly.EM.PAiqeA5KCuWfhMd577v2INaUp4sYzT8.FIoK');

-- --------------------------------------------------------

--
-- Table structure for table `students__details`
--

CREATE TABLE `students__details` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `college` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students__details`
--

INSERT INTO `students__details` (`id`, `name`, `email`, `phone`, `college`) VALUES
(1, 'Rohit Singh', 'rohit1.singh@vit.edu.in', 9167882452, 'Vidyalankar Institute of Technology');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approved_freelancing`
--
ALTER TABLE `approved_freelancing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `completed_freelancing`
--
ALTER TABLE `completed_freelancing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `completion_certificate`
--
ALTER TABLE `completion_certificate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pdf` (`pdf`);

--
-- Indexes for table `enrolled_freelancing`
--
ALTER TABLE `enrolled_freelancing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `freelancing`
--
ALTER TABLE `freelancing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `students__details`
--
ALTER TABLE `students__details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `approved_freelancing`
--
ALTER TABLE `approved_freelancing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `completed_freelancing`
--
ALTER TABLE `completed_freelancing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `completion_certificate`
--
ALTER TABLE `completion_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrolled_freelancing`
--
ALTER TABLE `enrolled_freelancing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `freelancing`
--
ALTER TABLE `freelancing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students__details`
--
ALTER TABLE `students__details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
