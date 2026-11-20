-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql206.infinityfree.com
-- Tiempo de generación: 20-11-2026 a las 17:42:38
-- Versión del servidor: 11.4.13-MariaDB
-- Versión de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `if0_43469634_manager_club`
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
(6, 'Arte de Acampar AR-001', NULL, '2026-11-18 21:04:30', '9e36d8325f9ab955.jpg'),
(7, 'Modales Cristianos AM-011', NULL, '2026-11-18 21:04:42', '56cdeb6ae541a746.jpg'),
(8, 'Pioneros Adventistas AM-043', NULL, '2026-11-18 21:04:55', 'fe47fa80ae010d5f.jpg'),
(9, 'Caminata con Mochila AR-056', NULL, '2026-11-18 21:05:06', '675e698f47a98532.jpg'),
(10, 'Orientación AR-021', NULL, '2026-11-19 19:01:10', '1e8d32c24f947563.jpg'),
(11, 'Civismo Cristiano AM-006', NULL, '2026-11-19 19:02:27', '30380fae3440b125.jpg'),
(12, 'Orden Cerrado AR-047', NULL, '2026-11-19 19:04:35', '55e626d4d7f80e4f.jpg'),
(13, 'Fogata y cocina al aire libre AR-020', NULL, '2026-11-19 19:06:10', '7a26dd0d8a27235d.jpg');

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
(2, 'ab0314f1909b2ba806b209cb2d9dfe9d', 6, 'final', '', 1, 1, '2026-11-20 23:59:00', '2026-11-18 21:22:18'),
(3, 'e5637a929aaf107c50adb909405e003a', 7, 'final', '', 1, 1, '2026-11-20 23:59:00', '2026-11-18 21:22:46'),
(4, '78e34726d224778b1a2f89d8ad6c9238', 8, 'final', '', 1, 1, '2026-11-20 23:59:00', '2026-11-18 21:23:04'),
(5, '2a3a9aed3045f049c4028bd1797711ef', 9, 'final', '', 1, 1, '2026-11-20 23:59:00', '2026-11-18 21:23:28'),
(6, '403584b431997901d1308a7b5f8a8103', 10, 'final', '', 1, 1, '2026-11-21 15:15:00', '2026-11-19 20:15:19'),
(7, '94a47d6ed85437b84dbab92387ac4bdf', 11, 'final', '', 1, 1, '2026-11-21 15:15:00', '2026-11-19 20:15:29'),
(8, '62f5bdb0662e9fb7cb48d759491e0699', 12, 'final', '', 1, 1, '2026-11-21 15:15:00', '2026-11-19 20:15:39'),
(9, '9566b6f1923ab0318bd74c32446c6c7b', 13, 'final', '', 1, 1, '2026-11-21 15:15:00', '2026-11-19 20:16:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembros`
--

CREATE TABLE `miembros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `funcion` varchar(80) NOT NULL,
  `seguro` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  `salud` enum('ACTUALIZADO','PENDIENTE') NOT NULL DEFAULT 'PENDIENTE',
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado_civil` varchar(20) NOT NULL,
  `talla` varchar(10) NOT NULL,
  `bautizado` tinyint(1) NOT NULL DEFAULT 0,
  `dni` varchar(20) NOT NULL,
  `organo_emisor` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `departamento` varchar(60) NOT NULL,
  `ciudad` varchar(80) NOT NULL,
  `codigo_postal` varchar(15) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `barrio` varchar(100) DEFAULT NULL,
  `idioma` varchar(20) NOT NULL DEFAULT 'ES',
  `acepto_terminos` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_aceptacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `miembros`
--

INSERT INTO `miembros` (`id`, `nombre`, `sexo`, `fecha_nacimiento`, `funcion`, `seguro`, `salud`, `creado`, `estado_civil`, `talla`, `bautizado`, `dni`, `organo_emisor`, `telefono`, `celular`, `correo`, `departamento`, `ciudad`, `codigo_postal`, `direccion`, `barrio`, `idioma`, `acepto_terminos`, `fecha_aceptacion`) VALUES
(3093854, 'AARON KEYLOR CAPUÑAY ZAMORA', 'M', '2014-08-27', 'CAMILLERO DE LA UNIDAD', 'ACTIVO', 'PENDIENTE', '2026-11-21 05:14:07', 'SOLTERO(A)', 'XS', 0, '78739167', 'reniec', '953376891', '975 432 845', 'SARAYANETZAVALETADOMINGUEZ@GMAIL.COM', 'Lima', 'Ate', '15022', ' PJE. JUAN SIFUENTES MZ: T-2 LTE: 08, URB: GRUMETE MEDINA', 'Grumete Medina', 'ES', 1, '2026-11-20 16:14:07'),
(3194407, 'ALEXA ZOE GUILLEN VELASQUEZ', 'F', '2014-02-23', 'CONQUISTADOR', 'ACTIVO', 'PENDIENTE', '2026-11-20 22:40:44', 'SOLTERO(A)', '16', 0, '78469079', 'reniec', '', '', '', 'Lima', 'ate', '15022', ' AV. MICHAEL FARADAY MZ: P LTE: 16, URB. SICUANI', 'sicuani', 'ES', 1, '2026-11-20 14:40:44');

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
(1, '¿Qué se debe hacer antes de armar una carpa?', 'Armarla sobre cualquier superficie', 'Revisar el terreno y retirar piedras y ramas', 'Encender una fogata cerca', 'Colocar la comida dentro', 'B', NULL, 'final', 6),
(2, '¿Qué tipo de terreno es el mejor para acampar?', 'Una zona baja donde se acumula el agua', 'Junto al cauce de un río', 'Un terreno plano, con buen drenaje y seguro', 'Debajo de un árbol seco', 'C', NULL, 'final', 6),
(3, '¿Para qué sirve el piso impermeable que se coloca bajo la carpa?', 'Proteger de la humedad del suelo', 'Decorar el campamento', 'Hacer la carpa más pesada', 'Evitar que entre la luz', 'A', NULL, 'final', 6),
(4, '¿Cuál es una regla básica al encender una fogata?', 'Hacerla junto a la carpa', 'Hacerla bajo ramas bajas', 'Dejarla sin vigilancia', 'Hacerla en un área despejada, con piedras alrededor y agua cerca', 'D', NULL, 'final', 6),
(5, '¿Qué principio resume el cuidado de la naturaleza al acampar?', 'Dejar el lugar mejor de como se encontró', 'Llevarse recuerdos de plantas y animales', 'Enterrar toda la basura', 'Cortar ramas verdes para la leña', 'A', NULL, 'final', 6),
(6, '¿Cómo se deben guardar los alimentos en un campamento?', 'Abiertos sobre la mesa', 'En recipientes cerrados y lejos de las carpas', 'Dentro de la carpa donde se duerme', 'En el suelo, sin cubrir', 'B', NULL, 'final', 6),
(7, '¿Qué nudo sirve para formar un lazo fijo que no se desliza?', 'Nudo simple', 'Nudo de zapato', 'As de guía', 'Nudo corredizo', 'C', NULL, 'final', 6),
(8, '¿Qué se debe hacer con la basura durante un campamento?', 'Dejarla en el lugar', 'Quemar plásticos en la fogata', 'Esconderla bajo las piedras', 'Recogerla y depositarla en un lugar apropiado', 'D', NULL, 'final', 6),
(9, '¿Qué tipo de ropa es recomendable para dormir en un clima frío?', 'Ropa seca y abrigada, preferiblemente en capas', 'Ropa mojada del día', 'Solo ropa ligera', 'Ninguna ropa especial', 'A', NULL, 'final', 6),
(10, '¿Qué se debe hacer al apagar una fogata?', 'Taparla con hojas secas', 'Apagarla con agua y comprobar que esté completamente fría', 'Dejar que se apague sola', 'Echarle tierra y marcharse', 'B', NULL, 'final', 6),
(11, '¿En qué texto bíblico se encuentra la regla de oro?', 'Juan 3:16', 'Salmo 23:1', 'Mateo 7:12', 'Génesis 1:1', 'C', NULL, 'final', 7),
(12, '¿Qué actitud demuestra cortesía al conversar con otra persona?', 'Interrumpirla para dar tu opinión', 'Escucharla con atención sin interrumpir', 'Mirar el celular mientras habla', 'Hablar más fuerte que ella', 'B', NULL, 'final', 7),
(13, '¿Qué debe hacer un cristiano cuando le presentan a una persona?', 'Ignorarla', 'Saludarla con amabilidad y mirarla a los ojos', 'Esperar que se vaya', 'Saludarla sin dejar de hacer otra cosa', 'B', NULL, 'final', 7),
(14, 'En la mesa, ¿cuándo se comienza a comer?', 'Cuando llega la comida a tu plato, sin esperar', 'Antes de que todos se sienten', 'Después de la oración y cuando todos estén servidos', 'Cuando el primero termine', 'C', NULL, 'final', 7),
(15, '¿Cuál de estas es una expresión de cortesía?', 'Dame eso', 'Por favor y gracias', 'Apúrate', 'No me interesa', 'B', NULL, 'final', 7),
(16, '¿Cómo se debe tratar a las personas mayores?', 'Con respeto, cediéndoles el asiento y ayudándolas', 'Con indiferencia', 'Con burlas', 'Sin prestarles atención', 'A', NULL, 'final', 7),
(17, '¿Qué actitud es apropiada dentro del templo durante el culto?', 'Conversar en voz alta', 'Caminar libremente durante el programa', 'Reverencia y silencio', 'Usar el celular para juegos', 'C', NULL, 'final', 7),
(18, '¿Qué debes hacer si llegas tarde a una reunión o culto?', 'Entrar haciendo ruido', 'Entrar discretamente y sin interrumpir', 'Saludar a todos en voz alta', 'Quejarte de la hora', 'B', NULL, 'final', 7),
(19, '¿Qué cita bíblica nos anima a ser bondadosos y compasivos unos con otros?', 'Efesios 4:32', 'Éxodo 20:3', 'Apocalipsis 22:21', 'Hechos 1:8', 'A', NULL, 'final', 7),
(20, '¿Cuál es la actitud correcta al recibir un regalo?', 'Criticarlo', 'Devolverlo de inmediato', 'Ignorarlo', 'Agradecer con sinceridad', 'D', NULL, 'final', 7),
(21, '¿Quién fue la cofundadora de la Iglesia Adventista que recibió el don de profecía?', 'Elena G. de White', 'Ana Johnson', 'Raquel Oakes', 'Dorcas Smith', 'A', NULL, 'final', 8),
(22, '¿Quién predicó el pronto regreso de Cristo para el año 1844?', 'José Bates', 'Guillermo Miller', 'Juan Byington', 'Jaime White', 'B', NULL, 'final', 8),
(23, '¿Cómo se conoce el evento del 22 de octubre de 1844?', 'La Gran Reforma', 'El Gran Avivamiento', 'El Gran Chasco', 'La Gran Comisión', 'C', NULL, 'final', 8),
(24, '¿En qué año se organizó oficialmente la Iglesia Adventista del Séptimo Día?', '1844', '1888', '1901', '1863', 'D', NULL, 'final', 8),
(25, '¿En qué ciudad se organizó oficialmente la Iglesia Adventista?', 'Battle Creek, Michigan', 'Nueva York', 'Washington, D.C.', 'Los Ángeles', 'A', NULL, 'final', 8),
(26, '¿Quién fue el primer presidente de la Asociación General?', 'Jaime White', 'Juan Byington', 'Uriah Smith', 'Juan Andrews', 'B', NULL, 'final', 8),
(27, '¿Quién fue el esposo de Elena G. de White y pionero de la iglesia?', 'José Bates', 'Hiram Edson', 'Jaime White', 'Joshua Himes', 'C', NULL, 'final', 8),
(28, '¿Qué aporte destacado hizo el capitán José Bates?', 'Tradujo la Biblia', 'Fundó una universidad', 'Escribió himnos', 'Promovió la observancia del sábado entre los primeros adventistas', 'D', NULL, 'final', 8),
(29, '¿Quién compartió el mensaje del sábado con un grupo de creyentes en Washington, New Hampshire?', 'Raquel Oakes (Preston)', 'Elena G. de White', 'Ana Smith', 'María Miller', 'A', NULL, 'final', 8),
(30, '¿Quién fue el primer misionero oficial de la iglesia enviado fuera de Estados Unidos?', 'Guillermo Miller', 'Juan Nevins Andrews', 'Jaime White', 'Hiram Edson', 'B', NULL, 'final', 8),
(31, '¿Cuánto debería pesar como máximo la mochila en relación con el peso corporal?', 'Alrededor del 50 %', 'Alrededor del 40 %', 'Alrededor del 20 %', 'No importa el peso', 'C', NULL, 'final', 9),
(32, '¿Dónde se deben colocar los objetos más pesados en la mochila?', 'En el fondo, lejos de la espalda', 'Cerca de la espalda y en la parte media', 'Colgando por fuera', 'Siempre en los bolsillos laterales', 'B', NULL, 'final', 9),
(33, '¿Qué calzado es el más recomendable para una caminata larga?', 'Zapatos nuevos sin usar', 'Sandalias de playa', 'Calzado cómodo, resistente y ya probado', 'Zapatos de vestir', 'C', NULL, 'final', 9),
(34, '¿Qué es esencial llevar siempre en una caminata?', 'Aparatos electrónicos de entretenimiento', 'Ropa de más sin necesidad', 'Objetos decorativos', 'Agua suficiente y alimentos energéticos', 'D', NULL, 'final', 9),
(35, '¿Qué se debe hacer antes de salir a una caminata?', 'Informar la ruta y la hora estimada de regreso', 'Salir sin avisar', 'Cambiar de ruta durante el camino', 'Caminar solo y sin planificar', 'A', NULL, 'final', 9),
(36, '¿Qué tipo de medias ayuda a prevenir ampollas?', 'Medias mojadas', 'Medias que absorban la humedad y sin arrugas', 'Medias rotas', 'No usar medias', 'B', NULL, 'final', 9),
(37, '¿Qué se debe hacer al sentir el primer signo de una ampolla?', 'Seguir caminando sin atenderla', 'Quitarse la bota y correr', 'Detenerse y proteger la zona', 'Reventarla con una aguja sucia', 'C', NULL, 'final', 9),
(38, '¿Cuál es el mejor ritmo de marcha en una caminata larga?', 'Ritmo constante con descansos periódicos', 'Correr al inicio y detenerse', 'Sin descansos', 'Lo más rápido posible', 'A', NULL, 'final', 9),
(39, '¿Cómo es recomendable vestirse para una caminata?', 'Con una sola prenda gruesa', 'Con ropa de algodón mojada', 'Con ropa formal', 'Por capas, para poder agregar o quitar según el clima', 'D', NULL, 'final', 9),
(40, '¿Qué debes hacer si te pierdes durante una caminata?', 'Correr en cualquier dirección', 'Mantener la calma, detenerte y quedarte en un lugar visible', 'Separarte del grupo', 'Seguir caminando sin rumbo', 'B', NULL, 'final', 9),
(41, '¿Cómo se representa el relieve en un mapa topográfico?', 'Con curvas de nivel', 'Con flechas rojas', 'Con cuadrículas de colores', 'Con líneas de alta tensión', 'A', NULL, 'final', 10),
(42, '¿De qué color se dibujan las curvas de nivel en un mapa topográfico?', 'Azul', 'Verde', 'Marrón', 'Negro', 'C', NULL, 'final', 10),
(43, '¿Qué es la equidistancia entre curvas de nivel?', 'La distancia horizontal entre dos poblaciones', 'La diferencia constante de altitud entre dos curvas de nivel consecutivas', 'El largo de la escala gráfica', 'El ángulo de la declinación magnética', 'B', NULL, 'final', 10),
(44, 'En un mapa con escala 1:50.000, ¿a cuántos metros reales equivale 1 cm del mapa?', '50 m', '5 km', '5 m', '500 m', 'D', NULL, 'final', 10),
(45, '¿Qué indican las curvas de nivel muy juntas entre sí?', 'Una pendiente suave', 'Un terreno plano', 'Una pendiente empinada', 'Un lago', 'C', NULL, 'final', 10),
(46, '¿En qué huso UTM se encuentra Lima Metropolitana?', 'Huso 17', 'Huso 18', 'Huso 19', 'Huso 20', 'B', NULL, 'final', 10),
(47, '¿Cuál es el azimut inverso (contra-azimut) de 60°?', '120°', '300°', '30°', '240°', 'D', NULL, 'final', 10),
(48, 'Si la declinación magnética es oeste, ¿qué se hace para pasar de un azimut geográfico a uno magnético?', 'Se suma la declinación', 'Se resta la declinación', 'Se multiplica por dos', 'No se modifica el azimut', 'A', NULL, 'final', 10),
(49, 'Con la constelación Cruz del Sur, ¿cuántas veces se prolonga su brazo mayor para ubicar el Sur?', '2 veces', '3 veces', '4,5 veces', '10 veces', 'C', NULL, 'final', 10),
(50, '¿Cuál es la brújula más popular entre los excursionistas?', 'La brújula de reloj', 'La brújula cartográfica de base transparente', 'La brújula de bolsillo sin limbo', 'La brújula de cocina', 'B', NULL, 'final', 10),
(51, 'Según Filipenses 3:20, además de ciudadanos de nuestro país, ¿de qué somos ciudadanos los cristianos?', 'De la tierra', 'Del cielo', 'Del mundo', 'De la iglesia', 'B', NULL, 'final', 11),
(52, '¿Quién creó la bandera del Perú en Pisco en 1820?', 'Simón Bolívar', 'Miguel Grau', 'José de la Torre Ugarte', 'José de San Martín', 'D', NULL, 'final', 11),
(53, 'En la bandera del Perú, ¿qué representa el color rojo?', 'La sangre derramada por los héroes de la independencia', 'La paz', 'La riqueza agrícola', 'La nobleza', 'A', NULL, 'final', 11),
(54, '¿Qué enseña Mateo 22:21: \"Dad a César lo que es de César y a Dios lo que es de Dios\"?', 'Que los cristianos no deben pagar impuestos', 'Que solo importan los asuntos espirituales', 'Que debemos respetar al Estado y entregar a Dios lo que le pertenece', 'Que el Estado está por encima de Dios', 'C', NULL, 'final', 11),
(55, '¿Qué principio se aplica cuando las leyes humanas contradicen la ley de Dios (Hechos 5:29)?', 'Obedecer a los hombres antes que a Dios', 'Es necesario obedecer a Dios antes que a los hombres', 'Ignorar a las autoridades', 'Responder con violencia', 'B', NULL, 'final', 11),
(56, 'Según la Constitución del Perú, ¿cuáles son los tres poderes del Estado?', 'Ejecutivo, Legislativo y Judicial', 'Presidente, Alcalde y Gobernador', 'Ejército, Policía y Congreso', 'Municipal, Regional y Nacional', 'A', NULL, 'final', 11),
(57, '¿Quién compuso la música del Himno Nacional del Perú?', 'José de San Martín', 'Simón Bolívar', 'Miguel Grau', 'José Bernardo Alcedo', 'D', NULL, 'final', 11),
(58, '¿Qué nave comandó Miguel Grau durante la Guerra del Pacífico?', 'La corbeta Esmeralda', 'El crucero Angamos', 'El monitor Huáscar', 'La fragata Unión', 'C', NULL, 'final', 11),
(59, '¿Cuál es el lema de los Conquistadores?', 'El amor de Cristo me motiva', 'Salvar del pecado y guiar en el servicio', 'Siempre listos', 'El mensaje del advenimiento a todo el mundo', 'A', NULL, 'final', 11),
(60, '¿Qué significa la palabra aramea \"Maranata\"?', 'Dios es amor', 'Gloria a Dios', 'Paz en la tierra', '¡El Señor viene!', 'D', NULL, 'final', 11),
(61, 'En orden cerrado, ¿qué es la distancia?', 'El espacio lateral entre dos personas', 'La longitud de un paso', 'El espacio libre entre dos personas colocadas una detrás de la otra', 'El ancho de una formación', 'C', NULL, 'final', 12),
(62, 'En orden cerrado, ¿qué es el intervalo?', 'El espacio lateral entre dos personas colocadas una al lado de la otra', 'El tiempo entre dos órdenes', 'El espacio entre dos columnas distintas', 'La distancia entre el primero y el último', 'A', NULL, 'final', 12),
(63, '¿Quién es el cierra-fila?', 'El primero de la columna', 'El capitán del club', 'El que da la voz de mando', 'El integrante ubicado detrás de la última fila para vigilar el orden', 'D', NULL, 'final', 12),
(64, '¿Cuál es la cadencia aproximada del paso ordinario?', '60 a 80 pasos por minuto', '110 a 120 pasos por minuto', '165 a 180 pasos por minuto', '200 pasos por minuto', 'B', NULL, 'final', 12),
(65, '¿Qué voz de mando determina el instante exacto en que todos ejecutan el movimiento?', 'La voz de advertencia', 'La voz preventiva', 'La voz ejecutiva', 'La voz de descanso', 'C', NULL, 'final', 12),
(66, '¿Cuál es la cadencia aproximada del paso veloz (trote)?', '165 a 180 pasos por minuto', '110 a 120 pasos por minuto', '70 a 75 pasos por minuto', '50 pasos por minuto', 'A', NULL, 'final', 12),
(67, '¿Quién es el hombre base?', 'El último de la columna', 'La persona por la cual toda la unidad regula su alineación, distancia y paso', 'El consejero del club', 'El abanderado', 'B', NULL, 'final', 12),
(68, '¿Cómo se ejecuta el comando \"Descanso\"?', 'Se sientan todos en el suelo', 'Se cruzan los brazos al frente', 'Se retrocede un paso', 'Se separa el pie izquierdo unos 30 cm y las manos van detrás de la espalda', 'D', NULL, 'final', 12),
(69, '¿Dónde debe ocupar su lugar la Bandera Nacional respecto a otras banderas?', 'A la derecha de cualquier otra bandera', 'A la izquierda de las demás', 'En el último lugar', 'Siempre más baja que las demás', 'A', NULL, 'final', 12),
(70, 'En una columna, ¿qué es la testa?', 'El último elemento de la columna', 'El espacio entre dos filas', 'El elemento que ocupa el extremo delantero de la columna', 'La persona que da las órdenes', 'C', NULL, 'final', 12),
(71, '¿Cuáles son los tres materiales que se usan para encender un fuego?', 'Papel, gasolina y fósforos', 'Hojas, pasto y carbón', 'Piedras, tierra y agua', 'Yesca, varas y combustible', 'D', NULL, 'final', 13),
(72, '¿Cuál es la ventaja del fogón altar de cocinar?', 'Se enciende sin leña', 'La persona no necesita encorvarse para cocinar', 'No produce humo', 'Se construye bajo tierra', 'B', NULL, 'final', 13),
(73, '¿Para qué se usa el fogón reflector?', 'Para dirigir el calor en una sola dirección', 'Para apagar el fuego rápidamente', 'Para producir más humo', 'Para iluminar a distancia', 'A', NULL, 'final', 13),
(74, '¿Cómo es el fogón polinesio o cazador?', 'Se hace dentro de un hoyo profundo', 'Se arma en forma de estrella con ramas secas', 'Se usan dos troncos verdes sobre los cuales se colocan las ollas', 'Se construye con piedras y lodo', 'C', NULL, 'final', 13),
(75, '¿Qué tres elementos necesita toda fogata?', 'Humo, ceniza y leña', 'Agua, viento y tierra', 'Piedras, leña y papel', 'Oxígeno, calor y combustible', 'D', NULL, 'final', 13),
(76, 'Según el texto, ¿cuándo se considera que una fogata está realmente apagada?', 'Cuando ya no se ve humo', 'Cuando se pueden pasar las manos sobre los carbones sin quemarse', 'Cuando termina la comida', 'Cuando se cubre con hojas', 'B', NULL, 'final', 13),
(77, '¿Qué característica tiene la madera dura al usarla en una fogata?', 'Arde lentamente y deja brasas duraderas', 'Se quema muy rápido', 'No produce brasas', 'Solo sirve para encender el fuego', 'A', NULL, 'final', 13),
(78, '¿Por qué se debe evitar usar granito al calentar piedras para hervir agua?', 'Porque mancha el agua', 'Porque es muy pesado', 'Porque puede explotar al calentarse', 'Porque no retiene calor', 'C', NULL, 'final', 13),
(79, '¿Cómo se debe apagar una sartén con grasa o aceite que ha cogido fuego?', 'Echándole agua', 'Sofocándola con una manta o un paño húmedo', 'Soplando fuertemente', 'Moviéndola con rapidez', 'B', NULL, 'final', 13),
(80, '¿Cómo se pueden proteger los alimentos del ataque de animales en el campamento?', 'Dejándolos sobre la mesa', 'Guardándolos dentro de la carpa', 'Enterrándolos sin envolver', 'Colgándolos de la rama de un árbol con una polea', 'D', NULL, 'final', 13);

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
(12, NULL, 10, 10, 100, '2026-11-18 21:52:22', 6, 'final', 302, 'Diego Fernando Salas Rodriguez', 2, '[{\"p\":\"¿Qué tipo de ropa es recomendable para dormir en un clima frío?\",\"a\":\"Ropa seca y abrigada, preferiblemente en capas\",\"b\":\"Ropa mojada del día\",\"c\":\"A\",\"d\":\"Ninguna ropa especial\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué tipo de terreno es el mejor para acampar?\",\"a\":\"Una zona baja donde se acumula el agua\",\"b\":\"Junto al cauce de un río\",\"c\":\"C\",\"d\":\"Debajo de un árbol seco\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cuál es una regla básica al encender una fogata?\",\"a\":\"Hacerla junto a la carpa\",\"b\":\"Hacerla bajo ramas bajas\",\"c\":\"D\",\"d\":\"Hacerla en un área despejada, con piedras alrededor y agua cerca\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer al apagar una fogata?\",\"a\":\"Taparla con hojas secas\",\"b\":\"Apagarla con agua y comprobar que esté completamente fría\",\"c\":\"B\",\"d\":\"Echarle tierra y marcharse\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer antes de armar una carpa?\",\"a\":\"Armarla sobre cualquier superficie\",\"b\":\"Revisar el terreno y retirar piedras y ramas\",\"c\":\"B\",\"d\":\"Colocar la comida dentro\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué principio resume el cuidado de la naturaleza al acampar?\",\"a\":\"Dejar el lugar mejor de como se encontró\",\"b\":\"Llevarse recuerdos de plantas y animales\",\"c\":\"A\",\"d\":\"Cortar ramas verdes para la leña\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Para qué sirve el piso impermeable que se coloca bajo la carpa?\",\"a\":\"Proteger de la humedad del suelo\",\"b\":\"Decorar el campamento\",\"c\":\"A\",\"d\":\"Evitar que entre la luz\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué nudo sirve para formar un lazo fijo que no se desliza?\",\"a\":\"Nudo simple\",\"b\":\"Nudo de zapato\",\"c\":\"C\",\"d\":\"Nudo corredizo\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer con la basura durante un campamento?\",\"a\":\"Dejarla en el lugar\",\"b\":\"Quemar plásticos en la fogata\",\"c\":\"D\",\"d\":\"Recogerla y depositarla en un lugar apropiado\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Cómo se deben guardar los alimentos en un campamento?\",\"a\":\"Abiertos sobre la mesa\",\"b\":\"En recipientes cerrados y lejos de las carpas\",\"c\":\"B\",\"d\":\"En el suelo, sin cubrir\",\"m\":\"B\",\"e\":\"\"}]'),
(13, NULL, 7, 10, 70, '2026-11-18 22:02:46', 6, 'final', 194, 'Thiago Alonso Vasquez Moreyra', 2, '[{\"p\":\"¿Cuál es una regla básica al encender una fogata?\",\"a\":\"Hacerla junto a la carpa\",\"b\":\"Hacerla bajo ramas bajas\",\"c\":\"D\",\"d\":\"Hacerla en un área despejada, con piedras alrededor y agua cerca\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer con la basura durante un campamento?\",\"a\":\"Dejarla en el lugar\",\"b\":\"Quemar plásticos en la fogata\",\"c\":\"D\",\"d\":\"Recogerla y depositarla en un lugar apropiado\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué nudo sirve para formar un lazo fijo que no se desliza?\",\"a\":\"Nudo simple\",\"b\":\"Nudo de zapato\",\"c\":\"C\",\"d\":\"Nudo corredizo\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué tipo de ropa es recomendable para dormir en un clima frío?\",\"a\":\"Ropa seca y abrigada, preferiblemente en capas\",\"b\":\"Ropa mojada del día\",\"c\":\"A\",\"d\":\"Ninguna ropa especial\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer al apagar una fogata?\",\"a\":\"Taparla con hojas secas\",\"b\":\"Apagarla con agua y comprobar que esté completamente fría\",\"c\":\"B\",\"d\":\"Echarle tierra y marcharse\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer antes de armar una carpa?\",\"a\":\"Armarla sobre cualquier superficie\",\"b\":\"Revisar el terreno y retirar piedras y ramas\",\"c\":\"B\",\"d\":\"Colocar la comida dentro\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué tipo de terreno es el mejor para acampar?\",\"a\":\"Una zona baja donde se acumula el agua\",\"b\":\"Junto al cauce de un río\",\"c\":\"C\",\"d\":\"Debajo de un árbol seco\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué principio resume el cuidado de la naturaleza al acampar?\",\"a\":\"Dejar el lugar mejor de como se encontró\",\"b\":\"Llevarse recuerdos de plantas y animales\",\"c\":\"A\",\"d\":\"Cortar ramas verdes para la leña\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Para qué sirve el piso impermeable que se coloca bajo la carpa?\",\"a\":\"Proteger de la humedad del suelo\",\"b\":\"Decorar el campamento\",\"c\":\"A\",\"d\":\"Evitar que entre la luz\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cómo se deben guardar los alimentos en un campamento?\",\"a\":\"Abiertos sobre la mesa\",\"b\":\"En recipientes cerrados y lejos de las carpas\",\"c\":\"B\",\"d\":\"En el suelo, sin cubrir\",\"m\":\"B\",\"e\":\"\"}]'),
(14, NULL, 5, 10, 50, '2026-11-18 22:10:13', 6, 'final', 236, 'Liam Mathias Artemio Luyo Moreira', 2, '[{\"p\":\"¿Cómo se deben guardar los alimentos en un campamento?\",\"a\":\"Abiertos sobre la mesa\",\"b\":\"En recipientes cerrados y lejos de las carpas\",\"c\":\"B\",\"d\":\"En el suelo, sin cubrir\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Para qué sirve el piso impermeable que se coloca bajo la carpa?\",\"a\":\"Proteger de la humedad del suelo\",\"b\":\"Decorar el campamento\",\"c\":\"A\",\"d\":\"Evitar que entre la luz\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué nudo sirve para formar un lazo fijo que no se desliza?\",\"a\":\"Nudo simple\",\"b\":\"Nudo de zapato\",\"c\":\"C\",\"d\":\"Nudo corredizo\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer al apagar una fogata?\",\"a\":\"Taparla con hojas secas\",\"b\":\"Apagarla con agua y comprobar que esté completamente fría\",\"c\":\"B\",\"d\":\"Echarle tierra y marcharse\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué tipo de terreno es el mejor para acampar?\",\"a\":\"Una zona baja donde se acumula el agua\",\"b\":\"Junto al cauce de un río\",\"c\":\"C\",\"d\":\"Debajo de un árbol seco\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuál es una regla básica al encender una fogata?\",\"a\":\"Hacerla junto a la carpa\",\"b\":\"Hacerla bajo ramas bajas\",\"c\":\"D\",\"d\":\"Hacerla en un área despejada, con piedras alrededor y agua cerca\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer antes de armar una carpa?\",\"a\":\"Armarla sobre cualquier superficie\",\"b\":\"Revisar el terreno y retirar piedras y ramas\",\"c\":\"B\",\"d\":\"Colocar la comida dentro\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué tipo de ropa es recomendable para dormir en un clima frío?\",\"a\":\"Ropa seca y abrigada, preferiblemente en capas\",\"b\":\"Ropa mojada del día\",\"c\":\"A\",\"d\":\"Ninguna ropa especial\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer con la basura durante un campamento?\",\"a\":\"Dejarla en el lugar\",\"b\":\"Quemar plásticos en la fogata\",\"c\":\"D\",\"d\":\"Recogerla y depositarla en un lugar apropiado\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué principio resume el cuidado de la naturaleza al acampar?\",\"a\":\"Dejar el lugar mejor de como se encontró\",\"b\":\"Llevarse recuerdos de plantas y animales\",\"c\":\"A\",\"d\":\"Cortar ramas verdes para la leña\",\"m\":\"A\",\"e\":\"\"}]'),
(15, NULL, 7, 10, 70, '2026-11-18 22:14:27', 6, 'final', 203, 'Liam Mathias Artemio Luyo Moreira', 2, '[{\"p\":\"¿Qué tipo de terreno es el mejor para acampar?\",\"a\":\"Una zona baja donde se acumula el agua\",\"b\":\"Junto al cauce de un río\",\"c\":\"C\",\"d\":\"Debajo de un árbol seco\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cuál es una regla básica al encender una fogata?\",\"a\":\"Hacerla junto a la carpa\",\"b\":\"Hacerla bajo ramas bajas\",\"c\":\"D\",\"d\":\"Hacerla en un área despejada, con piedras alrededor y agua cerca\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer antes de armar una carpa?\",\"a\":\"Armarla sobre cualquier superficie\",\"b\":\"Revisar el terreno y retirar piedras y ramas\",\"c\":\"B\",\"d\":\"Colocar la comida dentro\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué tipo de ropa es recomendable para dormir en un clima frío?\",\"a\":\"Ropa seca y abrigada, preferiblemente en capas\",\"b\":\"Ropa mojada del día\",\"c\":\"A\",\"d\":\"Ninguna ropa especial\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer al apagar una fogata?\",\"a\":\"Taparla con hojas secas\",\"b\":\"Apagarla con agua y comprobar que esté completamente fría\",\"c\":\"B\",\"d\":\"Echarle tierra y marcharse\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cómo se deben guardar los alimentos en un campamento?\",\"a\":\"Abiertos sobre la mesa\",\"b\":\"En recipientes cerrados y lejos de las carpas\",\"c\":\"B\",\"d\":\"En el suelo, sin cubrir\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer con la basura durante un campamento?\",\"a\":\"Dejarla en el lugar\",\"b\":\"Quemar plásticos en la fogata\",\"c\":\"D\",\"d\":\"Recogerla y depositarla en un lugar apropiado\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué principio resume el cuidado de la naturaleza al acampar?\",\"a\":\"Dejar el lugar mejor de como se encontró\",\"b\":\"Llevarse recuerdos de plantas y animales\",\"c\":\"A\",\"d\":\"Cortar ramas verdes para la leña\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Para qué sirve el piso impermeable que se coloca bajo la carpa?\",\"a\":\"Proteger de la humedad del suelo\",\"b\":\"Decorar el campamento\",\"c\":\"A\",\"d\":\"Evitar que entre la luz\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué nudo sirve para formar un lazo fijo que no se desliza?\",\"a\":\"Nudo simple\",\"b\":\"Nudo de zapato\",\"c\":\"C\",\"d\":\"Nudo corredizo\",\"m\":\"C\",\"e\":\"\"}]'),
(16, NULL, 9, 10, 90, '2026-11-18 22:24:40', 8, 'final', 479, 'Thiago Alonso Vasquez Moreyra', 4, '[{\"p\":\"¿Quién compartió el mensaje del sábado con un grupo de creyentes en Washington, New Hampshire?\",\"a\":\"Raquel Oakes (Preston)\",\"b\":\"Elena G. de White\",\"c\":\"A\",\"d\":\"María Miller\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cómo se conoce el evento del 22 de octubre de 1844?\",\"a\":\"La Gran Reforma\",\"b\":\"El Gran Avivamiento\",\"c\":\"C\",\"d\":\"La Gran Comisión\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Quién fue la cofundadora de la Iglesia Adventista que recibió el don de profecía?\",\"a\":\"Elena G. de White\",\"b\":\"Ana Johnson\",\"c\":\"A\",\"d\":\"Dorcas Smith\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Quién fue el primer presidente de la Asociación General?\",\"a\":\"Jaime White\",\"b\":\"Juan Byington\",\"c\":\"B\",\"d\":\"Juan Andrews\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿En qué año se organizó oficialmente la Iglesia Adventista del Séptimo Día?\",\"a\":\"1844\",\"b\":\"1888\",\"c\":\"D\",\"d\":\"1863\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿En qué ciudad se organizó oficialmente la Iglesia Adventista?\",\"a\":\"Battle Creek, Michigan\",\"b\":\"Nueva York\",\"c\":\"A\",\"d\":\"Los Ángeles\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién fue el esposo de Elena G. de White y pionero de la iglesia?\",\"a\":\"José Bates\",\"b\":\"Hiram Edson\",\"c\":\"C\",\"d\":\"Joshua Himes\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Quién predicó el pronto regreso de Cristo para el año 1844?\",\"a\":\"José Bates\",\"b\":\"Guillermo Miller\",\"c\":\"B\",\"d\":\"Jaime White\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Quién fue el primer misionero oficial de la iglesia enviado fuera de Estados Unidos?\",\"a\":\"Guillermo Miller\",\"b\":\"Juan Nevins Andrews\",\"c\":\"B\",\"d\":\"Hiram Edson\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué aporte destacado hizo el capitán José Bates?\",\"a\":\"Tradujo la Biblia\",\"b\":\"Fundó una universidad\",\"c\":\"D\",\"d\":\"Promovió la observancia del sábado entre los primeros adventistas\",\"m\":\"D\",\"e\":\"\"}]'),
(17, NULL, 8, 10, 80, '2026-11-18 22:31:17', 8, 'final', 333, 'Liam Mathias Artemio Luyo Moreira', 4, '[{\"p\":\"¿Cómo se conoce el evento del 22 de octubre de 1844?\",\"a\":\"La Gran Reforma\",\"b\":\"El Gran Avivamiento\",\"c\":\"C\",\"d\":\"La Gran Comisión\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Quién fue el esposo de Elena G. de White y pionero de la iglesia?\",\"a\":\"José Bates\",\"b\":\"Hiram Edson\",\"c\":\"C\",\"d\":\"Joshua Himes\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿En qué año se organizó oficialmente la Iglesia Adventista del Séptimo Día?\",\"a\":\"1844\",\"b\":\"1888\",\"c\":\"D\",\"d\":\"1863\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Quién compartió el mensaje del sábado con un grupo de creyentes en Washington, New Hampshire?\",\"a\":\"Raquel Oakes (Preston)\",\"b\":\"Elena G. de White\",\"c\":\"A\",\"d\":\"María Miller\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué aporte destacado hizo el capitán José Bates?\",\"a\":\"Tradujo la Biblia\",\"b\":\"Fundó una universidad\",\"c\":\"D\",\"d\":\"Promovió la observancia del sábado entre los primeros adventistas\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Quién fue la cofundadora de la Iglesia Adventista que recibió el don de profecía?\",\"a\":\"Elena G. de White\",\"b\":\"Ana Johnson\",\"c\":\"A\",\"d\":\"Dorcas Smith\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién predicó el pronto regreso de Cristo para el año 1844?\",\"a\":\"José Bates\",\"b\":\"Guillermo Miller\",\"c\":\"B\",\"d\":\"Jaime White\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿En qué ciudad se organizó oficialmente la Iglesia Adventista?\",\"a\":\"Battle Creek, Michigan\",\"b\":\"Nueva York\",\"c\":\"A\",\"d\":\"Los Ángeles\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién fue el primer misionero oficial de la iglesia enviado fuera de Estados Unidos?\",\"a\":\"Guillermo Miller\",\"b\":\"Juan Nevins Andrews\",\"c\":\"B\",\"d\":\"Hiram Edson\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Quién fue el primer presidente de la Asociación General?\",\"a\":\"Jaime White\",\"b\":\"Juan Byington\",\"c\":\"B\",\"d\":\"Juan Andrews\",\"m\":\"B\",\"e\":\"\"}]'),
(18, NULL, 8, 10, 80, '2026-11-18 22:40:32', 8, 'final', 365, 'Diego Fernando Salas Rodríguez', 4, '[{\"p\":\"¿En qué ciudad se organizó oficialmente la Iglesia Adventista?\",\"a\":\"Battle Creek, Michigan\",\"b\":\"Nueva York\",\"c\":\"A\",\"d\":\"Los Ángeles\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Quién compartió el mensaje del sábado con un grupo de creyentes en Washington, New Hampshire?\",\"a\":\"Raquel Oakes (Preston)\",\"b\":\"Elena G. de White\",\"c\":\"A\",\"d\":\"María Miller\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué aporte destacado hizo el capitán José Bates?\",\"a\":\"Tradujo la Biblia\",\"b\":\"Fundó una universidad\",\"c\":\"D\",\"d\":\"Promovió la observancia del sábado entre los primeros adventistas\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién fue el primer presidente de la Asociación General?\",\"a\":\"Jaime White\",\"b\":\"Juan Byington\",\"c\":\"B\",\"d\":\"Juan Andrews\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿En qué año se organizó oficialmente la Iglesia Adventista del Séptimo Día?\",\"a\":\"1844\",\"b\":\"1888\",\"c\":\"D\",\"d\":\"1863\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Quién fue el primer misionero oficial de la iglesia enviado fuera de Estados Unidos?\",\"a\":\"Guillermo Miller\",\"b\":\"Juan Nevins Andrews\",\"c\":\"B\",\"d\":\"Hiram Edson\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Quién fue el esposo de Elena G. de White y pionero de la iglesia?\",\"a\":\"José Bates\",\"b\":\"Hiram Edson\",\"c\":\"C\",\"d\":\"Joshua Himes\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Quién fue la cofundadora de la Iglesia Adventista que recibió el don de profecía?\",\"a\":\"Elena G. de White\",\"b\":\"Ana Johnson\",\"c\":\"A\",\"d\":\"Dorcas Smith\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cómo se conoce el evento del 22 de octubre de 1844?\",\"a\":\"La Gran Reforma\",\"b\":\"El Gran Avivamiento\",\"c\":\"C\",\"d\":\"La Gran Comisión\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Quién predicó el pronto regreso de Cristo para el año 1844?\",\"a\":\"José Bates\",\"b\":\"Guillermo Miller\",\"c\":\"B\",\"d\":\"Jaime White\",\"m\":\"B\",\"e\":\"\"}]'),
(19, NULL, 9, 10, 90, '2026-11-18 22:54:49', 8, 'final', 330, 'Luciana Valeska Martinez Moreyra', 4, '[{\"p\":\"¿Quién predicó el pronto regreso de Cristo para el año 1844?\",\"a\":\"José Bates\",\"b\":\"Guillermo Miller\",\"c\":\"B\",\"d\":\"Jaime White\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Quién fue el primer presidente de la Asociación General?\",\"a\":\"Jaime White\",\"b\":\"Juan Byington\",\"c\":\"B\",\"d\":\"Juan Andrews\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿En qué año se organizó oficialmente la Iglesia Adventista del Séptimo Día?\",\"a\":\"1844\",\"b\":\"1888\",\"c\":\"D\",\"d\":\"1863\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué aporte destacado hizo el capitán José Bates?\",\"a\":\"Tradujo la Biblia\",\"b\":\"Fundó una universidad\",\"c\":\"D\",\"d\":\"Promovió la observancia del sábado entre los primeros adventistas\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién fue la cofundadora de la Iglesia Adventista que recibió el don de profecía?\",\"a\":\"Elena G. de White\",\"b\":\"Ana Johnson\",\"c\":\"A\",\"d\":\"Dorcas Smith\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién fue el primer misionero oficial de la iglesia enviado fuera de Estados Unidos?\",\"a\":\"Guillermo Miller\",\"b\":\"Juan Nevins Andrews\",\"c\":\"B\",\"d\":\"Hiram Edson\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Quién compartió el mensaje del sábado con un grupo de creyentes en Washington, New Hampshire?\",\"a\":\"Raquel Oakes (Preston)\",\"b\":\"Elena G. de White\",\"c\":\"A\",\"d\":\"María Miller\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cómo se conoce el evento del 22 de octubre de 1844?\",\"a\":\"La Gran Reforma\",\"b\":\"El Gran Avivamiento\",\"c\":\"C\",\"d\":\"La Gran Comisión\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Quién fue el esposo de Elena G. de White y pionero de la iglesia?\",\"a\":\"José Bates\",\"b\":\"Hiram Edson\",\"c\":\"C\",\"d\":\"Joshua Himes\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿En qué ciudad se organizó oficialmente la Iglesia Adventista?\",\"a\":\"Battle Creek, Michigan\",\"b\":\"Nueva York\",\"c\":\"A\",\"d\":\"Los Ángeles\",\"m\":\"A\",\"e\":\"\"}]');
INSERT INTO `resultados` (`id`, `id_usuario`, `puntaje`, `total`, `porcentaje`, `fecha`, `id_cuestionario`, `capitulo`, `tiempo_seg`, `nombre_participante`, `id_enlace`, `detalle`) VALUES
(20, NULL, 9, 10, 90, '2026-11-18 23:05:17', 9, 'final', 367, 'Luciana Valeska Martinez Moreyra', 5, '[{\"p\":\"¿Qué calzado es el más recomendable para una caminata larga?\",\"a\":\"Zapatos nuevos sin usar\",\"b\":\"Sandalias de playa\",\"c\":\"C\",\"d\":\"Zapatos de vestir\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer antes de salir a una caminata?\",\"a\":\"Informar la ruta y la hora estimada de regreso\",\"b\":\"Salir sin avisar\",\"c\":\"A\",\"d\":\"Caminar solo y sin planificar\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué es esencial llevar siempre en una caminata?\",\"a\":\"Aparatos electrónicos de entretenimiento\",\"b\":\"Ropa de más sin necesidad\",\"c\":\"D\",\"d\":\"Agua suficiente y alimentos energéticos\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué debes hacer si te pierdes durante una caminata?\",\"a\":\"Correr en cualquier dirección\",\"b\":\"Mantener la calma, detenerte y quedarte en un lugar visible\",\"c\":\"B\",\"d\":\"Seguir caminando sin rumbo\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuál es el mejor ritmo de marcha en una caminata larga?\",\"a\":\"Ritmo constante con descansos periódicos\",\"b\":\"Correr al inicio y detenerse\",\"c\":\"A\",\"d\":\"Lo más rápido posible\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué tipo de medias ayuda a prevenir ampollas?\",\"a\":\"Medias mojadas\",\"b\":\"Medias que absorban la humedad y sin arrugas\",\"c\":\"B\",\"d\":\"No usar medias\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué se debe hacer al sentir el primer signo de una ampolla?\",\"a\":\"Seguir caminando sin atenderla\",\"b\":\"Quitarse la bota y correr\",\"c\":\"C\",\"d\":\"Reventarla con una aguja sucia\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cómo es recomendable vestirse para una caminata?\",\"a\":\"Con una sola prenda gruesa\",\"b\":\"Con ropa de algodón mojada\",\"c\":\"D\",\"d\":\"Por capas, para poder agregar o quitar según el clima\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Cuánto debería pesar como máximo la mochila en relación con el peso corporal?\",\"a\":\"Alrededor del 50 %\",\"b\":\"Alrededor del 40 %\",\"c\":\"C\",\"d\":\"No importa el peso\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Dónde se deben colocar los objetos más pesados en la mochila?\",\"a\":\"En el fondo, lejos de la espalda\",\"b\":\"Cerca de la espalda y en la parte media\",\"c\":\"B\",\"d\":\"Siempre en los bolsillos laterales\",\"m\":\"B\",\"e\":\"\"}]'),
(21, NULL, 9, 10, 90, '2026-11-19 20:31:14', 7, 'final', 535, 'Jhon Sneider Herrera Muñoz', 3, '[{\"p\":\"En la mesa, ¿cuándo se comienza a comer?\",\"a\":\"Cuando llega la comida a tu plato, sin esperar\",\"b\":\"Antes de que todos se sienten\",\"c\":\"C\",\"d\":\"Cuando el primero termine\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cómo se debe tratar a las personas mayores?\",\"a\":\"Con respeto, cediéndoles el asiento y ayudándolas\",\"b\":\"Con indiferencia\",\"c\":\"A\",\"d\":\"Sin prestarles atención\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cuál es la actitud correcta al recibir un regalo?\",\"a\":\"Criticarlo\",\"b\":\"Devolverlo de inmediato\",\"c\":\"D\",\"d\":\"Agradecer con sinceridad\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué actitud demuestra cortesía al conversar con otra persona?\",\"a\":\"Interrumpirla para dar tu opinión\",\"b\":\"Escucharla con atención sin interrumpir\",\"c\":\"B\",\"d\":\"Hablar más fuerte que ella\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuál de estas es una expresión de cortesía?\",\"a\":\"Dame eso\",\"b\":\"Por favor y gracias\",\"c\":\"B\",\"d\":\"No me interesa\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué cita bíblica nos anima a ser bondadosos y compasivos unos con otros?\",\"a\":\"Efesios 4:32\",\"b\":\"Éxodo 20:3\",\"c\":\"A\",\"d\":\"Hechos 1:8\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué debe hacer un cristiano cuando le presentan a una persona?\",\"a\":\"Ignorarla\",\"b\":\"Saludarla con amabilidad y mirarla a los ojos\",\"c\":\"B\",\"d\":\"Saludarla sin dejar de hacer otra cosa\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué actitud es apropiada dentro del templo durante el culto?\",\"a\":\"Conversar en voz alta\",\"b\":\"Caminar libremente durante el programa\",\"c\":\"C\",\"d\":\"Usar el celular para juegos\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿En qué texto bíblico se encuentra la regla de oro?\",\"a\":\"Juan 3:16\",\"b\":\"Salmo 23:1\",\"c\":\"C\",\"d\":\"Génesis 1:1\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué debes hacer si llegas tarde a una reunión o culto?\",\"a\":\"Entrar haciendo ruido\",\"b\":\"Entrar discretamente y sin interrumpir\",\"c\":\"B\",\"d\":\"Quejarte de la hora\",\"m\":\"B\",\"e\":\"\"}]'),
(22, NULL, 8, 10, 80, '2026-11-19 20:55:46', 7, 'final', 1378, 'Rosangela Valentina Huancayo Niño', 3, '[{\"p\":\"¿Qué actitud es apropiada dentro del templo durante el culto?\",\"a\":\"Conversar en voz alta\",\"b\":\"Caminar libremente durante el programa\",\"c\":\"C\",\"d\":\"Usar el celular para juegos\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué actitud demuestra cortesía al conversar con otra persona?\",\"a\":\"Interrumpirla para dar tu opinión\",\"b\":\"Escucharla con atención sin interrumpir\",\"c\":\"B\",\"d\":\"Hablar más fuerte que ella\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"En la mesa, ¿cuándo se comienza a comer?\",\"a\":\"Cuando llega la comida a tu plato, sin esperar\",\"b\":\"Antes de que todos se sienten\",\"c\":\"C\",\"d\":\"Cuando el primero termine\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cómo se debe tratar a las personas mayores?\",\"a\":\"Con respeto, cediéndoles el asiento y ayudándolas\",\"b\":\"Con indiferencia\",\"c\":\"A\",\"d\":\"Sin prestarles atención\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué cita bíblica nos anima a ser bondadosos y compasivos unos con otros?\",\"a\":\"Efesios 4:32\",\"b\":\"Éxodo 20:3\",\"c\":\"A\",\"d\":\"Hechos 1:8\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuál es la actitud correcta al recibir un regalo?\",\"a\":\"Criticarlo\",\"b\":\"Devolverlo de inmediato\",\"c\":\"D\",\"d\":\"Agradecer con sinceridad\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿En qué texto bíblico se encuentra la regla de oro?\",\"a\":\"Juan 3:16\",\"b\":\"Salmo 23:1\",\"c\":\"C\",\"d\":\"Génesis 1:1\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cuál de estas es una expresión de cortesía?\",\"a\":\"Dame eso\",\"b\":\"Por favor y gracias\",\"c\":\"B\",\"d\":\"No me interesa\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué debe hacer un cristiano cuando le presentan a una persona?\",\"a\":\"Ignorarla\",\"b\":\"Saludarla con amabilidad y mirarla a los ojos\",\"c\":\"B\",\"d\":\"Saludarla sin dejar de hacer otra cosa\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué debes hacer si llegas tarde a una reunión o culto?\",\"a\":\"Entrar haciendo ruido\",\"b\":\"Entrar discretamente y sin interrumpir\",\"c\":\"B\",\"d\":\"Quejarte de la hora\",\"m\":\"B\",\"e\":\"\"}]'),
(23, NULL, 9, 10, 90, '2026-11-19 21:17:36', 11, 'final', 395, 'Lesli Tatiana Valdivia Bustamante', 7, '[{\"p\":\"¿Qué enseña Mateo 22:21: \\\"Dad a César lo que es de César y a Dios lo que es de Dios\\\"?\",\"a\":\"Que los cristianos no deben pagar impuestos\",\"b\":\"Que solo importan los asuntos espirituales\",\"c\":\"C\",\"d\":\"Que el Estado está por encima de Dios\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué significa la palabra aramea \\\"Maranata\\\"?\",\"a\":\"Dios es amor\",\"b\":\"Gloria a Dios\",\"c\":\"D\",\"d\":\"¡El Señor viene!\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"Según la Constitución del Perú, ¿cuáles son los tres poderes del Estado?\",\"a\":\"Ejecutivo, Legislativo y Judicial\",\"b\":\"Presidente, Alcalde y Gobernador\",\"c\":\"A\",\"d\":\"Municipal, Regional y Nacional\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién creó la bandera del Perú en Pisco en 1820?\",\"a\":\"Simón Bolívar\",\"b\":\"Miguel Grau\",\"c\":\"D\",\"d\":\"José de San Martín\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Quién compuso la música del Himno Nacional del Perú?\",\"a\":\"José de San Martín\",\"b\":\"Simón Bolívar\",\"c\":\"D\",\"d\":\"José Bernardo Alcedo\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué principio se aplica cuando las leyes humanas contradicen la ley de Dios (Hechos 5:29)?\",\"a\":\"Obedecer a los hombres antes que a Dios\",\"b\":\"Es necesario obedecer a Dios antes que a los hombres\",\"c\":\"B\",\"d\":\"Responder con violencia\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuál es el lema de los Conquistadores?\",\"a\":\"El amor de Cristo me motiva\",\"b\":\"Salvar del pecado y guiar en el servicio\",\"c\":\"A\",\"d\":\"El mensaje del advenimiento a todo el mundo\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué nave comandó Miguel Grau durante la Guerra del Pacífico?\",\"a\":\"La corbeta Esmeralda\",\"b\":\"El crucero Angamos\",\"c\":\"C\",\"d\":\"La fragata Unión\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"En la bandera del Perú, ¿qué representa el color rojo?\",\"a\":\"La sangre derramada por los héroes de la independencia\",\"b\":\"La paz\",\"c\":\"A\",\"d\":\"La nobleza\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"Según Filipenses 3:20, además de ciudadanos de nuestro país, ¿de qué somos ciudadanos los cristianos?\",\"a\":\"De la tierra\",\"b\":\"Del cielo\",\"c\":\"B\",\"d\":\"De la iglesia\",\"m\":\"B\",\"e\":\"\"}]'),
(24, NULL, 9, 10, 90, '2026-11-19 21:23:38', 11, 'final', 315, 'José Caled Celis Garcia', 7, '[{\"p\":\"¿Cuál es el lema de los Conquistadores?\",\"a\":\"El amor de Cristo me motiva\",\"b\":\"Salvar del pecado y guiar en el servicio\",\"c\":\"A\",\"d\":\"El mensaje del advenimiento a todo el mundo\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué principio se aplica cuando las leyes humanas contradicen la ley de Dios (Hechos 5:29)?\",\"a\":\"Obedecer a los hombres antes que a Dios\",\"b\":\"Es necesario obedecer a Dios antes que a los hombres\",\"c\":\"B\",\"d\":\"Responder con violencia\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"En la bandera del Perú, ¿qué representa el color rojo?\",\"a\":\"La sangre derramada por los héroes de la independencia\",\"b\":\"La paz\",\"c\":\"A\",\"d\":\"La nobleza\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"Según Filipenses 3:20, además de ciudadanos de nuestro país, ¿de qué somos ciudadanos los cristianos?\",\"a\":\"De la tierra\",\"b\":\"Del cielo\",\"c\":\"B\",\"d\":\"De la iglesia\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué enseña Mateo 22:21: \\\"Dad a César lo que es de César y a Dios lo que es de Dios\\\"?\",\"a\":\"Que los cristianos no deben pagar impuestos\",\"b\":\"Que solo importan los asuntos espirituales\",\"c\":\"C\",\"d\":\"Que el Estado está por encima de Dios\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"Según la Constitución del Perú, ¿cuáles son los tres poderes del Estado?\",\"a\":\"Ejecutivo, Legislativo y Judicial\",\"b\":\"Presidente, Alcalde y Gobernador\",\"c\":\"A\",\"d\":\"Municipal, Regional y Nacional\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué significa la palabra aramea \\\"Maranata\\\"?\",\"a\":\"Dios es amor\",\"b\":\"Gloria a Dios\",\"c\":\"D\",\"d\":\"¡El Señor viene!\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Quién compuso la música del Himno Nacional del Perú?\",\"a\":\"José de San Martín\",\"b\":\"Simón Bolívar\",\"c\":\"D\",\"d\":\"José Bernardo Alcedo\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué nave comandó Miguel Grau durante la Guerra del Pacífico?\",\"a\":\"La corbeta Esmeralda\",\"b\":\"El crucero Angamos\",\"c\":\"C\",\"d\":\"La fragata Unión\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Quién creó la bandera del Perú en Pisco en 1820?\",\"a\":\"Simón Bolívar\",\"b\":\"Miguel Grau\",\"c\":\"D\",\"d\":\"José de San Martín\",\"m\":\"D\",\"e\":\"\"}]'),
(25, NULL, 8, 10, 80, '2026-11-19 21:35:37', 11, 'final', 573, 'Fabiana Valentina Farfan Chavez', 7, '[{\"p\":\"Según la Constitución del Perú, ¿cuáles son los tres poderes del Estado?\",\"a\":\"Ejecutivo, Legislativo y Judicial\",\"b\":\"Presidente, Alcalde y Gobernador\",\"c\":\"A\",\"d\":\"Municipal, Regional y Nacional\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"Según Filipenses 3:20, además de ciudadanos de nuestro país, ¿de qué somos ciudadanos los cristianos?\",\"a\":\"De la tierra\",\"b\":\"Del cielo\",\"c\":\"B\",\"d\":\"De la iglesia\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"En la bandera del Perú, ¿qué representa el color rojo?\",\"a\":\"La sangre derramada por los héroes de la independencia\",\"b\":\"La paz\",\"c\":\"A\",\"d\":\"La nobleza\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién creó la bandera del Perú en Pisco en 1820?\",\"a\":\"Simón Bolívar\",\"b\":\"Miguel Grau\",\"c\":\"D\",\"d\":\"José de San Martín\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué principio se aplica cuando las leyes humanas contradicen la ley de Dios (Hechos 5:29)?\",\"a\":\"Obedecer a los hombres antes que a Dios\",\"b\":\"Es necesario obedecer a Dios antes que a los hombres\",\"c\":\"B\",\"d\":\"Responder con violencia\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué significa la palabra aramea \\\"Maranata\\\"?\",\"a\":\"Dios es amor\",\"b\":\"Gloria a Dios\",\"c\":\"D\",\"d\":\"¡El Señor viene!\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué enseña Mateo 22:21: \\\"Dad a César lo que es de César y a Dios lo que es de Dios\\\"?\",\"a\":\"Que los cristianos no deben pagar impuestos\",\"b\":\"Que solo importan los asuntos espirituales\",\"c\":\"C\",\"d\":\"Que el Estado está por encima de Dios\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Quién compuso la música del Himno Nacional del Perú?\",\"a\":\"José de San Martín\",\"b\":\"Simón Bolívar\",\"c\":\"D\",\"d\":\"José Bernardo Alcedo\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué nave comandó Miguel Grau durante la Guerra del Pacífico?\",\"a\":\"La corbeta Esmeralda\",\"b\":\"El crucero Angamos\",\"c\":\"C\",\"d\":\"La fragata Unión\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cuál es el lema de los Conquistadores?\",\"a\":\"El amor de Cristo me motiva\",\"b\":\"Salvar del pecado y guiar en el servicio\",\"c\":\"A\",\"d\":\"El mensaje del advenimiento a todo el mundo\",\"m\":\"A\",\"e\":\"\"}]'),
(26, NULL, 9, 10, 90, '2026-11-19 21:42:36', 11, 'final', 309, 'Andrea Barbara Vasquez Moreyra', 7, '[{\"p\":\"¿Qué principio se aplica cuando las leyes humanas contradicen la ley de Dios (Hechos 5:29)?\",\"a\":\"Obedecer a los hombres antes que a Dios\",\"b\":\"Es necesario obedecer a Dios antes que a los hombres\",\"c\":\"B\",\"d\":\"Responder con violencia\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué enseña Mateo 22:21: \\\"Dad a César lo que es de César y a Dios lo que es de Dios\\\"?\",\"a\":\"Que los cristianos no deben pagar impuestos\",\"b\":\"Que solo importan los asuntos espirituales\",\"c\":\"C\",\"d\":\"Que el Estado está por encima de Dios\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuál es el lema de los Conquistadores?\",\"a\":\"El amor de Cristo me motiva\",\"b\":\"Salvar del pecado y guiar en el servicio\",\"c\":\"A\",\"d\":\"El mensaje del advenimiento a todo el mundo\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién compuso la música del Himno Nacional del Perú?\",\"a\":\"José de San Martín\",\"b\":\"Simón Bolívar\",\"c\":\"D\",\"d\":\"José Bernardo Alcedo\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"En la bandera del Perú, ¿qué representa el color rojo?\",\"a\":\"La sangre derramada por los héroes de la independencia\",\"b\":\"La paz\",\"c\":\"A\",\"d\":\"La nobleza\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué nave comandó Miguel Grau durante la Guerra del Pacífico?\",\"a\":\"La corbeta Esmeralda\",\"b\":\"El crucero Angamos\",\"c\":\"C\",\"d\":\"La fragata Unión\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Quién creó la bandera del Perú en Pisco en 1820?\",\"a\":\"Simón Bolívar\",\"b\":\"Miguel Grau\",\"c\":\"D\",\"d\":\"José de San Martín\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"Según la Constitución del Perú, ¿cuáles son los tres poderes del Estado?\",\"a\":\"Ejecutivo, Legislativo y Judicial\",\"b\":\"Presidente, Alcalde y Gobernador\",\"c\":\"A\",\"d\":\"Municipal, Regional y Nacional\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"Según Filipenses 3:20, además de ciudadanos de nuestro país, ¿de qué somos ciudadanos los cristianos?\",\"a\":\"De la tierra\",\"b\":\"Del cielo\",\"c\":\"B\",\"d\":\"De la iglesia\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué significa la palabra aramea \\\"Maranata\\\"?\",\"a\":\"Dios es amor\",\"b\":\"Gloria a Dios\",\"c\":\"D\",\"d\":\"¡El Señor viene!\",\"m\":\"D\",\"e\":\"\"}]'),
(27, NULL, 9, 10, 90, '2026-11-19 22:07:45', 12, 'final', 312, 'Andrea Barbara Vasquez Moreyra', 8, '[{\"p\":\"En orden cerrado, ¿qué es el intervalo?\",\"a\":\"El espacio lateral entre dos personas colocadas una al lado de la otra\",\"b\":\"El tiempo entre dos órdenes\",\"c\":\"A\",\"d\":\"La distancia entre el primero y el último\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Dónde debe ocupar su lugar la Bandera Nacional respecto a otras banderas?\",\"a\":\"A la derecha de cualquier otra bandera\",\"b\":\"A la izquierda de las demás\",\"c\":\"A\",\"d\":\"Siempre más baja que las demás\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién es el cierra-fila?\",\"a\":\"El primero de la columna\",\"b\":\"El capitán del club\",\"c\":\"D\",\"d\":\"El integrante ubicado detrás de la última fila para vigilar el orden\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Cómo se ejecuta el comando \\\"Descanso\\\"?\",\"a\":\"Se sientan todos en el suelo\",\"b\":\"Se cruzan los brazos al frente\",\"c\":\"D\",\"d\":\"Se separa el pie izquierdo unos 30 cm y las manos van detrás de la espalda\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué voz de mando determina el instante exacto en que todos ejecutan el movimiento?\",\"a\":\"La voz de advertencia\",\"b\":\"La voz preventiva\",\"c\":\"C\",\"d\":\"La voz de descanso\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Quién es el hombre base?\",\"a\":\"El último de la columna\",\"b\":\"La persona por la cual toda la unidad regula su alineación, distancia y paso\",\"c\":\"B\",\"d\":\"El abanderado\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuál es la cadencia aproximada del paso ordinario?\",\"a\":\"60 a 80 pasos por minuto\",\"b\":\"110 a 120 pasos por minuto\",\"c\":\"B\",\"d\":\"200 pasos por minuto\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"En orden cerrado, ¿qué es la distancia?\",\"a\":\"El espacio lateral entre dos personas\",\"b\":\"La longitud de un paso\",\"c\":\"C\",\"d\":\"El ancho de una formación\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cuál es la cadencia aproximada del paso veloz (trote)?\",\"a\":\"165 a 180 pasos por minuto\",\"b\":\"110 a 120 pasos por minuto\",\"c\":\"A\",\"d\":\"50 pasos por minuto\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"En una columna, ¿qué es la testa?\",\"a\":\"El último elemento de la columna\",\"b\":\"El espacio entre dos filas\",\"c\":\"C\",\"d\":\"La persona que da las órdenes\",\"m\":\"B\",\"e\":\"\"}]');
INSERT INTO `resultados` (`id`, `id_usuario`, `puntaje`, `total`, `porcentaje`, `fecha`, `id_cuestionario`, `capitulo`, `tiempo_seg`, `nombre_participante`, `id_enlace`, `detalle`) VALUES
(28, NULL, 9, 10, 90, '2026-11-19 22:14:43', 12, 'final', 360, 'Lesli Tatiana Valdivia Bustamante', 8, '[{\"p\":\"¿Cómo se ejecuta el comando \\\"Descanso\\\"?\",\"a\":\"Se sientan todos en el suelo\",\"b\":\"Se cruzan los brazos al frente\",\"c\":\"D\",\"d\":\"Se separa el pie izquierdo unos 30 cm y las manos van detrás de la espalda\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Cuál es la cadencia aproximada del paso veloz (trote)?\",\"a\":\"165 a 180 pasos por minuto\",\"b\":\"110 a 120 pasos por minuto\",\"c\":\"A\",\"d\":\"50 pasos por minuto\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién es el hombre base?\",\"a\":\"El último de la columna\",\"b\":\"La persona por la cual toda la unidad regula su alineación, distancia y paso\",\"c\":\"B\",\"d\":\"El abanderado\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuál es la cadencia aproximada del paso ordinario?\",\"a\":\"60 a 80 pasos por minuto\",\"b\":\"110 a 120 pasos por minuto\",\"c\":\"B\",\"d\":\"200 pasos por minuto\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"En orden cerrado, ¿qué es la distancia?\",\"a\":\"El espacio lateral entre dos personas\",\"b\":\"La longitud de un paso\",\"c\":\"C\",\"d\":\"El ancho de una formación\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Dónde debe ocupar su lugar la Bandera Nacional respecto a otras banderas?\",\"a\":\"A la derecha de cualquier otra bandera\",\"b\":\"A la izquierda de las demás\",\"c\":\"A\",\"d\":\"Siempre más baja que las demás\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién es el cierra-fila?\",\"a\":\"El primero de la columna\",\"b\":\"El capitán del club\",\"c\":\"D\",\"d\":\"El integrante ubicado detrás de la última fila para vigilar el orden\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué voz de mando determina el instante exacto en que todos ejecutan el movimiento?\",\"a\":\"La voz de advertencia\",\"b\":\"La voz preventiva\",\"c\":\"C\",\"d\":\"La voz de descanso\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"En orden cerrado, ¿qué es el intervalo?\",\"a\":\"El espacio lateral entre dos personas colocadas una al lado de la otra\",\"b\":\"El tiempo entre dos órdenes\",\"c\":\"A\",\"d\":\"La distancia entre el primero y el último\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"En una columna, ¿qué es la testa?\",\"a\":\"El último elemento de la columna\",\"b\":\"El espacio entre dos filas\",\"c\":\"C\",\"d\":\"La persona que da las órdenes\",\"m\":\"C\",\"e\":\"\"}]'),
(29, NULL, 8, 10, 80, '2026-11-19 22:25:01', 12, 'final', 587, 'José Caled Celis Garcia', 8, '[{\"p\":\"En orden cerrado, ¿qué es el intervalo?\",\"a\":\"El espacio lateral entre dos personas colocadas una al lado de la otra\",\"b\":\"El tiempo entre dos órdenes\",\"c\":\"A\",\"d\":\"La distancia entre el primero y el último\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cuál es la cadencia aproximada del paso veloz (trote)?\",\"a\":\"165 a 180 pasos por minuto\",\"b\":\"110 a 120 pasos por minuto\",\"c\":\"A\",\"d\":\"50 pasos por minuto\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Dónde debe ocupar su lugar la Bandera Nacional respecto a otras banderas?\",\"a\":\"A la derecha de cualquier otra bandera\",\"b\":\"A la izquierda de las demás\",\"c\":\"A\",\"d\":\"Siempre más baja que las demás\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién es el cierra-fila?\",\"a\":\"El primero de la columna\",\"b\":\"El capitán del club\",\"c\":\"D\",\"d\":\"El integrante ubicado detrás de la última fila para vigilar el orden\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"En orden cerrado, ¿qué es la distancia?\",\"a\":\"El espacio lateral entre dos personas\",\"b\":\"La longitud de un paso\",\"c\":\"C\",\"d\":\"El ancho de una formación\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"En una columna, ¿qué es la testa?\",\"a\":\"El último elemento de la columna\",\"b\":\"El espacio entre dos filas\",\"c\":\"C\",\"d\":\"La persona que da las órdenes\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cómo se ejecuta el comando \\\"Descanso\\\"?\",\"a\":\"Se sientan todos en el suelo\",\"b\":\"Se cruzan los brazos al frente\",\"c\":\"D\",\"d\":\"Se separa el pie izquierdo unos 30 cm y las manos van detrás de la espalda\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Quién es el hombre base?\",\"a\":\"El último de la columna\",\"b\":\"La persona por la cual toda la unidad regula su alineación, distancia y paso\",\"c\":\"B\",\"d\":\"El abanderado\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuál es la cadencia aproximada del paso ordinario?\",\"a\":\"60 a 80 pasos por minuto\",\"b\":\"110 a 120 pasos por minuto\",\"c\":\"B\",\"d\":\"200 pasos por minuto\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué voz de mando determina el instante exacto en que todos ejecutan el movimiento?\",\"a\":\"La voz de advertencia\",\"b\":\"La voz preventiva\",\"c\":\"C\",\"d\":\"La voz de descanso\",\"m\":\"C\",\"e\":\"\"}]'),
(30, NULL, 9, 10, 90, '2026-11-19 22:30:25', 12, 'final', 302, 'Fabiana Valentina Farfan Chavez', 8, '[{\"p\":\"¿Cuál es la cadencia aproximada del paso veloz (trote)?\",\"a\":\"165 a 180 pasos por minuto\",\"b\":\"110 a 120 pasos por minuto\",\"c\":\"A\",\"d\":\"50 pasos por minuto\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Quién es el hombre base?\",\"a\":\"El último de la columna\",\"b\":\"La persona por la cual toda la unidad regula su alineación, distancia y paso\",\"c\":\"B\",\"d\":\"El abanderado\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Quién es el cierra-fila?\",\"a\":\"El primero de la columna\",\"b\":\"El capitán del club\",\"c\":\"D\",\"d\":\"El integrante ubicado detrás de la última fila para vigilar el orden\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"En orden cerrado, ¿qué es la distancia?\",\"a\":\"El espacio lateral entre dos personas\",\"b\":\"La longitud de un paso\",\"c\":\"C\",\"d\":\"El ancho de una formación\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cómo se ejecuta el comando \\\"Descanso\\\"?\",\"a\":\"Se sientan todos en el suelo\",\"b\":\"Se cruzan los brazos al frente\",\"c\":\"D\",\"d\":\"Se separa el pie izquierdo unos 30 cm y las manos van detrás de la espalda\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cuál es la cadencia aproximada del paso ordinario?\",\"a\":\"60 a 80 pasos por minuto\",\"b\":\"110 a 120 pasos por minuto\",\"c\":\"B\",\"d\":\"200 pasos por minuto\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"En una columna, ¿qué es la testa?\",\"a\":\"El último elemento de la columna\",\"b\":\"El espacio entre dos filas\",\"c\":\"C\",\"d\":\"La persona que da las órdenes\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Dónde debe ocupar su lugar la Bandera Nacional respecto a otras banderas?\",\"a\":\"A la derecha de cualquier otra bandera\",\"b\":\"A la izquierda de las demás\",\"c\":\"A\",\"d\":\"Siempre más baja que las demás\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué voz de mando determina el instante exacto en que todos ejecutan el movimiento?\",\"a\":\"La voz de advertencia\",\"b\":\"La voz preventiva\",\"c\":\"C\",\"d\":\"La voz de descanso\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"En orden cerrado, ¿qué es el intervalo?\",\"a\":\"El espacio lateral entre dos personas colocadas una al lado de la otra\",\"b\":\"El tiempo entre dos órdenes\",\"c\":\"A\",\"d\":\"La distancia entre el primero y el último\",\"m\":\"A\",\"e\":\"\"}]'),
(31, NULL, 9, 10, 90, '2026-11-19 22:37:30', 13, 'final', 324, 'Lesli Tatiana Valdivia Bustamante', 9, '[{\"p\":\"¿Cuáles son los tres materiales que se usan para encender un fuego?\",\"a\":\"Papel, gasolina y fósforos\",\"b\":\"Hojas, pasto y carbón\",\"c\":\"D\",\"d\":\"Yesca, varas y combustible\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué tres elementos necesita toda fogata?\",\"a\":\"Humo, ceniza y leña\",\"b\":\"Agua, viento y tierra\",\"c\":\"D\",\"d\":\"Oxígeno, calor y combustible\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"Según el texto, ¿cuándo se considera que una fogata está realmente apagada?\",\"a\":\"Cuando ya no se ve humo\",\"b\":\"Cuando se pueden pasar las manos sobre los carbones sin quemarse\",\"c\":\"B\",\"d\":\"Cuando se cubre con hojas\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué característica tiene la madera dura al usarla en una fogata?\",\"a\":\"Arde lentamente y deja brasas duraderas\",\"b\":\"Se quema muy rápido\",\"c\":\"A\",\"d\":\"Solo sirve para encender el fuego\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Para qué se usa el fogón reflector?\",\"a\":\"Para dirigir el calor en una sola dirección\",\"b\":\"Para apagar el fuego rápidamente\",\"c\":\"A\",\"d\":\"Para iluminar a distancia\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cómo es el fogón polinesio o cazador?\",\"a\":\"Se hace dentro de un hoyo profundo\",\"b\":\"Se arma en forma de estrella con ramas secas\",\"c\":\"C\",\"d\":\"Se construye con piedras y lodo\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Por qué se debe evitar usar granito al calentar piedras para hervir agua?\",\"a\":\"Porque mancha el agua\",\"b\":\"Porque es muy pesado\",\"c\":\"C\",\"d\":\"Porque no retiene calor\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cómo se pueden proteger los alimentos del ataque de animales en el campamento?\",\"a\":\"Dejándolos sobre la mesa\",\"b\":\"Guardándolos dentro de la carpa\",\"c\":\"D\",\"d\":\"Colgándolos de la rama de un árbol con una polea\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Cuál es la ventaja del fogón altar de cocinar?\",\"a\":\"Se enciende sin leña\",\"b\":\"La persona no necesita encorvarse para cocinar\",\"c\":\"B\",\"d\":\"Se construye bajo tierra\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cómo se debe apagar una sartén con grasa o aceite que ha cogido fuego?\",\"a\":\"Echándole agua\",\"b\":\"Sofocándola con una manta o un paño húmedo\",\"c\":\"B\",\"d\":\"Moviéndola con rapidez\",\"m\":\"B\",\"e\":\"\"}]'),
(32, NULL, 9, 10, 90, '2026-11-19 22:41:50', 13, 'final', 237, 'Andrea Barbara Vasquez Moreyra', 9, '[{\"p\":\"¿Por qué se debe evitar usar granito al calentar piedras para hervir agua?\",\"a\":\"Porque mancha el agua\",\"b\":\"Porque es muy pesado\",\"c\":\"C\",\"d\":\"Porque no retiene calor\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"Según el texto, ¿cuándo se considera que una fogata está realmente apagada?\",\"a\":\"Cuando ya no se ve humo\",\"b\":\"Cuando se pueden pasar las manos sobre los carbones sin quemarse\",\"c\":\"B\",\"d\":\"Cuando se cubre con hojas\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué tres elementos necesita toda fogata?\",\"a\":\"Humo, ceniza y leña\",\"b\":\"Agua, viento y tierra\",\"c\":\"D\",\"d\":\"Oxígeno, calor y combustible\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué característica tiene la madera dura al usarla en una fogata?\",\"a\":\"Arde lentamente y deja brasas duraderas\",\"b\":\"Se quema muy rápido\",\"c\":\"A\",\"d\":\"Solo sirve para encender el fuego\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cómo se debe apagar una sartén con grasa o aceite que ha cogido fuego?\",\"a\":\"Echándole agua\",\"b\":\"Sofocándola con una manta o un paño húmedo\",\"c\":\"B\",\"d\":\"Moviéndola con rapidez\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Para qué se usa el fogón reflector?\",\"a\":\"Para dirigir el calor en una sola dirección\",\"b\":\"Para apagar el fuego rápidamente\",\"c\":\"A\",\"d\":\"Para iluminar a distancia\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cuál es la ventaja del fogón altar de cocinar?\",\"a\":\"Se enciende sin leña\",\"b\":\"La persona no necesita encorvarse para cocinar\",\"c\":\"B\",\"d\":\"Se construye bajo tierra\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuáles son los tres materiales que se usan para encender un fuego?\",\"a\":\"Papel, gasolina y fósforos\",\"b\":\"Hojas, pasto y carbón\",\"c\":\"D\",\"d\":\"Yesca, varas y combustible\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Cómo se pueden proteger los alimentos del ataque de animales en el campamento?\",\"a\":\"Dejándolos sobre la mesa\",\"b\":\"Guardándolos dentro de la carpa\",\"c\":\"D\",\"d\":\"Colgándolos de la rama de un árbol con una polea\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Cómo es el fogón polinesio o cazador?\",\"a\":\"Se hace dentro de un hoyo profundo\",\"b\":\"Se arma en forma de estrella con ramas secas\",\"c\":\"C\",\"d\":\"Se construye con piedras y lodo\",\"m\":\"C\",\"e\":\"\"}]'),
(33, NULL, 9, 10, 90, '2026-11-19 22:45:53', 13, 'final', 196, 'José Caled Celis Garcia', 9, '[{\"p\":\"¿Cuáles son los tres materiales que se usan para encender un fuego?\",\"a\":\"Papel, gasolina y fósforos\",\"b\":\"Hojas, pasto y carbón\",\"c\":\"D\",\"d\":\"Yesca, varas y combustible\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Por qué se debe evitar usar granito al calentar piedras para hervir agua?\",\"a\":\"Porque mancha el agua\",\"b\":\"Porque es muy pesado\",\"c\":\"C\",\"d\":\"Porque no retiene calor\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué característica tiene la madera dura al usarla en una fogata?\",\"a\":\"Arde lentamente y deja brasas duraderas\",\"b\":\"Se quema muy rápido\",\"c\":\"A\",\"d\":\"Solo sirve para encender el fuego\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cuál es la ventaja del fogón altar de cocinar?\",\"a\":\"Se enciende sin leña\",\"b\":\"La persona no necesita encorvarse para cocinar\",\"c\":\"B\",\"d\":\"Se construye bajo tierra\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cómo se debe apagar una sartén con grasa o aceite que ha cogido fuego?\",\"a\":\"Echándole agua\",\"b\":\"Sofocándola con una manta o un paño húmedo\",\"c\":\"B\",\"d\":\"Moviéndola con rapidez\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué tres elementos necesita toda fogata?\",\"a\":\"Humo, ceniza y leña\",\"b\":\"Agua, viento y tierra\",\"c\":\"D\",\"d\":\"Oxígeno, calor y combustible\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Para qué se usa el fogón reflector?\",\"a\":\"Para dirigir el calor en una sola dirección\",\"b\":\"Para apagar el fuego rápidamente\",\"c\":\"A\",\"d\":\"Para iluminar a distancia\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"Según el texto, ¿cuándo se considera que una fogata está realmente apagada?\",\"a\":\"Cuando ya no se ve humo\",\"b\":\"Cuando se pueden pasar las manos sobre los carbones sin quemarse\",\"c\":\"B\",\"d\":\"Cuando se cubre con hojas\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cómo es el fogón polinesio o cazador?\",\"a\":\"Se hace dentro de un hoyo profundo\",\"b\":\"Se arma en forma de estrella con ramas secas\",\"c\":\"C\",\"d\":\"Se construye con piedras y lodo\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cómo se pueden proteger los alimentos del ataque de animales en el campamento?\",\"a\":\"Dejándolos sobre la mesa\",\"b\":\"Guardándolos dentro de la carpa\",\"c\":\"D\",\"d\":\"Colgándolos de la rama de un árbol con una polea\",\"m\":\"A\",\"e\":\"\"}]'),
(34, NULL, 10, 10, 100, '2026-11-19 22:51:00', 13, 'final', 279, 'Fabiana Valentina Farfan Chavez', 9, '[{\"p\":\"¿Cuáles son los tres materiales que se usan para encender un fuego?\",\"a\":\"Papel, gasolina y fósforos\",\"b\":\"Hojas, pasto y carbón\",\"c\":\"D\",\"d\":\"Yesca, varas y combustible\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué tres elementos necesita toda fogata?\",\"a\":\"Humo, ceniza y leña\",\"b\":\"Agua, viento y tierra\",\"c\":\"D\",\"d\":\"Oxígeno, calor y combustible\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Cuál es la ventaja del fogón altar de cocinar?\",\"a\":\"Se enciende sin leña\",\"b\":\"La persona no necesita encorvarse para cocinar\",\"c\":\"B\",\"d\":\"Se construye bajo tierra\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cómo se pueden proteger los alimentos del ataque de animales en el campamento?\",\"a\":\"Dejándolos sobre la mesa\",\"b\":\"Guardándolos dentro de la carpa\",\"c\":\"D\",\"d\":\"Colgándolos de la rama de un árbol con una polea\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"Según el texto, ¿cuándo se considera que una fogata está realmente apagada?\",\"a\":\"Cuando ya no se ve humo\",\"b\":\"Cuando se pueden pasar las manos sobre los carbones sin quemarse\",\"c\":\"B\",\"d\":\"Cuando se cubre con hojas\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cómo es el fogón polinesio o cazador?\",\"a\":\"Se hace dentro de un hoyo profundo\",\"b\":\"Se arma en forma de estrella con ramas secas\",\"c\":\"C\",\"d\":\"Se construye con piedras y lodo\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Para qué se usa el fogón reflector?\",\"a\":\"Para dirigir el calor en una sola dirección\",\"b\":\"Para apagar el fuego rápidamente\",\"c\":\"A\",\"d\":\"Para iluminar a distancia\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cómo se debe apagar una sartén con grasa o aceite que ha cogido fuego?\",\"a\":\"Echándole agua\",\"b\":\"Sofocándola con una manta o un paño húmedo\",\"c\":\"B\",\"d\":\"Moviéndola con rapidez\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Por qué se debe evitar usar granito al calentar piedras para hervir agua?\",\"a\":\"Porque mancha el agua\",\"b\":\"Porque es muy pesado\",\"c\":\"C\",\"d\":\"Porque no retiene calor\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué característica tiene la madera dura al usarla en una fogata?\",\"a\":\"Arde lentamente y deja brasas duraderas\",\"b\":\"Se quema muy rápido\",\"c\":\"A\",\"d\":\"Solo sirve para encender el fuego\",\"m\":\"A\",\"e\":\"\"}]'),
(35, NULL, 0, 10, 0, '2026-11-19 22:53:38', 13, 'final', 44, 'Andrea Barbara Vasquez Moreyra', 9, '[{\"p\":\"¿Cómo es el fogón polinesio o cazador?\",\"a\":\"Se hace dentro de un hoyo profundo\",\"b\":\"Se arma en forma de estrella con ramas secas\",\"c\":\"C\",\"d\":\"Se construye con piedras y lodo\",\"m\":\"\",\"e\":\"\"},{\"p\":\"¿Cómo se pueden proteger los alimentos del ataque de animales en el campamento?\",\"a\":\"Dejándolos sobre la mesa\",\"b\":\"Guardándolos dentro de la carpa\",\"c\":\"D\",\"d\":\"Colgándolos de la rama de un árbol con una polea\",\"m\":\"\",\"e\":\"\"},{\"p\":\"¿Para qué se usa el fogón reflector?\",\"a\":\"Para dirigir el calor en una sola dirección\",\"b\":\"Para apagar el fuego rápidamente\",\"c\":\"A\",\"d\":\"Para iluminar a distancia\",\"m\":\"\",\"e\":\"\"},{\"p\":\"¿Cuáles son los tres materiales que se usan para encender un fuego?\",\"a\":\"Papel, gasolina y fósforos\",\"b\":\"Hojas, pasto y carbón\",\"c\":\"D\",\"d\":\"Yesca, varas y combustible\",\"m\":\"\",\"e\":\"\"},{\"p\":\"¿Cómo se debe apagar una sartén con grasa o aceite que ha cogido fuego?\",\"a\":\"Echándole agua\",\"b\":\"Sofocándola con una manta o un paño húmedo\",\"c\":\"B\",\"d\":\"Moviéndola con rapidez\",\"m\":\"\",\"e\":\"\"},{\"p\":\"Según el texto, ¿cuándo se considera que una fogata está realmente apagada?\",\"a\":\"Cuando ya no se ve humo\",\"b\":\"Cuando se pueden pasar las manos sobre los carbones sin quemarse\",\"c\":\"B\",\"d\":\"Cuando se cubre con hojas\",\"m\":\"\",\"e\":\"\"},{\"p\":\"¿Qué tres elementos necesita toda fogata?\",\"a\":\"Humo, ceniza y leña\",\"b\":\"Agua, viento y tierra\",\"c\":\"D\",\"d\":\"Oxígeno, calor y combustible\",\"m\":\"\",\"e\":\"\"},{\"p\":\"¿Por qué se debe evitar usar granito al calentar piedras para hervir agua?\",\"a\":\"Porque mancha el agua\",\"b\":\"Porque es muy pesado\",\"c\":\"C\",\"d\":\"Porque no retiene calor\",\"m\":\"\",\"e\":\"\"},{\"p\":\"¿Cuál es la ventaja del fogón altar de cocinar?\",\"a\":\"Se enciende sin leña\",\"b\":\"La persona no necesita encorvarse para cocinar\",\"c\":\"B\",\"d\":\"Se construye bajo tierra\",\"m\":\"\",\"e\":\"\"},{\"p\":\"¿Qué característica tiene la madera dura al usarla en una fogata?\",\"a\":\"Arde lentamente y deja brasas duraderas\",\"b\":\"Se quema muy rápido\",\"c\":\"A\",\"d\":\"Solo sirve para encender el fuego\",\"m\":\"\",\"e\":\"\"}]');
INSERT INTO `resultados` (`id`, `id_usuario`, `puntaje`, `total`, `porcentaje`, `fecha`, `id_cuestionario`, `capitulo`, `tiempo_seg`, `nombre_participante`, `id_enlace`, `detalle`) VALUES
(36, NULL, 10, 10, 100, '2026-11-19 22:59:14', 10, 'final', 251, 'Fabiana Valentina Farfan Chavez', 6, '[{\"p\":\"¿Qué es la equidistancia entre curvas de nivel?\",\"a\":\"La distancia horizontal entre dos poblaciones\",\"b\":\"La diferencia constante de altitud entre dos curvas de nivel consecutivas\",\"c\":\"B\",\"d\":\"El ángulo de la declinación magnética\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"En un mapa con escala 1:50.000, ¿a cuántos metros reales equivale 1 cm del mapa?\",\"a\":\"50 m\",\"b\":\"5 km\",\"c\":\"D\",\"d\":\"500 m\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Cuál es el azimut inverso (contra-azimut) de 60°?\",\"a\":\"120°\",\"b\":\"300°\",\"c\":\"D\",\"d\":\"240°\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"Con la constelación Cruz del Sur, ¿cuántas veces se prolonga su brazo mayor para ubicar el Sur?\",\"a\":\"2 veces\",\"b\":\"3 veces\",\"c\":\"C\",\"d\":\"10 veces\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cómo se representa el relieve en un mapa topográfico?\",\"a\":\"Con curvas de nivel\",\"b\":\"Con flechas rojas\",\"c\":\"A\",\"d\":\"Con líneas de alta tensión\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué indican las curvas de nivel muy juntas entre sí?\",\"a\":\"Una pendiente suave\",\"b\":\"Un terreno plano\",\"c\":\"C\",\"d\":\"Un lago\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿De qué color se dibujan las curvas de nivel en un mapa topográfico?\",\"a\":\"Azul\",\"b\":\"Verde\",\"c\":\"C\",\"d\":\"Negro\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cuál es la brújula más popular entre los excursionistas?\",\"a\":\"La brújula de reloj\",\"b\":\"La brújula cartográfica de base transparente\",\"c\":\"B\",\"d\":\"La brújula de cocina\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿En qué huso UTM se encuentra Lima Metropolitana?\",\"a\":\"Huso 17\",\"b\":\"Huso 18\",\"c\":\"B\",\"d\":\"Huso 20\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"Si la declinación magnética es oeste, ¿qué se hace para pasar de un azimut geográfico a uno magnético?\",\"a\":\"Se suma la declinación\",\"b\":\"Se resta la declinación\",\"c\":\"A\",\"d\":\"No se modifica el azimut\",\"m\":\"A\",\"e\":\"\"}]'),
(37, NULL, 10, 10, 100, '2026-11-19 23:05:21', 10, 'final', 332, 'José Caled Celis Garcia', 6, '[{\"p\":\"¿Qué indican las curvas de nivel muy juntas entre sí?\",\"a\":\"Una pendiente suave\",\"b\":\"Un terreno plano\",\"c\":\"C\",\"d\":\"Un lago\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"Con la constelación Cruz del Sur, ¿cuántas veces se prolonga su brazo mayor para ubicar el Sur?\",\"a\":\"2 veces\",\"b\":\"3 veces\",\"c\":\"C\",\"d\":\"10 veces\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"Si la declinación magnética es oeste, ¿qué se hace para pasar de un azimut geográfico a uno magnético?\",\"a\":\"Se suma la declinación\",\"b\":\"Se resta la declinación\",\"c\":\"A\",\"d\":\"No se modifica el azimut\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Qué es la equidistancia entre curvas de nivel?\",\"a\":\"La distancia horizontal entre dos poblaciones\",\"b\":\"La diferencia constante de altitud entre dos curvas de nivel consecutivas\",\"c\":\"B\",\"d\":\"El ángulo de la declinación magnética\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"En un mapa con escala 1:50.000, ¿a cuántos metros reales equivale 1 cm del mapa?\",\"a\":\"50 m\",\"b\":\"5 km\",\"c\":\"D\",\"d\":\"500 m\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Cuál es el azimut inverso (contra-azimut) de 60°?\",\"a\":\"120°\",\"b\":\"300°\",\"c\":\"D\",\"d\":\"240°\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Cómo se representa el relieve en un mapa topográfico?\",\"a\":\"Con curvas de nivel\",\"b\":\"Con flechas rojas\",\"c\":\"A\",\"d\":\"Con líneas de alta tensión\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿De qué color se dibujan las curvas de nivel en un mapa topográfico?\",\"a\":\"Azul\",\"b\":\"Verde\",\"c\":\"C\",\"d\":\"Negro\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿En qué huso UTM se encuentra Lima Metropolitana?\",\"a\":\"Huso 17\",\"b\":\"Huso 18\",\"c\":\"B\",\"d\":\"Huso 20\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuál es la brújula más popular entre los excursionistas?\",\"a\":\"La brújula de reloj\",\"b\":\"La brújula cartográfica de base transparente\",\"c\":\"B\",\"d\":\"La brújula de cocina\",\"m\":\"B\",\"e\":\"\"}]'),
(38, NULL, 8, 10, 80, '2026-11-19 23:10:10', 10, 'final', 255, 'Lesli Tatiana Valdivia Bustamante', 6, '[{\"p\":\"¿Cuál es el azimut inverso (contra-azimut) de 60°?\",\"a\":\"120°\",\"b\":\"300°\",\"c\":\"D\",\"d\":\"240°\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Qué indican las curvas de nivel muy juntas entre sí?\",\"a\":\"Una pendiente suave\",\"b\":\"Un terreno plano\",\"c\":\"C\",\"d\":\"Un lago\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cómo se representa el relieve en un mapa topográfico?\",\"a\":\"Con curvas de nivel\",\"b\":\"Con flechas rojas\",\"c\":\"A\",\"d\":\"Con líneas de alta tensión\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"Con la constelación Cruz del Sur, ¿cuántas veces se prolonga su brazo mayor para ubicar el Sur?\",\"a\":\"2 veces\",\"b\":\"3 veces\",\"c\":\"C\",\"d\":\"10 veces\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué es la equidistancia entre curvas de nivel?\",\"a\":\"La distancia horizontal entre dos poblaciones\",\"b\":\"La diferencia constante de altitud entre dos curvas de nivel consecutivas\",\"c\":\"B\",\"d\":\"El ángulo de la declinación magnética\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿De qué color se dibujan las curvas de nivel en un mapa topográfico?\",\"a\":\"Azul\",\"b\":\"Verde\",\"c\":\"C\",\"d\":\"Negro\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cuál es la brújula más popular entre los excursionistas?\",\"a\":\"La brújula de reloj\",\"b\":\"La brújula cartográfica de base transparente\",\"c\":\"B\",\"d\":\"La brújula de cocina\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"Si la declinación magnética es oeste, ¿qué se hace para pasar de un azimut geográfico a uno magnético?\",\"a\":\"Se suma la declinación\",\"b\":\"Se resta la declinación\",\"c\":\"A\",\"d\":\"No se modifica el azimut\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿En qué huso UTM se encuentra Lima Metropolitana?\",\"a\":\"Huso 17\",\"b\":\"Huso 18\",\"c\":\"B\",\"d\":\"Huso 20\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"En un mapa con escala 1:50.000, ¿a cuántos metros reales equivale 1 cm del mapa?\",\"a\":\"50 m\",\"b\":\"5 km\",\"c\":\"D\",\"d\":\"500 m\",\"m\":\"D\",\"e\":\"\"}]'),
(39, NULL, 8, 10, 80, '2026-11-19 23:17:30', 10, 'final', 363, 'Andrea Barbara Vasquez Moreyra', 6, '[{\"p\":\"¿Qué indican las curvas de nivel muy juntas entre sí?\",\"a\":\"Una pendiente suave\",\"b\":\"Un terreno plano\",\"c\":\"C\",\"d\":\"Un lago\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cuál es la brújula más popular entre los excursionistas?\",\"a\":\"La brújula de reloj\",\"b\":\"La brújula cartográfica de base transparente\",\"c\":\"B\",\"d\":\"La brújula de cocina\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿Cómo se representa el relieve en un mapa topográfico?\",\"a\":\"Con curvas de nivel\",\"b\":\"Con flechas rojas\",\"c\":\"A\",\"d\":\"Con líneas de alta tensión\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"Con la constelación Cruz del Sur, ¿cuántas veces se prolonga su brazo mayor para ubicar el Sur?\",\"a\":\"2 veces\",\"b\":\"3 veces\",\"c\":\"C\",\"d\":\"10 veces\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿De qué color se dibujan las curvas de nivel en un mapa topográfico?\",\"a\":\"Azul\",\"b\":\"Verde\",\"c\":\"C\",\"d\":\"Negro\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué es la equidistancia entre curvas de nivel?\",\"a\":\"La distancia horizontal entre dos poblaciones\",\"b\":\"La diferencia constante de altitud entre dos curvas de nivel consecutivas\",\"c\":\"B\",\"d\":\"El ángulo de la declinación magnética\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuál es el azimut inverso (contra-azimut) de 60°?\",\"a\":\"120°\",\"b\":\"300°\",\"c\":\"D\",\"d\":\"240°\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿En qué huso UTM se encuentra Lima Metropolitana?\",\"a\":\"Huso 17\",\"b\":\"Huso 18\",\"c\":\"B\",\"d\":\"Huso 20\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"En un mapa con escala 1:50.000, ¿a cuántos metros reales equivale 1 cm del mapa?\",\"a\":\"50 m\",\"b\":\"5 km\",\"c\":\"D\",\"d\":\"500 m\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"Si la declinación magnética es oeste, ¿qué se hace para pasar de un azimut geográfico a uno magnético?\",\"a\":\"Se suma la declinación\",\"b\":\"Se resta la declinación\",\"c\":\"A\",\"d\":\"No se modifica el azimut\",\"m\":\"A\",\"e\":\"\"}]'),
(40, NULL, 10, 10, 100, '2026-11-20 04:25:31', 10, 'final', 196, 'Juanki', 6, '[{\"p\":\"¿En qué huso UTM se encuentra Lima Metropolitana?\",\"a\":\"Huso 17\",\"b\":\"Huso 18\",\"c\":\"B\",\"d\":\"Huso 20\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Qué es la equidistancia entre curvas de nivel?\",\"a\":\"La distancia horizontal entre dos poblaciones\",\"b\":\"La diferencia constante de altitud entre dos curvas de nivel consecutivas\",\"c\":\"B\",\"d\":\"El ángulo de la declinación magnética\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"Si la declinación magnética es oeste, ¿qué se hace para pasar de un azimut geográfico a uno magnético?\",\"a\":\"Se suma la declinación\",\"b\":\"Se resta la declinación\",\"c\":\"A\",\"d\":\"No se modifica el azimut\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"En un mapa con escala 1:50.000, ¿a cuántos metros reales equivale 1 cm del mapa?\",\"a\":\"50 m\",\"b\":\"5 km\",\"c\":\"D\",\"d\":\"500 m\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"Con la constelación Cruz del Sur, ¿cuántas veces se prolonga su brazo mayor para ubicar el Sur?\",\"a\":\"2 veces\",\"b\":\"3 veces\",\"c\":\"C\",\"d\":\"10 veces\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Cuál es la brújula más popular entre los excursionistas?\",\"a\":\"La brújula de reloj\",\"b\":\"La brújula cartográfica de base transparente\",\"c\":\"B\",\"d\":\"La brújula de cocina\",\"m\":\"B\",\"e\":\"\"},{\"p\":\"¿Cuál es el azimut inverso (contra-azimut) de 60°?\",\"a\":\"120°\",\"b\":\"300°\",\"c\":\"D\",\"d\":\"240°\",\"m\":\"D\",\"e\":\"\"},{\"p\":\"¿Cómo se representa el relieve en un mapa topográfico?\",\"a\":\"Con curvas de nivel\",\"b\":\"Con flechas rojas\",\"c\":\"A\",\"d\":\"Con líneas de alta tensión\",\"m\":\"A\",\"e\":\"\"},{\"p\":\"¿De qué color se dibujan las curvas de nivel en un mapa topográfico?\",\"a\":\"Azul\",\"b\":\"Verde\",\"c\":\"C\",\"d\":\"Negro\",\"m\":\"C\",\"e\":\"\"},{\"p\":\"¿Qué indican las curvas de nivel muy juntas entre sí?\",\"a\":\"Una pendiente suave\",\"b\":\"Un terreno plano\",\"c\":\"C\",\"d\":\"Un lago\",\"m\":\"C\",\"e\":\"\"}]');

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
-- Indices de la tabla `miembros`
--
ALTER TABLE `miembros`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `enlaces_examen`
--
ALTER TABLE `enlaces_examen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `ranking`
--
ALTER TABLE `ranking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
