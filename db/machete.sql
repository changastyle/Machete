-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2017 a las 03:29:23
-- Versión del servidor: 10.1.22-MariaDB
-- Versión de PHP: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `machete`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `respuesta` text NOT NULL,
  `esImagen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `pregunta`, `respuesta`, `esImagen`) VALUES
(4, 'y dx + x ^2 dy; C es la curva x = 2t,y = t^2 -1, 0<t<2', '100/3', 0),
(5, 'El jacobiano con derivadas parciales de las funciones x(r,0) e y(r,0) en coordenadas polares evaluado en r = 1y 0 = 0 es:', '| J | = 1', 0),
(6, 'El jacobiano con las derivadas parciales de las funciones x (pq,t), y  (pq,t), z(pq,t) en coordenadas esfericas es', 'http://www.barivende.com:8081/upload/machete/respuesta%203%20del%20final.png', 1),
(7, 'Que resultados se obtiene si las funciones r y s en esta expresion son nulas', 'http://www.barivende.com:8081/upload/machete/respuesta4-final.png', 1),
(8, 'Evalue la integral por cambio de variable que se indican', 'http://www.barivende.com:8081/upload/machete/respuesta5.png', 1),
(9, 'Determine si el campo dado es conservativo, en tal caso, halle f tal que f = triangulo invertido f; en caso contrario indique que f no es conservativo.F(x,y) = (2e^y - ye^x)i - (2xe^y - e^x)j', 'http://www.barivende.com:8081/upload/machete/respuesta6%20(2).png', 1),
(10, 'Como es el sector de integracion en el plano xy si q y p son funciones constantes y distintas de la integral', 'Rectangular', 0),
(11, 'Determine la imagen del rectangulo con las esquinas dadas y calcule el jacobiano de la transformacion x = u+2v, y= u.2v; (0,0),(2,0),(2,1),(0,1)', 'http://www.barivende.com:8081/upload/machete/respuesta8.png', 1),
(12, 'Dado el grafico de la figura, determina cuanto vale el elemento del area dA', 'dA = dxdy', 0),
(13, 'Determine el volumen de la region acotada arriba por el paraboloide z = x^2+y^2 y abajo por el triangulo encerrado por las rectas y = x,x = 0 ,y x + 2 = 2 en el plano xy', '4/3', 0),
(14, 'Efectuando el calculo de integral (x^(3) + 5x^(2) - 2 ) e^2x dx', '(1/2 x ^ (3) + 7/4 x ^ (2) - 7/4 x - 1/8) e^2x + C', 0),
(15, 'Sea p un punto en el n-espacio y sea un numero > 0. El conjunto de puntos x tales que II X PII = a, se llamarÃ¡', 'Esfera de radio a y centro P', 0),
(16, 'Determine la convergencia o divergencia de la serie dada.Indice que criterio utilizado | Sumatoria 1/2+sen^(2)n', 'Diverge; criterio del n-esimo termino', 0),
(17, 'El polinomio de Taylor de | 1 /(1+x^2)', 'La que invalida al resto de las opciones', 0),
(18, 'Sean f(t) y g(t) funciones vectoriales y donde * es el producto escalar y x el producto vectorial, determine cual de las expresiones es correcta', 'http://www.barivende.com:8081/upload/machete/respuesta15.png', 1),
(19, 'Determine la velocidad v, la aceleracion a y la rapidez s en el instante t = t | r (t)  = cos(t) . i + sen (t) . j + t k | t 1 = pi', 'Raiz de 2 | -j + k; a(pi) = i; s(pi) = raiz de 2', 0),
(20, 'Determine el area de la superficie indicada. La parte de la esfera x ^2 + y^2 + z^2 = a ^2 dentro del cilindro circular x^2 + y^2 = ay', 'http://www.barivende.com:8081/upload/machete/respuesta%2017.png', 1),
(21, 'Evalue la integral de linea | S (2x + 9z) ds; c  es la curva | x = t, y = t^2 , z = t^3', '1/6 (14 . raiz de (14) - 1)', 0),
(22, 'Dada la siguiente integral SSS f(x,y,z)dv | S de -2 a 2, S de 0 a x, S de  0 a x+y', 'Z1 = 0 | Z2 = x + y', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
