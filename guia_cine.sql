-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 09-03-2020 a las 04:55:46
-- Versión del servidor: 5.5.43
-- Versión de PHP: 5.4.4-14+deb7u5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `guia_cine`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelicula` int(11) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `puntuacion` float(18,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL DEFAULT 'PENDIENTE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `id_pelicula`, `mensaje`, `puntuacion`, `id_usuario`, `estado`) VALUES
(2, 2, 'Muy entretenida, perfecta para niños en vacaciones', 5.00, 2, 'APROBADO'),
(3, 3, 'No la vi, pero me dijeron que es muy buena', 4.00, 2, 'APROBADO'),
(4, 0, 'Muy buena pelicula', 1.00, 1, 'PENDIENTE'),
(6, 1, 'Divertida', 4.00, 3, 'APROBADO'),
(9, 1, 'horrorosa', 2.00, 2, 'APROBADO'),
(10, 1, 'Preferiría correr en siberia descalzo que verla de vuelta', 2.00, 11, 'APROBADO'),
(11, 1, 'Muy graciosa', 5.00, 11, 'PENDIENTE'),
(12, 1, '"Graciosa"', 5.00, 11, 'PENDIENTE'),
(13, 1, 'Muy divertida y familiar', 5.00, 11, 'PENDIENTE'),
(14, 1, 'No muy buena', 5.00, 11, 'PENDIENTE'),
(15, 1, 'Divertida de a ratos', 3.00, 11, 'PENDIENTE'),
(16, 1, 'Entretenida', 3.00, 11, 'PENDIENTE'),
(17, 6, 'Me alegro de haberla visto', 4.00, 12, 'PENDIENTE'),
(18, 1, 'No recomendable', 2.00, 12, 'PENDIENTE'),
(19, 1, 'Preferiría haberme quedado en casa', 4.00, 12, 'APROBADO'),
(20, 1, 'Gran pelicula', 4.00, 12, 'PENDIENTE'),
(26, 2, 'Marquito comentario', 1.00, 23, 'APROBADO'),
(27, 2, 'Yo también doy comentarios', 2.00, 4, 'APROBADO'),
(28, 2, 'Altamente recomendable', 2.00, 9, 'APROBADO'),
(30, 8, 'Buena', 3.00, 24, 'APROBADO'),
(31, 8, 'Buenisima!', 5.00, 0, 'APROBADO'),
(32, 9, 'graciosa', 4.00, 24, 'APROBADO'),
(33, 6, 'No la volvería a ver', 2.00, 0, 'APROBADO'),
(34, 5, 'Buenos actores', 4.00, 0, 'APROBADO'),
(35, 6, 'Divertida!', 2.00, 25, 'APROBADO'),
(36, 5, 'Pelicula un poco aburrida', 2.00, 26, 'APROBADO'),
(37, 7, 'Repetitiva', 3.00, 27, 'APROBADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elencos`
--

CREATE TABLE IF NOT EXISTS `elencos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelicula` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `elencos`
--

INSERT INTO `elencos` (`id`, `id_pelicula`, `nombre`) VALUES
(1, 1, 'Arnold Schwarzenegger'),
(2, 1, 'Linda Hamilton'),
(3, 2, 'Kallan Holley'),
(4, 2, 'Carter Thorne'),
(6, 2, 'Berkley Silverman'),
(7, 3, 'Keanu Reeves');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE IF NOT EXISTS `generos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nombre`) VALUES
(1, 'Acción'),
(2, 'Aventuras'),
(3, 'Comedia'),
(4, 'Drama'),
(5, 'Musicales'),
(6, 'Terror'),
(7, 'Ciencia Ficción'),
(8, 'Suspenso'),
(9, 'Infantiles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE IF NOT EXISTS `peliculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `fecha_lanzamiento` date NOT NULL,
  `resumen` varchar(500) NOT NULL,
  `director` varchar(255) NOT NULL,
  `youtube_trailer` varchar(255) NOT NULL,
  `puntuacion` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `id_genero`, `fecha_lanzamiento`, `resumen`, `director`, `youtube_trailer`, `puntuacion`) VALUES
(1, 'Terminator: Dark Fate', 1, '2019-10-23', 'Un nuevo tipo de Terminator llega desde el futuro a la Ciudad de México para asesinar a una joven llamada Dani Ramos. Sin embargo, también viaja al presente desde el futuro Grace, un híbrido entre cyborg y humano que debe, con la ayuda de Sarah Connor, proteger a Ramos del aparentemente indestructible robot asesino.', 'Tim Miller', 'https://www.youtube.com/watch?v=oxy8udgWRmo', 3.33),
(2, 'Paw Patrol: Mighty Pups', 9, '2019-04-04', 'El alcalde Humdinger pone en marcha uno de sus planes más audaces: ser el primer Alcalde en pisar la luna. Con la ayuda de su sobrino Harold, construye un cohete en el que pretende llegar hasta el satélite de la tierra. Pero, como siempre, su plan va mal y el cohete termina saliendo sin él. En el camino, el cohete desvía la ruta de un meteoro, haciendo que éste se dirija hacia la tierra. Los cachorros de la Patrulla Canina unen sus fuerzas para evacuar las calles y proteger a los ciudadanos de B', 'Charles E. Bastien', 'https://www.youtube.com/watch?v=PSJCZpGxrm8', 2.67),
(3, 'The Matrix', 7, '1999-07-30', 'Un experto en computadoras descubre que su mundo es una simulación total creada con maliciosas intenciones por parte de la ciberinteligencia.', 'Lana Wachowski, Lilly Wachowski', '', 4.00),
(5, 'Sonic', 3, '2020-01-25', 'Sonic, la película (título original: Sonic the Hedgehog) es una película de aventuras fantásticas estadounidense-japonesa del año 2020 basada en la franquicia de videojuegos publicada por Sega. La película está dirigida por Jeff Fowler (en su debut como director) con un guion de Pat Casey y Josh Miller.', 'Jeff Fowler', 'https://www.youtube.com/watch?v=Xb3E8eWZ1mk', 3.00),
(6, 'Rapidos y furiosos 9', 1, '2020-05-22', 'Instalados en su vida familiar, Dom (Vin Diesel) y Letty (Michelle Rodriguez) viven en el campo con Brian Toretto, el hijo de Dom. Pero los problemas siguen tocando la puerta a la familia: Jakob (John Cena), el hermano menor de Dom, se ha unido con Cipher (Charlize Theron) para causar estragos y cumplir un deseo de venganza por parte de Cipher tras de los sucesos de The Fate of the Furious. El equipo se reunirá una vez más para mantener a la familia unida y deshacerse de los problemas de una vez', 'Justin Lin', 'https://www.youtube.com/watch?v=t3DpuQrBivU', 2.00),
(7, 'Sangre, sudor y gloria', 1, '2013-11-11', 'La película empieza en junio de 1995. Daniel Lugo (Mark Wahlberg) está haciendo ejercicio fuera del Sun Gym cuando la policía empieza a llegar. Luego empieza a escapar del lugar hasta que es atropellado por una patrulla.\r\n\r\nLuego la historia retrocede meses antes. Lugo es un intrigante y recién liberado convicto, que cumplió condena por fraude de Medicare. Lugo trabaja como un entrenador personal en el Sun Gym donde entrena a un cliente, Victor Kershaw (Tony Shalhoub), un hombre de negocios mult', 'Michael Bay', 'https://www.youtube.com/watch?v=AunqUHPJY6Y', 3.00),
(8, 'Escuadron 6', 8, '2016-11-11', 'Cuatro años después de presenciar los horrores de un régimen brutal en la nación del Medio Oriente de Turgistán, un multimillonario y filántropo estadounidense no identificado, que hizo su fortuna inventando imanes de neodimio, finge su propia muerte para formar un escuadrón de vigilantes anónimos cuyo fin es derrotar a criminales y terroristas que los gobiernos no tocarán. Ahora conocido como "Uno", recluta a otras cinco personas para abandonar su pasado y unirse a su causa como "fantasmas": Do', '	 Michael Bay', 'https://www.youtube.com/watch?v=aVfxMcGrKm4', 2.50),
(9, 'Spencer confidencial', 1, '2020-06-03', 'Disgraced former Boston police officer Spenser is released from a five-year prison sentence for intervening in a domestic dispute and assaulting his captain John Boylan. On the day of Spenser''s release, Boylan and another officer are murdered. Spenser teams up with his no-nonsense new roommate, Hawk, to investigate and take down the guilty parties. Rising property prices and a casino project on the former Wonderland dog track in South Boston fuel greed and police involvement in selling drugs to ', 'Peter berg', 'https://www.youtube.com/watch?v=bgKEoHNi3Uc', 4.00),
(10, 'El señor de los anillos las dos torres', 2, '2016-11-05', 'Si bien es cierto que El Señor de los Anillos fue concebida como una continuación de El hobbit, argumentalmente lo es de El Silmarillion, obra que relata los acontecimientos de los Días Antiguos y en la que se construye toda la trama del legendarium que creó J. R. R. Tolkien. La Primera Edad del Sol es la edad de los elfos, mientras que la Segunda es la del ascenso de los hombres de Númenor (dúnedain) y su posterior caída, pero también es la de la construcción de una cultura netamente humana (co', 'J.R.R. Tolkien', 'https://www.youtube.com/watch?v=yZLxtW7qq48', 0.00),
(11, 'Victor Frankestein', 1, '2012-04-05', 'Igor (Daniel Radcliffe) es un payaso de un circo londinense, maltratado física y psicológicamente por sus compañeros de troupe. Pero Igor es también un entusiasta de la ciencia, un estudioso de medicina, que tras el dramático accidente de la bella trapecista Lorelei (Jessica Brown Findlay), cambiará el rumbo de su vida cuando conozca y sea rescatado por Victor Frankenstein (James McAvoy).', 'Paul McGuigan', 'https://www.youtube.com/watch?v=7pxZxY_Siyc', 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `es_administrador` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usuarios_alias` (`alias`),
  KEY `idx_usuarios_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `alias`, `password`, `es_administrador`) VALUES
(0, 'test@test.com', 'Usuario de prueba', '098f6bcd4621d373cade4e832627b4f6', 1),
(1, 'admin@guia.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(25, 'marco@gmail.com', 'Marco', 'e10adc3949ba59abbe56e057f20f883e', 0),
(27, 'Nico@gmail.com', 'Nico', 'e10adc3949ba59abbe56e057f20f883e', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
