-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-09-2017 a las 00:30:21
-- Versión del servidor: 10.0.32-MariaDB-0+deb8u1
-- Versión de PHP: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `noticias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE IF NOT EXISTS `autores` (
`aut_id` int(11) NOT NULL,
  `aut_nombre` varchar(40) NOT NULL,
  `aut_apellido` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`aut_id`, `aut_nombre`, `aut_apellido`) VALUES
(1, 'Chavo', 'Fuks'),
(2, 'Fernando', 'Apo'),
(3, 'Diego', 'Bonadeo'),
(4, 'Pedro', 'Briguer'),
(5, 'Pablo', 'Carusso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE IF NOT EXISTS `imagenes` (
`ima_id` int(11) NOT NULL,
  `ima_url` varchar(400) NOT NULL,
  `ima_not_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`ima_id`, `ima_url`, `ima_not_id`) VALUES
(1, '<a data-flickr-embed="true"  href="https://www.flickr.com/photos/154917925@N05/37158510415/in/dateposted-public/" title="IMG-20160728-WA0011"><img src="https://farm5.staticflickr.com/4435/37158510415_023ea3be74_n.jpg" width="320" height="213" alt="IMG-20160728-WA0011"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>', 3),
(2, '<a data-flickr-embed="true"  href="https://www.flickr.com/photos/154917925@N05/36969171316/in/dateposted-public/" title="IMG-20160616-WA0037"><img src="https://farm5.staticflickr.com/4368/36969171316_4d3297d7c6_n.jpg" width="320" height="240" alt="IMG-20160616-WA0037"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>', 1),
(3, '<a data-flickr-embed="true"  href="https://www.flickr.com/photos/154917925@N05/36969168066/in/dateposted-public/" title="IMG-20160728-WA0026"><img src="https://farm5.staticflickr.com/4399/36969168066_564bd61e47_n.jpg" width="320" height="213" alt="IMG-20160728-WA0026"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE IF NOT EXISTS `notas` (
`not_id` int(11) NOT NULL,
  `not_fecha` date DEFAULT NULL,
  `not_titulo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `not_copete` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `not_texto` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `not_img_id` int(11) NOT NULL DEFAULT '1',
  `not_aut_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`not_id`, `not_fecha`, `not_titulo`, `not_copete`, `not_texto`, `not_img_id`, `not_aut_id`) VALUES
(1, '2017-09-04', 'Club Atletico Monte Grande', 'Nuevo predio cancha de 11', 'Las autoridades del club, confirmaron en conferencia de prensa, que ya está aprobado el convenio con la Municipalidad de Esteban Echeverría, que se otorgará en comodato al Club Atlético Monte Grande, el predio sito en la calle San Martín 1150 de la localidad de Luis Guillón.', 1, 4),
(2, '2017-08-14', 'Incorporación en Godoy Cruz', 'Godoy Cruz anunció la incorporación de un nuevo refuerzo', 'Se trata del paraguayo nacionalizado argentino Cristian Báez quien llega proveniente de Dorados de Sinaloa, de la segunda de México. Es el sexto refuerzo del Tomba. El defensor paraguayo nacionalizado argentino Cristian Báez se convirtió en la flamante incorporación del plantel con el que Godoy Cruz de Mendoza jugará el próximo campeonato de Primera División. Báez, de 27 años, viene de jugar en Dorados de Sinaloa, equipo que milita en la segunda división del fútbol mexicano.El defensor ya tiene experiencia en el fútbol argentino, donde vistió las camisetas de Independiente', 2, 3),
(3, '2017-08-22', 'Preocupación en los dirigentes del fútbol amateur', 'Al mismo tiempo mostraron su preocupación por los valores que deberían comenzar a pagar en materia de servicio de policía. Hoy se paga 352 pesos por efectivo y se debería pasar a pagar 1.056.', 'Este miércoles en la reunión del Comité Ejecutivo de la Liga de Fútbol Local se programaron los partidos de la 18ª fecha del torneo de Primera División y algunos pendientes. Además se informó sobre la gestión que se está llevando, a través de la Federación, en lo referente a los costos de la Policía. En cuanto a las divisiones formativas, se decidió parar el torneo hasta el 6 de agosto.El tema que preocupa a todos los dirigentes del fútbol amateur de la Provincia de Buenos Aires es el costo que tendrá a partir del mes de agosto el servicio policial.En la actualidad los clubes están abonando $352 y con el aumento que se ha mencionado -300 % – tendrían que abonar $1.056 por cada efectivo.Por esto en las últimas horas en una reunión mantenida en forma conjunta con la Federación Sur y algunas Ligas pertenecientes a la Jurisdicción de la Federación del Este de la provincia, se decidió comenzar a trabajar para lograr de forma conjunta reunirse con el Ministro de Seguridad de la provincia, Cristian Ritondo, para encontrar una solución y no tener que tomar medidas extremas.Con tal propósito, cada Liga deberá remitir a su Federación una nota firmada por las autoridades de la misma y de los clubes, y estas se encargaran de hacérselas llegar al Ministro para lograr una reunión.Por otra parte, se informó que las divisiones formativas no jugarán durante el receso escolar invernal y que la actividad volverá el 6 de agosto. Además, en los próximos días se comunicará como se jugará el segundo torneo del año, dado que por cuestiones de calendario no podrá ser igual al que se está disputando', 1, 3),
(4, '2017-08-12', 'Inicio de los torneos de todas las divisiones', 'Los directivos de la Liga de Fúltbol de Las Flores se reunieron el 31 de Julio, ausente estuvo La Terraza.', 'Se resolvió dar inicio a los torneos clausura de todas las divisiones, los días 26 y 27 de Agosto. Por un tema de calendario, las semifinales y finales serán a un solo partido, teniendo la condición de local aquel que terminó mejor ubicado en la tabla general, en el caso de las finales se sumaran los puntos obtenidos en semifinales.En ambos casos, en caso de empate se tomará en cuenta el resultado entre si, luego diferencia de gol, y goles a favor. En caso de empate en la rueda clasificatoria, se aplicará el mismo sistema.Se permitirán tres pases por categoría, las rescinciones de préstamo y los pases interliga no ocupan cupo.El libro de pases para todas las categorías abrirá el Martes 15 de Agosto, cerrando el Jueves 24, debiendo los clubes informar a la liga los nombres de los jugadores a fichar, caso contrario no se inscribirán.', 3, 2),
(5, '2017-09-06', 'River-Banfield', 'Así se jugará la segunda fecha', 'River le ganó a Banfield por 3-1 en el Monumental, en un partido que había arrancado perdiendo desde el primer minuto, por un gol de cabeza de Renato Civelli. Pero tuvo juego y carácter el equipo de Marcelo Gallardo para dar vuelta el resultado y llevarse el partido por 3-1, en su presentación de local en la Superliga.', 2, 4),
(6, '2017-09-05', 'Fórmula 1 en la Argentina', 'Es prematuro señalar al candidato.', ' No son muchos los argentinos que están corriendo en el exterior: esa meta se fue perdiendo en las últimas generaciones, acaso también debido a la ausencia del Gran Premio. El marplatense Marcos Siebert es una promesa: en 2016 le ganó el campeonato italiano de la Fórmula 4 a Mick Schumacher, el hijo del ahora postrado séptuple campeón mundial de F.1, y en esta temporada está disputando el torneo de la GP3, la tercera división de ascenso rumbo a la máxima disciplina, sin un adecuado respaldo económico y con resultado dispar: en Monza, una semana atrás, logró un cuarto lugar, su mejor ubicación de la temporada. En la F4 italiana compite ahora el chaqueño Giorgio Carrara, con apoyo de la lotería de su provincia.', 3, 2),
(7, '2017-09-06', 'Rechazo de Perú', 'Perú rechaza jugar en la Bombonera debido al lamentable hecho del gas pimienta', 'Lamentablemente el estadio determinado por la Asociación del Fútbol Argentino en el año 2015 fue clausurado preventivamente por autoridades judiciales argentinas debido a los lamentables hechos conocidos por todos en relación a un gas pimienta que tiraron en el estadio y que terminó con la suspensión de un clásico entre los clubes Boca Juniors y River Plate (...) Por tal motivo mostramos nuestra profunda preocupación ya que tomando en cuenta los pocos días que faltan para la realización del partido, es complicada una inspección que asegure que sus instalaciones cumplan con las exigencias FIFA.', 2, 1),
(8, '2017-09-13', 'Casi afuera', 'La situación actual de la selección', 'Es indefectible: si no sabés mucho sobre fútbol o no terminás de entender cuál es la situación de la selección nacional en el camino hacia Rusia 2018 después del partido ante Venezuela, este fin de semana te vas a quedar afuera de más de una conversación. Pero no desesperes: en esta nueva entrega de Para quedar bien,Jorge Pinarello te da cinco formas para simular que la tenés clarísima o, al menos, salir airoso de la charla.', 2, 3),
(9, '2017-09-12', 'Ganó Nadal', 'Nueva conquista de Rafael Nadal', 'NUEVA YORK (dpa).- El español Rafael Nadal recibió hoy con los ojos vidriosos la copa que le acredita como campeón del Abierto de tenis de Estados Unidos y recordó los momentos difíciles de las últimas temporadas. Lo que ha pasado este año es increíble. Después de dos años con lesiones y sin jugar bien en algunos momentos, este año ha sido muy emocionante desde el principio, dijo Nadal en la pista Arthur Ashe tras batir en la final al sudafricano Kevin Anderson por 6-3, 6-3 y 6-4', 3, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
 ADD PRIMARY KEY (`aut_id`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
 ADD PRIMARY KEY (`ima_id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
 ADD PRIMARY KEY (`not_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
MODIFY `aut_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
MODIFY `ima_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
MODIFY `not_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
