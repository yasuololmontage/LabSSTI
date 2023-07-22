-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2023 at 03:47 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twig`
--

-- --------------------------------------------------------

--
-- Table structure for table `binhluan`
--

CREATE TABLE `meo` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meo`
--

INSERT INTO `meo` (`ID`, `name`, `content`, `link`) VALUES
(1, 'Mèo like', 'Khi người yêu hỏi lần thứ 17 trong ngày là em có xinh không', 'views/img/meo1.jpg'),
(2, 'Mèo đồng ý', 'Dùng khi respect', 'views/img/meo2.jpg'),
(3, 'Mèo phê', 'Bê tha', 'views/img/meo3.jpg'),
(4, 'Mèo đẹp trai', 'Cầm lấy bông hoa, làm ny anh nka:>', 'views/img/meo4.jpg'),
(5, 'Mèo loading', 'Không hiểu kiểu gì', 'views/img/meo5.jpg'),
(6, 'Mèo ảo đá', 'Mèo meme', 'views/img/meo6.jpg'),
(7, 'Mèo béo', 'Nó thực sự béo', 'views/img/meo7.jpg'),
(8, 'Mèo cute', 'Mèo dễ thươnggg', 'views/img/meo8.jpg'),
(9, 'Mèo giận dữ', 'Mèo khi bạn dậy và không cho nó ăn hạt lần thứ n', 'views/img/meo9.jpg'),
(10, 'Mèo xỉu', 'Tình trạng chung sau khi chơi CTF', 'views/img/meo10.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `binhluan`
--
--
-- Indexes for table `meo`
--
ALTER TABLE `meo`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `binhluan`
--
--
-- AUTO_INCREMENT for table `meo`
--
ALTER TABLE `meo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
