-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Maj 2022, 15:37
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.0.15

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
-- Struktura tabeli dla tabeli `account`
--

CREATE TABLE `account` (
  `id` int(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwordHash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `account`
--

INSERT INTO `account` (`id`, `email`, `passwordHash`) VALUES
(1, 'XD@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$SUxWNjdWTE1OaE1Fc1plcQ$3fC9Nz+rKMMXq4wyNXBPmBQINTlN7f4xRwxPLlZrqWw'),
(2, '123@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$T09VcTRkYlJZeW00My5GVA$/JB6Jnf1BNWpNCo4OfMoVBL4D6F7s53YTSlD+qb/wx0');

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
(3, 2, '2022-05-18 12:00:00'),
(4, 3, '2022-05-25 13:27:59'),
(5, 3, '2022-05-25 13:27:59');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `marka` varchar(255) NOT NULL,
  `rocznik` varchar(255) NOT NULL,
  `phone` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `client`
--

INSERT INTO `client` (`id`, `marka`, `rocznik`, `phone`) VALUES
(1, 'Mercedes', '1984', '+48777777777'),
(2, 'BMW', '1920', '+48666666666'),
(3, 'BMW', '1920', '+48555555555'),
(4, 'Ford', '2000', '123123123'),
(5, 'Ford', '2001', '123123123'),
(6, 'Ford', '2001', '123123123'),
(7, 'Ford', '2001', '123123123'),
(8, 'fgsdf', 'sdsfs', 'd4354356'),
(9, 'gsdfg', 'sd', 'dfsgf'),
(10, 'asdasdas', 'sdasdsa', '2131231'),
(11, 'asdasdas', 'sdasdsa', '2131231'),
(12, 'asdasdas', 'sdasdsa', '2131231'),
(13, 'adasdas', '2222', '213123'),
(14, 'adasdas', '2222', '213123'),
(15, 'adasdas', '2222', '213123'),
(16, 'ewqeqw', '2212', '21312312'),
(17, 'XD', '2222', '123123321'),
(18, 'Ford', '1783', '+48999999999');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `clientappointment`
--

CREATE TABLE `clientappointment` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `clientappointment`
--

INSERT INTO `clientappointment` (`id`, `appointment_id`, `client_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 3),
(4, 3, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 7),
(8, 1, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 2, 13),
(14, 2, 14),
(15, 2, 15),
(16, 3, 16),
(17, 3, 17),
(18, 4, 18);

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
-- Indeksy dla tabeli `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_id` (`offer_id`);

--
-- Indeksy dla tabeli `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `clientappointment`
--
ALTER TABLE `clientappointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`appointment_id`),
  ADD KEY `appointment_id` (`client_id`);

--
-- Indeksy dla tabeli `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `account`
--
ALTER TABLE `account`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT dla tabeli `clientappointment`
--
ALTER TABLE `clientappointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
