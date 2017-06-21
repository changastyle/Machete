-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 20-06-2017 a las 19:36:07
-- Versión del servidor: 5.5.53-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `machete`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE IF NOT EXISTS `preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` text NOT NULL,
  `respuesta` text NOT NULL,
  `esImagen` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

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
(22, 'Dada la siguiente integral SSS f(x,y,z)dv | S de -2 a 2, S de 0 a x, S de  0 a x+y', 'Z1 = 0 | Z2 = x + y', 0),
(23, 'Calcule el volumen de la region cortada en el cilindro eliptico solido x^2 + 4y^2 <4 por el plano xy y el plano z = x + 2', '4n', 0),
(24, 'Determine la ecuacion de la esfera tangente a los 3 planos coordenados, si su radio es 6 y su centro estÃ¡ en el primer octante', '(x - 6) ^2 + (y - 6) ^ 2 +(z - 6)^2 = 36 | El radio de la esfera es 6 y el centro estÃ¡ a 6 de distancia del eje (6,6,6)', 0),
(25, 'Evalue la integral iterada S de 0 a pi sobre 2 S de 0 a cos r al cuadrado seno 0 dr d0', '1/12', 0),
(26, 'Deter,ome F( f (t), g(t)), si F(x,y) = x al cuadrado', 't^2', 0),
(27, 'Determine el limite que se pido o indique que no existe | Limite a 1 de 2ti - t al cuadrado por j', '2i -j', 0),
(28, 'Evalue la integral dada por medio de los cambios de variable que se indican | S S r (x+y) da , donde R es la region acotada por las graficas', '16', 0),
(29, 'Sean x(t) e y(t) dos curvas derivables ( definidas para los mismos valores de t). Entonces la suma X(t) + Y(t) es derivable y se puede afirmar', 'd( x(t) + y(t) ) / dt = ( dx / dt ) + ( dy / dt )', 0),
(30, 'La derivadad de una funcion vectorial f(t) es', 'limite de h que tiende a 0 de f(t + h) - f(t) todo sobre h  es igual a d f( t) sobre dt = f(t) prima', 0),
(31, 'Cual de la siguientes afirmaciones es correcta', 'Sea p un punto en el n-espacio y sea a un numero mayor a 0. el conjunto de puntos X tales que || X - P || menor a a . se llama bola abierta de radio a y centro p', 0),
(32, 'Para la serie sumatoria de n igual a 2 hasta el infinito de 1 partido n logaritmo de n que criterio se debe usar?', 'Criterio de la integral', 0),
(33, 'Sea x una curva derivable, se dice que la curva se encuentra sobre la superficie si para todo t se cumple que', 'f ( x ( t ) ) = c', 0),
(34, 'Determine la ecuacion del plano perpendicular a la curva | x = 3t, y = 2t al cuadrado , z = t a la quinta en t = -1', '3x -4y + 5z = -22', 0),
(35, 'Determine la convergencia o divergencia de la serie dada | Sumatoria de n = 1 hasta el infinito de 4n al cubo + 3n todo sobre n a la quinta - 4n al cuadrado + 1', 'Converge, criterio de comparacion de limites', 0),
(36, 'La longitud de una curva x entre el valor de a de t (a <= b ) en el intervalo de definicion de la curva, como la integral de la velocidad', 'No se puede determinar con los datos proporcionados', 0),
(37, 'Dado el dibujo de la figura, determinal cual es la curva superior en r que delimita el radio en coordenadas polares | dibujo cono de papas', 'F1 de tita', 0),
(38, 'Determine la masa m y l centro de la masa (x,y) de la lamina acotada por las curvas dadas y con densidad indicada | r= 1, r = 2 , tita = 0, tita = pi, (0 < tita < pi); delta(r, tita) = 1/r', 'm = pi , x = 0 , y = 3 partido pi', 0),
(39, 'Evalue la integral dada por medio de los cambios de variable que se indican | SSS (4z + 2x -2y ) donde D es el paralelepipedo', '96', 0),
(40, 'Calcule el volumen de la region del primer octante entre los planos | x + y + 2z = 2 y 2x + 2y + z = 4', '2', 0),
(41, 'Determine en triangulito de F, donde f(x,y,z)  = xe elevado a la y  por el coseno de z', 'e elevado a la y cos de zi + xe elevado a la v cos zj - xe elevado a la v sen zk', 0),
(42, 'Describa geometricamente el dominio de la funcion dada de tres valores f(x,y,z) = rais de 144 - 16 x al cuadrado - 9y cuadrado - 144 z al cudrado, cierro la raiz', 'x cuadrado partido 9 + y cuadrado partido 16 + z cuadrado partido 1 = 1 y la funcion 144 - 16x cuadrado - 9y cuadrado - 144zcuadrado es positiva', 0),
(43, 'Resuelva el sistema u = 3x + 2y , v =  x 4y | para xy en terminos de u y v. luego halle el valor del jacobiano', 'x = 1/5 (2u - v), y = 1/10 (3v -u) ; 1/10', 0),
(44, 'Evalue la integral iterada en S desde 0 a pi de S desde 0 a seno 0  de r cuadrado dr d0', '4/9', 0),
(45, 'Determine la imagen del rectangulo con las esquinas dadas y calcule el jacobiano de la transformacion | x = u cuadrado + v cuadrado , y = v (0,0),(1,0),(1,1).(0,1)', 'La imagen es el conjunto de x,y que satisfacen y cuadrado menor o igual  x menor o igual y cuadrado = 2u', 0),
(46, 'R ={(x,y)} : 0 < x < 6 , 0 < y < 4} y P es la particion de R en seis cuadrados iguales mediantes las rectas x = 2 , x = 4 y y = 2. Aproxime  SSr f(x,y) da mediante la suma de riemann', '52.62', 0),
(47, 'Evalue la integral iterada | S desde 0 a 2 S de 0 a 3 de (9-x) dy dx', '48', 0),
(48, '|J|  se denomina jacobiano y resulta de resolver la siguiente operacion algebraica, formado por las derivadas parciales de las funciones H y G con respecto a las variables u y v', 'http://www.barivende.com:8081/upload/machete/respuesta%2048.png', 1),
(49, 'Dada la integral repetida S de a hasta b [ S de f1 a f2  F(x,y) dy ] dx , podemos decir que las funciones f1 y f2?', 'Solamente son funciones de X', 0),
(50, 'Que resultado se obtiene si las funciones r y s en esta expresion son iguales a 1 | SSS f (x,y,z)dv = S de a0 a a1 S de p a q S de r a s f(x,y,z) dz dy dx', '1', 0),
(51, 'Suponga que R = {(x,y)} : 0 < x < 2 , 0 < y < 2 | R1 = {(x,y)}', '2', 0),
(52, 'Dado el grafico ( dos rayitas curvas ) que representa una area en el plano xy entre dos funciones f1 y f2, si se desea integrar la funcion G(x,y) en esa area, cuales son los limites superior e inferior de integracion de la variable y ?', 'Limite superior f2 e inferior f1', 0),
(53, 'Determine la transformacion del plano  uv al plano xy y calcule el jacobiano. Suponga que x > 0 y  y > 0 ; u xy, v = x', 'x = v ; y = u/v ; J = -1/v', 0),
(54, 'Suma de Riemann 14', '156', 0),
(55, 'Dada la funcion F (x,y) determine cual es el valor limite I = lim de n al infinito de Sumatoria de k = 1 hasta n  de F (xk , yk) da', 'S f(x,y) da palito', 0),
(56, 'calcule el valor promedio de F (x,y,z) = x cuadrado + y cuadrado + z cuadrado, sobre el cubo en el primer octante acotado por los planos coordenados y los plano x = 1 , y = 1 ; z = 1', '1', 0),
(57, 'Integre la funcion f(x,y) = 1 / (1 - x cuadrado - y cuadrado) sobre el disco x cuadrado + y cuadrado < 3/4', 'pi logaritmo natural de 4', 0),
(58, 'Dada la integral repetida S de a hasta b [ S de f1 a f2 F(x,y) dy ] dx = 0,  que podemos decir de las funciones f1 y f2 si a es distintinto de b y f (x,y) es positiva?', 'f1 = f2', 0),
(59, 'El jacobiano con las derivadas parciales de las funciones x (r,t,z) y (r,t,z) en coordenadas cilindricas', 'http://www.barivende.com:8081/upload/machete/respuesta%20del%2050.png', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
