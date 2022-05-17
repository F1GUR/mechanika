-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Maj 2022, 18:19
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mech`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `appointment`
--

INSERT INTO `appointment` (`id`, `offer_id`, `date`) VALUES
(1, 1, '2022-05-18 16:00:00'),
(2, 1, '2022-05-18 17:00:00'),
(3, 2, '2022-05-18 12:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `offer`
--

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `Nazwa` varchar(255) NOT NULL,
  `Cena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `offer`
--

INSERT INTO `offer` (`id`, `Nazwa`, `Cena`) VALUES
(1, 'Wymiana Klocków', '60$'),
(2, 'Przegląd Techniczny', '100$'),
(3, 'Zmiana i wyważenie kół', '40$');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_id` (`offer_id`);

--
-- Indeksy dla tabeli `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `offer`
--
ALTER TABLE `offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`offer_id`) REFERENCES `offer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
