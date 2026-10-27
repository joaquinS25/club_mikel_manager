-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2026 a las 01:31:31
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
-- Base de datos: `manager_club`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificados`
--

CREATE TABLE `certificados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `logo_club` varchar(255) DEFAULT NULL,
  `logo_conquistadores` varchar(255) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `clase_biblica` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `certificados`
--

INSERT INTO `certificados` (`id`, `nombre`, `fecha`, `logo_club`, `logo_conquistadores`, `fecha_registro`, `clase_biblica`) VALUES
(33, 'AARON KEYLOR CAPUñAY ZAMORA', '2026-05-30', '1000500021.jpg', '1000500020.jpg', '2026-05-29 01:15:14', 'JOYAS DE LA ETERNIDAD'),
(35, 'ANDREA BARBARA BELEN VASQUEZ MOREYRA', '2026-05-30', '1000500021.jpg', '1000500020.jpg', '2026-05-29 01:16:50', 'SUMERGIDOS EN LA PALABRA'),
(36, 'DIEGO FERNANDO SALAS RODRíGUEZ ', '2026-05-30', '1000500021.jpg', '1000500020.jpg', '2026-05-29 01:17:17', 'JOYAS DE LA ETERNIDAD'),
(37, 'FABIANA VALENTINA FARFAN CHAVEZ', '2026-05-30', '1000500021.jpg', '1000500020.jpg', '2026-05-29 01:18:28', 'SUMERGIDOS EN LA PALABRA'),
(38, 'JHON ESNEIDER HERRERA MUñOZ', '2026-05-30', '1000500021.jpg', '1000500020.jpg', '2026-05-29 01:19:15', 'JOYAS DE LA ETERNIDAD'),
(39, 'JOSÉ CALED CELIZ GARCIA', '2026-05-30', 'mikel.png', 'conquistadores.png', '2026-05-29 01:20:01', 'SUMERGIDOS EN LA PALBRA'),
(40, 'LESLIE TATIANA VALDIVIA BUSTAMANTE', '2026-05-30', 'mikel.png', 'conquistadores.png', '2026-05-29 01:20:45', 'SUMERGIDOS EN LA PALABRA'),
(41, 'LIA FERNANDA CHERAN CAPUÑAY', '2026-05-30', 'mikel.png', 'conquistadores.png', '2026-05-29 01:21:39', 'JOYAS DE LA ETERNIDAD'),
(42, 'LIAM MATHIAS ARTEMIO LUYO MOREYRA', '2026-05-30', 'mikel.png', 'conquistadores.png', '2026-05-29 01:22:10', 'JOYAS DE LA ETERNIDAD'),
(43, 'LUCIANA ANTONELLA NIÑO CAPUÑAY', '2026-05-30', 'mikel.png', 'conquistadores.png', '2026-05-29 01:22:47', 'SUMERGIDOS EN LA PALABRA'),
(44, 'LUCIANA VALESKA MARTINEZ MOREYRA		', '2026-05-30', 'mikel.png', 'conquistadores.png', '2026-05-29 01:23:15', 'JOYAS DE LA ETERNIDAD'),
(45, 'ROSANGELA VALENTINA HUANCAYO NIÑO', '2026-05-30', 'mikel.png', 'conquistadores.png', '2026-05-29 01:30:07', 'JOYAS DE LA ETERNIDAD'),
(46, 'SOFIA EMILY DOMIGUEZ DIACHENKO', '2026-05-30', 'mikel.png', 'conquistadores.png', '2026-05-29 01:30:40', 'SUMERGIDOS EN LA PALABRA'),
(47, 'THIAGO ALONSO VASQUEZ MOREYRA		', '2026-05-30', 'mikel.png', 'conquistadores.png', '2026-05-29 01:31:06', 'JOYAS DE LA ETERNIDAD'),
(48, 'VICTORIA ALEJANDRA DOMINGUEZ DIACHENKO', '2026-05-30', 'mikel.png', 'conquistadores.png', '2026-05-29 01:31:33', 'JOYAS DE LA ETERNIDAD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificados_especialidades`
--

CREATE TABLE `certificados_especialidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `logo_club` varchar(255) DEFAULT NULL,
  `logo_conquistadores` varchar(255) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `certificados_especialidades`
--

INSERT INTO `certificados_especialidades` (`id`, `nombre`, `especialidad`, `fecha`, `logo_club`, `logo_conquistadores`, `fecha_registro`) VALUES
(1, 'AARON KEYLOR CAPUÑAY ZAMORA', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 23:56:04'),
(2, 'ANDREA BARBARA BELEN VASQUEZ MOREYRA', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 23:55:49'),
(3, 'DIEGO FERNANDO SALAS RODRÍGUEZ', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 23:55:32'),
(4, 'FABIANA VALENTINA FARFAN CHAVEZ', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 23:55:11'),
(5, 'JHON ESNEIDER HERRERA MUÑOZ', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 23:54:52'),
(6, 'JOSÉ CALED CELIZ GARCIA', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 06:20:01'),
(7, 'LESLIE TATIANA VALDIVIA BUSTAMANTE', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 06:20:45'),
(8, 'LIA FERNANDA CHERAN CAPUÑAY', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 06:21:39'),
(9, 'LIAM MATHIAS ARTEMIO LUYO MOREYRA', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 06:22:10'),
(10, 'LUCIANA ANTONELLA NIÑO CAPUÑAY', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 06:22:47'),
(11, 'LUCIANA VALESKA MARTINEZ MOREYRA', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 06:23:15'),
(12, 'ROSANGELA VALENTINA HUANCAYO NIÑO', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 06:30:07'),
(13, 'SOFIA EMILY DOMIGUEZ DIACHENKO', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 06:30:40'),
(14, 'THIAGO ALONSO VASQUEZ MOREYRA', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 06:31:06'),
(15, 'VICTORIA ALEJANDRA DOMINGUEZ DIACHENKO', 'PIONEROS ADVENTISTAS', '2026-04-11', 'mikel.png', 'conquistadores.png', '2026-05-29 06:31:33'),
(0, 'FACUNDO JOAQUIN SALAS DOMINGUEZ', 'PIONEROS ADVENTISTAS', '2026-06-13', 'mikel.png', 'conquistadores.png', '2026-06-04 21:22:07'),
(0, 'LUCIANA VALESKA MARTINEZ MOREYRA', 'REPTILES', '2026-08-16', 'mikel.png', 'conquistadores.png', '2026-08-14 22:23:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuestionarios`
--

CREATE TABLE `cuestionarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuestionarios`
--

INSERT INTO `cuestionarios` (`id`, `nombre`, `descripcion`, `fecha_creacion`, `imagen`) VALUES
(1, 'ESTAFADO POR EL ESTOFADO', NULL, '2026-03-26 23:08:47', 'estafadoporElestofado.jpeg'),
(2, 'Pioneros Adventistas', NULL, '2026-03-26 23:09:08', 'Pioneros Adventistas.png'),
(3, 'Reptiles', NULL, '2026-08-17 05:43:10', 'reptiles.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enlaces_examen`
--

CREATE TABLE `enlaces_examen` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `id_cuestionario` int(11) NOT NULL,
  `capitulo` varchar(10) NOT NULL,
  `etiqueta` varchar(100) DEFAULT NULL,
  `mostrar_respuestas` tinyint(1) NOT NULL DEFAULT 1,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `expira` datetime DEFAULT NULL,
  `creado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `enlaces_examen`
--

INSERT INTO `enlaces_examen` (`id`, `token`, `id_cuestionario`, `capitulo`, `etiqueta`, `mostrar_respuestas`, `activo`, `expira`, `creado`) VALUES
(1, '2eb0f9beab2d4729b65f7aabd79ca4d8', 1, '1', '', 1, 1, '2026-10-28 18:26:00', '2026-10-26 23:26:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL,
  `pregunta` text DEFAULT NULL,
  `opcion_a` varchar(255) DEFAULT NULL,
  `opcion_b` varchar(255) DEFAULT NULL,
  `opcion_c` varchar(255) DEFAULT NULL,
  `opcion_d` varchar(255) DEFAULT NULL,
  `respuesta_correcta` char(1) DEFAULT NULL,
  `explicacion` text DEFAULT NULL,
  `capitulo` varchar(10) NOT NULL,
  `id_cuestionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `pregunta`, `opcion_a`, `opcion_b`, `opcion_c`, `opcion_d`, `respuesta_correcta`, `explicacion`, `capitulo`, `id_cuestionario`) VALUES
(2, '¿Cuál es el mensaje principal del libro?', 'La comida es importante', 'La obediencia a Dios', 'La riqueza', 'El éxito', 'B', NULL, '1', 1),
(3, '¿Qué representa el estofado?', 'Una bendición', 'Una tentación', 'Un castigo', 'Un premio', 'B', NULL, '1', 1),
(4, '¿Quién toma una decisión impulsiva?', 'El protagonista', 'Un amigo', 'Un rey', 'Un profeta', 'A', NULL, '1', 1),
(5, '¿Qué enseñanza deja la historia?', 'Valorar lo espiritual', 'Buscar riqueza', 'Ser impulsivo', 'Ignorar consejos', 'A', NULL, '1', 1),
(6, '¿Qué simboliza la pérdida?', 'Fracaso', 'Consecuencia de malas decisiones', 'Mala suerte', 'Destino', 'B', NULL, '1', 1),
(7, '¿Qué valor se resalta?', 'Paciencia', 'Orgullo', 'Envidia', 'Ambición', 'A', NULL, '1', 1),
(8, '¿Qué actitud evita errores?', 'Paciencia', 'Impulsividad', 'Orgullo', 'Desobediencia', 'A', NULL, '1', 1),
(9, '¿Qué enseñanza bíblica se refleja?', 'Obediencia', 'Desorden', 'Pereza', 'Orgullo', 'A', NULL, '1', 1),
(10, '¿Qué representa la decisión final?', 'Victoria', 'Pérdida', 'Éxito', 'Suerte', 'B', NULL, '1', 1),
(11, '¿Qué error se comete?', 'Impulsividad', 'Paciencia', 'Sabiduría', 'Amor', 'A', NULL, '1', 1),
(12, '¿Qué se prioriza incorrectamente?', 'Espiritual', 'Material', 'Emocional', 'Social', 'B', NULL, '1', 1),
(13, '¿Qué se aprende del error?', 'No pensar', 'Pensar antes de actuar', 'Actuar rápido', 'Ignorar', 'B', NULL, '1', 1),
(14, '¿Qué actitud faltó?', 'Sabiduría', 'Orgullo', 'Envidia', 'Miedo', 'A', NULL, '1', 1),
(15, '¿Qué simboliza el hambre?', 'Necesidad', 'Debilidad', 'Fuerza', 'Éxito', 'B', NULL, '1', 1),
(16, '¿Qué consecuencia hay?', 'Pérdida', 'Ganancia', 'Felicidad', 'Premio', 'A', NULL, '1', 1),
(17, '¿Qué enseñanza se repite?', 'Reflexión', 'Impulsividad', 'Desobediencia', 'Pereza', 'A', NULL, '1', 1),
(18, '¿Qué valor es importante?', 'Control', 'Orgullo', 'Envidia', 'Egoísmo', 'A', NULL, '1', 1),
(19, '¿Qué acción fue incorrecta?', 'Decidir rápido', 'Esperar', 'Orar', 'Pensar', 'A', NULL, '1', 1),
(20, '¿Qué simboliza el acto?', 'Error', 'Victoria', 'Sabiduría', 'Fuerza', 'A', NULL, '1', 1),
(21, '¿Qué enseñanza queda?', 'Ser sabio', 'Ser impulsivo', 'Ignorar', 'Correr', 'A', NULL, '1', 1),
(22, '¿Qué actitud se critica?', 'Impulsividad', 'Paciencia', 'Sabiduría', 'Fe', 'A', NULL, '1', 1),
(23, '¿Qué se pierde?', 'Algo valioso', 'Nada', 'Tiempo', 'Amigos', 'A', NULL, '1', 1),
(24, '¿Qué representa el intercambio?', 'Error grave', 'Éxito', 'Suerte', 'Juego', 'A', NULL, '1', 1),
(25, '¿Qué valor falta?', 'Dominio propio', 'Orgullo', 'Egoísmo', 'Ambición', 'A', NULL, '1', 1),
(26, '¿Qué enseñanza deja?', 'Pensar', 'Actuar rápido', 'Ignorar', 'Evitar', 'A', NULL, '1', 1),
(27, '¿Qué actitud mejora decisiones?', 'Reflexión', 'Impulsividad', 'Miedo', 'Orgullo', 'A', NULL, '1', 1),
(28, '¿Qué error se evita?', 'Apresurarse', 'Esperar', 'Pensar', 'Reflexionar', 'A', NULL, '1', 1),
(29, '¿Qué representa el deseo?', 'Debilidad', 'Fuerza', 'Victoria', 'Logro', 'A', NULL, '1', 1),
(30, '¿Qué enseñanza es clave?', 'Control', 'Impulsividad', 'Orgullo', 'Envidia', 'A', NULL, '1', 1),
(31, '¿Qué se necesita?', 'Paciencia', 'Rapidez', 'Orgullo', 'Impulsividad', 'A', NULL, '1', 1),
(32, '¿Qué actitud genera errores?', 'Impulsividad', 'Paciencia', 'Sabiduría', 'Amor', 'A', NULL, '1', 1),
(33, '¿Qué enseñanza espiritual hay?', 'Obedecer', 'Ignorar', 'Desobedecer', 'Olvidar', 'A', NULL, '1', 1),
(34, '¿Qué representa la historia?', 'Lección', 'Juego', 'Historia', 'Cuento', 'A', NULL, '1', 1),
(35, '¿Qué valor se promueve?', 'Sabiduría', 'Impulsividad', 'Orgullo', 'Egoísmo', 'A', NULL, '1', 1),
(36, '¿Qué actitud es correcta?', 'Pensar', 'Actuar rápido', 'Ignorar', 'Evitar', 'A', NULL, '1', 1),
(37, '¿Qué consecuencia trae el error?', 'Pérdida', 'Ganancia', 'Felicidad', 'Premio', 'A', NULL, '1', 1),
(38, '¿Qué simboliza el acto?', 'Debilidad', 'Fuerza', 'Victoria', 'Logro', 'A', NULL, '1', 1),
(39, '¿Qué enseñanza queda?', 'Reflexionar', 'Ignorar', 'Evitar', 'Correr', 'A', NULL, '1', 1),
(40, '¿Qué valor falta?', 'Control', 'Orgullo', 'Envidia', 'Egoísmo', 'A', NULL, '1', 1),
(41, '¿Qué actitud es mejor?', 'Paciencia', 'Impulsividad', 'Orgullo', 'Egoísmo', 'A', NULL, '1', 1),
(42, '¿Qué decisión fue mala?', 'Apresurada', 'Pensada', 'Reflexiva', 'Sabia', 'A', NULL, '1', 1),
(43, '¿Qué aprendizaje queda?', 'Pensar antes', 'Actuar rápido', 'Ignorar', 'Evitar', 'A', NULL, '1', 1),
(44, '¿Qué simboliza el error?', 'Debilidad', 'Fuerza', 'Éxito', 'Logro', 'A', NULL, '1', 1),
(45, '¿Qué enseñanza es clave?', 'Paciencia', 'Impulsividad', 'Orgullo', 'Envidia', 'A', NULL, '1', 1),
(46, '¿Qué valor es importante?', 'Dominio propio', 'Orgullo', 'Envidia', 'Ambición', 'A', NULL, '1', 1),
(47, '¿Qué enseña el capítulo 2?', 'Paciencia', 'Impulsividad', 'Orgullo', 'Envidia', 'A', NULL, '2', 1),
(48, '¿Qué valor se destaca?', 'Sabiduría', 'Impulsividad', 'Orgullo', 'Ambición', 'A', NULL, '2', 1),
(49, '¿Qué se debe evitar?', 'Apresurarse', 'Pensar', 'Reflexionar', 'Esperar', 'A', NULL, '2', 1),
(50, '¿Qué actitud es correcta?', 'Reflexión', 'Impulsividad', 'Orgullo', 'Egoísmo', 'A', NULL, '2', 1),
(51, '¿Qué consecuencia hay por malas decisiones?', 'Pérdida', 'Ganancia', 'Felicidad', 'Premio', 'A', NULL, '2', 1),
(52, '¿Qué valor se promueve?', 'Dominio propio', 'Orgullo', 'Envidia', 'Ambición', 'A', NULL, '2', 1),
(53, '¿Qué enseñanza deja?', 'Pensar antes de actuar', 'Actuar rápido', 'Ignorar', 'Evitar', 'A', NULL, '2', 1),
(54, '¿Qué simboliza la historia?', 'Lección', 'Juego', 'Suerte', 'Destino', 'A', NULL, '2', 1),
(55, '¿Qué actitud mejora decisiones?', 'Paciencia', 'Impulsividad', 'Orgullo', 'Envidia', 'A', NULL, '2', 1),
(56, '¿Qué valor espiritual se enseña?', 'Obediencia', 'Desobediencia', 'Olvido', 'Desorden', 'A', NULL, '2', 1),
(57, '¿Qué enseña el capítulo 3?', 'Reflexión', 'Impulsividad', 'Orgullo', 'Egoísmo', 'A', NULL, '3', 1),
(58, '¿Qué valor es importante?', 'Sabiduría', 'Impulsividad', 'Orgullo', 'Ambición', 'A', NULL, '3', 1),
(59, '¿Qué se debe evitar?', 'Actuar sin pensar', 'Reflexionar', 'Esperar', 'Analizar', 'A', NULL, '3', 1),
(60, '¿Qué actitud es correcta?', 'Pensar', 'Apresurarse', 'Ignorar', 'Evitar', 'A', NULL, '3', 1),
(61, '¿Qué consecuencia hay?', 'Pérdida', 'Ganancia', 'Felicidad', 'Premio', 'A', NULL, '3', 1),
(62, '¿Qué valor se resalta?', 'Paciencia', 'Orgullo', 'Envidia', 'Ambición', 'A', NULL, '3', 1),
(63, '¿Qué enseñanza queda?', 'Reflexionar', 'Ignorar', 'Evitar', 'Correr', 'A', NULL, '3', 1),
(64, '¿Qué simboliza la historia?', 'Lección', 'Juego', 'Destino', 'Suerte', 'A', NULL, '3', 1),
(65, '¿Qué actitud evita errores?', 'Pensar', 'Apresurarse', 'Ignorar', 'Evitar', 'A', NULL, '3', 1),
(66, '¿Qué valor espiritual hay?', 'Obediencia', 'Desobediencia', 'Olvido', 'Desorden', 'A', NULL, '3', 1),
(67, '¿Qué enseña el capítulo 4?', 'Paciencia', 'Impulsividad', 'Orgullo', 'Envidia', 'A', NULL, '4', 1),
(68, '¿Qué valor destaca?', 'Sabiduría', 'Impulsividad', 'Orgullo', 'Ambición', 'A', NULL, '4', 1),
(69, '¿Qué se debe evitar?', 'Apresurarse', 'Pensar', 'Reflexionar', 'Esperar', 'A', NULL, '4', 1),
(70, '¿Qué actitud es correcta?', 'Reflexión', 'Impulsividad', 'Orgullo', 'Egoísmo', 'A', NULL, '4', 1),
(71, '¿Qué consecuencia hay?', 'Pérdida', 'Ganancia', 'Felicidad', 'Premio', 'A', NULL, '4', 1),
(72, '¿Qué valor se promueve?', 'Dominio propio', 'Orgullo', 'Envidia', 'Ambición', 'A', NULL, '4', 1),
(73, '¿Qué enseñanza deja?', 'Pensar antes', 'Actuar rápido', 'Ignorar', 'Evitar', 'A', NULL, '4', 1),
(74, '¿Qué simboliza la historia?', 'Lección', 'Juego', 'Suerte', 'Destino', 'A', NULL, '4', 1),
(75, '¿Qué actitud mejora decisiones?', 'Paciencia', 'Impulsividad', 'Orgullo', 'Envidia', 'A', NULL, '4', 1),
(76, '¿Qué valor espiritual se enseña?', 'Obediencia', 'Desobediencia', 'Olvido', 'Desorden', 'A', NULL, '4', 1),
(77, '¿Qué enseña el capítulo 5?', 'Reflexión', 'Impulsividad', 'Orgullo', 'Egoísmo', 'A', NULL, '5', 1),
(78, '¿Qué valor es importante?', 'Sabiduría', 'Impulsividad', 'Orgullo', 'Ambición', 'A', NULL, '5', 1),
(79, '¿Qué se debe evitar?', 'Actuar sin pensar', 'Reflexionar', 'Esperar', 'Analizar', 'A', NULL, '5', 1),
(80, '¿Qué actitud es correcta?', 'Pensar', 'Apresurarse', 'Ignorar', 'Evitar', 'A', NULL, '5', 1),
(81, '¿Qué consecuencia hay?', 'Pérdida', 'Ganancia', 'Felicidad', 'Premio', 'A', NULL, '5', 1),
(82, '¿Qué valor se resalta?', 'Paciencia', 'Orgullo', 'Envidia', 'Ambición', 'A', NULL, '5', 1),
(83, '¿Qué enseñanza queda?', 'Reflexionar', 'Ignorar', 'Evitar', 'Correr', 'A', NULL, '5', 1),
(84, '¿Qué simboliza la historia?', 'Lección', 'Juego', 'Destino', 'Suerte', 'A', NULL, '5', 1),
(85, '¿Qué actitud evita errores?', 'Pensar', 'Apresurarse', 'Ignorar', 'Evitar', 'A', NULL, '5', 1),
(86, '¿Qué valor espiritual hay?', 'Obediencia', 'Desobediencia', 'Olvido', 'Desorden', 'A', NULL, '5', 1),
(87, '¿Qué enseña el capítulo 6?', 'Paciencia', 'Impulsividad', 'Orgullo', 'Envidia', 'A', NULL, '6', 1),
(88, '¿Qué valor destaca?', 'Sabiduría', 'Impulsividad', 'Orgullo', 'Ambición', 'A', NULL, '6', 1),
(89, '¿Qué se debe evitar?', 'Apresurarse', 'Pensar', 'Reflexionar', 'Esperar', 'A', NULL, '6', 1),
(90, '¿Qué actitud es correcta?', 'Reflexión', 'Impulsividad', 'Orgullo', 'Egoísmo', 'A', NULL, '6', 1),
(91, '¿Qué consecuencia hay?', 'Pérdida', 'Ganancia', 'Felicidad', 'Premio', 'A', NULL, '6', 1),
(92, '¿Qué valor se promueve?', 'Dominio propio', 'Orgullo', 'Envidia', 'Ambición', 'A', NULL, '6', 1),
(93, '¿Qué enseñanza deja?', 'Pensar antes', 'Actuar rápido', 'Ignorar', 'Evitar', 'A', NULL, '6', 1),
(94, '¿Qué simboliza la historia?', 'Lección', 'Juego', 'Suerte', 'Destino', 'A', NULL, '6', 1),
(95, '¿Qué actitud mejora decisiones?', 'Paciencia', 'Impulsividad', 'Orgullo', 'Envidia', 'A', NULL, '6', 1),
(96, '¿Qué valor espiritual se enseña?', 'Obediencia', 'Desobediencia', 'Olvido', 'Desorden', 'A', NULL, '6', 1),
(97, '¿Qué enseña el capítulo 7?', 'Reflexión', 'Impulsividad', 'Orgullo', 'Egoísmo', 'A', NULL, '7', 1),
(98, '¿Qué valor es importante?', 'Sabiduría', 'Impulsividad', 'Orgullo', 'Ambición', 'A', NULL, '7', 1),
(99, '¿Qué se debe evitar?', 'Actuar sin pensar', 'Reflexionar', 'Esperar', 'Analizar', 'A', NULL, '7', 1),
(100, '¿Qué actitud es correcta?', 'Pensar', 'Apresurarse', 'Ignorar', 'Evitar', 'A', NULL, '7', 1),
(101, '¿Qué consecuencia hay?', 'Pérdida', 'Ganancia', 'Felicidad', 'Premio', 'A', NULL, '7', 1),
(102, '¿Qué valor se resalta?', 'Paciencia', 'Orgullo', 'Envidia', 'Ambición', 'A', NULL, '7', 1),
(103, '¿Qué enseñanza queda?', 'Reflexionar', 'Ignorar', 'Evitar', 'Correr', 'A', NULL, '7', 1),
(104, '¿Qué simboliza la historia?', 'Lección', 'Juego', 'Destino', 'Suerte', 'A', NULL, '7', 1),
(105, '¿Qué actitud evita errores?', 'Pensar', 'Apresurarse', 'Ignorar', 'Evitar', 'A', NULL, '7', 1),
(106, '¿Qué valor espiritual hay?', 'Obediencia', 'Desobediencia', 'Olvido', 'Desorden', 'A', NULL, '7', 1),
(107, 'fff', '1', '2', '3', '4', 'B', NULL, 'final', 2),
(108, 'ftgf', 'erf', 'ert', 'erty', 'ertyui', 'A', NULL, 'final', 2),
(109, '¿Qué características necesita un animal para ser clasificado como reptil?', 'Tiene plumas y pone huevos', 'Posee piel impermeabilizada y generalmente cubierta de escamas.', 'Tiene el cuerpo cubierto de pelo.', 'Respira únicamente por la piel.', 'B', NULL, '1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranking`
--

CREATE TABLE `ranking` (
  `id` int(11) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `puntaje` int(11) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `puntaje` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `porcentaje` int(11) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_cuestionario` int(11) DEFAULT NULL,
  `capitulo` varchar(10) DEFAULT NULL,
  `tiempo_seg` int(11) DEFAULT NULL,
  `nombre_participante` varchar(100) DEFAULT NULL,
  `id_enlace` int(11) DEFAULT NULL,
  `detalle` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `resultados`
--

INSERT INTO `resultados` (`id`, `id_usuario`, `puntaje`, `total`, `porcentaje`, `fecha`, `id_cuestionario`, `capitulo`, `tiempo_seg`, `nombre_participante`, `id_enlace`, `detalle`) VALUES
(1, 2, 3, 10, 30, '2026-03-26 20:29:01', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 8, 10, 80, '2026-03-26 20:44:05', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, 6, 10, 60, '2026-03-26 21:15:17', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, 20, 45, 44, '2026-08-17 06:03:23', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 2, 22, 45, 49, '2026-08-17 06:11:06', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 2, 10, 10, 100, '2026-08-17 06:18:53', NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, 10, 45, 22, '2026-10-26 23:32:40', 1, '1', 49, 'Facundo Joaquin Salas Dominguez', 1, NULL),
(11, NULL, 7, 45, 16, '2026-10-27 00:26:14', 1, '1', 35, 'joaquin salas dominguez', 1, '[{\"p\":\"¿Cuál es el mensaje principal del libro?\",\"a\":\"La comida es importante\",\"b\":\"La obediencia a Dios\",\"c\":\"B\",\"d\":\"El éxito\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué representa el estofado?\",\"a\":\"Una bendición\",\"b\":\"Una tentación\",\"c\":\"B\",\"d\":\"Un premio\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Quién toma una decisión impulsiva?\",\"a\":\"El protagonista\",\"b\":\"Un amigo\",\"c\":\"A\",\"d\":\"Un profeta\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza deja la historia?\",\"a\":\"Valorar lo espiritual\",\"b\":\"Buscar riqueza\",\"c\":\"A\",\"d\":\"Ignorar consejos\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué simboliza la pérdida?\",\"a\":\"Fracaso\",\"b\":\"Consecuencia de malas decisiones\",\"c\":\"B\",\"d\":\"Destino\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué valor se resalta?\",\"a\":\"Paciencia\",\"b\":\"Orgullo\",\"c\":\"A\",\"d\":\"Ambición\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué actitud evita errores?\",\"a\":\"Paciencia\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Desobediencia\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza bíblica se refleja?\",\"a\":\"Obediencia\",\"b\":\"Desorden\",\"c\":\"A\",\"d\":\"Orgullo\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué representa la decisión final?\",\"a\":\"Victoria\",\"b\":\"Pérdida\",\"c\":\"B\",\"d\":\"Suerte\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué error se comete?\",\"a\":\"Impulsividad\",\"b\":\"Paciencia\",\"c\":\"A\",\"d\":\"Amor\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué se prioriza incorrectamente?\",\"a\":\"Espiritual\",\"b\":\"Material\",\"c\":\"B\",\"d\":\"Social\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué se aprende del error?\",\"a\":\"No pensar\",\"b\":\"Pensar antes de actuar\",\"c\":\"B\",\"d\":\"Ignorar\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué actitud faltó?\",\"a\":\"Sabiduría\",\"b\":\"Orgullo\",\"c\":\"A\",\"d\":\"Miedo\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué simboliza el hambre?\",\"a\":\"Necesidad\",\"b\":\"Debilidad\",\"c\":\"B\",\"d\":\"Éxito\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué consecuencia hay?\",\"a\":\"Pérdida\",\"b\":\"Ganancia\",\"c\":\"A\",\"d\":\"Premio\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza se repite?\",\"a\":\"Reflexión\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Pereza\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué valor es importante?\",\"a\":\"Control\",\"b\":\"Orgullo\",\"c\":\"A\",\"d\":\"Egoísmo\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué acción fue incorrecta?\",\"a\":\"Decidir rápido\",\"b\":\"Esperar\",\"c\":\"A\",\"d\":\"Pensar\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué simboliza el acto?\",\"a\":\"Error\",\"b\":\"Victoria\",\"c\":\"A\",\"d\":\"Fuerza\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza queda?\",\"a\":\"Ser sabio\",\"b\":\"Ser impulsivo\",\"c\":\"A\",\"d\":\"Correr\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué actitud se critica?\",\"a\":\"Impulsividad\",\"b\":\"Paciencia\",\"c\":\"A\",\"d\":\"Fe\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué se pierde?\",\"a\":\"Algo valioso\",\"b\":\"Nada\",\"c\":\"A\",\"d\":\"Amigos\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué representa el intercambio?\",\"a\":\"Error grave\",\"b\":\"Éxito\",\"c\":\"A\",\"d\":\"Juego\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué valor falta?\",\"a\":\"Dominio propio\",\"b\":\"Orgullo\",\"c\":\"A\",\"d\":\"Ambición\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza deja?\",\"a\":\"Pensar\",\"b\":\"Actuar rápido\",\"c\":\"A\",\"d\":\"Evitar\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué actitud mejora decisiones?\",\"a\":\"Reflexión\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Orgullo\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué error se evita?\",\"a\":\"Apresurarse\",\"b\":\"Esperar\",\"c\":\"A\",\"d\":\"Reflexionar\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué representa el deseo?\",\"a\":\"Debilidad\",\"b\":\"Fuerza\",\"c\":\"A\",\"d\":\"Logro\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza es clave?\",\"a\":\"Control\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Envidia\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué se necesita?\",\"a\":\"Paciencia\",\"b\":\"Rapidez\",\"c\":\"A\",\"d\":\"Impulsividad\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué actitud genera errores?\",\"a\":\"Impulsividad\",\"b\":\"Paciencia\",\"c\":\"A\",\"d\":\"Amor\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza espiritual hay?\",\"a\":\"Obedecer\",\"b\":\"Ignorar\",\"c\":\"A\",\"d\":\"Olvidar\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué representa la historia?\",\"a\":\"Lección\",\"b\":\"Juego\",\"c\":\"A\",\"d\":\"Cuento\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué valor se promueve?\",\"a\":\"Sabiduría\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Egoísmo\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué actitud es correcta?\",\"a\":\"Pensar\",\"b\":\"Actuar rápido\",\"c\":\"A\",\"d\":\"Evitar\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué consecuencia trae el error?\",\"a\":\"Pérdida\",\"b\":\"Ganancia\",\"c\":\"A\",\"d\":\"Premio\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué simboliza el acto?\",\"a\":\"Debilidad\",\"b\":\"Fuerza\",\"c\":\"A\",\"d\":\"Logro\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza queda?\",\"a\":\"Reflexionar\",\"b\":\"Ignorar\",\"c\":\"A\",\"d\":\"Correr\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué valor falta?\",\"a\":\"Control\",\"b\":\"Orgullo\",\"c\":\"A\",\"d\":\"Egoísmo\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué actitud es mejor?\",\"a\":\"Paciencia\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Egoísmo\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué decisión fue mala?\",\"a\":\"Apresurada\",\"b\":\"Pensada\",\"c\":\"A\",\"d\":\"Sabia\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué aprendizaje queda?\",\"a\":\"Pensar antes\",\"b\":\"Actuar rápido\",\"c\":\"A\",\"d\":\"Evitar\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué simboliza el error?\",\"a\":\"Debilidad\",\"b\":\"Fuerza\",\"c\":\"A\",\"d\":\"Logro\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza es clave?\",\"a\":\"Paciencia\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Envidia\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué valor es importante?\",\"a\":\"Dominio propio\",\"b\":\"Orgullo\",\"c\":\"A\",\"d\":\"Ambición\",\"m\":\"C\",\"e\":\"\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `apellido_usuario` varchar(100) NOT NULL,
  `correo_usuario` varchar(150) NOT NULL,
  `user_usuario` varchar(50) NOT NULL,
  `pass_usuario` varchar(255) NOT NULL,
  `tipo_club` enum('Conquistadores','Aventureros') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `apellido_usuario`, `correo_usuario`, `user_usuario`, `pass_usuario`, `tipo_club`) VALUES
(1, 'Joaquin', 'Salas', 'joaquinsalas_25@hotmail.com', 'joaquin25', '123456', 'Conquistadores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_simulador`
--

CREATE TABLE `usuarios_simulador` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rol` enum('admin','usuario') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios_simulador`
--

INSERT INTO `usuarios_simulador` (`id`, `usuario`, `password`, `rol`) VALUES
(1, 'Enrique', 'e10adc3949ba59abbe56e057f20f883e', 'admin'),
(2, 'joaquin', 'e10adc3949ba59abbe56e057f20f883e', 'usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuestionarios`
--
ALTER TABLE `cuestionarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `enlaces_examen`
--
ALTER TABLE `enlaces_examen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo_usuario` (`correo_usuario`),
  ADD UNIQUE KEY `user_usuario` (`user_usuario`);

--
-- Indices de la tabla `usuarios_simulador`
--
ALTER TABLE `usuarios_simulador`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuestionarios`
--
ALTER TABLE `cuestionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `enlaces_examen`
--
ALTER TABLE `enlaces_examen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT de la tabla `ranking`
--
ALTER TABLE `ranking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios_simulador`
--
ALTER TABLE `usuarios_simulador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
