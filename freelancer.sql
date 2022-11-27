-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2022 at 06:58 PM
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
(2, 'Rohit Singh', 'rohit1.singh@vit.edu.in', 'E-Commerce Web App Using MERN Stack', 'Cisco', 'Web Development', 'Online', '2022-10-28', '2022-10-27', '2022-10-27', 'certificate2.pdf'),
(3, 'Rohit Singh', 'rohit1.singh@vit.edu.in', 'Blog Web Using MERN Stack', 'Cisco', 'Web Development', 'Online', '2022-10-26', '2022-10-27', '2022-10-27', 'certificate3.pdf'),
(4, 'Rohit Singh', 'rohit1.singh@vit.edu.in', 'E-Commerce Web App Using MERN Stack', 'Cisco', 'Web Development', 'Online', '2022-10-28', '2022-10-27', '2022-10-27', 'certificate4.pdf'),
(5, 'abc', 'abc@vit.edu.in', 'E-Commerce Android Application using Java', 'Cisco', 'Mobile Application D', 'Online', '2022-11-26', '2022-11-26', '2022-11-26', 'certificate7.pdf'),
(6, 'xyz', 'xyz@vit.edu.in', 'E-store Mobile Application Android', 'Cisco', 'Mobile Application D', 'Online', '2022-11-27', '2022-11-27', '2022-11-27', 'certificate8.pdf');

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
(2, 'E-Commerce Web App Using MERN Stack', 'Cisco', 'Fully Functional E-commerce website using MERN Stack.\r\n\r\n\r\n\r\nIn this course, we will use four powerful technologies: React (Frontend), Node.js (Backend runtime environment), Express (Backend Framework), and MongoDB (Database).\r\n\r\n\r\n\r\nWe are also going to use Redux for state management, stipe to handle our payments, Cloudinary to handle our images, and follow the best practices to implement Authentication & Authorization.', 'HTML,CSS, JavaScript, React.js, Node.js, Express.js and Mongodb', 'BE / BTech', 'Mumbai City', 'Web Development', 'Online', '2022-10-28', '2 Month', '20000'),
(3, 'Android Music Streaming Application', 'Cisco', 'This is a very simple app suitable for beginners to learn the concepts. The following pre-requisites is good enough before starting.\r\n\r\nAndroid fundamentals for beginners\r\nInstall and Set up Android Studio\r\nFirst android app project\r\nHow to Run your first Android app\r\nThe following things you will learn in this article:\r\n\r\nImplementing MediaPlayer class and using its methods like pause, play and stop.\r\nUsing external files(images, audios, etc) in our project.\r\nBuilding the interface of our Music Player Android App.', 'Java, XML, SQL, Firebase, Android Studio', 'BE / BTech', 'Mumbai City', 'Mobile Application D', 'Online', '2022-11-26', '3 Month', '15000'),
(4, 'Apple I Tune Clone ', 'Cisco', 'Swift-based audio player with AVAudioEngine as its base. Allows for: streaming online audio, playing local file, changing audio speed (3.5X, 4X, 32X), pitch, and real-time audio manipulation using custom audio enhancements.\r\n\r\nThis player was built for podcasting. We originally used AVPlayer for playing audio but we wanted to manipulate audio that was being streamed. We set up AVAudioEngine at first just to play a file saved on the phone and it worked great, but AVAudioEngine on its own doesn\'t support streaming audio as easily as AVPlayer.\r\n\r\nThus, using AudioToolbox, we are able to stream audio and convert the downloaded data into usable data for the AVAudioEngine to play. For an overview of our solution check out our blog post.\r\n\r\nBasic Features\r\nRealtime audio manipulation that includes going up to 10x speed, using equalizers and other manipulations\r\nStream online audio using AVAudioEngine\r\nStream radio\r\nPlay locally saved audio with the same API\r\nDownload audio\r\nQueue up downloaded and streamed audio for autoplay\r\nUses only 1-2% CPU for optimal performance for the rest of your app\r\nYou\'re able to install taps and any other AVAudioEngine features to do cool things like skipping silences', 'Swift, XML, SQL, Firebase, XCode ', 'BE / BTech', 'Mumbai City', 'Mobile Application D', 'Online', '2022-11-25', '3 Month', '20000'),
(5, 'E-Commerce Android Application using Java', 'Cisco', 'his E-Commerce Application in Android is also very useful if you own a small shop business where you want to sell your products online. The main features of E-Commerce Application in Android are to view all products, choose products by category, search products, and view product details. By purchasing in the E-Commerce Application in Android you have to choose a product, and then add it in to cart. Indicate your preferred quantity then select checkout if you want to purchase the products. The E-Commerce Application in Android runs smoothly on your device as long as there’s an internet connection and it is more efficient and faster.\r\n\r\nThese are the following features of the E-Commerce Application in Android with Full Source Code\r\nView Products\r\nSearch Products\r\nChoose Products by Category\r\nView products details\r\nIndicate the desired quantity and add to cart\r\nCheckout', 'Java, XML, SQL, Firebase, Android Studio', 'BE / BTech', 'Mumbai City', 'Mobile Application D', 'Online', '2022-11-26', '3 Month', '15000'),
(6, 'E-store Mobile Application Android', 'Cisco', 'Andorid Application', 'Java, XML, SQL, Firebase, Android Studio', 'BE / BTech', 'Mumbai City', 'Mobile Application D', 'Online', '2022-11-27', '3 Month', '20000');

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
(1, 'Rohit Singh', 'rohit1.singh@vit.edu.in', 9167882452, 'Mumbai City', 'Vidyalankar Institute of Technology', 'Information Technology', 'rohit_6174', '$2b$12$Mg7MQBswbTjly.EM.PAiqeA5KCuWfhMd577v2INaUp4sYzT8.FIoK'),
(2, 'abc', 'abc@vit.edu.in', 2222222222, 'Mumbai City', 'Vidyalankar Institute of Technology', 'Information Technology', 'abc', '$2b$12$0jai8y7a1mVSSww1bdyqIedaCinuyatZdU9nKnlFqti676Tlfnofu'),
(3, 'xyz', 'xyz@vit.edu.in', 4444444444, 'Mumbai City', 'Vidyalankar Institute of Technology', 'Information Technology', 'xyz', '$2b$12$3bbc0XaarEwVx1Gl2lvTU.yjJIAPasM0.msypVlCe2YMr/.BntU0.');

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
(1, 'Rohit Singh', 'rohit1.singh@vit.edu.in', 9167882452, 'Vidyalankar Institute of Technology'),
(2, 'abc', 'abc@vit.edu.in', 2222222222, 'Vidyalankar Institute of Technology'),
(3, 'xyz', 'xyz@vit.edu.in', 4444444444, 'Vidyalankar Institute of Technology');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `completed_freelancing`
--
ALTER TABLE `completed_freelancing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `completion_certificate`
--
ALTER TABLE `completion_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `enrolled_freelancing`
--
ALTER TABLE `enrolled_freelancing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `freelancing`
--
ALTER TABLE `freelancing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students__details`
--
ALTER TABLE `students__details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
