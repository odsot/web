-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-01-2025 a las 13:50:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fertirriego`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_bomba`
--

CREATE TABLE `control_bomba` (
  `id` int(11) NOT NULL,
  `estado_bomba` tinyint(1) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_log`
--

CREATE TABLE `control_log` (
  `id` int(11) NOT NULL,
  `accion` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `control_log`
--

INSERT INTO `control_log` (`id`, `accion`, `fecha`) VALUES
(1, 'Encendiendo bomba de agua...', '2024-12-17 03:32:03'),
(2, 'Apagando bomba de agua...', '2024-12-17 03:32:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_npk`
--

CREATE TABLE `datos_npk` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `nitrógeno` float DEFAULT NULL,
  `fósforo` float DEFAULT NULL,
  `potasio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_sensor`
--

CREATE TABLE `datos_sensor` (
  `id` int(11) NOT NULL,
  `nitrógeno` float NOT NULL,
  `fósforo` float NOT NULL,
  `potasio` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`, `fecha_creacion`) VALUES
(1, 'paulina', '$2y$10$hXg8RHrBq3/f8jicU85e.uuDM/BtigibWOAOdq.2IdeQMwfe9g9fe', '2024-12-17 03:31:10'),
(2, 'admin', '$2y$10$IfM30B0fJlmhH1xTbtLBmuCUfDYxyKd71lUnGH3zqEbLwfmeXtYwe', '2024-12-17 03:31:35'),
(3, 'meivi', '$2y$10$FvCVEEyHlVVj8xcJDpzwLef7ZO03iTFpC/mQos5Dr97m4TEYcuijy', '2024-12-17 03:33:08'),
(4, 'pao', '$2y$10$/GngUUKQEXjYf0Lc3F2qvuWomyh5UL547FJMduWwlD7epfiW1GgE.', '2024-12-17 03:34:30'),
(5, 'pai', '$2y$10$bBwDgw.q80Fn0E/qUiXQteaLAHYHEPZezziK/b2JWGAdtioKt0nR2', '2024-12-17 03:38:36');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `control_bomba`
--
ALTER TABLE `control_bomba`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `control_log`
--
ALTER TABLE `control_log`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `datos_npk`
--
ALTER TABLE `datos_npk`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `datos_sensor`
--
ALTER TABLE `datos_sensor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `control_bomba`
--
ALTER TABLE `control_bomba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `control_log`
--
ALTER TABLE `control_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `datos_npk`
--
ALTER TABLE `datos_npk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_sensor`
--
ALTER TABLE `datos_sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
