-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2022 a las 02:28:06
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_web_tpe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album`
--

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `albumname` varchar(60) NOT NULL,
  `artist` varchar(60) NOT NULL,
  `genre` varchar(60) NOT NULL,
  `year` int(11) NOT NULL,
  `logo` varchar(50) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `album`
--

INSERT INTO `album` (`id`, `albumname`, `artist`, `genre`, `year`, `logo`) VALUES
(1, 'Alejado de la Red', 'La Renga', 'Rock', 2022, 'img/634dd68c05f4a.jpg'),
(2, 'Temporada de Reggaeton 2', 'Duki', 'Reggaeton', 2022, 'img/634de38639aa4.jpg'),
(3, 'Un Verano Sin Ti', 'Bad Bunny', 'Reggaeton', 2022, 'img/634ddffa9abcc.jpg'),
(19, 'OzuTochi', 'Ozuna', 'Reggaeton', 2022, 'img/634de37ad0fe1.jpg'),
(29, 'Music Of The Spheres', 'Coldplay', 'Pop', 2021, 'img/634de374f26bd.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `song`
--

CREATE TABLE `song` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `duration` varchar(5) NOT NULL,
  `id_album_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `song`
--

INSERT INTO `song` (`id`, `name`, `duration`, `id_album_fk`) VALUES
(1, 'Parece un Caso Perdido', '3:37', 1),
(2, 'Buena Pipa', '4:05', 1),
(3, 'Flecha en la Clave', '3:52', 1),
(4, 'Elefantes Poguenado', '3:27', 1),
(5, 'Llego la Hora', '4:04', 1),
(6, 'En Bicicleta', '4:04', 1),
(7, 'El Que Me Lleva', '2:50', 1),
(8, 'Para Que Yo Pueda Ver', '3:34', 1),
(9, 'Alejado de la Red', '3:47', 1),
(10, 'Amor Bipolar', '3:15', 2),
(11, 'Celosa', '2:37', 2),
(12, 'Perreo Bendito', '2:39', 2),
(13, 'Si Quieren Frontear', '3:20', 2),
(14, 'Esto Recien Empieza', '2:52', 2),
(15, 'Antes de Perderte', '2:56', 2),
(16, '\"La Vuelta\"', '0:40', 2),
(17, 'GIVENCHY', '3:02', 2),
(18, 'Moscow Mule', '4:05', 3),
(19, 'Despues de la Playa', '3:50', 3),
(20, 'Me Porto Bonito', '2:58', 3),
(21, 'Titi Me Pregunto', '4:03', 3),
(22, 'Un Ratito', '2:56', 3),
(23, 'Yo No Soy Celoso', '3:50', 3),
(24, 'Tarot', '3:57', 3),
(25, 'Neverita', '2:53', 3),
(28, 'Party', '3:47', 3),
(47, 'Kotodama', '3:08', 19),
(48, 'Mañana', '3:12', 19),
(49, 'Favorita', '3:28', 19),
(50, 'Mar Chiquita', '3:24', 19),
(51, 'Te Pienso', '2:27', 19),
(52, 'Dias y Meses', '3:12', 19),
(53, 'Un Lio', '3:15', 19),
(54, 'Perreo y Dembow', '2:42', 19),
(55, 'Hey Mor', '3:16', 19),
(56, 'Vida', '2:32', 19),
(57, '4:22', '3:13', 19),
(58, 'Te Marchaste', '4:00', 19),
(59, 'Un Reel', '3:23', 19),
(61, 'Somos Iguales', '2:52', 19),
(62, 'La Copa', '2:34', 19),
(63, 'El Cel', '4:47', 19),
(64, 'Cielos Rosado', '3:02', 19),
(68, '⦵', '0:53', 29),
(69, 'Higher Power', '3:26', 29),
(70, 'Humankind', '4:26', 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `rol` varchar(15) NOT NULL,
  `profilepicture` varchar(50) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`email`, `username`, `password`, `rol`, `profilepicture`) VALUES
('admin@admin.com', 'Admin', '$2y$10$I1Eqj/Nq.QT.8pS/E1jd7e8vhRqiuV15HE38JWYA2oeI2ybNZu6EO', 'Admin', 'img/634dd6ab997be.jpg'),
('user@user.com', 'User', '$2y$10$z1IjiOce9Nh0o.BaCOl9wuiSOHEss3oyikg2AAuVPXvhj/34IndKq', 'User', 'img/634dd6c55b5a0.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_album_fk` (`id_album_fk`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `song`
--
ALTER TABLE `song`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `song_ibfk_1` FOREIGN KEY (`id_album_fk`) REFERENCES `album` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
