-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-11-2021 a las 00:24:38
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `horarios`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `addPerson`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addPerson` (IN `globalidIN` VARCHAR(45), IN `namesIN` VARCHAR(45), IN `firstnameIN` VARCHAR(45), IN `lastnameIN` VARCHAR(45), IN `userIN` VARCHAR(45), IN `passwordIN` VARCHAR(255))  BEGIN
    INSERT INTO persons(globalid,names,firstname,lastname)
    VALUES(globalidIN,namesIN,firstnameIN,lastnameIN);
    INSERT INTO usersdata(user,password,usertype,idpersons)
    VALUE (userIN,passwordIN,0,LAST_INSERT_ID());

end$$

DROP PROCEDURE IF EXISTS `InsertarAsignatura`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAsignatura` (IN `nombreIN` VARCHAR(45), IN `carreraIN` VARCHAR(45))  BEGIN
INSERT INTO `libros`.`asignatura` (`nombre`, `carrera`) VALUES (nombreIN, carreraIN);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

DROP TABLE IF EXISTS `aulas`;
CREATE TABLE IF NOT EXISTS `aulas` (
  `idaulas` int NOT NULL AUTO_INCREMENT,
  `pab` varchar(45) NOT NULL,
  `aula` varchar(45) NOT NULL,
  `state` int NOT NULL,
  PRIMARY KEY (`idaulas`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`idaulas`, `pab`, `aula`, `state`) VALUES
(1, '36', '06', 1),
(2, '34', '08', 1),
(3, '38', '01', 1),
(4, '36', '02', 0),
(5, '42', '03', 0),
(6, '40', '3', 1),
(7, '40', '3', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bloques`
--

DROP TABLE IF EXISTS `bloques`;
CREATE TABLE IF NOT EXISTS `bloques` (
  `idbloques` int NOT NULL AUTO_INCREMENT,
  `day` varchar(45) NOT NULL,
  `timestart` time NOT NULL,
  `timefinish` time NOT NULL,
  `asignatura` varchar(45) DEFAULT NULL,
  `idhorarios` int NOT NULL,
  `idaulas` int DEFAULT NULL,
  `idprofesor` int DEFAULT NULL,
  PRIMARY KEY (`idbloques`),
  KEY `idhorarios_idx` (`idhorarios`),
  KEY `idaulas_idx` (`idaulas`),
  KEY `idprofesor_idx` (`idprofesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

DROP TABLE IF EXISTS `carreras`;
CREATE TABLE IF NOT EXISTS `carreras` (
  `idcarreras` int NOT NULL AUTO_INCREMENT,
  `carrera` varchar(65) NOT NULL,
  `iddepartamentos` int NOT NULL,
  `idcoordinador` int NOT NULL,
  `carrerasdata` json DEFAULT NULL,
  PRIMARY KEY (`idcarreras`),
  KEY `idcoordinador_idx` (`idcoordinador`),
  KEY `iddepartamentos_idx` (`iddepartamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `iddepartamentos` int NOT NULL AUTO_INCREMENT,
  `departamento` varchar(45) NOT NULL,
  `facultad` varchar(65) NOT NULL,
  PRIMARY KEY (`iddepartamentos`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamentos`
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
-- Estructura de tabla para la tabla `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `idgrupos` int NOT NULL AUTO_INCREMENT,
  `grupo` json NOT NULL,
  `idcarreras` int NOT NULL,
  PRIMARY KEY (`idgrupos`),
  KEY `idcarreras_idx` (`idcarreras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

DROP TABLE IF EXISTS `horarios`;
CREATE TABLE IF NOT EXISTS `horarios` (
  `idhorarios` int NOT NULL AUTO_INCREMENT,
  `year` year NOT NULL,
  `semestre` int NOT NULL,
  `idgrupos` int NOT NULL,
  `horariodata` json DEFAULT NULL,
  PRIMARY KEY (`idhorarios`),
  KEY `idgrupos_idx` (`idgrupos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `logindata`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `logindata`;
CREATE TABLE IF NOT EXISTS `logindata` (
`idpersons` int
,`user` varchar(45)
,`nombres` varchar(91)
,`password` varchar(255)
,`usertype` int
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persons`
--

DROP TABLE IF EXISTS `persons`;
CREATE TABLE IF NOT EXISTS `persons` (
  `idpersons` int NOT NULL AUTO_INCREMENT,
  `globalid` varchar(45) NOT NULL,
  `names` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `dataperson` json DEFAULT NULL,
  PRIMARY KEY (`idpersons`),
  UNIQUE KEY `globalid_UNIQUE` (`globalid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persons`
--

INSERT INTO `persons` (`idpersons`, `globalid`, `names`, `firstname`, `lastname`, `dataperson`) VALUES
(1, '30843677', 'Fanor Antonio', 'Rivera ', 'Flores', NULL),
(2, '18013654', 'Juan Francisco', 'Estrada', 'Nuñez', NULL),
(3, '210168', 'Dominga del  Socorro', 'Lopez', NULL, NULL),
(4, '20891201', 'Maritza', 'Canales', 'Ruíz', NULL),
(14, '09040205', 'Augusto ', 'Calderon', 'Sandino', NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `studendata`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `studendata`;
CREATE TABLE IF NOT EXISTS `studendata` (
`Carnet` varchar(45)
,`Nombres` varchar(45)
,`Apellidos` varchar(91)
,`Usuario` varchar(45)
,`Carrera` json
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usersdata`
--

DROP TABLE IF EXISTS `usersdata`;
CREATE TABLE IF NOT EXISTS `usersdata` (
  `idusersdata` int NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` int NOT NULL,
  `idpersons` int DEFAULT NULL,
  PRIMARY KEY (`idusersdata`),
  UNIQUE KEY `user_UNIQUE` (`user`),
  KEY `idpersons_idx` (`idpersons`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usersdata`
--

INSERT INTO `usersdata` (`idusersdata`, `user`, `password`, `usertype`, `idpersons`) VALUES
(3, 'user2', 'e99a18c428cb38d5f260853678922e03', 0, 2),
(4, 'user3', 'ffasfasfgfhdgh', 0, 4),
(6, '30843677', '$2y$10$iBpkEn92sCZERS39imFrvOLs1x.WTrzG1xfC3xnyRPBJyYZ/prPve', 0, 1),
(17, 'sandino79', '$2y$10$4HglfZbjRxcBF0iNPmuRmeLqZJDTzchtBgxOKyl4bBJR/Df7W7Rxi', 0, 14);

-- --------------------------------------------------------

--
-- Estructura para la vista `logindata`
--
DROP TABLE IF EXISTS `logindata`;

DROP VIEW IF EXISTS `logindata`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `logindata`  AS  select `p`.`idpersons` AS `idpersons`,`u`.`user` AS `user`,concat(substring_index(`p`.`names`,' ',1),' ',`p`.`firstname`) AS `nombres`,`u`.`password` AS `password`,`u`.`usertype` AS `usertype` from (`usersdata` `u` join `persons` `p` on((`p`.`idpersons` = `u`.`idpersons`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `studendata`
--
DROP TABLE IF EXISTS `studendata`;

DROP VIEW IF EXISTS `studendata`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studendata`  AS  select `p`.`globalid` AS `Carnet`,`p`.`names` AS `Nombres`,concat(`p`.`firstname`,' ',`p`.`lastname`) AS `Apellidos`,`u`.`user` AS `Usuario`,`p`.`dataperson` AS `Carrera` from (`usersdata` `u` join `persons` `p` on((`u`.`idpersons` = `p`.`idpersons`))) ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bloques`
--
ALTER TABLE `bloques`
  ADD CONSTRAINT `idaulas` FOREIGN KEY (`idaulas`) REFERENCES `aulas` (`idaulas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idhorarios` FOREIGN KEY (`idhorarios`) REFERENCES `horarios` (`idhorarios`),
  ADD CONSTRAINT `idprofesor` FOREIGN KEY (`idprofesor`) REFERENCES `persons` (`idpersons`);

--
-- Filtros para la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `idcoordinador` FOREIGN KEY (`idcoordinador`) REFERENCES `persons` (`idpersons`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `iddepartamentos` FOREIGN KEY (`iddepartamentos`) REFERENCES `departamentos` (`iddepartamentos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `idcarreras` FOREIGN KEY (`idcarreras`) REFERENCES `carreras` (`idcarreras`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `idgrupos` FOREIGN KEY (`idgrupos`) REFERENCES `grupos` (`idgrupos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usersdata`
--
ALTER TABLE `usersdata`
  ADD CONSTRAINT `idpersons` FOREIGN KEY (`idpersons`) REFERENCES `persons` (`idpersons`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
