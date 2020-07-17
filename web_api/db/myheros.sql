-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2020 at 11:04 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myheros`
--

-- --------------------------------------------------------

--
-- Table structure for table `heros`
--

CREATE TABLE `heros` (
  `id` int(4) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `image` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `heros`
--

INSERT INTO `heros` (`id`, `name`, `description`, `date`, `image`) VALUES
(1, 'Ir. Soekarno', 'President Pertama Republik Indonesia dan Pahlawan Proklamasi Kemerdekaan Republik Indonesia', '2020-07-16', 'Soekarno.jpg'),
(2, 'Mohamad Hata', 'Wakil Presiden Republik Indonesia Pertama, merupakan Pahlawan Proklamasi Kemerdekaan Republik Indonesia', '2020-07-14', 'Hatta.jpg'),
(3, 'Sudirman', 'Jenderal Besar Raden Soedirman adalah seorang perwira tinggi Indonesia pada masa Revolusi Nasional Indonesia. Sebagai panglima besar Tentara Nasional Indonesia pertama, ia adalah sosok yang dihormati di Indonesia. ', '2020-07-16', 'Sudirman.jpg'),
(4, 'Soetomo', 'Sutomo lebih dikenal dengan sapaan akrab oleh rakyat sebagai Bung Tomo, adalah pahlawan yang terkenal karena peranannya dalam membangkitkan semangat rakyat untuk melawan kembalinya penjajah Belanda.', '2020-07-16', 'Soetomo.jpg'),
(5, 'Ki Hadjar Dewantara', 'Raden Mas Soewardi Soerjaningrat adalah aktivis pergerakan kemerdekaan Indonesia, kolumnis, politisi, dan pelopor pendidikan bagi kaum pribumi Indonesia dari zaman penjajahan Belanda. ', '2020-07-16', 'Ki_Hadjar_Dewantara.jpg'),
(6, 'Ahmad Dahlan', 'Kiai Haji Ahmad Dahlan atau Muhammad Darwis adalah seorang Pahlawan Nasional Indonesia yang merupakan pendiri Muhammadiyah. Dia adalah putra keempat dari tujuh bersaudara dari keluarga K.H. Abu Bakar.', '2020-07-17', 'kh-ahmad-dahlan.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `heros`
--
ALTER TABLE `heros`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `heros`
--
ALTER TABLE `heros`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
