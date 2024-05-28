-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2024 a las 14:42:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `desarrollo_pmi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autorizacion`
--

CREATE TABLE `autorizacion` (
  `id_autorizaciones` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_especialista` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `descripcion_estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_medica`
--

CREATE TABLE `cita_medica` (
  `id_cita` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_especialista` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialista`
--

CREATE TABLE `especialista` (
  `id_especialista` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialista`
--

INSERT INTO `especialista` (`id_especialista`, `nombre`, `apellido`, `especialidad`, `telefono`, `email`) VALUES
(1, 'Vanessa ', 'Reina', 'Anatomía Patológica', '12345678', 'especialistaprueba@testing.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_medico`
--

CREATE TABLE `examen_medico` (
  `id_examen` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `fecha` date NOT NULL,
  `resultado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_medico`
--

CREATE TABLE `historial_medico` (
  `id_historial` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `motivo` text NOT NULL,
  `examen` varchar(100) DEFAULT NULL,
  `tratamiento` varchar(100) DEFAULT NULL,
  `descripcion_historia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `id_medicamento` int(11) NOT NULL,
  `normbe` varchar(100) NOT NULL,
  `descripçion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `dni` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` char(1) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `antecedentes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `nombre`, `apellido`, `dni`, `fecha_nacimiento`, `sexo`, `direccion`, `telefono`, `email`, `antecedentes`) VALUES
(1, 'Karima ', 'Galvan', 101425015, '2002-04-01', 'F', 'Avenida Villa Palma, Cra 21', '12345678', 'pacienteprueba@testing.com', 'Ninguna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preescripcion`
--

CREATE TABLE `preescripcion` (
  `id_prescripcion` int(11) NOT NULL,
  `id_medicamento` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_especialista` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `dosis` varchar(100) DEFAULT NULL,
  `instrucciones` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorio_cita`
--

CREATE TABLE `recordatorio_cita` (
  `id_recordatorio` int(11) NOT NULL,
  `id_cita` int(11) NOT NULL,
  `fecha_recordatorio` date NOT NULL,
  `hora_recordatorio` time DEFAULT NULL,
  `tipo` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_usuario`
--

CREATE TABLE `rol_usuario` (
  `id_rol_usuario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_especialista` int(11) DEFAULT NULL,
  `rol` varchar(100) NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol_usuario`
--

INSERT INTO `rol_usuario` (`id_rol_usuario`, `id_usuario`, `id_paciente`, `id_especialista`, `rol`, `fecha_creacion`) VALUES
(2, 0, NULL, 1, 'ESPECIALISTA', '2024-04-28 06:35:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(100) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `email`, `password`, `rol`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(0, 'especialistaprueba@testing.com', 'Admin1234', 'ESPECIALISTA', '2024-04-28 03:45:39', '2024-04-28 03:45:39'),
(1, 'pacienteprueba@testing.com', 'Admin1234', 'PACIENTE', '2024-04-28 03:45:39', '2024-04-28 03:45:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita_medica`
--

CREATE TABLE `visita_medica` (
  `id_visista_medica` int(11) NOT NULL,
  `id_historial` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text DEFAULT NULL,
  `id_especialista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autorizacion`
--
ALTER TABLE `autorizacion`
  ADD PRIMARY KEY (`id_autorizaciones`),
  ADD KEY `autorizaciones_paciente_FK` (`id_paciente`),
  ADD KEY `autorizaciones_especialista_FK` (`id_especialista`);

--
-- Indices de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `cita_medica_paciente_FK` (`id_paciente`),
  ADD KEY `cita_medica_especialista_FK` (`id_especialista`);

--
-- Indices de la tabla `especialista`
--
ALTER TABLE `especialista`
  ADD PRIMARY KEY (`id_especialista`);

--
-- Indices de la tabla `examen_medico`
--
ALTER TABLE `examen_medico`
  ADD PRIMARY KEY (`id_examen`),
  ADD KEY `examenes_medicos_paciente_FK` (`id_paciente`);

--
-- Indices de la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `historial_medico_paciente_FK` (`id_paciente`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`id_medicamento`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `preescripcion`
--
ALTER TABLE `preescripcion`
  ADD PRIMARY KEY (`id_prescripcion`),
  ADD KEY `preescripcion_medicamento_FK` (`id_medicamento`),
  ADD KEY `preescripcion_paciente_FK` (`id_paciente`),
  ADD KEY `preescripcion_especialista_FK` (`id_especialista`);

--
-- Indices de la tabla `recordatorio_cita`
--
ALTER TABLE `recordatorio_cita`
  ADD PRIMARY KEY (`id_recordatorio`),
  ADD KEY `recordatorio_cita_cita_medica_FK` (`id_cita`);

--
-- Indices de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD PRIMARY KEY (`id_rol_usuario`),
  ADD KEY `rol_usuario_paciente_FK` (`id_paciente`),
  ADD KEY `rol_usuario_user_FK` (`id_usuario`),
  ADD KEY `rol_usuario_especialista_FK` (`id_especialista`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indices de la tabla `visita_medica`
--
ALTER TABLE `visita_medica`
  ADD PRIMARY KEY (`id_visista_medica`),
  ADD KEY `visita_medica_historial_medico_FK` (`id_historial`),
  ADD KEY `visita_medica_especialista_FK` (`id_especialista`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autorizacion`
--
ALTER TABLE `autorizacion`
  MODIFY `id_autorizaciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialista`
--
ALTER TABLE `especialista`
  MODIFY `id_especialista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `preescripcion`
--
ALTER TABLE `preescripcion`
  MODIFY `id_prescripcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recordatorio_cita`
--
ALTER TABLE `recordatorio_cita`
  MODIFY `id_recordatorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  MODIFY `id_rol_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `visita_medica`
--
ALTER TABLE `visita_medica`
  MODIFY `id_visista_medica` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autorizacion`
--
ALTER TABLE `autorizacion`
  ADD CONSTRAINT `autorizaciones_especialista_FK` FOREIGN KEY (`id_especialista`) REFERENCES `especialista` (`id_especialista`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `autorizaciones_paciente_FK` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD CONSTRAINT `cita_medica_especialista_FK` FOREIGN KEY (`id_especialista`) REFERENCES `especialista` (`id_especialista`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_medica_paciente_FK` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `examen_medico`
--
ALTER TABLE `examen_medico`
  ADD CONSTRAINT `examenes_medicos_paciente_FK` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  ADD CONSTRAINT `historial_medico_paciente_FK` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preescripcion`
--
ALTER TABLE `preescripcion`
  ADD CONSTRAINT `preescripcion_especialista_FK` FOREIGN KEY (`id_especialista`) REFERENCES `especialista` (`id_especialista`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preescripcion_medicamento_FK` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id_medicamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preescripcion_paciente_FK` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `recordatorio_cita`
--
ALTER TABLE `recordatorio_cita`
  ADD CONSTRAINT `recordatorio_cita_cita_medica_FK` FOREIGN KEY (`id_cita`) REFERENCES `cita_medica` (`id_cita`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD CONSTRAINT `rol_usuario_especialista_FK` FOREIGN KEY (`id_especialista`) REFERENCES `especialista` (`id_especialista`),
  ADD CONSTRAINT `rol_usuario_paciente_FK` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `rol_usuario_user_FK` FOREIGN KEY (`id_usuario`) REFERENCES `user` (`id_user`);

--
-- Filtros para la tabla `visita_medica`
--
ALTER TABLE `visita_medica`
  ADD CONSTRAINT `visita_medica_especialista_FK` FOREIGN KEY (`id_especialista`) REFERENCES `especialista` (`id_especialista`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visita_medica_historial_medico_FK` FOREIGN KEY (`id_historial`) REFERENCES `historial_medico` (`id_historial`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;