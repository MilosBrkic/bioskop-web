-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2020 at 05:03 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bioskop`
--

-- --------------------------------------------------------

--
-- Table structure for table `distributeri`
--

CREATE TABLE `distributeri` (
  `id` int(8) NOT NULL,
  `naziv` varchar(40) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributeri`
--

INSERT INTO `distributeri` (`id`, `naziv`, `telefon`, `email`) VALUES
(1, 'Distributer 1', '066-3424-112', 'disributer@gmail.com'),
(2, 'Distributer 2', '063-123-2234', 'dis2@gmail.com'),
(6, 'Movie dist', '061 3324 123', 'dist3@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `filmovi`
--

CREATE TABLE `filmovi` (
  `id` int(8) NOT NULL,
  `naziv` varchar(100) NOT NULL,
  `trajanje` int(4) UNSIGNED NOT NULL COMMENT 'minut',
  `distributer` int(8) DEFAULT NULL,
  `aktivan` tinyint(1) NOT NULL,
  `reziser` int(8) DEFAULT NULL,
  `opis` text NOT NULL,
  `godina` int(6) NOT NULL,
  `url` varchar(200) NOT NULL,
  `ocena` decimal(2,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filmovi`
--

INSERT INTO `filmovi` (`id`, `naziv`, `trajanje`, `distributer`, `aktivan`, `reziser`, `opis`, `godina`, `url`, `ocena`) VALUES
(1, 'Batman', 110, 1, 0, 1, '', 2002, 'https://images-na.ssl-images-amazon.com/images/I/61sXtDrzDaL._AC_SY879_.jpg', '9.7'),
(2, 'Avatar', 116, 2, 1, 1, '', 2007, 'https://upload.wikimedia.org/wikipedia/sr/0/01/AvatarPoster.jpg', '5.0'),
(3, 'Harry Poter', 130, 1, 1, 1, '', 2005, 'https://i.pinimg.com/originals/ff/cf/07/ffcf070e22c2ca7e9134d0b1779877f8.jpg', '5.0'),
(4, 'Ko to tamo peva', 80, 1, 1, 1, 'It\'s April 5, 1941, somewhere in Serbia. A group of people go on a bus to Belgrade, on a journey that will change their lives forever.', 1995, 'https://i.pinimg.com/originals/97/f3/97/97f397188b0787b22914874c984cf7b2.png', '8.4'),
(5, 'Juzni vetar', 95, 2, 1, 2, '', 2017, 'https://m.media-amazon.com/images/M/MV5BNzc4NjNhMmYtZGQ2YS00MTIwLTk4NjktZGNmNDZiNTExODhjXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', '5.0'),
(6, 'Mi nismo andjeli 2', 100, 1, 0, 1, '', 2005, 'https://m.media-amazon.com/images/M/MV5BYzhjYTZhODgtMTFhNC00YzhiLTkwNjAtNTRlMjU1MmY2NzUzXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_.jpg', '5.0'),
(34, 'Spiderman', 135, 2, 0, 1, '', 2010, 'https://i.pinimg.com/originals/f5/b1/a6/f5b1a65cdf95f0cec0b949283aa35fc6.jpg', '5.0'),
(95, 'Lord of the rings', 220, 2, 1, 1, 'Frodo and Sam are trekking to Mordor to destroy the One Ring of Power while Gimli, Legolas and Aragorn search for the orc-captured Merry and Pippin. All along, nefarious wizard Saruman awaits the Fellowship members at the Orthanc Tower in Isengard', 0, 'http://image.tmdb.org/t/p/w342/5VTN0pR8gcqV3EPUHHfMGnJYN9L.jpg', '5.0'),
(104, 'Joker', 200, 1, 1, 1, 'ovo je opis filma', 2019, 'https://cdn11.bigcommerce.com/s-ydriczk/images/stencil/1280x1280/products/89058/93685/Joker-2019-Final-Style-steps-Poster-buy-original-movie-posters-at-starstills__62518.1572351165.jpg?c=2?imbypass=on', '5.0');

-- --------------------------------------------------------

--
-- Table structure for table `karte`
--

CREATE TABLE `karte` (
  `id` int(8) NOT NULL,
  `broj_reda` int(8) NOT NULL,
  `broj_sedista` int(8) NOT NULL,
  `projekcija` int(8) NOT NULL,
  `cena` decimal(10,0) NOT NULL,
  `zaposleni` int(11) NOT NULL,
  `status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karte`
--

INSERT INTO `karte` (`id`, `broj_reda`, `broj_sedista`, `projekcija`, `cena`, `zaposleni`, `status`) VALUES
(2, 6, 6, 1, '6', 4, 'prodata'),
(3, 7, 7, 1, '7', 4, 'prodata'),
(4, 5, 6, 1, '200', 4, 'prodata'),
(5, 2, 33, 1, '44', 4, 'prodata'),
(6, 12, 12, 66, '12', 4, 'prodata'),
(7, 12, 13, 66, '22', 1, 'prodata'),
(8, 12, 14, 66, '55', 1, 'prodata'),
(9, 12, 23, 66, '55', 1, 'prodata'),
(10, 88, 8, 94, '8', 1, 'prodata'),
(11, -1, 0, 1, '8', 1, 'prodata'),
(12, -1, 0, 1, '5', 1, 'prodata'),
(13, -1, 0, 1, '5', 1, 'prodata'),
(14, 334, 4, 1, '45', 1, 'prodata'),
(15, 1, 1, 84, '5', 1, 'prodata'),
(16, 2, 2, 84, '44', 1, 'prodata'),
(17, 0, 0, 103, '5', 1, 'prodata'),
(18, 0, 0, 103, '5', 1, 'prodata'),
(19, 1, 1, 117, '200', 1, 'prodata'),
(20, 1, 1, 117, '5', 1, 'prodata'),
(21, 1, 1, 115, '5', 1, 'prodata'),
(22, 1, 2, 115, '55', 1, 'prodata'),
(23, 2, 1, 115, '5', 1, 'prodata'),
(24, 1, 2, 117, '200', 1, 'prodata'),
(25, 1, 3, 117, '500', 1, 'prodata'),
(26, 5, 5, 120, '5', 1, 'prodata'),
(27, 5, 6, 120, '5', 1, 'prodata'),
(29, 0, 0, 115, '500', 1, 'prodata');

-- --------------------------------------------------------

--
-- Table structure for table `osoba`
--

CREATE TABLE `osoba` (
  `id` int(8) NOT NULL,
  `ime_prezime` varchar(40) NOT NULL,
  `datum_rodjenja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `osoba`
--

INSERT INTO `osoba` (`id`, `ime_prezime`, `datum_rodjenja`) VALUES
(1, 'Marko Makrovic', '1990-03-18'),
(2, 'Petar Petrovic', '1986-05-02'),
(3, 'Will Smith', '1970-07-15'),
(5, 'Ema Votson', '1990-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `pripadnost_zanru`
--

CREATE TABLE `pripadnost_zanru` (
  `zanr` int(8) NOT NULL,
  `film` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pripadnost_zanru`
--

INSERT INTO `pripadnost_zanru` (`zanr`, `film`) VALUES
(1, 4),
(1, 6),
(1, 95),
(1, 104),
(2, 1),
(3, 1),
(3, 3),
(3, 5),
(3, 34),
(3, 95),
(3, 104),
(4, 3),
(4, 6),
(5, 1),
(5, 2),
(5, 5),
(5, 104),
(6, 4),
(7, 104);

-- --------------------------------------------------------

--
-- Table structure for table `projekcije`
--

CREATE TABLE `projekcije` (
  `id` int(8) NOT NULL,
  `film` int(8) NOT NULL,
  `sala` int(8) NOT NULL,
  `datum` date NOT NULL,
  `vreme` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projekcije`
--

INSERT INTO `projekcije` (`id`, `film`, `sala`, `datum`, `vreme`) VALUES
(1, 1, 101, '2019-12-19', '02:00:00'),
(2, 1, 100, '2019-12-19', '00:00:00'),
(62, 1, 100, '2020-01-29', '01:07:00'),
(66, 3, 100, '2020-01-28', '23:00:00'),
(84, 3, 100, '2020-01-29', '12:54:00'),
(89, 1, 100, '2020-01-30', '17:00:00'),
(92, 2, 100, '2020-03-02', '12:00:00'),
(94, 2, 101, '2020-01-31', '18:10:00'),
(96, 5, 100, '2020-02-02', '19:00:00'),
(97, 2, 104, '2020-02-02', '18:43:00'),
(98, 2, 104, '2020-06-28', '18:00:00'),
(102, 5, 97, '2020-07-06', '15:00:00'),
(103, 4, 0, '2020-08-04', '04:05:00'),
(106, 3, 100, '2020-08-11', '11:00:00'),
(114, 3, 3, '2030-12-13', '04:20:00'),
(115, 4, 0, '2030-12-13', '11:00:00'),
(116, 3, 3, '2030-12-13', '06:31:00'),
(117, 3, 3, '2030-12-13', '02:01:00'),
(119, 4, 50, '2020-07-18', '22:04:00'),
(120, 2, 0, '2020-07-30', '05:06:00'),
(121, 2, 0, '2020-09-18', '02:03:00'),
(124, 2, 0, '2055-05-05', '03:04:00');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `id` int(8) NOT NULL,
  `broj_sedista` int(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`id`, `broj_sedista`) VALUES
(0, 0),
(3, 0),
(50, 6),
(65, 0),
(78, 78),
(97, 55),
(100, 200),
(101, 150),
(104, 75);

-- --------------------------------------------------------

--
-- Table structure for table `uloga`
--

CREATE TABLE `uloga` (
  `osoba` int(8) NOT NULL,
  `film` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uloga`
--

INSERT INTO `uloga` (`osoba`, `film`) VALUES
(1, 5),
(2, 4),
(2, 6),
(3, 2),
(3, 95),
(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `zanrovi`
--

CREATE TABLE `zanrovi` (
  `id` int(8) NOT NULL,
  `naziv` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zanrovi`
--

INSERT INTO `zanrovi` (`id`, `naziv`) VALUES
(1, 'Komedija'),
(2, 'Horor'),
(3, 'Akcija'),
(4, 'Drama'),
(5, 'Triler'),
(6, 'Romansa'),
(7, 'Fantastika'),
(8, 'Avantura'),
(9, 'Animacija'),
(10, 'Misterija');

-- --------------------------------------------------------

--
-- Table structure for table `zaposleni`
--

CREATE TABLE `zaposleni` (
  `id` int(8) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `ime_prezime` varchar(40) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zaposleni`
--

INSERT INTO `zaposleni` (`id`, `username`, `password`, `ime_prezime`, `telefon`, `status`) VALUES
(1, 'milos', '$2a$10$76ppt/8KWSmDHgJcFLFvdedN8D2Tn1huEtIaoODXfoS4kvN.3EJR.', 'Milos Brkic', '065-111-333', 'admin'),
(4, 'aca', '$2a$10$6uQrffaWicyEodQvBLWe1evgY0JrCwlZhqVsdyD01ny2XSrRQs.Qa', 'Aleksandar Mitic', '065 3342 123', 'zaposleni'),
(11, 'jovica', '$2a$10$fX9tr2HTxMThN.Qz5TZR7uwejfhauZSBgudz.VC8SeaRF6rF7XoaG', NULL, NULL, 'admin'),
(20, 'test', '$2a$10$FSkaqQ3H86eNFTBg78uEEeWov6YFmsgr62abCxrgYcoOM2ncM9pS6', 'pass: test', '123', 'zaposleni'),
(23, '4', '$2a$10$Rjrxp8qYUa/5hh6/6/22MODyoV0FmxKcApnDmBonnftaWU41RuM7K', '345', '3453453453', 'zaposleni'),
(24, 'dfgdfg', '$2a$10$ZXmA3sU28cWcFSDtQdnh5O7Bsea9nhdHs0eIl72eyh2ShYz2QZKNy', 'fgdfgd', '435344', 'zaposleni'),
(25, '1234', '$2a$10$x3SPjnfTvT8X5tEEBcj6V.yTwU3zAdbtDpLubtwIZ85CMPnBgzkda', '123', '123', 'zaposleni'),
(26, 'petar', '$2a$10$uQdpP/1/zFwHxQh9MEHdw.SlIWqGX55QIy4TrclaKALupJHxDBdIW', 'Petar Peric', '065 444 444', 'zaposleni');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `distributeri`
--
ALTER TABLE `distributeri`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filmovi`
--
ALTER TABLE `filmovi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_distributer` (`distributer`),
  ADD KEY `fk_reziser` (`reziser`);

--
-- Indexes for table `karte`
--
ALTER TABLE `karte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_projekcija` (`projekcija`),
  ADD KEY `fk_zaposleni` (`zaposleni`);

--
-- Indexes for table `osoba`
--
ALTER TABLE `osoba`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pripadnost_zanru`
--
ALTER TABLE `pripadnost_zanru`
  ADD PRIMARY KEY (`zanr`,`film`),
  ADD KEY `fk_film` (`film`);

--
-- Indexes for table `projekcije`
--
ALTER TABLE `projekcije`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_filmProjekcije` (`film`),
  ADD KEY `fk_sala` (`sala`) USING BTREE;

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uloga`
--
ALTER TABLE `uloga`
  ADD PRIMARY KEY (`osoba`,`film`),
  ADD KEY `film_fk` (`film`);

--
-- Indexes for table `zanrovi`
--
ALTER TABLE `zanrovi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zaposleni`
--
ALTER TABLE `zaposleni`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `distributeri`
--
ALTER TABLE `distributeri`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `filmovi`
--
ALTER TABLE `filmovi`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `karte`
--
ALTER TABLE `karte`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `osoba`
--
ALTER TABLE `osoba`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `projekcije`
--
ALTER TABLE `projekcije`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `zanrovi`
--
ALTER TABLE `zanrovi`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `zaposleni`
--
ALTER TABLE `zaposleni`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `filmovi`
--
ALTER TABLE `filmovi`
  ADD CONSTRAINT `fk_distributer` FOREIGN KEY (`distributer`) REFERENCES `distributeri` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reziser` FOREIGN KEY (`reziser`) REFERENCES `osoba` (`id`);

--
-- Constraints for table `karte`
--
ALTER TABLE `karte`
  ADD CONSTRAINT `fk_projekcija` FOREIGN KEY (`projekcija`) REFERENCES `projekcije` (`id`),
  ADD CONSTRAINT `fk_zaposleni` FOREIGN KEY (`zaposleni`) REFERENCES `zaposleni` (`id`);

--
-- Constraints for table `pripadnost_zanru`
--
ALTER TABLE `pripadnost_zanru`
  ADD CONSTRAINT `fk_film` FOREIGN KEY (`film`) REFERENCES `filmovi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zanr` FOREIGN KEY (`zanr`) REFERENCES `zanrovi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projekcije`
--
ALTER TABLE `projekcije`
  ADD CONSTRAINT `fk_filmProjekcije` FOREIGN KEY (`film`) REFERENCES `filmovi` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sala` FOREIGN KEY (`sala`) REFERENCES `sale` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `uloga`
--
ALTER TABLE `uloga`
  ADD CONSTRAINT `film_fk` FOREIGN KEY (`film`) REFERENCES `filmovi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `osoba_fk` FOREIGN KEY (`osoba`) REFERENCES `osoba` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
