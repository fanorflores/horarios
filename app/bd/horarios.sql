-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-10-2021 a las 19:33:42
-- Versión del servidor: 5.7.32
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `horarios`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAsignatura` (IN `nombreIN` VARCHAR(45), IN `carreraIN` VARCHAR(45))  BEGIN
INSERT INTO `libros`.`asignatura` (`nombre`, `carrera`) VALUES (nombreIN, carreraIN);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `idaulas` int(11) NOT NULL,
  `pab` varchar(45) NOT NULL,
  `aula` varchar(45) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`idaulas`, `pab`, `aula`, `state`) VALUES
(1, '36', '06', 1),
(2, '34', '08', 1),
(3, '38', '01', 1),
(4, '36', '02', 0),
(5, '42', '03', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bloques`
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
-- Estructura de tabla para la tabla `carreras`
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
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `iddepartamentos` int(11) NOT NULL,
  `departamento` varchar(45) NOT NULL,
  `facultad` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `grupos` (
  `idgrupos` int(11) NOT NULL,
  `grupo` json NOT NULL,
  `idcarreras` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
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
-- Estructura de tabla para la tabla `persons`
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
-- Volcado de datos para la tabla `persons`
--

INSERT INTO `persons` (`idpersons`, `globalid`, `names`, `firstname`, `lastname`, `dataperson`) VALUES
(1, '30843677', 'Fanor Antonio', 'Rivera ', 'Flores', NULL),
(2, '18013654', 'Juan Francisco', 'Estrada', 'Nuñez', NULL),
(3, '210168', 'Dominga del  Socorro', 'Lopez', NULL, NULL),
(4, '20891201', 'Maritza', 'Canales', 'Ruíz', NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `studendata`
-- (Véase abajo para la vista actual)
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
-- Estructura de tabla para la tabla `usersdata`
--

CREATE TABLE `usersdata` (
  `idusersdata` int(11) NOT NULL,
  `user` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` int(11) NOT NULL,
  `idpersons` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usersdata`
--

INSERT INTO `usersdata` (`idusersdata`, `user`, `password`, `usertype`, `idpersons`) VALUES
(1, '30843677', '$2y$10$v/QqIpth4InhSaaWpDQHceMnEFqwIJxxLzyZzFpsPbLgTjCZqwwjq', 0, 1),
(3, 'uesr2', 'fdasfasfs', 0, 2);

-- --------------------------------------------------------

--
-- Estructura para la vista `studendata`
--
DROP TABLE IF EXISTS `studendata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studendata`  AS SELECT `p`.`globalid` AS `Carnet`, `p`.`names` AS `Nombres`, concat(`p`.`firstname`,' ',`p`.`lastname`) AS `Apellidos`, `u`.`user` AS `Usuario`, `p`.`dataperson` AS `Carrera` FROM (`usersdata` `u` join `persons` `p` on((`u`.`idpersons` = `p`.`idpersons`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`idaulas`);

--
-- Indices de la tabla `bloques`
--
ALTER TABLE `bloques`
  ADD PRIMARY KEY (`idbloques`),
  ADD KEY `idhorarios_idx` (`idhorarios`),
  ADD KEY `idaulas_idx` (`idaulas`),
  ADD KEY `idprofesor_idx` (`idprofesor`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`idcarreras`),
  ADD KEY `idcoordinador_idx` (`idcoordinador`),
  ADD KEY `iddepartamentos_idx` (`iddepartamentos`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`iddepartamentos`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`idgrupos`),
  ADD KEY `idcarreras_idx` (`idcarreras`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`idhorarios`),
  ADD KEY `idgrupos_idx` (`idgrupos`);

--
-- Indices de la tabla `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`idpersons`);

--
-- Indices de la tabla `usersdata`
--
ALTER TABLE `usersdata`
  ADD PRIMARY KEY (`idusersdata`),
  ADD UNIQUE KEY `user_UNIQUE` (`user`),
  ADD KEY `idpersons_idx` (`idpersons`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `idaulas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `bloques`
--
ALTER TABLE `bloques`
  MODIFY `idbloques` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `idcarreras` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `iddepartamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `idgrupos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `idhorarios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persons`
--
ALTER TABLE `persons`
  MODIFY `idpersons` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usersdata`
--
ALTER TABLE `usersdata`
  MODIFY `idusersdata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
