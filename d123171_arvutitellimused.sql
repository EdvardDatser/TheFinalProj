-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: d123171.mysql.zonevs.eu
-- Loomise aeg: Mai 06, 2024 kell 09:11 EL
-- Serveri versioon: 10.4.32-MariaDB-log
-- PHP versioon: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `d123171_arvutitellimused`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `arvutitellimused`
--

CREATE TABLE `arvutitellimused` (
  `id` int(11) NOT NULL,
  `kirjeldus` text DEFAULT ' ',
  `korpus` bit(1) DEFAULT NULL,
  `kuvar` bit(1) DEFAULT NULL,
  `pakitud` bit(1) DEFAULT b'0',
  `tellimusNR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `arvutitellimused`
--

INSERT INTO `arvutitellimused` (`id`, `kirjeldus`, `korpus`, `kuvar`, `pakitud`, `tellimusNR`) VALUES
(17, 'Must kuvar, ja see on kõik', b'1', b'0', b'0', NULL),
(18, 'Ainult valge korpus!!!!!', b'1', b'0', b'0', NULL),
(19, 'Mul on vaja must/rede korpus ja kuvar!', b'1', b'1', b'1', NULL),
(20, 'I want a huge golden monitor', b'1', b'1', b'0', NULL),
(21, 'testhgdhgshgdhgds', b'0', b'0', b'0', NULL),
(22, 'test', NULL, NULL, b'0', NULL),
(23, '', NULL, NULL, b'0', NULL),
(24, '1 tuctuc iz Indii', b'1', b'1', b'1', NULL),
(25, '23У1321312312315513', NULL, NULL, b'0', NULL),
(26, 'dsadsa', NULL, NULL, b'0', NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `kasutaja`
--

CREATE TABLE `kasutaja` (
  `kasutajaID` int(11) NOT NULL,
  `kasutaja` varchar(35) DEFAULT NULL,
  `parool` varchar(35) DEFAULT NULL,
  `onAdmin` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `kasutaja`
--

INSERT INTO `kasutaja` (`kasutajaID`, `kasutaja`, `parool`, `onAdmin`) VALUES
(13, 'admin', 'su6FF4/MgjUAk', b'1'),
(14, 'kasutaja', 'suOCEedRV0wCc', NULL),
(19, 'opilane', 'suql11CWUmRTs', NULL),
(20, 'jalohigei', 'su3HSzT.H2uqc', NULL),
(21, 'VALENTIN', 'suD3TzCGce2Kc', b'1'),
(22, 'b', 'suff3Bk2ifoBU', NULL);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `arvutitellimused`
--
ALTER TABLE `arvutitellimused`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tellimusNR` (`tellimusNR`);

--
-- Indeksid tabelile `kasutaja`
--
ALTER TABLE `kasutaja`
  ADD PRIMARY KEY (`kasutajaID`),
  ADD UNIQUE KEY `kasutaja` (`kasutaja`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `arvutitellimused`
--
ALTER TABLE `arvutitellimused`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT tabelile `kasutaja`
--
ALTER TABLE `kasutaja`
  MODIFY `kasutajaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `arvutitellimused`
--
ALTER TABLE `arvutitellimused`
  ADD CONSTRAINT `arvutitellimused_ibfk_1` FOREIGN KEY (`tellimusNR`) REFERENCES `kasutaja` (`kasutajaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
