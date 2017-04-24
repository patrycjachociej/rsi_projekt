-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Kwi 2017, 21:51
-- Wersja serwera: 10.1.21-MariaDB
-- Wersja PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `rsi_biblioteka_baza`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autor`
--

CREATE TABLE `autor` (
  `id_autora` int(11) NOT NULL,
  `imie` varchar(128) COLLATE utf16_polish_ci NOT NULL,
  `nazwisko` varchar(128) COLLATE utf16_polish_ci NOT NULL,
  `data_urodzenia` date NOT NULL,
  `stan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Zrzut danych tabeli `autor`
--

INSERT INTO `autor` (`id_autora`, `imie`, `nazwisko`, `data_urodzenia`, `stan`) VALUES
(1, 'Jan', 'Kowalski', '2017-03-01', 3),
(2, 'Anna', 'Nowak', '2017-03-26', 5),
(3, 'Zygmunt', 'WiesioÅ‚ek', '2017-03-10', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autor_ksiazka`
--

CREATE TABLE `autor_ksiazka` (
  `id_autor_ksiazka` int(11) NOT NULL,
  `id_ksiazki` int(11) NOT NULL,
  `id_autora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazka`
--

CREATE TABLE `ksiazka` (
  `id_ksiazki` int(11) NOT NULL,
  `tytul` varchar(512) COLLATE utf16_polish_ci NOT NULL,
  `id_autora` int(11) NOT NULL,
  `id_wydawcy` int(11) NOT NULL,
  `data_dodania` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_wydania` date NOT NULL,
  `link` varchar(1024) COLLATE utf16_polish_ci NOT NULL,
  `stan` int(11) NOT NULL,
  `opis` text COLLATE utf16_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Zrzut danych tabeli `ksiazka`
--

INSERT INTO `ksiazka` (`id_ksiazki`, `tytul`, `id_autora`, `id_wydawcy`, `data_dodania`, `data_wydania`, `link`, `stan`, `opis`) VALUES
(1, 'Tytuł książki pierwszej', 1, 1, '2017-03-24 15:12:59', '2017-03-02', '', 3, 'To jest opis pierwszej książki'),
(2, 'Tytuł drugiej ksiazki', 1, 1, '2017-03-24 16:18:02', '2017-03-01', '', 4, 'Opis drugiej ksiazki. Bla bla'),
(3, 'TytuÅ‚ testowy', 1, 1, '2017-03-26 17:06:21', '2017-03-26', 'NULL', 1, 'yhgnhjtvbyjy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `subskrypcje`
--

CREATE TABLE `subskrypcje` (
  `id_subskrypcji` int(11) NOT NULL,
  `id_uzytkownika` int(11) NOT NULL,
  `id_ksiazki` int(11) NOT NULL,
  `data_subskrybcji` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Zrzut danych tabeli `subskrypcje`
--

INSERT INTO `subskrypcje` (`id_subskrypcji`, `id_uzytkownika`, `id_ksiazki`, `data_subskrybcji`, `stan`) VALUES
(1, 1, 1, '2017-04-21 11:39:25', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sztuka_ksiazki`
--

CREATE TABLE `sztuka_ksiazki` (
  `id_sztuki_ksiazki` int(11) NOT NULL,
  `id_ksiazki` int(11) NOT NULL,
  `stan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Zrzut danych tabeli `sztuka_ksiazki`
--

INSERT INTO `sztuka_ksiazki` (`id_sztuki_ksiazki`, `id_ksiazki`, `stan`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id_uzytkownika` int(11) NOT NULL,
  `mail` varchar(256) COLLATE utf16_polish_ci NOT NULL,
  `uprawnienia` int(11) NOT NULL,
  `stan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id_uzytkownika`, `mail`, `uprawnienia`, `stan`) VALUES
(1, 'patrycja.chociej@gmail.com', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wydawca`
--

CREATE TABLE `wydawca` (
  `id_wydawcy` int(11) NOT NULL,
  `nazwa` varchar(256) COLLATE utf16_polish_ci NOT NULL,
  `stan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Zrzut danych tabeli `wydawca`
--

INSERT INTO `wydawca` (`id_wydawcy`, `nazwa`, `stan`) VALUES
(1, 'Wydawca 1', 3),
(2, 'Wydawca drugi', 5),
(3, 'Wydawca testowy nr 3', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczenie`
--

CREATE TABLE `wypozyczenie` (
  `id_wypozyczenia` int(11) NOT NULL,
  `id_sztuki_ksiazki` int(11) NOT NULL,
  `id_uzytkownika` int(11) NOT NULL,
  `data_wypozyczenia` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_przewidywanego_zwrotu` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_zwrotu` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Zrzut danych tabeli `wypozyczenie`
--

INSERT INTO `wypozyczenie` (`id_wypozyczenia`, `id_sztuki_ksiazki`, `id_uzytkownika`, `data_wypozyczenia`, `data_przewidywanego_zwrotu`, `data_zwrotu`, `stan`) VALUES
(1, 1, 1, '2017-04-21 12:12:55', '2017-04-29 22:00:00', '2017-04-28 22:00:00', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autora`);

--
-- Indexes for table `autor_ksiazka`
--
ALTER TABLE `autor_ksiazka`
  ADD PRIMARY KEY (`id_autor_ksiazka`),
  ADD KEY `id_autora` (`id_autora`),
  ADD KEY `id_ksiazki` (`id_ksiazki`);

--
-- Indexes for table `ksiazka`
--
ALTER TABLE `ksiazka`
  ADD PRIMARY KEY (`id_ksiazki`),
  ADD KEY `id_autora` (`id_autora`) USING BTREE,
  ADD KEY `id_wydawcy` (`id_wydawcy`) USING BTREE;

--
-- Indexes for table `subskrypcje`
--
ALTER TABLE `subskrypcje`
  ADD PRIMARY KEY (`id_subskrypcji`),
  ADD KEY `id_uzytkownika` (`id_uzytkownika`),
  ADD KEY `id_ksiazki` (`id_ksiazki`);

--
-- Indexes for table `sztuka_ksiazki`
--
ALTER TABLE `sztuka_ksiazki`
  ADD PRIMARY KEY (`id_sztuki_ksiazki`),
  ADD KEY `id_ksiazki` (`id_ksiazki`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_uzytkownika`);

--
-- Indexes for table `wydawca`
--
ALTER TABLE `wydawca`
  ADD PRIMARY KEY (`id_wydawcy`);

--
-- Indexes for table `wypozyczenie`
--
ALTER TABLE `wypozyczenie`
  ADD PRIMARY KEY (`id_wypozyczenia`),
  ADD KEY `id_uzytkownika` (`id_uzytkownika`),
  ADD KEY `id_sztuki_ksiazki` (`id_sztuki_ksiazki`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `autor_ksiazka`
--
ALTER TABLE `autor_ksiazka`
  ADD CONSTRAINT `autor_ksiazka_ibfk_1` FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazka` (`id_ksiazki`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `autor_ksiazka_ibfk_2` FOREIGN KEY (`id_autora`) REFERENCES `autor` (`id_autora`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `ksiazka`
--
ALTER TABLE `ksiazka`
  ADD CONSTRAINT `ksiazka_ibfk_1` FOREIGN KEY (`id_wydawcy`) REFERENCES `wydawca` (`id_wydawcy`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `subskrypcje`
--
ALTER TABLE `subskrypcje`
  ADD CONSTRAINT `subskrypcje_ibfk_1` FOREIGN KEY (`id_uzytkownika`) REFERENCES `user` (`id_uzytkownika`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subskrypcje_ibfk_2` FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazka` (`id_ksiazki`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `sztuka_ksiazki`
--
ALTER TABLE `sztuka_ksiazki`
  ADD CONSTRAINT `sztuka_ksiazki_ibfk_1` FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazka` (`id_ksiazki`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `wypozyczenie`
--
ALTER TABLE `wypozyczenie`
  ADD CONSTRAINT `wypozyczenie_ibfk_1` FOREIGN KEY (`id_uzytkownika`) REFERENCES `user` (`id_uzytkownika`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wypozyczenie_ibfk_2` FOREIGN KEY (`id_sztuki_ksiazki`) REFERENCES `sztuka_ksiazki` (`id_sztuki_ksiazki`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
