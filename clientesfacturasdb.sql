-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2024 a las 20:45:26
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clientesfacturasdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_cliente` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_cliente`, `Nombre`, `Email`, `Telefono`, `Direccion`) VALUES
(1, 'Nando', 'nandobpc32@gmail.com', '0983148193', 'Tena Napo'),
(2, 'Jose', 'josee32@gmail.com', '0983148194', 'Napo Archidona'),
(3, 'pedro', 'hernandez@gmail.com', '098654565', 'Quito Ecuador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientefactura`
--

CREATE TABLE `clientefactura` (
  `ID_cliente` int(11) NOT NULL,
  `ID_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientefactura`
--

INSERT INTO `clientefactura` (`ID_cliente`, `ID_factura`) VALUES
(3, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `ID_factura` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  `Metodo_pago` varchar(50) DEFAULT NULL,
  `ID_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`ID_factura`, `Fecha`, `Total`, `Estado`, `Metodo_pago`, `ID_cliente`) VALUES
(4, '2024-02-01', 1000.00, 'pendiente', 'pendiente', 1),
(5, '2024-02-22', 21.00, 'pendiente', 'pendiente', 2),
(6, '2024-02-21', 121.00, 'pendiente', 'pendiente', 3),
(7, '2024-02-27', 332.00, 'pendiente', 'pendiente', 3),
(8, '2024-02-02', 3333232.00, 'pendiente', 'pendiente', 2),
(9, '2023-10-12', 31.00, 'Pagado', 'Efectivo', 2),
(10, '2024-03-01', 1029.00, 'Pagado', 'Transferencia', 1),
(11, '2024-02-29', 23.00, 'Pagado', 'Efectivo', 1),
(12, '2024-02-27', 1122131.00, 'pendiente', 'Transferencia', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_cliente`);

--
-- Indices de la tabla `clientefactura`
--
ALTER TABLE `clientefactura`
  ADD PRIMARY KEY (`ID_cliente`,`ID_factura`),
  ADD KEY `ID_factura` (`ID_factura`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID_factura`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `ID_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientefactura`
--
ALTER TABLE `clientefactura`
  ADD CONSTRAINT `clientefactura_ibfk_1` FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID_cliente`),
  ADD CONSTRAINT `clientefactura_ibfk_2` FOREIGN KEY (`ID_factura`) REFERENCES `factura` (`ID_factura`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
