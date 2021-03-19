-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2020 at 07:16 PM
-- Server version: 5.7.24
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--
CREATE DATABASE IF NOT EXISTS `demo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `demo`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(16) NOT NULL,
  `hash` varchar(100) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `score` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `hash`, `salt`, `score`) VALUES
(4, 'Demofont', '$5$rounds=5000$steamedhamsDemof$1tZFvYqo0lgvNJNAY5kwiVvEEh6dq5w7TpEKVaiivSA', '$5$rounds=5000$steamedhamsDemofont$', 0),
(5, 'ministr', '$5$rounds=5000$steamedhamsminis$gfvF0AqELJxX.7WDt41K5nVya6GEU.XwUc5dUdiIQa1', '$5$rounds=5000$steamedhamsministr$', 0);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `universaleaccess`
--
CREATE DATABASE IF NOT EXISTS `universaleaccess` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `universaleaccess`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserEmail` varchar(500) NOT NULL,
  `UserHash` varchar(100) NOT NULL,
  `UserSalt` varchar(50) NOT NULL,
  `UserFirstName` varchar(50) NOT NULL,
  `UserLastName` varchar(50) NOT NULL,
  `UserCity` varchar(90) NOT NULL,
  `UserState` varchar(20) NOT NULL,
  `UserZip` varchar(12) NOT NULL,
  `UserEmailVerified` tinyint(1) NOT NULL,
  `UserRegistrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserVerificationCode` varchar(20) NOT NULL,
  `UserIP` varchar(50) NOT NULL,
  `UserPhone` varchar(20) NOT NULL,
  `UserFax` varchar(20) NOT NULL,
  `UserCountry` varchar(20) NOT NULL,
  `UserAdress` varchar(100) NOT NULL,
  `UserAdress2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserEmail` (`UserEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
