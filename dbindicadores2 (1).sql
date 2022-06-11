-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2022 a las 14:55:17
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbindicadores2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `idarea` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `estatus` enum('Activo','Inactivo') NOT NULL,
  `fecha_hora` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`idarea`, `nombre`, `estatus`, `fecha_hora`) VALUES
(1, 'Sistemas', 'Activo', '2021-11-12'),
(2, 'Administracion', 'Activo', '12-11-2021'),
(3, 'Ventas', 'Activo', '12-11-2021 07:29'),
(4, 'Enfermeria', 'Activo', '23-11-2021 6:03'),
(5, 'Taller y Ceramicas', 'Activo', '22-11-2021 4:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buzon_quejas`
--

CREATE TABLE `buzon_quejas` (
  `idBuzon_quejas` int(11) NOT NULL,
  `queja` varchar(300) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `correoe` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `buzon_quejas`
--

INSERT INTO `buzon_quejas` (`idBuzon_quejas`, `queja`, `descripcion`, `correoe`) VALUES
(2, 'adsssad', 'adasd', 'adsad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calidad_diaria`
--

CREATE TABLE `calidad_diaria` (
  `idcalidad` int(11) NOT NULL,
  `turno` enum('Primero','Segundo','Tercero') NOT NULL,
  `volumen1` float NOT NULL,
  `volumen2` float NOT NULL,
  `total` float NOT NULL,
  `fecha` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calidad_diaria`
--

INSERT INTO `calidad_diaria` (`idcalidad`, `turno`, `volumen1`, `volumen2`, `total`, `fecha`, `hora`) VALUES
(1, 'Primero', 9428, 437, 9865, '25-Noviembre-2021', '07:24'),
(2, 'Segundo', 8399, 291, 8690, '06-Diciembre-2021', '08:51'),
(3, 'Tercero', 9422, 277, 9699, '06-Diciembre-2021', '08:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciontiempo`
--

CREATE TABLE `configuraciontiempo` (
  `segundos` int(11) NOT NULL,
  `activa` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `configuraciontiempo`
--

INSERT INTO `configuraciontiempo` (`segundos`, `activa`) VALUES
(5, ''),
(10, 'Si'),
(15, 'No'),
(10, 'Si'),
(15, 'No');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `diasrecord`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `diasrecord` (
`Name_exp_1` int(7)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias_accidente`
--

CREATE TABLE `dias_accidente` (
  `iddias_accidente` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `descripcion_accidente` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `turno` enum('Primero','Segundo','Tercero') NOT NULL,
  `supervisor` varchar(255) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `record` int(11) NOT NULL,
  `trabajador_idtrabajador` int(11) NOT NULL,
  `area_idarea` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dias_accidente`
--

INSERT INTO `dias_accidente` (`iddias_accidente`, `Nombre`, `descripcion_accidente`, `area`, `turno`, `supervisor`, `fecha_hora`, `record`, `trabajador_idtrabajador`, `area_idarea`) VALUES
(2, 'Rosa Lizbeth', 'Fractura De Pierna', 'Administracion', 'Primero', 'Cesar', '2021-12-09 16:16:51', 18, 2, 2),
(4, 'Javier Ramirez', 'Quemadura primer grado', 'Ventas', 'Primero', 'Aura Ariadna ', '2021-12-09 16:17:05', 18, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `energiticos_esmaltes`
--

CREATE TABLE `energiticos_esmaltes` (
  `idconsumo` int(11) NOT NULL,
  `energia_electrica` float NOT NULL,
  `objetivo_energia` float NOT NULL,
  `desperdicio_esmalte` float NOT NULL,
  `objetivo_desperdicio` float NOT NULL,
  `gas_natural` float NOT NULL,
  `objetivo_gas` float NOT NULL,
  `fecha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `energiticos_esmaltes`
--

INSERT INTO `energiticos_esmaltes` (`idconsumo`, `energia_electrica`, `objetivo_energia`, `desperdicio_esmalte`, `objetivo_desperdicio`, `gas_natural`, `objetivo_gas`, `fecha`) VALUES
(1, 0.141, 0, 7.76, 0, 1151, 0, 'Noviembre 2021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `idproduccion` int(11) NOT NULL,
  `volumen` float NOT NULL,
  `objetivo_volumen` float NOT NULL,
  `desperdicio` float NOT NULL,
  `objetivo_desperdicio` float NOT NULL,
  `calidad` float NOT NULL,
  `objetivo_calidad` float NOT NULL,
  `tiempo_horno` float NOT NULL,
  `objetivo_horno` float NOT NULL,
  `mes` varchar(255) NOT NULL,
  `fecha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`idproduccion`, `volumen`, `objetivo_volumen`, `desperdicio`, `objetivo_desperdicio`, `calidad`, `objetivo_calidad`, `tiempo_horno`, `objetivo_horno`, `mes`, `fecha`) VALUES
(1, 942929, 942930, 96.51, 0, 96.5, 96.55, 0.51, 0, 'Enero', '2021'),
(2, 942929, 952927, 96.5, 0, 96.5, 94, 0.2, 0, 'Febrero', '2021'),
(3, 942929, 942929, 4.4, 0, 96.51, 96.51, 0.45, 0, 'Marzo', '2021'),
(4, 942929, 942910, 4.3, 4.6, 96.51, 95, 0.45, 0, 'Abril ', '2021'),
(5, 942929, 942940, 1, 1, 96.51, 98, 1, 0, 'Mayo', '2021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `idclavetrabajador` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apaterno` varchar(255) NOT NULL,
  `amaterno` varchar(255) NOT NULL,
  `areatrabajo` varchar(255) NOT NULL,
  `turno` enum('Primero','Segundo','Tercero') NOT NULL,
  `correoe` varchar(255) NOT NULL,
  `estatus` enum('Activo','Inactivo') NOT NULL,
  `fechamodificacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`idclavetrabajador`, `nombre`, `apaterno`, `amaterno`, `areatrabajo`, `turno`, `correoe`, `estatus`, `fechamodificacion`) VALUES
(1, 'Cesar', 'Ramirez', 'Luna', 'Sistemas', 'Primero', 'cramirezluna08@gmail.com', 'Activo', '12-11-2021 07:21'),
(2, 'Rosa Lizbeth', 'Flores', 'Escalante', 'Administración', 'Primero', 'rlfloresescalante25@gmail.com', 'Activo', '12-11-2021 07:30'),
(3, 'Javier', 'Ramirez', 'Arce', 'Ventas', 'Primero', 'cramirezluna08@gmail.com', 'Activo', '2021-11-17'),
(7, 'Aura Ariadna', 'Martinez', 'Salgado', 'Taller y ceramicas', 'Primero', 'ari1018madi@gmail.com', 'Activo', '2021-12-09'),
(8, 'Jesus Aldair', 'Perez ', 'Hernandez', 'Sistemas', 'Primero', 'aldairverthogen@gmail.com', 'Activo', '09-12-2021'),
(9, 'Yamilet', 'Davila', 'Aguilar', 'Ventas', 'Primero', 'yamdavagu121989@gmail.com', 'Activo', '2021-12-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  `authKey` varchar(200) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `tipoUsuario` enum('Administrador','Visitante') DEFAULT NULL,
  `area` varchar(255) NOT NULL,
  `turno` enum('Primero','Segundo','Tercero') NOT NULL,
  `estatus` enum('Activo','Inactivo') NOT NULL,
  `fechamodificacion` varchar(255) NOT NULL,
  `trabajador_idclavetrabajador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `username`, `password`, `correo`, `accessToken`, `authKey`, `nombre`, `apellidos`, `tipoUsuario`, `area`, `turno`, `estatus`, `fechamodificacion`, `trabajador_idclavetrabajador`) VALUES
(2, '9d2d1f82a3cdc9b96bcba1ab61b5e0ca', '824e4e3386a8c72ee8074810583a0801', 'cramirezluna08@gmail.com', '', '', 'Rosa Lizbeth', 'Flores Escalante', 'Visitante', 'Administración', 'Primero', 'Activo', '24-11-2021 6:21', 2),
(3, 'dd2fb70dc44087092fbb5f1ad5602a8a', '01cfcd4f6b8770febfb40cb906715822', 'cramirezluna08@gmail.com', '', '', 'Javier', 'Ramirez Arce', 'Visitante', 'Ventas', 'Primero', 'Activo', '28-11-2021', 3),
(8, '3b9d0c2d583659e4b21b4c929d754ea0', '01cfcd4f6b8770febfb40cb906715822', 'cramirezluna1945@gmail.com', '', '', 'Cesar', 'Ramirez Luna', 'Administrador', 'Sistemas', 'Primero', 'Activo', '02/12/2021', 1),
(9, '7cbd330ed033135fb4f60dd55b0208c4', '01cfcd4f6b8770febfb40cb906715822', 'cramirezluna08@gmail.com', '', '', 'Aura Ariadna ', 'Martinez Salgado', 'Administrador', 'Taller y Ceramicas', 'Primero', 'Activo', '2021-12-09', 7);

-- --------------------------------------------------------

--
-- Estructura para la vista `diasrecord`
--
DROP TABLE IF EXISTS `diasrecord`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `diasrecord`  AS  select to_days(date_format(current_timestamp(),'%Y-%m-%d')) - to_days(date_format((select max(`dias_accidente`.`fecha_hora`) from `dias_accidente`),'%Y-%m-%d')) AS `Name_exp_1` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`idarea`);

--
-- Indices de la tabla `buzon_quejas`
--
ALTER TABLE `buzon_quejas`
  ADD PRIMARY KEY (`idBuzon_quejas`);

--
-- Indices de la tabla `calidad_diaria`
--
ALTER TABLE `calidad_diaria`
  ADD PRIMARY KEY (`idcalidad`);

--
-- Indices de la tabla `dias_accidente`
--
ALTER TABLE `dias_accidente`
  ADD PRIMARY KEY (`iddias_accidente`,`trabajador_idtrabajador`,`area_idarea`),
  ADD KEY `fk_dias_accidente_trabajador1_idx` (`trabajador_idtrabajador`),
  ADD KEY `fk_dias_accidente_area1_idx` (`area_idarea`);

--
-- Indices de la tabla `energiticos_esmaltes`
--
ALTER TABLE `energiticos_esmaltes`
  ADD PRIMARY KEY (`idconsumo`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`idproduccion`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`idclavetrabajador`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`,`trabajador_idclavetrabajador`),
  ADD KEY `fk_usuario_trabajador1_idx` (`trabajador_idclavetrabajador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `idarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `buzon_quejas`
--
ALTER TABLE `buzon_quejas`
  MODIFY `idBuzon_quejas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `calidad_diaria`
--
ALTER TABLE `calidad_diaria`
  MODIFY `idcalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `dias_accidente`
--
ALTER TABLE `dias_accidente`
  MODIFY `iddias_accidente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `energiticos_esmaltes`
--
ALTER TABLE `energiticos_esmaltes`
  MODIFY `idconsumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `idproduccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `idclavetrabajador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dias_accidente`
--
ALTER TABLE `dias_accidente`
  ADD CONSTRAINT `fk_dias_accidente_area1` FOREIGN KEY (`area_idarea`) REFERENCES `area` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dias_accidente_trabajador1` FOREIGN KEY (`trabajador_idtrabajador`) REFERENCES `trabajador` (`idclavetrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_trabajador1` FOREIGN KEY (`trabajador_idclavetrabajador`) REFERENCES `trabajador` (`idclavetrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
