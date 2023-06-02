-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2023 a las 22:29:53
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `soluciones_botica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `unidad_medida` varchar(45) NOT NULL,
  `descripcion_otros` varchar(45) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `afectacion` varchar(20) NOT NULL,
  `stock_salida` int(11) NOT NULL,
  `stock_ingreso` int(11) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `id_tipo_venta_articulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`idarticulo`, `idcategoria`, `codigo`, `nombre`, `stock`, `descripcion`, `imagen`, `unidad_medida`, `descripcion_otros`, `condicion`, `afectacion`, `stock_salida`, `stock_ingreso`, `fecha_vencimiento`, `id_tipo_venta_articulo`) VALUES
(1, 7, '', 'AB AMBROMOX 1200 X 1 AMP', 0, 'AMPICILINA + LIDOCAINA + TERPINOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(2, 7, '', 'AEROTECH COMPUESTO SUSP.X 120ML', 0, 'CLENBUTEROL + AMBROXOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(3, 7, '', 'AIRUM JAT SUSPENSION X 120ML', 0, 'CODEINA + PSEUDOFEDRINA + CLORFENIRAMINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(4, 7, '', 'ALIZAR 0.05MG CREMA X 30GR', 0, 'CLOBETASOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(5, 7, '', 'AMBROMOX SUSP X 60ML', 0, 'AMOXICILINA + AMBROXOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(6, 7, '', 'AQUASOL-A CREMA X 29 GR', 0, 'VITAMINA-A + PANTENOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(7, 7, '', 'BIOGAIA GOTAS X 5ML', 0, 'LACTOBACILLUS REUTERI PROTECTIS', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(8, 7, '', 'BIOGAIA X 10 TAB', 0, 'LACTOBACILLUS REUTERI PROTECTIS', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(9, 7, '', 'CADITAR 200MG X CAPS', 0, 'CELECOXIB', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(10, 7, '', 'CADITAR 400MG X CAPS', 0, 'CELECOXIB', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(11, 7, '', 'CADITAR FLEX X 60 TAB', 0, 'CELECOXIB + ORFENADRINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(12, 7, '', 'CADITAR VIT X 100 COMP ', 0, 'CELECOXIB', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(13, 7, '', 'CEFABAC SUSP X 75ML', 0, 'CEFACLOR', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(14, 7, '', 'CEREGEN FORTE X 180ML', 0, 'MULTIVITAMINICO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(15, 7, '', 'CEREGEN FORTE X 300ML', 0, 'MULTIVITAMINICO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(16, 7, '', 'CINAFLOX-F X 60 TAB', 0, 'CIPROFLOXACINO + FENAZOPIRINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(17, 7, '', 'DEXACORT 4MG X 10 TAB', 0, 'DEXAMETASONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(18, 7, '', 'DEXACORT 2MG X SUSP X 60ML', 0, 'DEXAMETASONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(19, 7, '', 'DIXI-35 X 21 COMP', 0, 'CIPROTERONA + ETINILESTRADIOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(20, 7, '', 'DOLNIX FORTE X 10 CAPS', 0, 'KETOROLACO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(21, 7, '', 'DOLNIX 10MG X 50 COMP', 0, 'KETOROLACO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(22, 7, '', 'DOLO QUIMAGESICO C-50 X 120 TAB', 0, 'PARACETAMOL + DICLOFENACO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(23, 7, '', 'DOLO QUIMAGESICO VIT X 100 TAB', 0, 'DICLOFENACO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(24, 7, '', 'DOLO TENSODOX X 50 TAB', 0, 'CICLOBENZAPRINA + MELOXICAM', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(25, 7, '', 'DUO CVP-K X 40 TAB', 0, 'CITROBIOFLAVONOIDES + ACIDO ASCORBICO + MENADIONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(26, 7, '', 'FRUTENZIMA X 120 CAPS', 0, 'METOCLOPRAMIDA + DIMETICONA + ENZIMAS DIGESTIVAS', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(27, 7, '', 'LIPEBIN JARABE X 90ML', 0, 'LACTULOSA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(28, 7, '', 'MAGALDRAX JARABE X 200ML', 0, 'MAGALDRATO + SIMETICONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(29, 7, '', 'MAXUCAL-D 400MG X 60 TAB', 0, 'CITRATO DE CALCIO + VITAMINA D3', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(30, 7, '', 'MIZONASE X 10 OVULOS', 0, 'TINIDAZOL + MICONAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(31, 7, '', 'MULTIBIOTICOS CARAMELOS', 0, 'POR CORREGIR', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(32, 7, '', 'MULTIDERM CREMA X 10GR', 0, 'BETAMETASONA + GENTAMICINA + CLOTRIMAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(33, 7, '', 'MULTIMYCIN CREMA X 20GR', 0, 'NEOMICINA + POLIMIXINA-B + BACITRACINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(34, 7, '', 'NETAF X 100 COMP', 0, 'DOMPERIDONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(35, 7, '', 'NITAXOM SUSPENSION X 100ML', 0, 'NITAZOXANIDA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(36, 7, '', 'NOFERTYL X 1 AMP', 0, 'NORETISTERONA + ESTRADIOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(37, 7, '', 'RINOFILAX SUSPENSION X 60ML', 0, 'DESLORATADINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(38, 7, '', 'TIOCTAN PLUS X 100 GRAGEAS', 0, 'HEPAPROTECTOR', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(39, 7, '', 'TOBAN-F X 100 TAB ', 0, 'LOPERAMIDA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(40, 7, '', 'TRIMETABOL SUSPENSION X 100ML', 0, 'MULTIVITAMINICO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(41, 7, '', 'UROCYCLAR X 90 TAB', 0, 'NORFLOXACINO + FENAZOPIRIDINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(42, 8, '', 'ACICLOVIR 400MG X 100 TAB', 0, 'ACICLOVIR', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(43, 8, '', 'BACLOFENO X 100 TAB', 0, 'BACLOFENO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(44, 8, '', 'CARBIDOPA+LEVODOPA X 100 TAB', 0, 'CARBIDOPA + LEVODOPA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(45, 8, '', 'DIZOLVIN NIÑOS JARABE', 0, 'AMBROXOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(46, 8, '', 'DIZOLVIN ADULTO JARABE', 0, 'AMBROXOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(47, 8, '', 'HIDROCLOROTIAZIDA 25MG X 100 TAB', 0, 'HIDROCLOROTIAZIDA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(48, 8, '', 'HIOSCINA 10MG X 100 TAB', 0, 'HIOSCINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(49, 8, '', 'MIGRALIVIA X 100 TAB', 0, 'PARACETAMOL + ACIDO ACETILSALICILICO + CAFEINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(50, 8, '', 'NAPROCOP COMPUESTO X 100 TAB', 0, 'NAPROXENO + PARACETAMOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(51, 8, '', 'NAPROXPORT 550 MG X 100 TAB', 0, 'NAPROXENO ', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(52, 8, '', 'NORFLOXACINO + FENAZOPIRIDINA X 100 TAB', 0, 'NORFLOXACINO + FENAZOPIRIDINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(53, 8, '', 'OZOL 20MG X 100 TAB', 0, 'OMEPRAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(54, 8, '', 'PROPRANOLOL 40MG X 100 TAB', 0, 'PROPRANOLOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(55, 9, '', 'ALLEGRA JBE X 150ML', 0, 'FEXOFENADINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(56, 9, '', 'ALLEGRA 180MG X 10 TAB', 0, 'FEXOFENADINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(57, 9, '', 'BIPROFENID 150MG X 10 COMP', 0, 'KETOPROFENO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(58, 9, '', 'ENTEROGERMINA X 10 AMP BEB.', 0, 'BACILLUS CLAUSI ESPORAS', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(59, 9, '', 'FLAGYL 500MG X 20 COMP', 0, 'METRONIDAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(60, 9, '', 'FLAGYL 500MG X 10 OVULOS', 0, 'METRONIDAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(61, 9, '', 'LACTACYD FEMINA', 0, 'ACIDO LACTICO + LACTOSUERO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(62, 9, '', 'LACTACYD INFANTIL', 0, 'ACIDO LACTICO + LACTOSUERO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(63, 9, '', 'RIFOCINA SPRAY X 20ML', 0, 'RIFAMICINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(64, 10, '', 'AB AMOXIDAL X 1 AMP', 0, 'AMOXICILINA + BROMHEXINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(65, 10, '', 'ABRILAR JBE', 0, 'HEDERA HELIX', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(66, 10, '', 'ACI TIP SUSPENSION X 220ML', 0, 'MAGALDRATO + SIMETICONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(67, 10, '', 'ALERFAST FORTE X 8 COMP', 0, 'LORATADINA + DEXAMETASONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(68, 10, '', 'AMOXIDAL DUO 250MG JARABE X 70ML', 0, 'AMOXICILINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(69, 10, '', 'AMOXIDAL DUO 750MG JARABE X 70ML', 0, 'AMOXICILINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(70, 10, '', 'AMOXIDAL DUO 875MG X 98 TAB', 0, 'AMOXICILINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(71, 10, '', 'AMOXIDAL DUO RESP X 98 TAB', 0, 'AMOXICILINA + AMBROXOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(72, 10, '', 'ATURAL 300MG X 50 COMP', 0, 'RANITIDINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(73, 10, '', 'CIRIAX X 50 TAB', 0, 'CIPROFLOXACINO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(74, 10, '', 'MICOLIS CREMA', 0, 'ECONAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(75, 10, '', 'MICOLIS GOTAS', 0, 'ECONAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(76, 10, '', 'PLIDAN COMPUESTO X 100 TAB', 0, 'PROPINOXATO + LISINA CLONIXINATO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(77, 10, '', 'PLIDAN FORTE X 20 COMP', 0, 'PROPINOXATO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(78, 10, '', 'PLIDAN GOTAS X 20ML', 0, 'PROPINOXATO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(79, 10, '', 'TELAREN NF X 100 TAB', 0, 'MELOXICAM', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(80, 11, '', 'AB BRONCOL 1200MG X 1 AMP', 0, 'ALCANFOR + AMPICILINA + GOMENOL + TERPINOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(81, 11, '', 'ACARIL CREMA X 42', 0, 'BENZOATO DE BENCILO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(82, 11, '', 'ACNOMEL CREMA X 30GR', 0, 'RESORCINA + AZUFRE', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(83, 11, '', 'ADECEROL AMP.BEBIBLE', 0, 'MULTIVITAMINICO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(84, 11, '', 'BETACORT AMP', 0, 'BETAMETASONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(85, 11, '', 'BRONCO TRIFAMOX 125MG X 60ML', 0, 'AMOXICILINA + BROMHEXINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(86, 11, '', 'BRONCO TRIFAMOX 250MG X 60ML', 0, 'AMOXICILINA + BROMHEXINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(87, 11, '', 'BRONCOXAN DILAT JARABE 120ML', 0, 'CLENBUTEROL + AMBROXOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(88, 11, '', 'CEFABRONCOL SUSPENSION X 75ML', 0, 'CEFALEXINA + AMBROXOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(89, 11, '', 'CEFABRONCOL DUO X 60 TAB', 0, 'CEFALEXINA + AMBROXOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(90, 11, '', 'CEFACROL IM 1GR X 1 AMP', 0, 'CEFTRIAXONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(91, 11, '', 'CLARIMED X 50  TAB', 0, 'CLARITROMICINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(92, 11, '', 'DEQUAZOL 500MG X 60 TAB', 0, 'METRONIDAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(93, 11, '', 'DEQUAZOL-R X 8 OVULOS', 0, 'METRONIDAZOL + NISTATINA + LIDOCAINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(94, 11, '', 'DIGESTAL X 100 CAPS', 0, 'SIMETICONA + ENZIMAS DIGESTIVAS', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(95, 11, '', 'EVACUOL ENEMA X 130ML', 0, 'FOSFATO DE SODIO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(96, 11, '', 'EVACUOL ENEMA X 250ML', 0, 'FOSFATO DE SODIO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(97, 11, '', 'FURACIN CREMA X 35GR', 0, 'NITROFURAZONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(98, 11, '', 'FUROXONA JARABE X 120ML', 0, 'FURAZOLIDONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(99, 11, '', 'FUROXONA FORTE JARABE X 120ML', 0, 'FURAZOLIDONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(100, 11, '', 'FUROXONA 100MG X 100 TAB', 0, 'FURAZOLIDONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(101, 11, '', 'GASEOVET 40MG X 150 TAB', 0, 'SIMETICONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(102, 11, '', 'GASEOVET 80MG X 120 TAB', 0, 'SIMETICONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(103, 11, '', 'GASEOVET GOTAS X 15ML', 0, 'SIMETICONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(104, 11, '', 'LECHE DE MAGNESIA NATURAL', 0, 'HIDROXIDO DE MAGNESIO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(105, 11, '', 'LECHE DE MAGNESIA KIDS', 0, 'HIDROXIDO DE MAGNESIO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(106, 11, '', 'MEDICORTIL GOTAS', 0, 'FRAMICETINA + DEXAMETASONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(107, 11, '', 'RAQUIFEROL D3 ', 0, 'VITAMINA D3', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(108, 11, '', 'SITIDERM CREMA X 20GR', 0, 'BETAMETASONA + GENTAMICINA + CLOTRIMAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(109, 11, '', 'SOLOUNA-5  X 1 AMP', 0, 'NORETISTERONA + ESTRADIOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(110, 11, '', 'SOLUNA X 1 AMP', 0, 'ALGESTONA + ESTRADIOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(111, 11, '', 'SOLUTRES X 1 AMP', 0, 'MEDROXIPROGESTERONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(112, 11, '', 'SULFACREM LATA', 0, 'SULFADIAZIDA + LIDOCAINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(113, 11, '', 'SULFACREM CREMA X 20GR', 0, 'SULFADIAZIDA + LIDOCAINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(114, 11, '', 'XILONEST 2% JALEA', 0, 'LIDOCAINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(115, 11, '', 'XILONEST 5% POMADA', 0, 'LIDOCAINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(116, 12, '', 'ACI BASIC SUSPENSION X 150ML', 0, 'MAGALDRATO + SIMETICONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(117, 12, '', 'ACI BASIC SUSPENSION X 220ML', 0, 'MAGALDRATO + SIMETICONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(118, 12, '', 'ANTALGINA 250MG X 60ML', 0, 'METAMIZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(119, 12, '', 'ANTALGINA 400MG GOTAS', 0, 'METAMIZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(120, 12, '', 'ANTALGINA 500MG X 100 COMP', 0, 'METAMIZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(121, 12, '', 'ANTALGINA 1GR X 1 AMP', 0, 'METAMIZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(122, 12, '', 'BISMUTOL SUSPENSION X 150ML', -36, 'BISMUTO SUBSALICILATO', '', 'NIU', '', 1, 'Gravado', 43, 7, '0000-00-00', 2),
(123, 12, '', 'BISMUTOL SUSPENSION X 340ML', 0, 'BISMUTO SUBSALICILATO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(124, 12, '', 'BRONCO MAGNIMOX JARABE', 0, 'AMOXICILINA + BROMHEXINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(125, 12, '', 'CIPROFLOX X TAB', 0, 'CIPROFLOXACINO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(126, 12, '', 'ESPASMO ANTALGINA X TAB', 0, 'HIOSCINA BUTILBROMURO + METAMIZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(127, 12, '', 'GINGISONA TOQUES X 30ML', 0, 'NEOMICINA + HIDROCORTISONA + LIDOCAINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(128, 12, '', 'GINGISONA PASTILLAS', 0, 'POR CORREGIR', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(129, 12, '', 'GYNO DEXACORT PLUS OVULOS', 0, 'METRONIDAZOL + CLOTRIMAZOL + DEXAMETASONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(130, 12, '', 'KITADOL MIGRAÑA X 40 SOBRES', 0, 'PARACETAMOL + CAFEINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(131, 12, '', 'LERGIUM PLUS CAPS', 0, 'CETIRIZINA + PSEUDOFEDRINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(132, 12, '', 'NASTIFLU X 120 SOBRES', 0, 'POR CORREGIR', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(133, 12, '', 'PALTOMIEL NIÑOS', 0, 'POR CORREGIR', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(134, 12, '', 'PALTOMIEL ADULTO', 0, 'POR CORREGIR', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(135, 12, '', 'REDEX X TAB', 0, 'DICLOFENACO + ORFENADRINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(136, 12, '', 'REDEX X 1 AMP', 0, 'DICLOFENACO + ORFENADRINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(137, 12, '', 'RHINO BB GOTAS', 0, 'CLORURO DE SODIO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(138, 12, '', 'SILVERDIAZINA CREMA X 25GR', 0, 'SULFADIAZIDA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(139, 12, '', 'SILVERDIAZINA-L CREMA  X 25GR', 0, 'SULFADIAZIDA + LIDOCAINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(140, 12, '', 'WELTON X 240ML', 0, 'MULTIVITAMINICO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(141, 13, '', 'ARTRIMIDA MSM X 30 SOBRES', 0, 'GLUCOSAMINA + CONDROITINSULFATO + METILSULFONILMETANO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(142, 13, '', 'AZOQUIN X 100 TAB', 0, 'NORFLOXACINO + FENAZOPIRIDINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(143, 13, '', 'DOLALIVIO FORTE X 100 TAB', 0, 'PARACETAMOL + DICLOFENACO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(144, 13, '', 'DOLALIVIO FORTE GEL', 0, 'DICLOFENACO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(145, 13, '', 'DOLOKIDS JARABE', 0, 'IBUPROFENO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(146, 13, '', 'GASTRIZOL 40MG X 14 CAPS', 0, 'ESOMEPRAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(147, 13, '', 'LOPEFAN X 100 TAB', 0, 'LOPERAMIDA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(148, 13, '', 'SULPHYTRIM JUNIOR JBE', 0, 'SULFAMETOXAZOL + TRIMETOPRIMA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(149, 13, '', 'SULPHYTRIM BALS JBE', 0, 'SULFAMETOXAZOL + TRIMETOPRIMA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(150, 14, '', 'ACICLOVIR 800MG X 14 TAB', 0, 'ACICLOVIR', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(151, 14, '', 'ACICLOVIR CREMA X 5 GR', 0, 'ACICLOVIR', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(152, 14, '', 'ALBENDAZOL 200MG X 100 TAB', 0, 'ALBENDAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(153, 14, '', 'ALBENDAZOL 100MG X 2 FCOS.', 0, 'ALBENDAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(154, 14, '', 'ALOPURINOL 100MG X 30 TAB', 0, 'ALOPURINOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(155, 14, '', 'ALOPURINOL 300MG X 30 TAB', 0, 'ALOPURINOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(156, 14, '', 'AMBROXOL 15MG SUSP X 120ML', 0, 'AMBROXOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(157, 14, '', 'AMBROXOL 30MG SUSP X 120ML', 0, 'AMBROXOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(158, 14, '', 'AMLODIPINO 5MG X 100 TAB', 0, 'AMLODIPINO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(159, 14, '', 'AMLODIPINO 10MG X 30 TAB', 0, 'AMLODIPINO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(160, 14, '', 'AMOXICILINA 250MG JARABE', 0, 'AMOXICILINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(161, 14, '', 'AMOXICILINA 500MG X 100 TAB', 0, 'AMOXICILINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(162, 14, '', 'AZITROMICINA 200MG SUSP 15ML', 0, 'AZITROMICINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(163, 14, '', 'BETAMETASONA CREMA 20GR', 0, 'BETAMETASONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(164, 14, '', 'CAPTOPRIL 25MG X 100 COMP', 0, 'CAPTOPRIL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(165, 14, '', 'CEFADROXILO SUSP X 60ML', 0, 'CEFADROXILO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(166, 14, '', 'CEFALEXINA SUSP X 60ML', 0, 'CEFALEXINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(167, 14, '', 'CETIRIZINA SUSPENSION X 60ML', 0, 'CETIRIZINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(168, 14, '', 'CINARIZINA 75MG X 100 CAPS', 0, 'CINARIZINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(169, 14, '', 'CIPROFLOXACINO 500MG X 100 TAB', 0, 'CIPROFLOXACINO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(170, 14, '', 'CLARITROMICINA 500MG X 100 TAB', 0, 'CLARITROMICINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(171, 14, '', 'CLINDAMICINA 300MG X 120 CAPS', 0, 'CLINDAMICINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(172, 14, '', 'CLOBETASOL CREMA X 25G', 0, 'CLOBETASOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(173, 14, '', 'CLOBETASOL UNGÜENTO', 0, 'CLOBETASOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(174, 14, '', 'CLORFENAMINA JARABE', 0, 'CLORFENAMINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(175, 14, '', 'DEFLAZACORT 6MG X 10 TAB', 0, 'DEFLAZACORT', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(176, 14, '', 'DESLORATADINA 10MG X 100 TAB', 0, 'DESLORATADINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(177, 14, '', 'DESLOTARADINA JARABE', 0, 'DESLORATADINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(178, 14, '', 'DEXAMETASONA 4MG X 100 TAB', 0, 'DEXAMETASONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(179, 14, '', 'DEXAMETASONA 4MG X AMP', 0, 'DEXAMETASONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(180, 14, '', 'DICLOFENACO 75MG X 100 AMP', 0, 'DICLOFENACO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(181, 14, '', 'DICLOFENACO GEL ', 0, 'DICLOFENACO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(182, 14, '', 'ENALAPRIL 10MG X 140 TAB', 0, 'ENALAPRIL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(183, 14, '', 'ENALAPRIL 20MG X 100 TAB', 0, 'ENALAPRIL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(184, 14, '', 'ERITROMICINA 500MG X 100 TAB', 0, 'ERITROMICINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(185, 14, '', 'ERITROMICINA JARABE', 0, 'ERITROMICINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(186, 14, '', 'FENAZOPIRIDINA 100MG X 100 TAB', 0, 'FENAZOPIRIDINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(187, 14, '', 'FLUCONAZOL 150MG X 2 TAB', 0, 'FLUCONAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(188, 14, '', 'FUROSEMIDA 40MG X 100 TAB', 0, 'FUROSEMIDA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(189, 14, '', 'GLIBENCLAMIDA 5MG X 100 TAB', 0, 'GLIBENCLAMIDA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(190, 14, '', 'IBUPROFENO 400MG X 100 TAB', 0, 'IBUPROFENO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(191, 14, '', 'IBUPROFENO 800MG X 100 TAB', 0, 'IBUPROFENO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(192, 14, '', 'KETOCONAZOL CREMA', 0, 'KETOCONAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(193, 14, '', 'KETOPROFENO 100MG X 30 TAB', 0, 'KETOPROFENO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(194, 14, '', 'LACTULOSA JARABE X 100ML', 0, 'LACTULOSA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(195, 14, '', 'LACTULOSA JARABE X 200ML', 0, 'LACTULOSA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(196, 14, '', 'LORATADINA 10MG X 100 TAB', 0, 'LORATADINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(197, 14, '', 'LORATADINA JARABE', 0, 'LORATADINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(198, 14, '', 'LOSARTAN 50MG X 60 TAB', 0, 'LOSARTAN', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(199, 14, '', 'NAPROXENO 550MG X 100 TAB', 0, 'NAPROXENO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(200, 14, '', 'ORFENADRINA 100MG X 100 COMP', 0, 'ORFENADRINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(201, 14, '', 'PANTOPRAZOL 40MG X 14 TAB', 0, 'PANTOPRAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(202, 14, '', 'PARACETAMOL 500MG X 100 TAB', 0, 'PARACETAMOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(203, 14, '', 'PREDNISONA 5MG X 100 TAB', 0, 'PREDNISONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(204, 14, '', 'PREDNISONA 20MG X 100 TAB', 0, 'PREDNISONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(205, 14, '', 'PREDNISONA 50MG X 100 TAB', 0, 'PREDNISONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(206, 14, '', 'RANITIDINA 300MG X 100 TAB', 0, 'RANITIDINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(207, 14, '', 'TERBINAFINA CREMA X 15GR', 0, 'TERBINAFINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(208, 14, '', 'VERAPAMILO 80MG X 100TAB', 0, 'VERAPAMILO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(209, 15, '', 'AMOXI+ACIDO CLAV JARABE', 0, 'AMOXICILINA + ACIDO CLAVULANICO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(210, 15, '', 'AMOXI+ACIDO CLAV TABLETAS', 0, 'AMOXICILINA + ACIDO CLAVULANICO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(211, 15, '', 'AMOXI+AMBROXOL JARABE', 0, 'AMOXICILINA + AMBROXOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(212, 15, '', 'AMPICILINA 500MG X 100 CAPS', 0, 'AMPICILINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(213, 15, '', 'ATORVASTATINA 10MG X 100 TAB', 0, 'ATORVASTATINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(214, 15, '', 'ATORVASTATINA 20MG X 100 TAB', 0, 'ATORVASTATINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(215, 15, '', 'CELECOXIB 200MG X 100 CAPS', 0, 'CELECOXIB', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(216, 15, '', 'CLOPIDOGREL 75MG X 30 TAB', 0, 'CLOPIDOGREL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(217, 15, '', 'CLORANFENICOL 250MG JARABE', 0, 'CLORANFENICOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(218, 15, '', 'CLORANFENICOL 500MG X 100 CAPS', 0, 'CLORANFENICOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(219, 15, '', 'CLORFENAMINA 4MG X 100 TAB', 0, 'CLORFENAMINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(220, 15, '', 'CLOTRIMAZOL CREMA X 20GR', 0, 'CLOTRIMAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(221, 15, '', 'COMPLEJO B X 300 CAPS', 0, 'COMPLEJO B', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(222, 15, '', 'COMPLEJO B JARABE', 0, 'COMPLEJO B', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(223, 15, '', 'DICLOXACILINA JARABE', 0, 'DICLOXACILINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(224, 15, '', 'DICLOXACILINA X 100 CAPS', 0, 'DICLOXACILINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(225, 15, '', 'DIMENHIDRINATO X 100 TAB', 0, 'DIMENHIDRINATO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(226, 15, '', 'DOXICICLINA 100MG X 100 TAB', 0, 'DOXICICLINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(227, 15, '', 'FURAZOLIDONA 50MG X 100 TAB', 0, 'FURAZOLIDONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(228, 15, '', 'FURAZOLIDONA JARABE', 0, 'FURAZOLIDONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(229, 15, '', 'GENFIBROZILO 600MG X 100 TAB', 0, 'GENFIBROZILO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(230, 15, '', 'IBUPROFENO JARABE', 0, 'IBUPROFENO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(231, 15, '', 'MELOXICAM 15MG X 100 TAB', 0, 'MELOXICAM', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(232, 15, '', 'METFORMINA 850MG X 100 TAB', 0, 'METFORMINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(233, 15, '', 'METRONIDAZOL 500MG X 100 TAB', 0, 'METRONIDAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(234, 15, '', 'METRONIDAZOL 250MG JARABE', 0, 'METRONIDAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(235, 15, '', 'NORFLOXACINO X 100 CAPS', 0, 'NORFLOXACINO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(236, 15, '', 'OMEPRAZOL 20MG X 100 CAPS', 0, 'OMEPRAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(237, 15, '', 'PARACETAMOL JARABE', 0, 'PARACETAMOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(238, 15, '', 'PARACETMOL GOTAS', 0, 'PARACETAMOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(239, 15, '', 'PREDNISONA SUSPENSION', 0, 'PREDNISONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(240, 15, '', 'SULFATO FERROSO X 100 TAB', 0, 'SULFATO FERROSO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(241, 15, '', 'SULFA+TRIM 200 SUSP', 0, 'SULFAMETOXAZOL + TRIMETOPRIMA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(242, 15, '', 'SULFA+TRIM 400 SUSP', 0, 'SULFAMETOXAZOL + TRIMETOPRIMA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(243, 15, '', 'SULFA+TRIM X 100 TAB', 0, 'SULFAMETOXAZOL + TRIMETOPRIMA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(244, 16, '', 'ATORVASTATINA 40MG X 100 TAB', 0, 'ATORVASTATINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(245, 16, '', 'DOBESILATO DE CALCIO X 100 CAPS', 0, 'DOBESILATO DE CALCIO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(246, 16, '', 'GABAPENTINA 300MG X 100 CAPS', 0, 'GABAPENTINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(247, 16, '', 'LEVOFLOXACINO 500MG X 100 TAB', 0, 'LEVOFLOXACINO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(248, 16, '', 'MONTELUKAST 4MG X 100 TAB', 0, 'MONTELUKAST', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(249, 16, '', 'TERBINAFINA 250MG X 100 TAB', 0, 'TERBINAFINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(250, 17, '', 'AMOXICLIN DUO RESPIR. 98 TAB', 0, 'AMOXICILINA + AMBROXOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(251, 17, '', 'AMOXICLIN DUO X 98 TAB', 0, 'AMOXICILINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(252, 17, '', 'QUANOX GOTAS X 5ML', 0, 'IVERMECTINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(253, 18, '', 'LAMISIL CREMA X 15GR', 0, 'TERBINAFINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(254, 19, '', 'AMOXIL 250MG POLVO', 0, 'AMOXICILINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(255, 19, '', 'AMOXIL 500MG X 100 CAPS', 0, 'AMOXICILINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(256, 19, '', 'AVAMYS SPRAY NASAL', 0, 'FLUTICASONA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(257, 19, '', 'DERMOVATE CREMA X 30GR', 0, 'CLOBETASOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(258, 19, '', 'ECOTRIM 100MG X 114', 0, 'ACIDO ACETILSALICILICO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(259, 19, '', 'EMULSION SCOTT X 200ML', 0, 'MULTIVITAMINICO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(260, 19, '', 'EMULSION SCOTT X 400ML', 0, 'MULTIVITAMINICO', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(261, 19, '', 'PANADOL 500MG X 100 TAB', 0, 'PARACETAMOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(262, 19, '', 'PANADOL ANTIGRIPAL X 100 TAB', 0, 'POR CORREGIR', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(263, 19, '', 'PANADOL ALLERGY X SOBRES', 0, 'PARACETAMOL + FENILEFRINA + CLORFENIRAMINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(264, 19, '', 'PANADOL FORTE', 0, 'PARACETAMOL + CAFEINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(265, 19, '', 'PANADOL JARABE ', 0, 'PARACETAMOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(266, 19, '', 'PANADOL GOTAS', 0, 'PARACETAMOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(267, 19, '', 'POSIPEN 500MG X CAPS', 0, 'DICLOXACILINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(268, 19, '', 'POSIPEN SUSPENSION', 0, 'DICLOXACILINA', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(269, 19, '', 'ZENTEL 200MG X TAB', 0, 'ALBENDAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(270, 19, '', 'ZENTEL 400MG X TAB ', 0, 'ALBENDAZOL', '', 'NIU', '', 1, 'Gravado', 0, 0, '0000-00-00', 2),
(271, 20, '', 'AMIODARONA 200MG X 100 TAB', 99, 'AMIODARONA', '', 'NIU', '', 1, 'Gravado', 0, 99, '2023-10-21', 1),
(272, 20, '', 'AZITROMICINA 500MG X 30 TAB', 4, 'AZITROMICINA', '', 'NIU', '', 1, 'Gravado', 12, 16, '2020-01-28', 2),
(273, 20, '', 'BIPERIDENO 2MG X 100 TAB', -34, 'BIPERIDENO', '', 'NIU', '', 1, 'Gravado', 39, 5, '0000-00-00', 2),
(274, 20, '', 'BISOPROLOL 100MG X 100 TAB', -53, 'BISOPROLOL', '', 'NIU', '', 1, 'Gravado', 59, 6, '0000-00-00', 2),
(275, 20, '', 'ESPIRONOLACTONA 25MG X 100 TAB', -38, 'ESPIRONOLACTONA', '', 'NIU', '', 1, 'Gravado', 42, 4, '0000-00-00', 2),
(692, 72, '', 'Chela cristal pe', 17, 'no se', '', 'BX', '', 1, 'Gravado', 6, 23, '2023-04-19', 0),
(702, 67, '', 'FANTA', 19, 'SXSX', '', 'LTR', '', 1, 'Gravado', 1, 20, '2023-04-19', 0),
(703, 69, '', 'COCA COLA', 5, 'XDDDD', '', 'LTR', '', 1, 'Gravado', 0, 5, '2023-03-28', 0),
(704, 69, '', 'CIFRUT', 51, 'JUGO', '', 'LTR', '', 1, 'Gravado', 0, 51, '2023-04-25', 0),
(705, 72, '', 'SEVEN UP', 81, 'GASEOSA', '', 'LTR', '', 1, 'Gravado', 10, 91, '2023-04-04', 0),
(706, 72, '', 'Trakoma', 3, '', '', 'NIU', '', 1, 'Gravado', 0, 3, '2023-04-25', 0),
(707, 72, '', 'Trakoma20', 2, '', '', 'NIU', '', 1, 'Gravado', 0, 2, '2023-05-06', 0),
(708, 72, '', 'PARACETAMOL', 3, 'Para aliviar el dolor', '', 'NIU', '', 1, 'Gravado', 0, 3, '0000-00-00', 2023);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `condicion`) VALUES
(66, 'Anaqleto 1', 'Ambiente 1', 0),
(67, 'Anaqleto 2', '', 1),
(68, 'Almacen', '', 1),
(69, 'Vitrina', '', 1),
(70, 'Anaqleto 3', 'Tu caza', 1),
(71, 'PARACETAMOL', 'Para aliviar el dolor', 1),
(72, 'SIMVASTATINA', 'Para aliviar el dolorssssssssssssssssssss', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `confidencial`
--

CREATE TABLE `confidencial` (
  `idconfidencial` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `serie` varchar(4) NOT NULL,
  `correlativo` varchar(8) NOT NULL,
  `fecha` datetime NOT NULL,
  `gastos_totales` decimal(11,2) NOT NULL,
  `compras` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `idcotizacion` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  `serie` varchar(100) DEFAULT NULL,
  `referencia` varchar(100) NOT NULL,
  `validez` varchar(100) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`idcotizacion`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`, `serie`, `referencia`, `validez`) VALUES
(1, 63, 272, 1, '1.00', '0.00', '', '', ''),
(2, 63, 683, 1, '4.50', '0.00', '', '', ''),
(3, 63, 122, 1, '4.50', '0.00', '', '', ''),
(4, 73, 692, 1, '15.00', '0.00', '2', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desarrollo`
--

CREATE TABLE `desarrollo` (
  `idsoporte` int(15) NOT NULL,
  `nombre_cliente` varchar(50) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `fecha_ingreso` varchar(50) DEFAULT NULL,
  `fecha_salida` varchar(50) DEFAULT NULL,
  `tecnico_respon` varchar(100) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `problema` varchar(100) DEFAULT NULL,
  `solucion` varchar(100) DEFAULT NULL,
  `tipo_equipo` varchar(100) DEFAULT NULL,
  `codigo_soporte` varchar(50) NOT NULL,
  `estado_entrega` varchar(20) NOT NULL,
  `estado_servicio` varchar(20) NOT NULL,
  `estado_pago` varchar(20) NOT NULL,
  `total` int(20) NOT NULL,
  `cuota` int(20) NOT NULL,
  `saldo` int(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `accesorio` varchar(200) NOT NULL,
  `recomendacion` varchar(50) NOT NULL,
  `garantia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `desarrollo`
--

INSERT INTO `desarrollo` (`idsoporte`, `nombre_cliente`, `telefono`, `fecha_ingreso`, `fecha_salida`, `tecnico_respon`, `marca`, `problema`, `solucion`, `tipo_equipo`, `codigo_soporte`, `estado_entrega`, `estado_servicio`, `estado_pago`, `total`, `cuota`, `saldo`, `direccion`, `accesorio`, `recomendacion`, `garantia`) VALUES
(3, 'HOSTAL FLORES', '996720630', '2019-06-04', '2019-06-14', 'JULCA BRONCANO', '', '0', '0', 'DESARROLLO WEB', '6565651222', '', 'pendiente', 'Pendiente', 650, 250, 0, '1DE MAYO', '0', '0', ''),
(4, 'LELY YOVERA', '996720630', '2019-06-10', '2019-06-10', 'JULCA BRONCANO', 'PAGINA', 'NO', 'O', 'DESARROLLO WEB', '65656500', '', 'pendiente', 'Pagado', 500, 300, 0, 'Lopez de Zuñiga N° 254', 'NO', 'O', ''),
(5, 'PEDRITO EL PRRO DE LA PLantita', '996720630', '2019-06-05', '2019-06-11', 'JULCA BRONCANO', 'web', 'o', 'o', 'DESARROLLO WEB', 'fgdfgfdgdf', '', 'pendiente', 'Pendiente', 200, 20, 0, 'Lopez de Zuñiga N° 254', 'o', 'o', ''),
(6, 'PEDRITO EL PRRO DE LA PLantita', '', '', '', '', '', '', '', '', 'fgdfgfdgdf', '', 'pendiente', 'Pagado', 200, 0, 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingreso`
--

CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` int(11) NOT NULL,
  `idingreso` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `laboratorio` varchar(100) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `lote` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `incentivo` decimal(11,2) NOT NULL,
  `fecha_vencimiento` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_ingreso`
--

INSERT INTO `detalle_ingreso` (`iddetalle_ingreso`, `idingreso`, `idarticulo`, `laboratorio`, `codigo`, `lote`, `cantidad`, `precio_compra`, `precio_venta`, `incentivo`, `fecha_vencimiento`) VALUES
(2, 2, 272, 'HUACHO', '', 'Nº122121', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(3, 3, 683, 'SOL', '', 'Nº455', 20, '3.20', '4.50', '5.50', '0000-00-00 00:00:00'),
(4, 4, 122, 'MIFARMA', '', 'Nº711', 7, '3.60', '4.50', '1.60', '0000-00-00 00:00:00'),
(5, 5, 273, '', '', 'Nº616259', 5, '1.20', '1.60', '0.90', '0000-00-00 00:00:00'),
(6, 5, 274, '', '', 'Nº484', 8, '1.31', '1.90', '0.70', '0000-00-00 00:00:00'),
(7, 5, 275, '', '', 'Nº54246', 4, '1.40', '1.50', '1.90', '0000-00-00 00:00:00'),
(8, 6, 271, '', '', 'Nº746745', 100, '5.50', '110.00', '0.00', '0000-00-00 00:00:00'),
(9, 7, 687, '', '', 'Nº14', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(10, 8, 688, '', '', 'Nº4123243', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(11, 9, 691, '', '', 'Nº42423', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(12, 11, 691, '', 'Vitrina', 'Nº7234', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(13, 11, 692, '', 'Anaquel 2', 'Nº77897', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(14, 15, 691, 'xd', 'Vitrina', 'Nº475', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(15, 15, 692, '', 'Anaquel 2', 'Nº454141', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(16, 16, 691, 'xd', 'Vitrina', 'Nº758453', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(17, 16, 692, '', 'Anaquel 2', 'Nº745756', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(18, 17, 691, 'xd', 'Vitrina', 'Nº711473', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(19, 17, 694, '', 'Anaquel 2', 'Nº787895', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(20, 17, 693, '', 'Anaquel 2', 'Nº57756', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(21, 18, 691, 'xd', 'Vitrina', 'Nº898', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(22, 18, 694, '', 'Anaquel 2', 'Nº21345', 1, '1.00', '1.00', '0.00', '2023-03-23 00:00:00'),
(23, 18, 693, '', 'Anaquel 2', 'Nº576765', 1, '1.00', '1.00', '0.00', '2023-03-15 00:00:00'),
(24, 18, 692, '', 'Anaquel 2', 'Nº57676', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(25, 19, 691, 'xd', 'Vitrina', 'Nº5224', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(26, 19, 694, '', 'Anaquel 2', 'Nº111', 1, '1.00', '1.00', '0.00', '2023-03-23 00:00:00'),
(27, 20, 693, 'dsfdsf', 'Anaquel 2', 'Nº447', 1, '1.00', '1.00', '0.00', '2023-03-15 00:00:00'),
(28, 20, 692, 'sdfdsf', 'Anaquel 2', 'Nº275757', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(29, 28, 694, '', 'test1', 'Nº717828', 1, '1.00', '1.00', '0.00', '2023-03-23 00:00:00'),
(30, 28, 693, '', 'test1', 'Nº41171', 1, '1.00', '1.00', '0.00', '2023-03-15 00:00:00'),
(31, 28, 692, '', 'test1', 'Nº45676', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(32, 29, 698, '', 'test2', '0', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(33, 29, 691, '', 'test2', '0', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(34, 29, 694, '', 'test2', '0', 1, '1.00', '1.00', '0.00', '2023-03-23 00:00:00'),
(35, 30, 693, '', '67', '0', 1, '1.00', '1.00', '0.00', '2023-03-15 00:00:00'),
(36, 30, 692, '', '67', '0', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(37, 31, 694, '', '67', '0', 1, '1.00', '1.00', '0.00', '2023-03-23 00:00:00'),
(38, 31, 693, '', '67', '0', 1, '1.00', '1.00', '0.00', '2023-03-15 00:00:00'),
(39, 31, 692, '', '67', '0', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(40, 32, 692, '', '69', '0', 1, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(41, 32, 693, '', '69', '0', 1, '1.00', '1.00', '0.00', '2023-03-15 00:00:00'),
(42, 33, 700, '', '67', '0', 1, '1.00', '1.00', '0.00', '2023-04-05 00:00:00'),
(43, 34, 692, 'xd', '69', '1', 2, '12.00', '11.00', '0.00', '0000-00-00 00:00:00'),
(44, 35, 692, 'lima xd', '66', 'cxo', 10, '1.00', '15.00', '0.00', '0000-00-00 00:00:00'),
(45, 36, 701, 'NASSA', '70', 'CALLAO', 5, '1.00', '1.00', '0.00', '0000-00-00 00:00:00'),
(46, 37, 702, 'NASSA1', '67', '150 XD', 20, '20.00', '15.00', '0.00', '2023-04-19 00:00:00'),
(47, 38, 703, 'NASSA', '69', '50442', 5, '2.00', '20.00', '0.00', '2023-03-16 00:00:00'),
(48, 39, 704, 'SENATI', '68', 'HUAURA', 50, '15.00', '10.00', '0.00', '2023-04-12 00:00:00'),
(49, 39, 705, 'SENATI', '68', 'HUAURA', 90, '18.00', '10.00', '0.00', '2023-04-29 00:00:00'),
(50, 40, 701, 'nose ', '70', '21123', 50, '10.00', '5.00', '0.00', '2023-04-12 00:00:00'),
(51, 41, 706, 'Test1', '66', '00011', 1, '1.00', '1.00', '0.00', '2023-04-25 00:00:00'),
(52, 41, 707, 'Test2', '66', '00022', 1, '1.00', '1.00', '0.00', '2023-05-06 00:00:00'),
(53, 42, 704, '', '69', '0', 1, '1.00', '1.00', '0.00', '2023-04-25 00:00:00'),
(54, 43, 692, '', '72', '0', 1, '0.50', '1.00', '0.00', '2023-04-19 00:00:00'),
(55, 44, 705, '', '72', '0', 1, '0.90', '1.00', '0.00', '2023-04-04 00:00:00'),
(56, 45, 692, '', '72', '0', 1, '0.90', '1.00', '0.00', '2023-04-19 00:00:00'),
(57, 46, 707, '', '72', '0', 1, '0.50', '1.00', '0.00', '2023-05-06 00:00:00'),
(58, 47, 706, '', '72', '0', 1, '0.99', '0.99', '0.00', '2023-04-25 00:00:00'),
(59, 47, 706, '', '72', '0', 1, '1.00', '1.00', '0.00', '2023-04-25 00:00:00'),
(60, 48, 708, '', '72', '0', 2, '0.99', '0.99', '0.00', '0000-00-00 00:00:00'),
(61, 48, 708, '', '72', '0', 1, '0.99', '0.99', '0.00', '0000-00-00 00:00:00');

--
-- Disparadores `detalle_ingreso`
--
DELIMITER $$
CREATE TRIGGER `tr_updtStockIngreso` AFTER INSERT ON `detalle_ingreso` FOR EACH ROW BEGIN 
UPDATE articulo SET stock = stock + NEW.cantidad, stock_ingreso=stock_ingreso + NEW.cantidad
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_proforma`
--

CREATE TABLE `detalle_proforma` (
  `iddetalle_proforma` int(11) NOT NULL,
  `idproforma` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_proforma`
--

INSERT INTO `detalle_proforma` (`iddetalle_proforma`, `idproforma`, `descripcion`, `cantidad`, `precio`) VALUES
(1, 1, 'Cable UTP  CAT5 300m puro cobre blindado', 1, '1.00'),
(2, 1, 'DVR de 4 canales Hikvision Turbo HD', 1, '1.00'),
(3, 2, 'Sistema de facturación electrónica', 1, '1.00'),
(4, 2, 'Epson Supercolor ', 1, '1.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_puntos`
--

CREATE TABLE `detalle_puntos` (
  `id_detalle_puntos` int(11) NOT NULL,
  `id_puntos` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `puntos` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_puntos`
--

INSERT INTO `detalle_puntos` (`id_detalle_puntos`, `id_puntos`, `id_producto`, `cantidad`, `puntos`) VALUES
(3, 3, 2, 1, 2);

--
-- Disparadores `detalle_puntos`
--
DELIMITER $$
CREATE TRIGGER `tr_updtStockPuntos` AFTER INSERT ON `detalle_puntos` FOR EACH ROW BEGIN
	UPDATE productos SET stock = stock - NEW.cantidad
	WHERE productos.id_producto = NEW.id_producto;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  `fecha_mas_vendido` datetime DEFAULT NULL,
  `item` int(11) NOT NULL,
  `serie` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=REDUNDANT;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`, `fecha_mas_vendido`, `item`, `serie`, `estado`) VALUES
(1, 1, 683, 45, '4.20', '2.00', '2020-01-31 16:50:36', 1, 'P', NULL),
(2, 2, 683, 7, '4.20', '5.00', '2020-01-31 16:51:06', 1, '', NULL),
(3, 3, 683, 12, '4.20', '0.00', '2020-01-31 16:52:09', 1, '', NULL),
(4, 3, 683, 1, '4.20', '0.00', '2020-01-31 16:52:09', 2, '', NULL),
(5, 3, 683, 1, '4.20', '0.00', '2020-01-31 16:52:09', 3, '', NULL),
(6, 3, 683, 1, '4.20', '0.00', '2020-01-31 16:52:09', 4, '', NULL),
(7, 4, 683, 5, '4.20', '0.63', '2020-01-31 19:08:41', 1, '', NULL),
(8, 5, 683, 5, '4.20', '0.60', '2020-01-31 19:25:58', 1, '', NULL),
(9, 5, 683, 5, '4.20', '0.80', '2020-01-31 19:25:58', 2, '', NULL),
(10, 6, 683, 30, '4.20', '0.50', '2020-02-01 11:28:43', 1, '', NULL),
(11, 7, 683, 40, '4.20', '2.20', '2020-02-01 11:42:27', 1, '', NULL),
(12, 8, 683, 12, '4.20', '0.60', '2020-02-01 12:05:18', 1, '', NULL),
(13, 9, 683, 3, '4.20', '1.20', '2020-02-01 19:29:43', 1, '', NULL),
(14, 9, 683, 3, '4.20', '0.00', '2020-02-01 19:29:43', 2, '', NULL),
(15, 10, 683, 3, '4.20', '0.20', '2020-02-01 19:31:50', 1, '', NULL),
(16, 11, 683, 40, '4.20', '0.00', '2020-02-01 19:48:11', 1, '', NULL),
(17, 12, 683, 40, '4.20', '0.00', '2020-02-01 19:52:59', 1, '', NULL),
(18, 0, 683, 5, '4.20', '0.00', '2020-02-01 20:24:58', 1, '', ''),
(19, 13, 683, 5, '4.20', '0.00', '2020-02-01 20:28:11', 1, '', NULL),
(20, 14, 683, 5, '4.20', '0.00', '2020-02-01 20:30:14', 1, '', 'Aceptado'),
(21, 16, 683, 10, '4.20', '0.00', '2020-02-01 20:32:43', 1, '', 'Aceptado'),
(22, 17, 683, 2, '4.20', '0.30', '2020-02-01 20:37:11', 1, '', 'Aceptado'),
(23, 18, 683, 3, '4.20', '0.00', '2020-02-01 20:46:46', 1, '', 'Aceptado'),
(24, 19, 683, 5, '4.20', '2.00', '2020-02-01 20:54:22', 1, '', 'Aceptado'),
(25, 20, 683, 5, '4.20', '3.20', '2020-02-01 21:01:28', 1, '', 'Aceptado'),
(26, 20, 683, 3, '4.20', '1.50', '2020-02-01 21:01:28', 2, '', 'Aceptado'),
(27, 21, 683, 3, '4.20', '1.80', '2020-02-01 21:06:15', 1, '', 'Aceptado'),
(28, 21, 683, 2, '4.20', '0.90', '2020-02-01 21:06:15', 2, '', 'Aceptado'),
(29, 24, 683, 3, '4.20', '0.00', '2020-02-02 11:41:55', 1, '', 'Aceptado'),
(30, 37, 683, 25, '4.50', '4.00', '2020-02-02 15:38:20', 1, '', 'Aceptado'),
(31, 38, 122, 1, '4.50', '0.36', '2020-02-02 15:45:09', 1, '', 'Aceptado'),
(32, 39, 122, 3, '4.50', '0.07', '2020-02-02 15:48:17', 1, '', 'Aceptado'),
(33, 40, 122, 1, '4.50', '0.07', '2020-02-02 15:49:01', 1, '-', 'Aceptado'),
(34, 41, 122, 1, '4.50', '0.04', '2020-02-02 15:49:58', 1, '', 'Aceptado'),
(35, 42, 122, 1, '4.50', '0.09', '2020-02-02 15:51:13', 1, '-', 'Aceptado'),
(36, 43, 122, 1, '4.50', '0.03', '2020-02-02 15:52:55', 1, '-', 'Aceptado'),
(37, 44, 122, 4, '4.50', '0.02', '2020-02-02 15:53:33', 1, '', 'Aceptado'),
(38, 45, 683, 3, '4.50', '0.19', '2020-02-02 15:56:47', 1, '', 'Aceptado'),
(39, 46, 273, 2, '1.60', '0.00', '2020-02-02 17:20:30', 1, '', 'Aceptado'),
(40, 46, 274, 2, '1.90', '0.00', '2020-02-02 17:20:30', 2, '', 'Aceptado'),
(41, 46, 275, 2, '1.50', '0.00', '2020-02-02 17:20:30', 3, '', 'Aceptado'),
(42, 47, 273, 10, '1.60', '0.00', '2020-02-02 17:24:19', 1, '', 'Aceptado'),
(43, 48, 274, 3, '1.90', '0.01', '2020-02-02 17:53:23', 1, '', 'Aceptado'),
(44, 48, 275, 2, '1.50', '0.02', '2020-02-02 17:53:23', 2, '', 'Aceptado'),
(45, 49, 274, 6, '1.90', '0.00', '2020-02-02 17:55:03', 1, '', 'Aceptado'),
(46, 50, 274, 7, '1.90', '0.00', '2020-02-02 17:57:36', 1, '', 'Aceptado'),
(47, 50, 274, 7, '1.90', '0.00', '2020-02-02 17:57:36', 2, '', 'Aceptado'),
(48, 51, 274, 10, '1.90', '0.22', '2020-02-02 17:58:25', 1, '', 'Aceptado'),
(49, 52, 274, 10, '1.90', '1.22', '2020-02-02 17:59:28', 1, '', 'Aceptado'),
(50, 53, 273, 3, '1.60', '0.29', '2020-02-02 18:39:20', 1, '', 'Aceptado'),
(51, 53, 274, 3, '1.90', '0.20', '2020-02-02 18:39:20', 2, '', 'Aceptado'),
(52, 53, 275, 6, '1.50', '0.40', '2020-02-02 18:39:20', 3, '', 'Aceptado'),
(53, 54, 274, 1, '1.90', '0.00', '2020-02-02 18:41:37', 1, '', 'Aceptado'),
(54, 54, 275, 1, '1.50', '0.00', '2020-02-02 18:41:37', 2, '', 'Aceptado'),
(55, 55, 273, 4, '1.60', '0.00', '2020-02-02 18:43:06', 1, '', 'Aceptado'),
(56, 55, 274, 1, '1.90', '0.00', '2020-02-02 18:43:06', 2, '', 'Aceptado'),
(57, 55, 275, 1, '1.50', '0.00', '2020-02-02 18:43:06', 3, '', 'Aceptado'),
(58, 56, 274, 1, '1.90', '1.00', '2020-02-02 18:44:00', 1, '', 'Aceptado'),
(59, 56, 275, 1, '1.50', '1.00', '2020-02-02 18:44:00', 2, '', 'Aceptado'),
(60, 57, 274, 3, '1.90', '0.90', '2020-02-02 19:35:16', 1, '', 'Aceptado'),
(61, 57, 275, 4, '1.50', '0.50', '2020-02-02 19:35:16', 2, '', 'Aceptado'),
(62, 57, 274, 5, '1.90', '0.30', '2020-02-02 19:35:16', 3, '', 'Aceptado'),
(63, 57, 275, 9, '1.50', '0.50', '2020-02-02 19:35:16', 4, '', 'Aceptado'),
(64, 57, 275, 5, '1.50', '0.73', '2020-02-02 19:35:16', 5, '', 'Aceptado'),
(65, 58, 275, 1, '1.50', '0.00', '2020-02-02 19:36:38', 1, '', 'Aceptado'),
(66, 58, 275, 1, '1.50', '0.00', '2020-02-02 19:36:38', 2, '', 'Aceptado'),
(67, 58, 275, 1, '1.50', '4.00', '2020-02-02 19:36:38', 3, '', 'Aceptado'),
(68, 58, 275, 1, '1.50', '0.00', '2020-02-02 19:36:38', 4, '', 'Aceptado'),
(69, 58, 275, 1, '1.50', '0.00', '2020-02-02 19:36:38', 5, '', 'Aceptado'),
(70, 58, 275, 1, '1.50', '0.00', '2020-02-02 19:36:38', 6, '', 'Aceptado'),
(71, 58, 275, 1, '1.50', '0.00', '2020-02-02 19:36:38', 7, '', 'Aceptado'),
(72, 58, 275, 1, '1.50', '0.00', '2020-02-02 19:36:38', 8, '', 'Aceptado'),
(73, 58, 275, 1, '1.50', '0.00', '2020-02-02 19:36:38', 9, '', 'Aceptado'),
(74, 58, 275, 1, '1.50', '0.00', '2020-02-02 19:36:38', 10, '', 'Aceptado'),
(75, 58, 275, 1, '1.50', '0.00', '2020-02-02 19:36:38', 11, '', 'Aceptado'),
(76, 59, 683, 10, '4.50', '0.03', '2020-02-03 12:22:32', 1, '', 'Aceptado'),
(77, 59, 122, 10, '4.50', '0.08', '2020-02-03 12:22:32', 2, '', 'Aceptado'),
(78, 60, 273, 10, '1.60', '0.30', '2020-02-03 12:25:15', 1, '', 'Aceptado'),
(79, 61, 683, 10, '4.50', '0.00', '2020-02-03 12:29:37', 1, '', 'Aceptado'),
(80, 61, 122, 10, '4.50', '0.00', '2020-02-03 12:29:37', 2, '', 'Aceptado'),
(81, 61, 273, 10, '1.60', '0.00', '2020-02-03 12:29:37', 3, '', 'Aceptado'),
(82, 62, 683, 10, '4.50', '0.00', '2020-02-03 12:31:12', 1, '', 'Aceptado'),
(83, 62, 122, 10, '4.50', '0.00', '2020-02-03 12:31:12', 2, '', 'Aceptado'),
(84, 64, 272, 1, '1.00', '0.00', '2020-02-06 17:19:13', 1, '', 'Aceptado'),
(85, 64, 122, 1, '4.50', '0.00', '2020-02-06 17:19:13', 2, '', 'Aceptado'),
(86, 65, 272, 10, '1.00', '3.50', '2020-02-07 12:04:39', 1, '', 'Aceptado'),
(87, 66, 272, 1, '1.00', '0.00', '2020-02-08 01:26:52', 1, '', 'Aceptado'),
(88, 66, 683, 1, '4.50', '0.00', '2020-02-08 01:26:52', 2, '', 'Aceptado'),
(89, 67, 271, 1, '110.00', '0.00', '2023-01-20 19:56:12', 1, '', 'Aceptado'),
(90, 68, 705, 1, '10.00', '0.00', '2023-04-13 15:39:40', 1, '', 'Aceptado'),
(91, 68, 705, 1, '10.00', '0.00', '2023-04-13 15:39:40', 2, '', 'Aceptado'),
(92, 68, 705, 1, '10.00', '0.00', '2023-04-13 15:39:40', 3, '', 'Aceptado'),
(93, 69, 705, 1, '10.00', '0.00', '2023-04-13 16:22:22', 1, '', 'Aceptado'),
(94, 69, 692, 1, '15.00', '0.00', '2023-04-13 16:22:22', 2, '', 'Aceptado'),
(95, 69, 692, 1, '15.00', '0.00', '2023-04-13 16:22:22', 3, '', 'Aceptado'),
(96, 69, 692, 1, '15.00', '0.00', '2023-04-13 16:22:22', 4, '', 'Aceptado'),
(97, 70, 692, 1, '15.00', '0.00', '2023-04-13 16:22:29', 1, '', 'Aceptado'),
(98, 71, 692, 1, '15.00', '0.00', '2023-04-13 16:22:39', 1, '', 'Aceptado'),
(99, 71, 692, 1, '15.00', '0.00', '2023-04-13 16:22:39', 2, '', 'Aceptado'),
(100, 72, 705, 1, '10.00', '0.00', '2023-04-13 16:23:09', 1, '', 'Aceptado'),
(101, 74, 705, 1, '10.00', '0.00', '2023-04-15 11:34:22', 1, '', 'Aceptado'),
(102, 75, 705, 1, '10.00', '0.00', '2023-04-16 18:22:09', 1, '', 'Aceptado'),
(103, 76, 705, 1, '10.00', '0.00', '2023-04-16 18:25:15', 1, '', 'Aceptado'),
(104, 77, 705, 2, '10.02', '0.00', '2023-04-16 19:33:19', 1, '', 'Aceptado'),
(105, 78, 702, 1, '15.00', '0.00', '2023-04-25 17:41:09', 1, '', 'Aceptado');

--
-- Disparadores `detalle_venta`
--
DELIMITER $$
CREATE TRIGGER `tr_updtStockVenta` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
	IF(NEW.estado != 'Cancelado' || NEW.estado = null ) THEN
		UPDATE articulo SET stock = stock - NEW.cantidad,
		stock_salida=stock_salida + NEW.cantidad
		WHERE articulo.idarticulo = NEW.idarticulo;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_entrega`
--

CREATE TABLE `estado_entrega` (
  `cancelado` int(10) NOT NULL,
  `pendiente_entrega` int(10) NOT NULL,
  `sin_servicio` int(10) NOT NULL,
  `por_servicio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pago`
--

CREATE TABLE `estado_pago` (
  `pendiente_pago` int(11) NOT NULL,
  `pagado_pago` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_servicio`
--

CREATE TABLE `estado_servicio` (
  `pendiente` int(10) NOT NULL,
  `reparacion` int(10) NOT NULL,
  `terminado` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `idingreso` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `num_cuotas` int(11) DEFAULT NULL,
  `valor_cuota` decimal(11,2) DEFAULT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`idingreso`, `idproveedor`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `num_cuotas`, `valor_cuota`, `total_compra`, `estado`) VALUES
(1, 2, 1, 'Boleta', '', '10', '2020-01-31 00:00:00', '0.00', NULL, NULL, '180.00', 'Aceptado'),
(2, 2, 1, 'Boleta', '000', '00000', '2020-02-02 00:00:00', '0.00', NULL, NULL, '1.00', 'Aceptado'),
(3, 2, 1, 'Boleta', '4851', '54521', '2020-02-02 00:00:00', '0.00', NULL, NULL, '64.00', 'Aceptado'),
(4, 2, 1, 'Boleta', '000', '0000', '2020-02-02 00:00:00', '0.00', NULL, NULL, '25.20', 'Aceptado'),
(5, 2, 1, 'Boleta', '000', '0000', '2020-02-02 00:00:00', '0.00', NULL, NULL, '19.46', 'Aceptado'),
(6, 2, 1, 'Boleta', 'B001', '00000016', '2023-01-20 00:00:00', '0.00', NULL, NULL, '550.00', 'Aceptado'),
(7, 6, 1, 'Boleta', '0091', '123', '2023-03-24 00:00:00', '0.00', NULL, NULL, '1.00', 'Aceptado'),
(8, 7, 1, 'Boleta', '0091', '000', '2023-03-24 00:00:00', '0.00', NULL, NULL, '1.00', 'Aceptado'),
(9, 7, 1, 'Boleta', '0091', '123', '2023-03-24 00:00:00', '0.00', NULL, NULL, '1.00', 'Aceptado'),
(10, 6, 1, 'Boleta', '0091', '123', '2023-03-24 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(11, 6, 1, 'Boleta', '00', '123', '2023-03-24 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(12, 7, 1, 'Boleta', '123', '000', '2023-03-24 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(13, 6, 1, 'Boleta', '11', '111', '2023-03-24 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(14, 6, 1, 'Boleta', '00', '123', '2023-03-24 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(15, 6, 1, 'Boleta', '', '123', '2023-03-24 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(16, 6, 1, 'Boleta', '', '123', '2023-03-24 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(17, 6, 1, 'Boleta', '001', '000', '2023-03-27 00:00:00', '0.00', NULL, NULL, '3.00', 'Aceptado'),
(18, 6, 1, 'Boleta', '0091', '00', '2023-03-27 00:00:00', '0.00', NULL, NULL, '4.00', 'Aceptado'),
(19, 7, 1, 'Boleta', '0091', '123', '2023-03-27 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(20, 6, 1, 'Boleta', '00', '123', '2023-03-27 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(21, 6, 1, 'Factura', '0091', '123', '2023-03-28 00:00:00', '18.00', NULL, NULL, '3.00', 'Aceptado'),
(22, 6, 1, 'Boleta', '0091', '000', '2023-03-28 00:00:00', '0.00', NULL, NULL, '4.00', 'Aceptado'),
(23, 7, 1, 'Boleta', '0091', '000', '2023-03-28 00:00:00', '0.00', NULL, NULL, '3.00', 'Aceptado'),
(24, 7, 1, 'Boleta', '0091', '000', '2023-03-28 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(25, 6, 1, 'Boleta', '0091', '000', '2023-03-28 00:00:00', '0.00', NULL, NULL, '4.00', 'Aceptado'),
(26, 7, 1, 'Boleta', '0091', '000', '2023-03-28 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(27, 6, 1, 'Boleta', '0091', '111', '2023-03-28 00:00:00', '0.00', NULL, NULL, '3.00', 'Aceptado'),
(28, 7, 1, 'Boleta', '00', '000', '2023-03-28 00:00:00', '0.00', NULL, NULL, '3.00', 'Aceptado'),
(29, 6, 1, 'Boleta', '001', '000', '2023-03-28 00:00:00', '0.00', NULL, NULL, '3.00', 'Aceptado'),
(30, 7, 1, 'Boleta', '0091', '000', '2023-03-28 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(31, 6, 1, 'Boleta', '000', '000', '2023-03-30 00:00:00', '0.00', NULL, NULL, '3.00', 'Aceptado'),
(32, 7, 1, 'Boleta', '000', '00', '2023-03-30 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(33, 7, 1, 'Boleta', '00', '00', '2023-03-30 00:00:00', '0.00', NULL, NULL, '1.00', 'Aceptado'),
(34, 6, 1, 'Factura', '31233', '132312', '2023-04-03 00:00:00', '18.00', NULL, NULL, '24.00', 'Aceptado'),
(35, 2, 1, 'Boleta', '1', '1', '2023-04-03 00:00:00', '0.00', NULL, NULL, '10.00', 'Aceptado'),
(36, 8, 1, 'Boleta', '13', '21', '2023-04-03 00:00:00', '0.00', NULL, NULL, '5.00', 'Aceptado'),
(37, 8, 1, 'Factura', '1212', '1212', '2023-04-25 00:00:00', '18.00', NULL, NULL, '400.00', 'Aceptado'),
(38, 8, 1, 'Factura', '1212', '12122', '2023-04-21 00:00:00', '18.00', NULL, NULL, '10.00', 'Aceptado'),
(39, 8, 1, 'Boleta', '', '879789', '2023-04-03 00:00:00', '0.00', NULL, NULL, '2370.00', 'Aceptado'),
(40, 8, 1, 'Boleta', '1', '1', '2023-04-04 00:00:00', '0.00', NULL, NULL, '500.00', 'Aceptado'),
(41, 6, 1, 'Boleta', '000', '000', '2023-04-04 00:00:00', '0.00', NULL, NULL, '2.00', 'Aceptado'),
(42, 7, 1, 'Boleta', '000', '000', '2023-04-10 00:00:00', '0.00', NULL, NULL, '1.00', 'Aceptado'),
(43, 8, 5, 'Boleta', '2', '7', '2023-04-16 00:00:00', '0.00', NULL, NULL, '0.50', 'Aceptado'),
(44, 8, 5, 'Boleta', '2', '7', '2023-04-16 00:00:00', '0.00', NULL, NULL, '0.90', 'Aceptado'),
(45, 8, 5, 'Boleta', '2', '7', '2023-04-16 00:00:00', '0.00', NULL, NULL, '0.90', 'Aceptado'),
(46, 8, 5, 'Boleta', '2', '7', '2023-04-16 00:00:00', '0.00', NULL, NULL, '0.50', 'Aceptado'),
(47, 8, 5, 'Boleta', '2', '7', '2023-04-16 00:00:00', '0.00', NULL, NULL, '1.99', 'Aceptado'),
(48, 8, 5, 'Boleta', '2', '7', '2023-04-16 00:00:00', '0.00', NULL, NULL, '2.97', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE `moneda` (
  `idmoneda` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `simbolo` varchar(45) NOT NULL,
  `codigo` varchar(5) NOT NULL,
  `pais_referencia` varchar(100) DEFAULT NULL,
  `num` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`idmoneda`, `descripcion`, `simbolo`, `codigo`, `pais_referencia`, `num`) VALUES
(1, 'Nuevo Sol', 'S/.', 'PEN', 'PERU', '604');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo_documento`
--

CREATE TABLE `motivo_documento` (
  `idmotivo_documento` int(11) NOT NULL,
  `codigo_motivo` varchar(5) NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `motivo_documento`
--

INSERT INTO `motivo_documento` (`idmotivo_documento`, `codigo_motivo`, `motivo`, `descripcion`) VALUES
(1, '01', 'Anulación de la operación', NULL),
(2, '02', 'Anulación por error en el RUC', NULL),
(3, '03', 'Corrección por error  en la descripcion', NULL),
(4, '04', 'Descuento  global', NULL),
(5, '05', 'Descuento por Item', NULL),
(6, '06', 'Devolución  total', NULL),
(7, '07', 'Devolución parcial', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notacredito`
--

CREATE TABLE `notacredito` (
  `idnota_credito` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  `correccion_descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notacredito`
--

INSERT INTO `notacredito` (`idnota_credito`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`, `correccion_descripcion`) VALUES
(1, 15, 683, 5, '4.20', '0.00', ''),
(2, 22, 683, 5, '4.20', '3.20', ''),
(3, 22, 683, 3, '4.20', '1.50', ''),
(4, 23, 683, 5, '4.20', '2.00', ''),
(5, 25, 683, 3, '4.20', '0.00', ''),
(6, 26, 683, 2, '4.20', '0.30', ''),
(7, 27, 683, 3, '4.20', '0.00', ''),
(8, 28, 683, 3, '4.20', '0.00', ''),
(9, 29, 683, 5, '4.20', '2.00', ''),
(10, 30, 683, 5, '4.20', '2.00', ''),
(11, 31, 683, 5, '4.20', '3.20', ''),
(12, 31, 683, 3, '4.20', '1.50', ''),
(13, 32, 683, 3, '4.20', '0.00', ''),
(14, 33, 683, 45, '4.20', '2.00', ''),
(15, 34, 683, 5, '4.20', '3.20', ''),
(16, 34, 683, 3, '4.20', '1.50', ''),
(17, 35, 683, 3, '4.20', '1.80', ''),
(18, 35, 683, 2, '4.20', '0.90', ''),
(19, 36, 683, 3, '4.20', '0.00', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idpago` int(11) NOT NULL,
  `idingreso` int(11) NOT NULL,
  `valor_cuota` decimal(10,2) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idpago`, `idingreso`, `valor_cuota`, `fecha_pago`, `estado`) VALUES
(1, 16, '400.00', '2019-10-16 00:00:00', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL,
  `razon_social` varchar(200) NOT NULL,
  `nombre_comercial` varchar(100) DEFAULT NULL,
  `ruc` varchar(45) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `distrito` varchar(50) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `codigo_postal` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL,
  `logo` varchar(256) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `ubigeo` varchar(45) DEFAULT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  `direccion2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`idperfil`, `razon_social`, `nombre_comercial`, `ruc`, `direccion`, `distrito`, `provincia`, `departamento`, `codigo_postal`, `telefono`, `email`, `logo`, `pais`, `ubigeo`, `ubicacion`, `direccion2`) VALUES
(1, 'Soluciones Integrales JB SAC', 'soluciones integrales jb sac', '10410697551', 'Lopez de Zuñiga N°  254', 'Chancay', 'Huaral', 'Huaral', '15131', '996720630', 'wilderjulca@solucionesintegralesjb.com', 'sijb.png', 'Perú', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Almacen'),
(3, 'Compras'),
(4, 'Ventas'),
(5, 'Acesso'),
(6, 'Consulta Compras'),
(7, 'Consulta Ventas'),
(8, 'Administracion'),
(9, 'Configuracion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `razon_social` varchar(256) DEFAULT NULL,
  `puntos` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `razon_social`, `puntos`) VALUES
(1, 'Cliente', 'JULCA BRONCANO WILDER FLORENTINO', 'RUC', '10410697551', '-', '575757', '', 'JULCA BRONCANO WILDER FLORENTINO', 489),
(2, 'Proveedor', 'asdasd', 'DNI', '99999999', '', '', '', '', 0),
(3, 'Cliente', 'Soluciones Integrales JB SAC', 'RUC', '10410697551', 'Lopez de Zuñiga N°  254', '996720630', 'wilderjulca@solucionesintegralesjb.com', 'Wilder Florenitno Julca Broncano', 15),
(4, 'Cliente', 'JULCA BRONCANO WILDER FLORENTINO', 'RUC', '10410697551', '-', '', '', 'JULCA BRONCANO WILDER FLORENTINO', 6),
(5, 'Cliente', 'Wilder Florentino Julca Broncano', 'DNI', '41069755', 'Calle Luis Alberto De Las Casas', '996720630', 'wilderjulca@solucionesintegralesjb.com', '', 190),
(6, 'Proveedor', 'Proveedor Test 1', 'DNI', '000000000000', 'Direccion Test 1', '', '', '', 0),
(7, 'Proveedor', 'Proveedor Test 2', 'DNI', '000000000', 'Direccion Test 2', '', '', '', 0),
(8, 'Proveedor', 'CREAR EJEMPLOS PE', 'DNI', '8794512', 'TU CASA', '98765423', 'TUCASA@GMAIL.COM', '78987945', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `puntos` int(11) DEFAULT '0',
  `condicion` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `codigo`, `stock`, `puntos`, `condicion`) VALUES
(2, 'SUPERTEC S.A.C.', '11111', 11, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proforma`
--

CREATE TABLE `proforma` (
  `idproforma` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `correlativo` varchar(10) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `tipo_proforma` varchar(20) NOT NULL,
  `igv_total` decimal(11,2) NOT NULL,
  `total_venta` decimal(9,2) NOT NULL,
  `fecha_hora` date NOT NULL,
  `estado` varchar(20) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proforma`
--

INSERT INTO `proforma` (`idproforma`, `idusuario`, `idcliente`, `correlativo`, `referencia`, `tipo_proforma`, `igv_total`, `total_venta`, `fecha_hora`, `estado`) VALUES
(1, 2, 3, '', '', 'servicios', '0.36', '2.36', '2020-02-04', 'AceptadoP'),
(2, 2, 3, '', '', 'productos', '0.36', '2.36', '2020-02-04', 'AceptadoP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos`
--

CREATE TABLE `puntos` (
  `id_puntos` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `serie` varchar(4) NOT NULL,
  `correlativo` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  `total_puntos_descontados` int(11) NOT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `puntos`
--

INSERT INTO `puntos` (`id_puntos`, `idcliente`, `idusuario`, `serie`, `correlativo`, `fecha`, `total_puntos_descontados`, `estado`) VALUES
(3, 1, 5, 'PT01', '00000001', '2023-05-14', 2, 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soporte`
--

CREATE TABLE `soporte` (
  `idsoporte` int(15) NOT NULL,
  `nombre_cliente` varchar(50) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `fecha_ingreso` varchar(50) DEFAULT NULL,
  `fecha_salida` varchar(50) DEFAULT NULL,
  `tecnico_respon` varchar(100) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `problema` varchar(100) DEFAULT NULL,
  `solucion` varchar(100) DEFAULT NULL,
  `tipo_equipo` varchar(100) DEFAULT NULL,
  `codigo_soporte` varchar(50) NOT NULL,
  `estado_entrega` varchar(20) NOT NULL,
  `estado_servicio` varchar(20) NOT NULL,
  `estado_pago` varchar(20) NOT NULL,
  `total` int(20) NOT NULL,
  `cuota` int(20) NOT NULL,
  `saldo` int(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `accesorio` varchar(200) NOT NULL,
  `recomendacion` varchar(50) NOT NULL,
  `garantia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_comprobante`
--

CREATE TABLE `tipo_comprobante` (
  `codigotipo_comprobante` int(11) NOT NULL,
  `descripcion_tipo_comprobante` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_comprobante`
--

INSERT INTO `tipo_comprobante` (`codigotipo_comprobante`, `descripcion_tipo_comprobante`) VALUES
(1, 'Factura'),
(3, 'Boleta de Venta'),
(7, 'Nota de Credito'),
(8, 'Guia de Remisión Remitente'),
(10, 'Cotizacion'),
(11, 'Credito'),
(12, 'Ticket'),
(13, 'Prestamo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `codigotipo_pago` int(11) NOT NULL,
  `descripcion_tipo_pago` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`codigotipo_pago`, `descripcion_tipo_pago`) VALUES
(1, 'Contado'),
(2, 'Credito'),
(3, 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_venta_articulo`
--

CREATE TABLE `tipo_venta_articulo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_venta_articulo`
--

INSERT INTO `tipo_venta_articulo` (`id`, `descripcion`, `estado`) VALUES
(1, 'Venta con receta médica', 1),
(2, 'Venta sin receta médica', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte`
--

CREATE TABLE `transporte` (
  `idtansporte` int(11) NOT NULL,
  `idvehiculo` int(11) NOT NULL,
  `direccion_partida` varchar(200) NOT NULL,
  `direccion_llegada` varchar(200) NOT NULL,
  `hora_salida` datetime NOT NULL,
  `hora_llegada` datetime DEFAULT NULL,
  `condicion` varchar(45) DEFAULT NULL,
  `motivo_traslado` varchar(200) DEFAULT NULL,
  `unidad_medida_peso_bruto` varchar(20) DEFAULT NULL,
  `ubigeo_partida` varchar(45) DEFAULT NULL,
  `ubigeo_llegada` varchar(45) DEFAULT NULL,
  `modalidad_traslado` varchar(25) DEFAULT NULL,
  `idguia_remision` int(11) DEFAULT NULL,
  `iddestinatario` int(11) DEFAULT NULL,
  `idarticulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_ubicacion` int(11) NOT NULL,
  `almacen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id_ubicacion`, `almacen`) VALUES
(1, 'Anaquel 1'),
(2, 'Anaquel 2'),
(3, 'Anaquel 3'),
(4, 'Vitrina'),
(5, 'Almacen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `incentivo_total` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `condicion`, `incentivo_total`) VALUES
(1, 'Soluciones Integrales', 'RUC', '10410697551', 'Lopez de Zuñiga N° 254 Chancay', '996720630', 'ventas@solucionesintegralesjb.com', 'Administrador', 'admin1', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1580835465.png', 1, '76.50'),
(2, 'Wilder Julca  Broncano', 'DNI', '41069755', 'Lopez de Zuñiga N° 254', '996720630', 'wilderjulca@solucionesintegralesjb.com', 'Administrador', 'julca', '76aee384f4ad1938f1d7e370dd102cf4e731870a0610a147eb8367d600fcb69c', '1580835510.png', 1, '1.60'),
(4, 'Trakoma20', 'RUC', '10410697551', 'Lopez de Zuñiga N° 254 Chancay', '996720630', 'david@123.com', 'Administrador', 'admin2', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '', 1, NULL),
(5, 'Boquena', 'DNI', '10410697551', '', '996720630', '', 'Administrador', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '', 1, '0.00'),
(9, 'Test4', 'DNI', '123', '', '', '', 'Administrador', 'test4', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '', 1, NULL),
(10, 'Test5', 'RUC', '123', '', '', '', 'Administrador', 'test5', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '', 1, NULL),
(11, 'Test6', 'DNI', '123', '', '', '', 'Administrador', 'test6', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '', 1, NULL),
(12, 'Test7', 'DNI', '123', '', '123', '', 'Administrador', 'test7', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '', 1, NULL),
(13, 'test-1', 'DNI', '123', '', '', '', 'Administrador', 'test-1', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '', 1, NULL),
(14, 'test-2', 'DNI', '123', '', '', '', 'Administrador', 'test-2', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '', 1, NULL),
(16, 'test9', 'DNI', '1', '', '', '', '', 'test9', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '', 1, NULL),
(17, 'test10', 'DNI', '1', '', '', '', 'Administrador', 'test10', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '', 1, NULL),
(24, 'PARACETAMOL', 'DNI', '78732633', 'PRIMERO DE MAYO MZ J LT 02', '932536464', 'admin@gmial.com', 'Administrador', 'Ruben', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(83, 3, 1),
(84, 3, 2),
(85, 3, 4),
(86, 3, 10),
(120, 5, 1),
(121, 5, 2),
(122, 5, 3),
(123, 5, 4),
(124, 5, 6),
(125, 5, 7),
(126, 5, 8),
(127, 5, 9),
(128, 5, 10),
(129, 5, 11),
(141, 2, 1),
(142, 2, 2),
(143, 2, 3),
(144, 2, 4),
(145, 2, 5),
(146, 2, 6),
(147, 2, 7),
(148, 2, 8),
(149, 2, 9),
(150, 2, 10),
(151, 2, 11),
(166, 0, 1),
(167, 5, 1),
(168, 5, 2),
(169, 5, 3),
(170, 5, 4),
(171, 5, 5),
(172, 5, 6),
(173, 5, 7),
(174, 6, 1),
(175, 7, 1),
(176, 7, 2),
(177, 8, 1),
(178, 8, 2),
(179, 8, 3),
(180, 9, 1),
(181, 9, 2),
(182, 9, 3),
(183, 9, 4),
(184, 10, 1),
(185, 10, 2),
(186, 10, 3),
(187, 10, 4),
(188, 10, 5),
(189, 11, 1),
(190, 11, 2),
(191, 11, 3),
(192, 11, 4),
(193, 11, 5),
(194, 11, 6),
(195, 12, 1),
(196, 12, 2),
(197, 12, 3),
(198, 12, 4),
(199, 12, 5),
(200, 12, 6),
(201, 12, 7),
(202, 13, 1),
(203, 13, 2),
(204, 13, 3),
(205, 13, 4),
(206, 13, 5),
(207, 13, 6),
(208, 13, 7),
(209, 14, 1),
(210, 14, 2),
(211, 14, 3),
(226, 15, 1),
(227, 15, 2),
(228, 15, 3),
(229, 15, 4),
(230, 15, 5),
(231, 15, 6),
(232, 16, 1),
(233, 16, 2),
(234, 16, 3),
(235, 16, 4),
(236, 16, 6),
(237, 16, 8),
(238, 16, 10),
(239, 17, 1),
(240, 17, 2),
(241, 17, 3),
(242, 17, 4),
(243, 17, 7),
(244, 17, 8),
(245, 17, 10),
(253, 4, 1),
(254, 4, 2),
(255, 4, 3),
(256, 4, 4),
(257, 4, 7),
(258, 4, 8),
(259, 4, 10),
(293, 18, 1),
(294, 18, 2),
(295, 18, 3),
(296, 18, 4),
(297, 18, 5),
(298, 18, 6),
(299, 18, 7),
(300, 18, 8),
(301, 18, 9),
(302, 19, 1),
(303, 0, 1),
(304, 0, 2),
(305, 0, 1),
(306, 0, 2),
(307, 22, 1),
(308, 22, 2),
(309, 23, 1),
(310, 23, 2),
(311, 23, 3),
(312, 23, 4),
(313, 23, 5),
(314, 23, 6),
(315, 23, 7),
(316, 23, 8),
(317, 23, 9),
(318, 24, 1),
(319, 24, 2),
(320, 24, 3),
(321, 0, 1),
(322, 0, 2),
(323, 26, 1),
(324, 26, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valor_cambio`
--

CREATE TABLE `valor_cambio` (
  `idvalor_cambio` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `valor_compra` decimal(4,3) NOT NULL,
  `valor_venta` decimal(4,3) NOT NULL,
  `idmoneda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `idvehiculo` int(11) NOT NULL,
  `idconductor` int(11) NOT NULL,
  `placa` varchar(45) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `soat` varchar(80) DEFAULT NULL,
  `marca` varchar(45) NOT NULL,
  `idempresa_transportista` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `codigotipo_comprobante` int(11) NOT NULL,
  `serie` varchar(4) NOT NULL,
  `correlativo` varchar(8) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `impuesto` decimal(4,2) DEFAULT NULL,
  `op_gravadas` decimal(11,2) DEFAULT NULL,
  `op_inafectas` decimal(11,2) DEFAULT NULL,
  `op_exoneradas` decimal(11,2) DEFAULT NULL,
  `op_gratuitas` decimal(11,2) DEFAULT NULL,
  `isc` decimal(11,2) DEFAULT NULL,
  `total_descuentos` decimal(11,2) NOT NULL,
  `total_igv` decimal(11,2) NOT NULL,
  `total_venta` decimal(11,2) NOT NULL,
  `leyenda` varchar(255) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `idmotivo_doc` int(11) DEFAULT NULL,
  `sustento` varchar(200) DEFAULT NULL,
  `doc_relacionado` int(11) DEFAULT NULL,
  `codigotipo_pago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `idcliente`, `idusuario`, `codigotipo_comprobante`, `serie`, `correlativo`, `fecha_hora`, `impuesto`, `op_gravadas`, `op_inafectas`, `op_exoneradas`, `op_gratuitas`, `isc`, `total_descuentos`, `total_igv`, `total_venta`, `leyenda`, `estado`, `idmoneda`, `idmotivo_doc`, `sustento`, `doc_relacionado`, `codigotipo_pago`) VALUES
(1, 1, 1, 3, 'B001', '00000001', '2020-01-31 21:50:36', '18.00', '158.47', '0.00', '0.00', '0.00', '0.00', '2.00', '28.53', '187.00', 'CIENTO OCHENTA Y SIETE  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(2, 1, 1, 3, 'B001', '00000002', '2020-01-31 21:51:06', '18.00', '20.68', '0.00', '0.00', '0.00', '0.00', '5.00', '3.72', '24.40', 'VEINTICUATRO  Y 40/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(3, 1, 1, 3, 'B001', '00000003', '2020-01-31 21:52:09', '18.00', '53.39', '0.00', '0.00', '0.00', '0.00', '0.00', '9.61', '63.00', 'SESENTA Y TRES  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(4, 1, 1, 3, 'B001', '00000004', '2020-02-01 00:08:41', '18.00', '17.26', '0.00', '0.00', '0.00', '0.00', '0.63', '3.11', '20.37', 'VEINTE  Y 37/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(5, 1, 1, 3, 'B001', '00000005', '2020-02-01 00:25:58', '18.00', '34.41', '0.00', '0.00', '0.00', '0.00', '1.40', '6.19', '40.60', 'CUARENTA  Y 60/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(7, 1, 1, 3, 'B001', '00000007', '2020-02-01 16:42:27', '18.00', '140.51', '0.00', '0.00', '0.00', '0.00', '2.20', '25.29', '165.80', 'CIENTO SESENTA Y CINCO  Y 80/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(8, 1, 1, 3, 'B001', '00000008', '2020-02-01 17:05:18', '18.00', '42.20', '0.00', '0.00', '0.00', '0.00', '0.60', '7.60', '49.80', 'CUARENTA Y NUEVE  Y 80/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(9, 1, 1, 3, 'B001', '00000009', '2020-02-02 00:29:43', '18.00', '20.34', '0.00', '0.00', '0.00', '0.00', '1.20', '3.66', '24.00', 'VEINTICUATRO  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(11, 1, 1, 3, 'B001', '00000011', '2020-02-02 00:48:11', '18.00', '142.37', '0.00', '0.00', '0.00', '0.00', '0.00', '25.63', '168.00', 'CIENTO SESENTA Y OCHO  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(12, 1, 1, 3, 'B001', '00000012', '2020-02-02 00:52:59', '18.00', '142.37', '0.00', '0.00', '0.00', '0.00', '0.00', '25.63', '168.00', 'CIENTO SESENTA Y OCHO  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(13, 1, 1, 3, 'B001', '00000013', '2020-02-02 01:28:11', '18.00', '17.80', '0.00', '0.00', '0.00', '0.00', '0.00', '3.20', '21.00', 'VEINTIUN  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(14, 1, 1, 3, 'B001', '00000014', '2020-02-02 01:30:14', '18.00', '17.80', '0.00', '0.00', '0.00', '0.00', '0.00', '3.20', '21.00', 'VEINTIUN  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(16, 1, 1, 3, 'B001', '00000015', '2020-02-02 01:32:43', '18.00', '35.59', '0.00', '0.00', '0.00', '0.00', '0.00', '6.41', '42.00', 'CUARENTA Y DOS  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(17, 1, 1, 3, 'B001', '00000016', '2020-02-02 01:37:11', '18.00', '6.86', '0.00', '0.00', '0.00', '0.00', '0.30', '1.24', '8.10', 'OCHO  Y 10/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(18, 1, 1, 3, 'B001', '00000017', '2020-02-02 01:46:46', '18.00', '10.68', '0.00', '0.00', '0.00', '0.00', '0.00', '1.92', '12.60', 'DOCE  Y 60/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(19, 1, 1, 3, 'B001', '00000018', '2020-02-02 01:54:22', '18.00', '16.10', '0.00', '0.00', '0.00', '0.00', '2.00', '2.90', '19.00', 'DIECINUEVE  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(20, 1, 1, 3, 'B001', '00000019', '2020-02-02 02:01:28', '18.00', '24.49', '0.00', '0.00', '0.00', '0.00', '4.70', '4.41', '28.90', 'VEINTIOCHO  Y 90/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(21, 1, 1, 3, 'B001', '00000020', '2020-02-02 02:06:15', '18.00', '15.51', '0.00', '0.00', '0.00', '0.00', '2.70', '2.79', '18.30', 'DIECIOCHO  Y 30/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(24, 1, 1, 1, 'F001', '00000001', '2020-02-02 16:41:55', '18.00', '10.68', '0.00', '0.00', '0.00', '0.00', '0.00', '1.92', '12.60', 'DOCE  Y 60/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(25, 1, 1, 7, 'F001', '00000001', '2020-02-02 16:45:24', '18.00', '10.68', '0.00', '0.00', '0.00', '0.00', '0.00', '1.92', '12.60', 'DOCE  Y 6/100 SOLES', 'AceptadoNC', 1, 1, 'plantita', 24, 0),
(26, 1, 1, 7, 'B001', '00000002', '2020-02-02 17:13:40', '18.00', '6.86', '0.00', '0.00', '0.00', '0.00', '0.00', '1.23', '8.10', 'OCHO  Y 1/100 SOLES', 'AceptadoNC', 1, 1, 'sfsdf', 17, 0),
(27, 1, 1, 7, 'F001', '00000002', '2020-02-02 17:14:03', '18.00', '10.68', '0.00', '0.00', '0.00', '0.00', '0.00', '1.92', '12.60', 'DOCE  Y 6/100 SOLES', 'AceptadoNC', 1, 1, 'dsfsdfsd', 24, 0),
(28, 1, 1, 7, 'F001', '00000003', '2020-02-02 17:14:40', '18.00', '10.68', '0.00', '0.00', '0.00', '0.00', '0.00', '1.92', '12.60', 'DOCE  Y 6/100 SOLES', 'AceptadoNC', 1, 1, 'sdfsdf', 24, 0),
(29, 1, 1, 7, 'B001', '00000004', '2020-02-02 17:14:59', '18.00', '16.10', '0.00', '0.00', '0.00', '0.00', '0.00', '2.84', '19.00', 'DIECINUEVE  Y /100 SOLES', 'AceptadoNC', 1, 1, 'sdfsdf', 19, 0),
(30, 1, 1, 7, 'B001', '00000005', '2020-02-02 17:15:16', '18.00', '16.10', '0.00', '0.00', '0.00', '0.00', '0.00', '2.84', '19.00', 'DIECINUEVE  Y /100 SOLES', 'AceptadoNC', 1, 1, 'sadad', 19, 0),
(31, 1, 1, 7, 'B001', '00000006', '2020-02-02 17:15:30', '18.00', '24.49', '0.00', '0.00', '0.00', '0.00', '0.00', '4.28', '28.90', 'VEINTIOCHO  Y 9/100 SOLES', 'AceptadoNC', 1, 1, 'sadas', 20, 0),
(32, 1, 1, 7, 'F001', '00000007', '2020-02-02 17:15:39', '18.00', '10.68', '0.00', '0.00', '0.00', '0.00', '0.00', '1.92', '12.60', 'DOCE  Y 6/100 SOLES', 'AceptadoNC', 1, 1, 'asdsad', 24, 0),
(33, 1, 1, 7, 'B001', '00000008', '2020-02-02 17:15:56', '18.00', '158.47', '0.00', '0.00', '0.00', '0.00', '0.00', '28.47', '187.00', 'CIENTO OCHENTA Y SIETE  Y /100 SOLES', 'AceptadoNC', 1, 1, 'sadasd', 1, 0),
(34, 1, 1, 7, 'B001', '99999999', '2020-02-02 17:17:15', '18.00', '24.49', '0.00', '0.00', '0.00', '0.00', '0.00', '4.28', '28.90', 'VEINTIOCHO  Y 9/100 SOLES', 'AceptadoNC', 1, 1, 'sfsdf', 20, 0),
(35, 1, 1, 7, 'B002', '00000001', '2023-04-15 23:43:12', '18.00', '15.51', '0.00', '0.00', '0.00', '0.00', '0.00', '2.72', '18.30', 'DIECIOCHO  Y 3/100 SOLES', 'AnuladoNC', 1, 1, 'dssdfsd', 21, 0),
(36, 1, 1, 7, 'F001', '00000002', '2023-04-15 23:43:04', '18.00', '10.68', '0.00', '0.00', '0.00', '0.00', '0.00', '1.92', '12.60', 'DOCE  Y 6/100 SOLES', 'AnuladoNC', 1, 1, 'dssdfsdf', 24, 0),
(37, 1, 1, 3, 'B001', '00000021', '2020-02-02 20:38:20', '18.00', '91.95', '0.00', '0.00', '0.00', '0.00', '4.00', '16.55', '108.50', 'CIENTO OCHO  Y 50/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(38, 1, 1, 3, 'B001', '00000022', '2020-02-02 20:45:09', '18.00', '3.51', '0.00', '0.00', '0.00', '0.00', '0.36', '0.63', '4.14', 'CUATRO  Y 14/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(39, 1, 1, 3, 'B001', '00000023', '2020-02-02 20:48:17', '18.00', '11.38', '0.00', '0.00', '0.00', '0.00', '0.07', '2.05', '13.43', 'TRECE  Y 43/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(40, 1, 1, 3, 'B001', '00000024', '2020-02-02 20:49:01', '18.00', '3.75', '0.00', '0.00', '0.00', '0.00', '0.07', '0.68', '4.43', 'CUATRO  Y 43/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(41, 1, 1, 3, 'B001', '00000025', '2020-02-02 20:49:58', '18.00', '3.78', '0.00', '0.00', '0.00', '0.00', '0.04', '0.68', '4.46', 'CUATRO  Y 46/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(42, 1, 1, 3, 'B001', '00000026', '2020-02-02 20:51:13', '18.00', '3.74', '0.00', '0.00', '0.00', '0.00', '0.09', '0.67', '4.41', 'CUATRO  Y 41/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(43, 1, 1, 3, 'B001', '00000027', '2020-02-02 20:52:55', '18.00', '3.79', '0.00', '0.00', '0.00', '0.00', '0.03', '0.68', '4.47', 'CUATRO  Y 47/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(44, 1, 1, 3, 'B001', '00000028', '2020-02-02 20:53:33', '18.00', '15.24', '0.00', '0.00', '0.00', '0.00', '0.02', '2.74', '17.98', 'DIECISIETE  Y 98/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(45, 1, 1, 3, 'B001', '00000029', '2020-02-02 20:56:47', '18.00', '11.28', '0.00', '0.00', '0.00', '0.00', '0.19', '2.03', '13.31', 'TRECE  Y 31/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(46, 1, 1, 3, 'B001', '00000030', '2020-02-02 22:20:30', '18.00', '8.47', '0.00', '0.00', '0.00', '0.00', '0.00', '1.53', '10.00', 'DIEZ  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(47, 1, 1, 3, 'B001', '00000031', '2020-02-02 22:24:19', '18.00', '13.56', '0.00', '0.00', '0.00', '0.00', '0.00', '2.44', '16.00', 'DIECISEIS  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(48, 1, 1, 3, 'B001', '00000032', '2020-02-02 22:53:23', '18.00', '7.35', '0.00', '0.00', '0.00', '0.00', '0.03', '1.32', '8.67', 'OCHO  Y 67/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(49, 1, 1, 3, 'B001', '00000033', '2020-02-02 22:55:03', '18.00', '9.66', '0.00', '0.00', '0.00', '0.00', '0.00', '1.74', '11.40', 'ONCE  Y 40/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(50, 1, 1, 3, 'B001', '00000034', '2020-02-02 22:57:36', '18.00', '22.54', '0.00', '0.00', '0.00', '0.00', '0.00', '4.06', '26.60', 'VEINTISEIS  Y 60/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(51, 1, 1, 3, 'B001', '00000035', '2020-02-02 22:58:25', '18.00', '15.92', '0.00', '0.00', '0.00', '0.00', '0.22', '2.86', '18.78', 'DIECIOCHO  Y 78/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(52, 1, 1, 3, 'B001', '00000036', '2020-02-02 22:59:28', '18.00', '15.07', '0.00', '0.00', '0.00', '0.00', '1.22', '2.71', '17.78', 'DIECISIETE  Y 78/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(53, 1, 1, 3, 'B001', '00000037', '2020-02-02 23:39:20', '18.00', '15.77', '0.00', '0.00', '0.00', '0.00', '0.89', '2.84', '18.61', 'DIECIOCHO  Y 61/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(54, 1, 1, 3, 'B001', '00000038', '2020-02-02 23:41:37', '18.00', '2.88', '0.00', '0.00', '0.00', '0.00', '0.00', '0.52', '3.40', 'TRES  Y 40/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(55, 1, 1, 3, 'B001', '00000039', '2020-02-02 23:43:06', '18.00', '8.31', '0.00', '0.00', '0.00', '0.00', '0.00', '1.49', '9.80', 'NUEVE  Y 80/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(56, 1, 1, 3, 'B001', '00000040', '2020-02-02 23:44:00', '18.00', '1.19', '0.00', '0.00', '0.00', '0.00', '2.00', '0.21', '1.40', 'UN Y 40/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(57, 1, 1, 3, 'B001', '00000041', '2020-02-03 00:35:16', '18.00', '33.28', '0.00', '0.00', '0.00', '0.00', '2.93', '5.99', '39.27', 'TREINTA Y NUEVE  Y 27/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(58, 1, 1, 3, 'B001', '00000042', '2020-02-03 00:36:38', '18.00', '10.59', '0.00', '0.00', '0.00', '0.00', '4.00', '1.91', '12.50', 'DOCE  Y 50/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(59, 1, 1, 3, 'B001', '00000043', '2020-02-03 17:22:32', '18.00', '76.18', '0.00', '0.00', '0.00', '0.00', '0.11', '13.71', '89.89', 'OCHENTA Y NUEVE  Y 89/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(60, 1, 1, 3, 'B001', '00000044', '2020-02-03 17:25:15', '18.00', '13.31', '0.00', '0.00', '0.00', '0.00', '0.30', '2.39', '15.70', 'QUINCE  Y 70/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(61, 1, 1, 3, 'B001', '00000045', '2020-02-03 17:29:37', '18.00', '89.83', '0.00', '0.00', '0.00', '0.00', '0.00', '16.17', '106.00', 'CIENTO SEIS  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(62, 1, 1, 3, 'B001', '00000046', '2020-02-03 17:31:12', '18.00', '76.27', '0.00', '0.00', '0.00', '0.00', '0.00', '13.73', '90.00', 'NOVENTA  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(63, 1, 2, 10, 'C001', '00000001', '2020-02-04 00:00:00', '18.00', '8.47', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10.00', '', 'Cotizado', 1, NULL, NULL, NULL, 0),
(64, 1, 2, 3, 'B001', '00000047', '2020-02-06 17:19:13', '18.00', '4.66', '0.00', '0.00', '0.00', '0.00', '0.00', '0.84', '5.50', 'CINCO  Y 50/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(65, 1, 1, 3, 'B001', '00000048', '2020-02-07 12:04:39', '18.00', '5.51', '0.00', '0.00', '0.00', '0.00', '3.50', '0.99', '6.50', 'SEIS  Y 50/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(66, 4, 1, 1, 'F001', '00000002', '2020-02-08 01:26:52', '18.00', '4.66', '0.00', '0.00', '0.00', '0.00', '0.00', '0.84', '5.50', 'CINCO  Y 50/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(73, 4, 5, 10, 'C001', '00000002', '2023-04-14 05:00:00', '18.00', '12.71', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '15.00', '', 'Cotizado', 1, NULL, NULL, NULL, 0),
(74, 5, 5, 12, 'N001', '00000001', '2023-04-15 16:34:22', '18.00', '8.47', '0.00', '0.00', '0.00', '0.00', '0.00', '1.53', '10.00', 'DIEZ  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(75, 5, 5, 3, 'B001', '00000049', '2023-04-16 23:22:09', '18.00', '8.47', '0.00', '0.00', '0.00', '0.00', '0.00', '1.53', '10.00', 'DIEZ  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(76, 5, 5, 3, 'B001', '00000050', '2023-04-16 23:25:15', '18.00', '8.47', '0.00', '0.00', '0.00', '0.00', '0.00', '1.53', '10.00', 'DIEZ  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(77, 5, 5, 3, 'B001', '00000051', '2023-04-17 00:33:19', '18.00', '16.98', '0.00', '0.00', '0.00', '0.00', '0.00', '3.06', '20.04', 'VEINTE  Y 04/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 0),
(78, 3, 5, 3, 'B001', '00000052', '2023-04-25 22:41:09', '18.00', '12.71', '0.00', '0.00', '0.00', '0.00', '0.00', '2.29', '15.00', 'QUINCE  Y 00/100 SOLES', 'Aceptado', 1, NULL, NULL, NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`idarticulo`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  ADD KEY `fk_articulo_categoria_idx` (`idcategoria`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `confidencial`
--
ALTER TABLE `confidencial`
  ADD PRIMARY KEY (`idconfidencial`),
  ADD KEY `confidencial_persona_fk` (`idpersona`),
  ADD KEY `confidencial_usuario_fk` (`idusuario`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`idcotizacion`),
  ADD KEY `fk_cotizacion_idventa_idx` (`idventa`),
  ADD KEY `fk_cotizacion_idarticulo_idx` (`idarticulo`);

--
-- Indices de la tabla `desarrollo`
--
ALTER TABLE `desarrollo`
  ADD PRIMARY KEY (`idsoporte`);

--
-- Indices de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD PRIMARY KEY (`iddetalle_ingreso`),
  ADD KEY `fk_detalle_ingreso_ingreso_idx` (`idingreso`),
  ADD KEY `fk_detalle_ingreso_articulo_idx` (`idarticulo`);

--
-- Indices de la tabla `detalle_proforma`
--
ALTER TABLE `detalle_proforma`
  ADD PRIMARY KEY (`iddetalle_proforma`),
  ADD KEY `fk_detalle_proforma_proforma` (`idproforma`);

--
-- Indices de la tabla `detalle_puntos`
--
ALTER TABLE `detalle_puntos`
  ADD PRIMARY KEY (`id_detalle_puntos`),
  ADD KEY `fk_detalle_puntos` (`id_puntos`),
  ADD KEY `fk_detalle_productos` (`id_producto`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`iddetalle_venta`),
  ADD KEY `fk_detalle_venta_venta_idx` (`idventa`),
  ADD KEY `fk_detalle_venta_articulo_idx` (`idarticulo`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`idingreso`),
  ADD KEY `fk_ingreso_persona_idx` (`idproveedor`),
  ADD KEY `fk_ingreso_usuario_idx` (`idusuario`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`idmoneda`);

--
-- Indices de la tabla `motivo_documento`
--
ALTER TABLE `motivo_documento`
  ADD PRIMARY KEY (`idmotivo_documento`);

--
-- Indices de la tabla `notacredito`
--
ALTER TABLE `notacredito`
  ADD PRIMARY KEY (`idnota_credito`),
  ADD KEY `fk_notaCredito_venta_idx` (`idventa`),
  ADD KEY `fk_notaCredito_articulo_idx` (`idarticulo`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idpago`),
  ADD KEY `FK_pago_ingreso` (`idingreso`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idperfil`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proforma`
--
ALTER TABLE `proforma`
  ADD PRIMARY KEY (`idproforma`),
  ADD KEY `fk_proforma_usuario` (`idusuario`),
  ADD KEY `fk_proforma_persona` (`idcliente`);

--
-- Indices de la tabla `puntos`
--
ALTER TABLE `puntos`
  ADD PRIMARY KEY (`id_puntos`),
  ADD KEY `fk_puntos_usuario` (`idusuario`),
  ADD KEY `fk_puntos_persona` (`idcliente`);

--
-- Indices de la tabla `soporte`
--
ALTER TABLE `soporte`
  ADD PRIMARY KEY (`idsoporte`);

--
-- Indices de la tabla `tipo_comprobante`
--
ALTER TABLE `tipo_comprobante`
  ADD PRIMARY KEY (`codigotipo_comprobante`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`codigotipo_pago`);

--
-- Indices de la tabla `tipo_venta_articulo`
--
ALTER TABLE `tipo_venta_articulo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transporte`
--
ALTER TABLE `transporte`
  ADD PRIMARY KEY (`idtansporte`),
  ADD KEY `fk_transporte_vehiculo_idx` (`idvehiculo`),
  ADD KEY `fk_transporte_persona_idx` (`iddestinatario`),
  ADD KEY `fk_transporte_articulo_idx` (`idarticulo`),
  ADD KEY `fk_transporte_guia_remision_idx` (`idguia_remision`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_ubicacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- Indices de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`idusuario_permiso`),
  ADD KEY `fk_usuario_permiso_permiso_idx` (`idpermiso`),
  ADD KEY `fk_usuario_permiso_usuario_idx` (`idusuario`);

--
-- Indices de la tabla `valor_cambio`
--
ALTER TABLE `valor_cambio`
  ADD PRIMARY KEY (`idvalor_cambio`),
  ADD KEY `fk_valor_cambio_moneda_idx` (`idmoneda`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`idvehiculo`),
  ADD KEY `fk_idconductor_idx` (`idconductor`),
  ADD KEY `fk_vehiculo_empresa_transportista_idx` (`idempresa_transportista`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `fk_venta_persona_idx` (`idcliente`),
  ADD KEY `fk_venta_usuario_idx` (`idusuario`),
  ADD KEY `fk_venta_codigotipo_comp_idx` (`codigotipo_comprobante`),
  ADD KEY `fk_venta_moneda_idx` (`idmoneda`),
  ADD KEY `fk_venta_motivo_idx` (`idmotivo_doc`),
  ADD KEY `fk_venta_doc_relacionado_idx` (`doc_relacionado`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `idarticulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=709;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `confidencial`
--
ALTER TABLE `confidencial`
  MODIFY `idconfidencial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `idcotizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `desarrollo`
--
ALTER TABLE `desarrollo`
  MODIFY `idsoporte` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  MODIFY `iddetalle_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `detalle_proforma`
--
ALTER TABLE `detalle_proforma`
  MODIFY `iddetalle_proforma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_puntos`
--
ALTER TABLE `detalle_puntos`
  MODIFY `id_detalle_puntos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `idingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
  MODIFY `idmoneda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `motivo_documento`
--
ALTER TABLE `motivo_documento`
  MODIFY `idmotivo_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `notacredito`
--
ALTER TABLE `notacredito`
  MODIFY `idnota_credito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idperfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proforma`
--
ALTER TABLE `proforma`
  MODIFY `idproforma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `puntos`
--
ALTER TABLE `puntos`
  MODIFY `id_puntos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `soporte`
--
ALTER TABLE `soporte`
  MODIFY `idsoporte` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `codigotipo_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_venta_articulo`
--
ALTER TABLE `tipo_venta_articulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `transporte`
--
ALTER TABLE `transporte`
  MODIFY `idtansporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;

--
-- AUTO_INCREMENT de la tabla `valor_cambio`
--
ALTER TABLE `valor_cambio`
  MODIFY `idvalor_cambio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `idvehiculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
