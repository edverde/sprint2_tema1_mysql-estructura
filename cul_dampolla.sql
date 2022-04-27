-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2022 a las 19:11:40
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul_dampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_clients` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `telefon` int(20) NOT NULL,
  `correo_electronic` varchar(60) NOT NULL,
  `data_registre` date NOT NULL,
  `direccio_id` int(11) NOT NULL,
  `id_recomendat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_clients`, `nom`, `telefon`, `correo_electronic`, `data_registre`, `direccio_id`, `id_recomendat`) VALUES
(9, 'Eduard', 456456, 'eduardvr83@gmail.com', '2022-04-01', 1, NULL),
(10, 'marta', 45645645, 'eduardvr83@gmail.com', '2022-04-12', 3, 9),
(11, 'Cristina', 456456, '456465@usiu.com', '2022-04-11', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccio`
--

CREATE TABLE `direccio` (
  `id_direccio` int(11) NOT NULL,
  `carrer` varchar(40) NOT NULL,
  `numero` int(6) NOT NULL,
  `pis` varchar(20) NOT NULL,
  `porta` varchar(20) NOT NULL,
  `ciutat` varchar(20) NOT NULL,
  `C.P.` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direccio`
--

INSERT INTO `direccio` (`id_direccio`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `C.P.`) VALUES
(1, 'sgse', 23, '3', '2', 'bcn', 342),
(2, 'c/anselm clave', 17, '3', '2', 'bcn', 8902),
(3, 'c/kk de bak', 4, 'segon', '15', 'BArcelona', 28466);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `proveidor_id` int(11) NOT NULL,
  `nom_marca` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `proveidor_id`, `nom_marca`) VALUES
(1, 2, 'rayban'),
(2, 2, 'dolce gabbana'),
(3, 2, 'carolina herrera'),
(4, 2, 'prada'),
(5, 1, 'rayban'),
(6, 1, 'alenfelu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `id_proveidor` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `NIF` varchar(20) NOT NULL,
  `direccio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveidor`
--

INSERT INTO `proveidor` (`id_proveidor`, `nom`, `telefon`, `fax`, `NIF`, `direccio_id`) VALUES
(1, 'Juanjo', '6865465', '456465456', '4566454K', 3),
(2, 'Llibert', '465464566', '78979879546', '1564645H', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` int(11) NOT NULL,
  `model` varchar(20) NOT NULL,
  `ull_dret` varchar(40) NOT NULL,
  `ull_esquerra` varchar(40) NOT NULL,
  `tipos` enum('flotant','pasta','metallica','') NOT NULL,
  `color_montura` varchar(20) NOT NULL,
  `color_vidre_esquerra` varchar(20) NOT NULL,
  `color_vidre_dret` varchar(20) NOT NULL,
  `preu` double NOT NULL,
  `marca_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ulleres`, `model`, `ull_dret`, `ull_esquerra`, `tipos`, `color_montura`, `color_vidre_esquerra`, `color_vidre_dret`, `preu`, `marca_id`) VALUES
(1, 'aviator', '15,5', '16', 'pasta', 'negre', 'foscos', 'foscos', 150, 1),
(2, 'caca dura', '45', '23', 'metallica', 'blanc', 'fosc', 'fosc', 128, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venedor`
--

CREATE TABLE `venedor` (
  `id_venedor` int(11) NOT NULL,
  `nom_venedor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venedor`
--

INSERT INTO `venedor` (`id_venedor`, `nom_venedor`) VALUES
(1, 'Ruben HErrera'),
(2, 'Sonia FErron');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `data_venta` date NOT NULL,
  `ulleres_id` int(11) NOT NULL,
  `venedor_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `data_venta`, `ulleres_id`, `venedor_id`, `client_id`) VALUES
(1, '2022-04-26', 1, 2, 9),
(2, '2022-04-04', 1, 2, 11);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_clients`),
  ADD KEY `direccio_id` (`direccio_id`),
  ADD KEY `id_recomendat` (`id_recomendat`);

--
-- Indices de la tabla `direccio`
--
ALTER TABLE `direccio`
  ADD PRIMARY KEY (`id_direccio`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `proveidor_id` (`proveidor_id`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id_proveidor`),
  ADD UNIQUE KEY `NIF` (`NIF`),
  ADD KEY `direccio_id` (`direccio_id`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD UNIQUE KEY `proveidor_id` (`marca_id`),
  ADD KEY `marca_id` (`marca_id`);

--
-- Indices de la tabla `venedor`
--
ALTER TABLE `venedor`
  ADD PRIMARY KEY (`id_venedor`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `venedor_id` (`venedor_id`),
  ADD KEY `ulleres_id` (`ulleres_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_clients` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `direccio`
--
ALTER TABLE `direccio`
  MODIFY `id_direccio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ulleres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venedor`
--
ALTER TABLE `venedor`
  MODIFY `id_venedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`direccio_id`) REFERENCES `direccio` (`id_direccio`),
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`id_recomendat`) REFERENCES `clients` (`id_clients`);

--
-- Filtros para la tabla `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `marca_ibfk_1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidor` (`id_proveidor`);

--
-- Filtros para la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD CONSTRAINT `proveidor_ibfk_1` FOREIGN KEY (`direccio_id`) REFERENCES `direccio` (`id_direccio`);

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id_marca`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_clients`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`venedor_id`) REFERENCES `venedor` (`id_venedor`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`ulleres_id`) REFERENCES `ulleres` (`id_ulleres`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
