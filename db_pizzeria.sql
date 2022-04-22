-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2022 a las 00:33:08
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
-- Base de datos: `db_pizzeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_empleat`
--

CREATE TABLE `categoria_empleat` (
  `id_categoria_empleat` int(11) NOT NULL,
  `nom_categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_pizza`
--

CREATE TABLE `categoria_pizza` (
  `id_categoria_pizza` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_clients` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `direccio` varchar(80) DEFAULT NULL,
  `cp` varchar(15) DEFAULT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `localitats_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comandes`
--

CREATE TABLE `comandes` (
  `id_comanda` int(11) NOT NULL,
  `data_hora` datetime DEFAULT NULL,
  `envio` enum('domicili','botiga') DEFAULT NULL,
  `quantitat_producte` int(11) DEFAULT NULL,
  `preu_total` decimal(4,2) DEFAULT NULL,
  `clients_id` int(11) NOT NULL,
  `empleat_repartidor_id` int(11) NOT NULL,
  `data_hora_entrega` datetime DEFAULT NULL,
  `tenda_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comandes_productes`
--

CREATE TABLE `comandes_productes` (
  `comanda_id` int(11) NOT NULL,
  `productos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleats`
--

CREATE TABLE `empleats` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `cognom` varchar(40) DEFAULT NULL,
  `nif` varchar(20) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `tenda_id` int(11) NOT NULL,
  `categoria_empleat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localitat`
--

CREATE TABLE `localitat` (
  `id_localitat` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `provincia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productes`
--

CREATE TABLE `productes` (
  `id_productes` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `descripcio` varchar(200) DEFAULT NULL,
  `imatge` varchar(50) DEFAULT NULL,
  `preu` decimal(4,2) DEFAULT NULL,
  `categoria_pizza_id` int(11) NOT NULL,
  `tipus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincies`
--

CREATE TABLE `provincies` (
  `id_provincies` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tenda`
--

CREATE TABLE `tenda` (
  `id_tenda` int(11) NOT NULL,
  `direccio` varchar(50) DEFAULT NULL,
  `cp` varchar(20) DEFAULT NULL,
  `localitat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipus`
--

CREATE TABLE `tipus` (
  `id_tipus` int(11) NOT NULL,
  `nom` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_empleat`
--
ALTER TABLE `categoria_empleat`
  ADD PRIMARY KEY (`id_categoria_empleat`);

--
-- Indices de la tabla `categoria_pizza`
--
ALTER TABLE `categoria_pizza`
  ADD PRIMARY KEY (`id_categoria_pizza`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_clients`),
  ADD KEY `localitats_id` (`localitats_id`);

--
-- Indices de la tabla `comandes`
--
ALTER TABLE `comandes`
  ADD PRIMARY KEY (`id_comanda`),
  ADD KEY `clients_id` (`clients_id`),
  ADD KEY `empleat_repartidor_id` (`empleat_repartidor_id`),
  ADD KEY `tenda_id` (`tenda_id`) USING BTREE;

--
-- Indices de la tabla `comandes_productes`
--
ALTER TABLE `comandes_productes`
  ADD PRIMARY KEY (`comanda_id`,`productos_id`),
  ADD KEY `comanda_id` (`comanda_id`),
  ADD KEY `productos_id` (`productos_id`);

--
-- Indices de la tabla `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`id_empleat`),
  ADD UNIQUE KEY `nif` (`nif`),
  ADD KEY `tenda_id` (`tenda_id`),
  ADD KEY `categoria_empleat_id` (`categoria_empleat_id`);

--
-- Indices de la tabla `localitat`
--
ALTER TABLE `localitat`
  ADD PRIMARY KEY (`id_localitat`),
  ADD KEY `provincia_id` (`provincia_id`);

--
-- Indices de la tabla `productes`
--
ALTER TABLE `productes`
  ADD PRIMARY KEY (`id_productes`),
  ADD KEY `categoria_pizza_id` (`categoria_pizza_id`),
  ADD KEY `tipus_id` (`tipus_id`);

--
-- Indices de la tabla `provincies`
--
ALTER TABLE `provincies`
  ADD PRIMARY KEY (`id_provincies`);

--
-- Indices de la tabla `tenda`
--
ALTER TABLE `tenda`
  ADD PRIMARY KEY (`id_tenda`),
  ADD KEY `localitat_id` (`localitat_id`);

--
-- Indices de la tabla `tipus`
--
ALTER TABLE `tipus`
  ADD PRIMARY KEY (`id_tipus`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_empleat`
--
ALTER TABLE `categoria_empleat`
  MODIFY `id_categoria_empleat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria_pizza`
--
ALTER TABLE `categoria_pizza`
  MODIFY `id_categoria_pizza` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_clients` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comandes`
--
ALTER TABLE `comandes`
  MODIFY `id_comanda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id_empleat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `localitat`
--
ALTER TABLE `localitat`
  MODIFY `id_localitat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productes`
--
ALTER TABLE `productes`
  MODIFY `id_productes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincies`
--
ALTER TABLE `provincies`
  MODIFY `id_provincies` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tenda`
--
ALTER TABLE `tenda`
  MODIFY `id_tenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipus`
--
ALTER TABLE `tipus`
  MODIFY `id_tipus` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`localitats_id`) REFERENCES `localitat` (`id_localitat`);

--
-- Filtros para la tabla `comandes`
--
ALTER TABLE `comandes`
  ADD CONSTRAINT `comandes_ibfk_1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id_clients`),
  ADD CONSTRAINT `comandes_ibfk_2` FOREIGN KEY (`empleat_repartidor_id`) REFERENCES `empleats` (`id_empleat`),
  ADD CONSTRAINT `comandes_ibfk_3` FOREIGN KEY (`tenda_id`) REFERENCES `tenda` (`id_tenda`);

--
-- Filtros para la tabla `comandes_productes`
--
ALTER TABLE `comandes_productes`
  ADD CONSTRAINT `comandes_productes_ibfk_1` FOREIGN KEY (`comanda_id`) REFERENCES `comandes` (`id_comanda`),
  ADD CONSTRAINT `comandes_productes_ibfk_2` FOREIGN KEY (`productos_id`) REFERENCES `productes` (`id_productes`);

--
-- Filtros para la tabla `empleats`
--
ALTER TABLE `empleats`
  ADD CONSTRAINT `empleats_ibfk_1` FOREIGN KEY (`tenda_id`) REFERENCES `tenda` (`id_tenda`),
  ADD CONSTRAINT `empleats_ibfk_2` FOREIGN KEY (`categoria_empleat_id`) REFERENCES `categoria_empleat` (`id_categoria_empleat`);

--
-- Filtros para la tabla `localitat`
--
ALTER TABLE `localitat`
  ADD CONSTRAINT `localitat_ibfk_1` FOREIGN KEY (`provincia_id`) REFERENCES `provincies` (`id_provincies`);

--
-- Filtros para la tabla `productes`
--
ALTER TABLE `productes`
  ADD CONSTRAINT `productes_ibfk_1` FOREIGN KEY (`tipus_id`) REFERENCES `tipus` (`id_tipus`),
  ADD CONSTRAINT `productes_ibfk_2` FOREIGN KEY (`categoria_pizza_id`) REFERENCES `categoria_pizza` (`id_categoria_pizza`);

--
-- Filtros para la tabla `tenda`
--
ALTER TABLE `tenda`
  ADD CONSTRAINT `tenda_ibfk_1` FOREIGN KEY (`localitat_id`) REFERENCES `localitat` (`id_localitat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
