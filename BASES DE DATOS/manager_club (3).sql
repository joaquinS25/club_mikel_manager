-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2026 a las 01:20:45
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
(6, 'Arte de Acampar AR-001', NULL, '2026-11-18 17:57:44', '3e327fe9ca14bc25.jpg'),
(7, 'Modales Cristianos AM-011', NULL, '2026-11-18 17:58:14', '71f77670351c2aa7.jpg'),
(8, 'Pioneros Adventistas AM-043', NULL, '2026-11-18 17:58:48', '963bf966907e0a7d.jpg'),
(9, 'Caminata con Mochila AR-056', NULL, '2026-11-18 17:59:33', 'e51084d4c49b3b37.jpg');

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
(2, '8c7be64f4f8773c083c1e4d6d2b9220a', 6, 'final', '', 1, 1, '2026-11-19 23:59:00', '2026-11-18 18:10:27');

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
(217, '¿Cuál es el objetivo principal de acampar?', 'A) Competir con otros clubes.', 'B) Disfrutar de la naturaleza, desarrollar habilidades y fortalecer el compañerismo.', 'C) Evitar realizar actividades al aire libre.', 'D) Permanecer dentro de las carpas todo el día.', 'B', NULL, 'final', 6),
(218, '¿Qué elemento es indispensable para protegerse del frío durante una noche de campamento?', 'A) Una linterna.', 'B) Una brújula.', 'C) Una bolsa de dormir.', 'D) Un silbato', 'C', NULL, 'final', 6),
(219, '¿Qué se debe hacer antes de instalar una carpa?', 'A) Buscar un terreno plano, seco y seguro.', 'B) Instalarla debajo de árboles con ramas secas.', 'C) Colocarla en una pendiente pronunciada.', 'D) Buscar un lugar cercano a un barranco.', 'A', NULL, 'final', 6),
(220, '¿Cuál es la función principal de una brújula?', 'A) Medir la temperatura.', 'B) Indicar los puntos cardinales y orientar.', 'C) Medir la velocidad del viento.', 'D) Calcular la distancia recorrida.', 'B', NULL, 'final', 6),
(221, '¿Qué se debe hacer con la basura durante un campamento?', 'A) Enterrar toda la basura sin clasificarla.', 'B) Dejarla en el lugar donde se realizó el campamento.', 'C) Quemarla sin tomar precauciones.', 'D) Recogerla y depositarla en los lugares correspondientes.', 'D', NULL, 'final', 6),
(222, '¿Cuál es el equipo adecuado para encender una fogata de manera segura?', 'A) Fósforos o encendedor y materiales apropiados para iniciar el fuego.', 'B) Plásticos y botellas.', 'C) Combustible derramado sobre la madera.', 'D) Papel y materiales tóxicos.', 'A', NULL, 'final', 6),
(223, '¿Qué se debe hacer antes de abandonar el lugar donde se realizó una fogata?', 'A) Cubrirla con hojas secas.', 'B) Dejar que se apague sola.', 'C) Apagarla completamente con agua y comprobar que no queden brasas calientes.', 'D) Colocar más leña para que dure toda la noche.', 'C', NULL, 'final', 6),
(224, '¿Qué elemento sirve para proporcionar iluminación durante la noche?', 'A) Cantimplora.', 'B) Linterna.', 'C) Brújula.', 'D) Cuerda.', 'B', NULL, 'final', 6),
(225, '¿Cuál es la mejor manera de conservar los alimentos durante un campamento?', 'A) Dejarlos expuestos al sol.', 'B) Guardarlos junto a la basura.', 'C) Dejarlos fuera de la carpa durante toda la noche.', 'D) Mantenerlos protegidos, limpios y almacenados adecuadamente.', 'D', NULL, 'final', 6),
(226, '10. ¿Qué principio debe respetar todo conquistador al realizar actividades en la naturaleza?', 'A) Dejar el lugar mejor de como lo encontró, cuidando el medio ambiente.', 'B) Cortar árboles para facilitar el campamento.', 'C) Alimentar a todos los animales silvestres.', 'D) Dejar restos de comida en el suelo.', 'A', NULL, 'final', 6);

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
(11, NULL, 7, 45, 16, '2026-10-27 00:26:14', 1, '1', 35, 'joaquin salas dominguez', 1, '[{\"p\":\"¿Cuál es el mensaje principal del libro?\",\"a\":\"La comida es importante\",\"b\":\"La obediencia a Dios\",\"c\":\"B\",\"d\":\"El éxito\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué representa el estofado?\",\"a\":\"Una bendición\",\"b\":\"Una tentación\",\"c\":\"B\",\"d\":\"Un premio\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Quién toma una decisión impulsiva?\",\"a\":\"El protagonista\",\"b\":\"Un amigo\",\"c\":\"A\",\"d\":\"Un profeta\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza deja la historia?\",\"a\":\"Valorar lo espiritual\",\"b\":\"Buscar riqueza\",\"c\":\"A\",\"d\":\"Ignorar consejos\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué simboliza la pérdida?\",\"a\":\"Fracaso\",\"b\":\"Consecuencia de malas decisiones\",\"c\":\"B\",\"d\":\"Destino\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué valor se resalta?\",\"a\":\"Paciencia\",\"b\":\"Orgullo\",\"c\":\"A\",\"d\":\"Ambición\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué actitud evita errores?\",\"a\":\"Paciencia\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Desobediencia\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza bíblica se refleja?\",\"a\":\"Obediencia\",\"b\":\"Desorden\",\"c\":\"A\",\"d\":\"Orgullo\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué representa la decisión final?\",\"a\":\"Victoria\",\"b\":\"Pérdida\",\"c\":\"B\",\"d\":\"Suerte\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué error se comete?\",\"a\":\"Impulsividad\",\"b\":\"Paciencia\",\"c\":\"A\",\"d\":\"Amor\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué se prioriza incorrectamente?\",\"a\":\"Espiritual\",\"b\":\"Material\",\"c\":\"B\",\"d\":\"Social\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué se aprende del error?\",\"a\":\"No pensar\",\"b\":\"Pensar antes de actuar\",\"c\":\"B\",\"d\":\"Ignorar\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué actitud faltó?\",\"a\":\"Sabiduría\",\"b\":\"Orgullo\",\"c\":\"A\",\"d\":\"Miedo\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué simboliza el hambre?\",\"a\":\"Necesidad\",\"b\":\"Debilidad\",\"c\":\"B\",\"d\":\"Éxito\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué consecuencia hay?\",\"a\":\"Pérdida\",\"b\":\"Ganancia\",\"c\":\"A\",\"d\":\"Premio\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza se repite?\",\"a\":\"Reflexión\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Pereza\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué valor es importante?\",\"a\":\"Control\",\"b\":\"Orgullo\",\"c\":\"A\",\"d\":\"Egoísmo\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué acción fue incorrecta?\",\"a\":\"Decidir rápido\",\"b\":\"Esperar\",\"c\":\"A\",\"d\":\"Pensar\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué simboliza el acto?\",\"a\":\"Error\",\"b\":\"Victoria\",\"c\":\"A\",\"d\":\"Fuerza\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza queda?\",\"a\":\"Ser sabio\",\"b\":\"Ser impulsivo\",\"c\":\"A\",\"d\":\"Correr\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué actitud se critica?\",\"a\":\"Impulsividad\",\"b\":\"Paciencia\",\"c\":\"A\",\"d\":\"Fe\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué se pierde?\",\"a\":\"Algo valioso\",\"b\":\"Nada\",\"c\":\"A\",\"d\":\"Amigos\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué representa el intercambio?\",\"a\":\"Error grave\",\"b\":\"Éxito\",\"c\":\"A\",\"d\":\"Juego\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué valor falta?\",\"a\":\"Dominio propio\",\"b\":\"Orgullo\",\"c\":\"A\",\"d\":\"Ambición\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza deja?\",\"a\":\"Pensar\",\"b\":\"Actuar rápido\",\"c\":\"A\",\"d\":\"Evitar\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué actitud mejora decisiones?\",\"a\":\"Reflexión\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Orgullo\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué error se evita?\",\"a\":\"Apresurarse\",\"b\":\"Esperar\",\"c\":\"A\",\"d\":\"Reflexionar\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué representa el deseo?\",\"a\":\"Debilidad\",\"b\":\"Fuerza\",\"c\":\"A\",\"d\":\"Logro\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza es clave?\",\"a\":\"Control\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Envidia\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué se necesita?\",\"a\":\"Paciencia\",\"b\":\"Rapidez\",\"c\":\"A\",\"d\":\"Impulsividad\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué actitud genera errores?\",\"a\":\"Impulsividad\",\"b\":\"Paciencia\",\"c\":\"A\",\"d\":\"Amor\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza espiritual hay?\",\"a\":\"Obedecer\",\"b\":\"Ignorar\",\"c\":\"A\",\"d\":\"Olvidar\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué representa la historia?\",\"a\":\"Lección\",\"b\":\"Juego\",\"c\":\"A\",\"d\":\"Cuento\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué valor se promueve?\",\"a\":\"Sabiduría\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Egoísmo\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué actitud es correcta?\",\"a\":\"Pensar\",\"b\":\"Actuar rápido\",\"c\":\"A\",\"d\":\"Evitar\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué consecuencia trae el error?\",\"a\":\"Pérdida\",\"b\":\"Ganancia\",\"c\":\"A\",\"d\":\"Premio\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué simboliza el acto?\",\"a\":\"Debilidad\",\"b\":\"Fuerza\",\"c\":\"A\",\"d\":\"Logro\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza queda?\",\"a\":\"Reflexionar\",\"b\":\"Ignorar\",\"c\":\"A\",\"d\":\"Correr\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué valor falta?\",\"a\":\"Control\",\"b\":\"Orgullo\",\"c\":\"A\",\"d\":\"Egoísmo\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué actitud es mejor?\",\"a\":\"Paciencia\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Egoísmo\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué decisión fue mala?\",\"a\":\"Apresurada\",\"b\":\"Pensada\",\"c\":\"A\",\"d\":\"Sabia\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué aprendizaje queda?\",\"a\":\"Pensar antes\",\"b\":\"Actuar rápido\",\"c\":\"A\",\"d\":\"Evitar\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué simboliza el error?\",\"a\":\"Debilidad\",\"b\":\"Fuerza\",\"c\":\"A\",\"d\":\"Logro\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué enseñanza es clave?\",\"a\":\"Paciencia\",\"b\":\"Impulsividad\",\"c\":\"A\",\"d\":\"Envidia\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué valor es importante?\",\"a\":\"Dominio propio\",\"b\":\"Orgullo\",\"c\":\"A\",\"d\":\"Ambición\",\"m\":\"C\",\"e\":\"\"}]'),
(12, NULL, 4, 10, 40, '2026-11-18 18:11:40', 6, 'final', 47, 'Facundo Salas', 2, '[{\"p\":\"¿Qué elemento es indispensable para protegerse del frío durante una noche de campamento?\",\"a\":\"A) Una linterna.\",\"b\":\"B) Una brújula.\",\"c\":\"C\",\"d\":\"D) Un silbato\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer antes de instalar una carpa?\",\"a\":\"A) Buscar un terreno plano, seco y seguro.\",\"b\":\"B) Instalarla debajo de árboles con ramas secas.\",\"c\":\"A\",\"d\":\"D) Buscar un lugar cercano a un barranco.\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cuál es el equipo adecuado para encender una fogata de manera segura?\",\"a\":\"A) Fósforos o encendedor y materiales apropiados para iniciar el fuego.\",\"b\":\"B) Plásticos y botellas.\",\"c\":\"A\",\"d\":\"D) Papel y materiales tóxicos.\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer con la basura durante un campamento?\",\"a\":\"A) Enterrar toda la basura sin clasificarla.\",\"b\":\"B) Dejarla en el lugar donde se realizó el campamento.\",\"c\":\"D\",\"d\":\"D) Recogerla y depositarla en los lugares correspondientes.\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuál es la mejor manera de conservar los alimentos durante un campamento?\",\"a\":\"A) Dejarlos expuestos al sol.\",\"b\":\"B) Guardarlos junto a la basura.\",\"c\":\"D\",\"d\":\"D) Mantenerlos protegidos, limpios y almacenados adecuadamente.\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Cuál es la función principal de una brújula?\",\"a\":\"A) Medir la temperatura.\",\"b\":\"B) Indicar los puntos cardinales y orientar.\",\"c\":\"B\",\"d\":\"D) Calcular la distancia recorrida.\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer antes de abandonar el lugar donde se realizó una fogata?\",\"a\":\"A) Cubrirla con hojas secas.\",\"b\":\"B) Dejar que se apague sola.\",\"c\":\"C\",\"d\":\"D) Colocar más leña para que dure toda la noche.\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cuál es el objetivo principal de acampar?\",\"a\":\"A) Competir con otros clubes.\",\"b\":\"B) Disfrutar de la naturaleza, desarrollar habilidades y fortalecer el compañerismo.\",\"c\":\"B\",\"d\":\"D) Permanecer dentro de las carpas todo el día.\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué elemento sirve para proporcionar iluminación durante la noche?\",\"a\":\"A) Cantimplora.\",\"b\":\"B) Linterna.\",\"c\":\"B\",\"d\":\"D) Cuerda.\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"10. ¿Qué principio debe respetar todo conquistador al realizar actividades en la naturaleza?\",\"a\":\"A) Dejar el lugar mejor de como lo encontró, cuidando el medio ambiente.\",\"b\":\"B) Cortar árboles para facilitar el campamento.\",\"c\":\"A\",\"d\":\"D) Dejar restos de comida en el suelo.\",\"m\":\"D\",\"e\":\"\"}]');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `enlaces_examen`
--
ALTER TABLE `enlaces_examen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT de la tabla `ranking`
--
ALTER TABLE `ranking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
