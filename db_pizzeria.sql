-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2022 a las 19:10:41
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

--
-- Volcado de datos para la tabla `categoria_empleat`
--

INSERT INTO `categoria_empleat` (`id_categoria_empleat`, `nom_categoria`) VALUES
(1, 'cuiner'),
(2, 'repartidor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_pizza`
--

CREATE TABLE `categoria_pizza` (
  `id_categoria_pizza` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria_pizza`
--

INSERT INTO `categoria_pizza` (`id_categoria_pizza`, `nom`) VALUES
(1, 'carbonara'),
(2, 'barbacoa'),
(3, 'vegetal'),
(4, 'formatges'),
(5, 'atun');

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

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_clients`, `nom`, `direccio`, `cp`, `telefon`, `localitats_id`) VALUES
(1, 'Eduard', 'anselm_clave_13_segon', '08902', '68654654', 1),
(2, 'sonia', NULL, '08902', NULL, 2),
(3, 'breda', NULL, NULL, NULL, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comandes`
--

CREATE TABLE `comandes` (
  `id_comanda` int(11) NOT NULL,
  `data_hora` datetime DEFAULT NULL,
  `envio` enum('domicili','botiga') DEFAULT NULL,
  `preu_total` decimal(4,2) DEFAULT NULL,
  `clients_id` int(11) NOT NULL,
  `empleat_repartidor_id` int(11) NOT NULL,
  `data_hora_entrega` datetime DEFAULT NULL,
  `tenda_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comandes`
--

INSERT INTO `comandes` (`id_comanda`, `data_hora`, `envio`, `preu_total`, `clients_id`, `empleat_repartidor_id`, `data_hora_entrega`, `tenda_id`) VALUES
(1, '2022-04-15 12:53:18', 'domicili', '30.00', 1, 1, '2022-04-23 12:55:18', 2),
(2, '2022-04-24 12:53:17', NULL, NULL, 1, 1, '2022-04-24 12:53:17', 2),
(3, '2022-04-24 12:58:01', NULL, NULL, 2, 9, '2022-04-24 12:58:01', 5);

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

--
-- Volcado de datos para la tabla `empleats`
--

INSERT INTO `empleats` (`id_empleat`, `nom`, `cognom`, `nif`, `telefon`, `tenda_id`, `categoria_empleat_id`) VALUES
(1, 'alberto', 'caraja', '44556678O', '45645645', 1, 1),
(2, 'ruben', 'herrera', '44559988R', '654987987', 1, 2),
(3, 'juanjo', 'cardenal', '45678912e', '654321654', 2, 1),
(4, 'maria', 'caca', '4567891r', '654987789', 2, 2),
(5, 'rodolfo', 'rewrwrew', '4564654k', '65445646', 6, 2),
(6, 'carolina', 'pichardo', '456789456', '567894561g', 7, 1),
(7, 'alfred', 'kk', '456546rf', '546456456', 10, 2),
(8, 'maria', 'unpajote', '4567891e', '456123458', 9, 1),
(9, 'dolores', 'cabeza', '456789t', '456123', 9, 2),
(10, 'nuria', 'gonzalez', '456789123', '44123575t', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localitat`
--

CREATE TABLE `localitat` (
  `id_localitat` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `provincia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `localitat`
--

INSERT INTO `localitat` (`id_localitat`, `nom`, `provincia_id`) VALUES
(1, 'hospitalet_de_llobregat', 2),
(2, 'santa_coloma', 2),
(3, 'barcelona', 2),
(4, 'Besalu', 3),
(5, 'breda', 3),
(6, 'pals', 3),
(7, 'cambrils', 4),
(8, 'reus', 4),
(9, 'torregrossa', 5),
(10, 'mollerussa', 5);

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

--
-- Volcado de datos para la tabla `provincies`
--

INSERT INTO `provincies` (`id_provincies`, `nom`) VALUES
(2, 'barcelona'),
(3, 'girona'),
(4, 'tarragona'),
(5, 'lleida');

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

--
-- Volcado de datos para la tabla `tenda`
--

INSERT INTO `tenda` (`id_tenda`, `direccio`, `cp`, `localitat_id`) VALUES
(1, 'prat_de_la_riba_166', '08907', 1),
(2, 'muns_26', '08902', 1),
(3, 'America_101', '08924', 2),
(4, 'carme_134', '05678', 4),
(5, 'santa_eulalia_12', '08956', 6),
(6, 'Ramon_i_cajal_8', '08965', 9),
(7, 'marie_curie_54', '08975', 10),
(8, 'unio_56', '08902', 1),
(9, 'tallers_26', '08925', 3),
(10, 'gran_130', '09865', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipus`
--

CREATE TABLE `tipus` (
  `id_tipus` int(11) NOT NULL,
  `nom` enum('hamburguesa','beguda','pizza') DEFAULT NULL,
  `quantitat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipus`
--

INSERT INTO `tipus` (`id_tipus`, `nom`, `quantitat`) VALUES
(1, 'pizza', 0),
(2, '', 0),
(3, 'beguda', 0);

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
  MODIFY `id_categoria_empleat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoria_pizza`
--
ALTER TABLE `categoria_pizza`
  MODIFY `id_categoria_pizza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_clients` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comandes`
--
ALTER TABLE `comandes`
  MODIFY `id_comanda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id_empleat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `localitat`
--
ALTER TABLE `localitat`
  MODIFY `id_localitat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productes`
--
ALTER TABLE `productes`
  MODIFY `id_productes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `provincies`
--
ALTER TABLE `provincies`
  MODIFY `id_provincies` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tenda`
--
ALTER TABLE `tenda`
  MODIFY `id_tenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipus`
--
ALTER TABLE `tipus`
  MODIFY `id_tipus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
