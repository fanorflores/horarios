-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 03, 2021 at 05:02 PM
-- Server version: 5.7.32
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `horarios`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAsignatura` (IN `nombreIN` VARCHAR(45), IN `carreraIN` VARCHAR(45))  BEGIN
INSERT INTO `libros`.`asignatura` (`nombre`, `carrera`) VALUES (nombreIN, carreraIN);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `aulas`
--

CREATE TABLE `aulas` (
  `idaulas` int(11) NOT NULL,
  `pab` varchar(45) NOT NULL,
  `aula` varchar(45) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aulas`
--

INSERT INTO `aulas` (`idaulas`, `pab`, `aula`, `state`) VALUES
(1, '36', '06', 1),
(2, '34', '08', 1),
(3, '38', '01', 1),
(4, '36', '02', 0),
(5, '42', '03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bloques`
--

CREATE TABLE `bloques` (
  `idbloques` int(11) NOT NULL,
  `day` varchar(45) NOT NULL,
  `timestart` time NOT NULL,
  `timefinish` time NOT NULL,
  `asignatura` varchar(45) DEFAULT NULL,
  `idhorarios` int(11) NOT NULL,
  `idaulas` int(11) DEFAULT NULL,
  `idprofesor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `carreras`
--

CREATE TABLE `carreras` (
  `idcarreras` int(11) NOT NULL,
  `carrera` varchar(65) NOT NULL,
  `iddepartamentos` int(11) NOT NULL,
  `idcoordinador` int(11) NOT NULL,
  `carrerasdata` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE `departamentos` (
  `iddepartamentos` int(11) NOT NULL,
  `departamento` varchar(45) NOT NULL,
  `facultad` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`iddepartamentos`, `departamento`, `facultad`) VALUES
(1, 'Tecnología Educativa', 'fei'),
(2, 'Español', 'fei'),
(3, 'Inglés', 'fei'),
(4, 'Francés', 'fei'),
(5, 'Enfermería', 'polisal'),
(6, 'Economía', 'ccee'),
(7, 'Construción', 'ccii');

-- --------------------------------------------------------

--
-- Table structure for table `grupos`
--

CREATE TABLE `grupos` (
  `idgrupos` int(11) NOT NULL,
  `grupo` json NOT NULL,
  `idcarreras` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `horarios`
--

CREATE TABLE `horarios` (
  `idhorarios` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `semestre` int(11) NOT NULL,
  `idgrupos` int(11) NOT NULL,
  `horariodata` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `logindata`
-- (See below for the actual view)
--
CREATE TABLE `logindata` (
`idpersons` int(11)
,`user` varchar(45)
,`nombres` varchar(91)
,`password` varchar(255)
,`usertype` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `idpersons` int(11) NOT NULL,
  `globalid` varchar(45) NOT NULL,
  `names` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `dataperson` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`idpersons`, `globalid`, `names`, `firstname`, `lastname`, `dataperson`) VALUES
(1, '30843677', 'Fanor Antonio', 'Rivera ', 'Flores', NULL),
(2, '18013654', 'Juan Francisco', 'Estrada', 'Nuñez', NULL),
(3, '210168', 'Dominga del  Socorro', 'Lopez', NULL, NULL),
(4, '20891201', 'Maritza', 'Canales', 'Ruíz', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `studendata`
-- (See below for the actual view)
--
CREATE TABLE `studendata` (
`Carnet` varchar(45)
,`Nombres` varchar(45)
,`Apellidos` varchar(91)
,`Usuario` varchar(45)
,`Carrera` json
);

-- --------------------------------------------------------

--
-- Table structure for table `usersdata`
--

CREATE TABLE `usersdata` (
  `idusersdata` int(11) NOT NULL,
  `user` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` int(11) NOT NULL,
  `idpersons` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usersdata`
--

INSERT INTO `usersdata` (`idusersdata`, `user`, `password`, `usertype`, `idpersons`) VALUES
(3, 'user2', 'e99a18c428cb38d5f260853678922e03', 0, 2),
(4, 'user3', 'ffasfasfgfhdgh', 0, 4),
(6, '30843677', '$2y$10$iBpkEn92sCZERS39imFrvOLs1x.WTrzG1xfC3xnyRPBJyYZ/prPve', 0, 1);

-- --------------------------------------------------------

--
-- Structure for view `logindata`
--
DROP TABLE IF EXISTS `logindata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `logindata`  AS SELECT `p`.`idpersons` AS `idpersons`, `u`.`user` AS `user`, concat(substring_index(`p`.`names`,' ',1),' ',`p`.`firstname`) AS `nombres`, `u`.`password` AS `password`, `u`.`usertype` AS `usertype` FROM (`usersdata` `u` join `persons` `p` on((`p`.`idpersons` = `u`.`idpersons`))) ;

-- --------------------------------------------------------

--
-- Structure for view `studendata`
--
DROP TABLE IF EXISTS `studendata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studendata`  AS SELECT `p`.`globalid` AS `Carnet`, `p`.`names` AS `Nombres`, concat(`p`.`firstname`,' ',`p`.`lastname`) AS `Apellidos`, `u`.`user` AS `Usuario`, `p`.`dataperson` AS `Carrera` FROM (`usersdata` `u` join `persons` `p` on((`u`.`idpersons` = `p`.`idpersons`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`idaulas`);

--
-- Indexes for table `bloques`
--
ALTER TABLE `bloques`
  ADD PRIMARY KEY (`idbloques`),
  ADD KEY `idhorarios_idx` (`idhorarios`),
  ADD KEY `idaulas_idx` (`idaulas`),
  ADD KEY `idprofesor_idx` (`idprofesor`);

--
-- Indexes for table `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`idcarreras`),
  ADD KEY `idcoordinador_idx` (`idcoordinador`),
  ADD KEY `iddepartamentos_idx` (`iddepartamentos`);

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`iddepartamentos`);

--
-- Indexes for table `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`idgrupos`),
  ADD KEY `idcarreras_idx` (`idcarreras`);

--
-- Indexes for table `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`idhorarios`),
  ADD KEY `idgrupos_idx` (`idgrupos`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`idpersons`);

--
-- Indexes for table `usersdata`
--
ALTER TABLE `usersdata`
  ADD PRIMARY KEY (`idusersdata`),
  ADD UNIQUE KEY `user_UNIQUE` (`user`),
  ADD KEY `idpersons_idx` (`idpersons`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aulas`
--
ALTER TABLE `aulas`
  MODIFY `idaulas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bloques`
--
ALTER TABLE `bloques`
  MODIFY `idbloques` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carreras`
--
ALTER TABLE `carreras`
  MODIFY `idcarreras` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `iddepartamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `grupos`
--
ALTER TABLE `grupos`
  MODIFY `idgrupos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `horarios`
--
ALTER TABLE `horarios`
  MODIFY `idhorarios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `idpersons` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usersdata`
--
ALTER TABLE `usersdata`
  MODIFY `idusersdata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bloques`
--
ALTER TABLE `bloques`
  ADD CONSTRAINT `idaulas` FOREIGN KEY (`idaulas`) REFERENCES `aulas` (`idaulas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idhorarios` FOREIGN KEY (`idhorarios`) REFERENCES `horarios` (`idhorarios`),
  ADD CONSTRAINT `idprofesor` FOREIGN KEY (`idprofesor`) REFERENCES `persons` (`idpersons`);

--
-- Constraints for table `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `idcoordinador` FOREIGN KEY (`idcoordinador`) REFERENCES `persons` (`idpersons`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `iddepartamentos` FOREIGN KEY (`iddepartamentos`) REFERENCES `departamentos` (`iddepartamentos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `idcarreras` FOREIGN KEY (`idcarreras`) REFERENCES `carreras` (`idcarreras`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `idgrupos` FOREIGN KEY (`idgrupos`) REFERENCES `grupos` (`idgrupos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usersdata`
--
ALTER TABLE `usersdata`
  ADD CONSTRAINT `idpersons` FOREIGN KEY (`idpersons`) REFERENCES `persons` (`idpersons`) ON DELETE CASCADE ON UPDATE CASCADE;
