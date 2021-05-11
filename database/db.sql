-- phpMyAdmin SQL Dump
-- version 5.0.4deb2~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 11 mai 2021 à 22:51
-- Version du serveur :  10.3.27-MariaDB-0+deb10u1
-- Version de PHP : 7.3.27-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sectionnement`
--
CREATE DATABASE IF NOT EXISTS `sectionnement` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `sectionnement`;

-- --------------------------------------------------------

--
-- Structure de la table `appartenance_matiere`
--

CREATE TABLE `appartenance_matiere` (
  `id_matiere` int(11) NOT NULL,
  `id_sous_matiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `appartenance_matiere`
--

INSERT INTO `appartenance_matiere` (`id_matiere`, `id_sous_matiere`) VALUES
(1, 30),
(2, 31),
(3, 32),
(4, 33),
(5, 34),
(6, 35),
(7, 36),
(8, 37),
(9, 38),
(10, 39),
(11, 44),
(12, 45),
(13, 46),
(14, 47),
(15, 48),
(16, 42),
(17, 2),
(18, 12),
(19, 13),
(20, 14),
(21, 15),
(22, 16),
(22, 17),
(22, 18),
(22, 19),
(22, 20),
(22, 21),
(24, 22),
(24, 23),
(24, 24),
(24, 25),
(26, 1),
(28, 3),
(29, 4),
(30, 5),
(31, 6),
(32, 7),
(33, 8),
(34, 9),
(34, 10),
(35, 11),
(36, 43);

-- --------------------------------------------------------

--
-- Structure de la table `choix_etudiants`
--

CREATE TABLE `choix_etudiants` (
  `id_matiere` int(11) NOT NULL,
  `id_etu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `choix_etudiants`
--

INSERT INTO `choix_etudiants` (`id_matiere`, `id_etu`) VALUES
(11, 5),
(11, 8),
(11, 10),
(11, 13),
(11, 14),
(11, 309),
(11, 311),
(11, 312),
(11, 316),
(11, 317),
(11, 319),
(11, 326),
(11, 328),
(11, 329),
(11, 331),
(11, 332),
(11, 334),
(11, 335),
(11, 338),
(11, 339),
(11, 340),
(11, 342),
(11, 347),
(11, 347),
(11, 351),
(11, 354),
(11, 355),
(11, 356),
(11, 360),
(11, 362),
(11, 372),
(11, 374),
(11, 376),
(11, 378),
(11, 379),
(11, 380),
(11, 381),
(11, 383),
(11, 389),
(11, 390),
(11, 392),
(11, 393),
(11, 395),
(11, 396),
(11, 397),
(11, 398),
(12, 7),
(12, 16),
(12, 18),
(12, 299),
(12, 300),
(12, 302),
(12, 304),
(12, 306),
(12, 307),
(12, 310),
(12, 313),
(12, 314),
(12, 315),
(12, 318),
(12, 321),
(12, 322),
(12, 323),
(12, 324),
(12, 325),
(12, 332),
(12, 336),
(12, 337),
(12, 345),
(12, 346),
(12, 352),
(12, 353),
(12, 359),
(12, 361),
(12, 365),
(12, 368),
(12, 370),
(12, 371),
(12, 385),
(12, 399),
(13, 5),
(13, 302),
(13, 306),
(13, 307),
(13, 310),
(13, 312),
(13, 316),
(13, 317),
(13, 319),
(13, 321),
(13, 322),
(13, 323),
(13, 324),
(13, 326),
(13, 328),
(13, 331),
(13, 335),
(13, 338),
(13, 339),
(13, 356),
(13, 374),
(13, 376),
(13, 378),
(13, 379),
(13, 380),
(13, 381),
(13, 389),
(13, 390),
(13, 392),
(13, 393),
(13, 395),
(13, 396),
(13, 397),
(14, 10),
(14, 16),
(14, 18),
(15, 7),
(15, 8),
(15, 13),
(15, 14),
(15, 299),
(15, 300),
(15, 304),
(15, 309),
(15, 311),
(15, 313),
(15, 314),
(15, 315),
(15, 318),
(15, 325),
(15, 329),
(15, 334),
(15, 336),
(15, 337),
(15, 340),
(15, 342),
(15, 345),
(15, 346),
(15, 351),
(15, 352),
(15, 353),
(15, 354),
(15, 355),
(15, 359),
(15, 360),
(15, 361),
(15, 362),
(15, 365),
(15, 368),
(15, 370),
(15, 371),
(15, 372),
(15, 383),
(15, 385),
(15, 398),
(15, 399),
(22, 11),
(22, 12),
(22, 19),
(22, 32),
(22, 35),
(22, 35),
(22, 35),
(22, 35),
(22, 35),
(22, 35),
(22, 40),
(22, 41),
(22, 42),
(22, 43),
(22, 44),
(22, 45),
(22, 47),
(22, 49),
(22, 50),
(22, 51),
(22, 54),
(22, 54),
(22, 55),
(22, 57),
(22, 60),
(22, 66),
(22, 71),
(22, 73),
(22, 74),
(22, 75),
(22, 76),
(22, 78),
(22, 80),
(22, 82),
(22, 83),
(22, 89),
(22, 91),
(22, 92),
(22, 93),
(22, 94),
(22, 97),
(22, 98),
(22, 99),
(22, 101),
(22, 102),
(22, 103),
(22, 103),
(22, 106),
(22, 107),
(22, 109),
(22, 110),
(22, 113),
(22, 116),
(22, 121),
(22, 123),
(22, 124),
(22, 125),
(22, 126),
(22, 127),
(22, 128),
(22, 129),
(22, 130),
(22, 134),
(22, 136),
(22, 143),
(22, 145),
(22, 146),
(22, 147),
(22, 148),
(22, 153),
(22, 154),
(22, 155),
(22, 157),
(22, 158),
(22, 159),
(22, 161),
(22, 162),
(22, 166),
(22, 167),
(22, 172),
(22, 174),
(22, 175),
(22, 177),
(22, 178),
(22, 180),
(22, 181),
(22, 182),
(22, 184),
(22, 185),
(22, 187),
(22, 189),
(22, 190),
(22, 191),
(22, 192),
(22, 193),
(22, 195),
(22, 196),
(22, 197),
(22, 198),
(22, 199),
(22, 200),
(22, 201),
(22, 204),
(22, 205),
(22, 206),
(22, 210),
(22, 211),
(22, 212),
(22, 213),
(22, 214),
(22, 215),
(22, 216),
(22, 217),
(22, 218),
(22, 220),
(22, 221),
(22, 223),
(22, 224),
(22, 225),
(22, 226),
(22, 227),
(22, 229),
(22, 231),
(22, 234),
(22, 235),
(22, 240),
(22, 241),
(22, 242),
(22, 245),
(22, 246),
(22, 249),
(22, 250),
(22, 253),
(22, 253),
(22, 258),
(22, 260),
(22, 262),
(22, 266),
(22, 267),
(22, 271),
(22, 273),
(22, 278),
(22, 282),
(22, 283),
(22, 285),
(22, 286),
(22, 288),
(22, 289),
(22, 290),
(22, 291),
(22, 293),
(22, 294),
(22, 295),
(22, 297),
(23, 17),
(23, 35),
(23, 39),
(23, 63),
(23, 67),
(23, 69),
(23, 70),
(23, 86),
(23, 105),
(23, 108),
(23, 114),
(23, 118),
(23, 120),
(23, 133),
(23, 138),
(23, 139),
(23, 140),
(23, 142),
(23, 144),
(23, 149),
(23, 151),
(23, 152),
(23, 163),
(23, 164),
(23, 165),
(23, 203),
(23, 207),
(23, 209),
(23, 231),
(23, 233),
(23, 238),
(23, 243),
(23, 244),
(23, 248),
(23, 268),
(23, 270),
(23, 279),
(23, 281),
(24, 20),
(24, 21),
(24, 22),
(24, 23),
(24, 24),
(24, 25),
(24, 26),
(24, 26),
(24, 27),
(24, 28),
(24, 29),
(24, 29),
(24, 30),
(24, 31),
(24, 32),
(24, 33),
(24, 34),
(24, 35),
(24, 36),
(24, 37),
(24, 38),
(24, 56),
(24, 58),
(24, 59),
(24, 61),
(24, 62),
(24, 64),
(24, 68),
(24, 72),
(24, 75),
(24, 79),
(24, 81),
(24, 84),
(24, 87),
(24, 88),
(24, 90),
(24, 95),
(24, 96),
(24, 100),
(24, 111),
(24, 112),
(24, 115),
(24, 117),
(24, 119),
(24, 122),
(24, 131),
(24, 132),
(24, 133),
(24, 135),
(24, 137),
(24, 141),
(24, 150),
(24, 150),
(24, 156),
(24, 160),
(24, 168),
(24, 169),
(24, 173),
(24, 173),
(24, 176),
(24, 179),
(24, 183),
(24, 186),
(24, 188),
(24, 188),
(24, 194),
(24, 194),
(24, 208),
(24, 219),
(24, 222),
(24, 228),
(24, 230),
(24, 236),
(24, 237),
(24, 239),
(24, 247),
(24, 251),
(24, 252),
(24, 255),
(24, 256),
(24, 257),
(24, 258),
(24, 261),
(24, 261),
(24, 263),
(24, 264),
(24, 265),
(24, 272),
(24, 272),
(24, 274),
(24, 275),
(24, 276),
(24, 277),
(24, 280),
(24, 284),
(24, 287),
(24, 292),
(24, 296),
(24, 298),
(24, 301),
(24, 303),
(24, 305),
(24, 308),
(24, 320),
(24, 327),
(24, 333),
(24, 343),
(24, 344),
(24, 349),
(24, 350),
(24, 358),
(24, 363),
(24, 364),
(24, 366),
(24, 369),
(24, 373),
(24, 382),
(24, 384),
(24, 386),
(24, 387),
(24, 391),
(24, 394),
(25, 9),
(34, 11),
(34, 12),
(34, 17),
(34, 25),
(34, 26),
(34, 27),
(34, 28),
(34, 30),
(34, 31),
(34, 32),
(34, 32),
(34, 34),
(34, 35),
(34, 35),
(34, 36),
(34, 38),
(34, 40),
(34, 42),
(34, 44),
(34, 45),
(34, 47),
(34, 51),
(34, 54),
(34, 55),
(34, 56),
(34, 64),
(34, 66),
(34, 68),
(34, 69),
(34, 71),
(34, 72),
(34, 74),
(34, 75),
(34, 75),
(34, 78),
(34, 79),
(34, 84),
(34, 86),
(34, 87),
(34, 91),
(34, 94),
(34, 95),
(34, 96),
(34, 97),
(34, 99),
(34, 100),
(34, 102),
(34, 103),
(34, 105),
(34, 106),
(34, 108),
(34, 109),
(34, 117),
(34, 118),
(34, 119),
(34, 121),
(34, 122),
(34, 125),
(34, 126),
(34, 127),
(34, 132),
(34, 133),
(34, 134),
(34, 135),
(34, 136),
(34, 137),
(34, 142),
(34, 143),
(34, 145),
(34, 146),
(34, 147),
(34, 149),
(34, 150),
(34, 153),
(34, 157),
(34, 159),
(34, 161),
(34, 162),
(34, 166),
(34, 167),
(34, 168),
(34, 172),
(34, 173),
(34, 176),
(34, 177),
(34, 178),
(34, 180),
(34, 181),
(34, 182),
(34, 183),
(34, 184),
(34, 187),
(34, 188),
(34, 188),
(34, 190),
(34, 191),
(34, 192),
(34, 194),
(34, 197),
(34, 198),
(34, 200),
(34, 201),
(34, 207),
(34, 208),
(34, 212),
(34, 213),
(34, 215),
(34, 217),
(34, 218),
(34, 220),
(34, 224),
(34, 225),
(34, 227),
(34, 228),
(34, 231),
(34, 231),
(34, 234),
(34, 235),
(34, 238),
(34, 243),
(34, 244),
(34, 247),
(34, 248),
(34, 250),
(34, 252),
(34, 253),
(34, 256),
(34, 258),
(34, 258),
(34, 261),
(34, 263),
(34, 265),
(34, 266),
(34, 272),
(34, 272),
(34, 273),
(34, 275),
(34, 276),
(34, 278),
(34, 280),
(34, 281),
(34, 282),
(34, 283),
(34, 284),
(34, 287),
(34, 290),
(34, 291),
(34, 292),
(34, 293),
(34, 305),
(34, 308),
(34, 320),
(34, 349),
(34, 358),
(34, 363),
(34, 364),
(34, 366),
(34, 373),
(34, 384),
(34, 391),
(34, 394),
(35, 9),
(35, 19),
(35, 20),
(35, 21),
(35, 22),
(35, 23),
(35, 24),
(35, 26),
(35, 29),
(35, 29),
(35, 33),
(35, 35),
(35, 35),
(35, 35),
(35, 35),
(35, 35),
(35, 35),
(35, 37),
(35, 39),
(35, 41),
(35, 43),
(35, 49),
(35, 50),
(35, 54),
(35, 57),
(35, 58),
(35, 59),
(35, 60),
(35, 61),
(35, 62),
(35, 63),
(35, 67),
(35, 70),
(35, 73),
(35, 76),
(35, 80),
(35, 81),
(35, 82),
(35, 83),
(35, 88),
(35, 89),
(35, 90),
(35, 92),
(35, 93),
(35, 98),
(35, 101),
(35, 103),
(35, 107),
(35, 110),
(35, 111),
(35, 112),
(35, 113),
(35, 114),
(35, 115),
(35, 116),
(35, 120),
(35, 123),
(35, 124),
(35, 128),
(35, 129),
(35, 130),
(35, 131),
(35, 133),
(35, 138),
(35, 139),
(35, 140),
(35, 141),
(35, 144),
(35, 148),
(35, 150),
(35, 151),
(35, 152),
(35, 154),
(35, 155),
(35, 156),
(35, 158),
(35, 160),
(35, 163),
(35, 164),
(35, 165),
(35, 169),
(35, 173),
(35, 174),
(35, 175),
(35, 179),
(35, 185),
(35, 186),
(35, 189),
(35, 193),
(35, 194),
(35, 195),
(35, 196),
(35, 199),
(35, 203),
(35, 204),
(35, 205),
(35, 206),
(35, 209),
(35, 210),
(35, 211),
(35, 214),
(35, 216),
(35, 219),
(35, 221),
(35, 222),
(35, 223),
(35, 226),
(35, 229),
(35, 230),
(35, 233),
(35, 236),
(35, 237),
(35, 239),
(35, 240),
(35, 241),
(35, 242),
(35, 245),
(35, 246),
(35, 249),
(35, 251),
(35, 253),
(35, 255),
(35, 257),
(35, 260),
(35, 261),
(35, 262),
(35, 264),
(35, 267),
(35, 268),
(35, 270),
(35, 271),
(35, 274),
(35, 277),
(35, 279),
(35, 285),
(35, 286),
(35, 288),
(35, 289),
(35, 294),
(35, 295),
(35, 296),
(35, 297),
(35, 298),
(35, 301),
(35, 303),
(35, 327),
(35, 333),
(35, 343),
(35, 344),
(35, 350),
(35, 369),
(35, 382),
(35, 386),
(35, 387);

-- --------------------------------------------------------

--
-- Structure de la table `choix_groupe`
--

CREATE TABLE `choix_groupe` (
  `id_etu` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `id_partie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `categorie` enum('NORMAL','DA') COLLATE utf8_bin NOT NULL DEFAULT 'NORMAL',
  `nom` varchar(25) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(25) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `categorie`, `nom`, `prenom`) VALUES
(5, 'NORMAL', 'NTest', 'PTest'),
(7, 'NORMAL', 'NTest', 'PTest'),
(8, 'NORMAL', 'NTest', 'PTest'),
(9, 'NORMAL', 'NTest', 'PTest'),
(10, 'NORMAL', 'NTest', 'PTest'),
(11, 'NORMAL', 'NTest', 'PTest'),
(12, 'NORMAL', 'NTest', 'PTest'),
(13, 'NORMAL', 'NTest', 'PTest'),
(14, 'NORMAL', 'NTest', 'PTest'),
(15, 'NORMAL', 'NTest', 'PTest'),
(16, 'NORMAL', 'NTest', 'PTest'),
(17, 'NORMAL', 'NTest', 'PTest'),
(18, 'NORMAL', 'NTest', 'PTest'),
(19, 'NORMAL', 'NTest', 'PTest'),
(20, 'NORMAL', 'YOSKEI', ' HASSAN Y'),
(21, 'NORMAL', 'Alban', '_'),
(22, 'NORMAL', 'Anass', '_'),
(23, 'NORMAL', 'Dorian', 'BIAGI'),
(24, 'NORMAL', 'Eddy', '_'),
(25, 'NORMAL', 'Elie', 'K'),
(26, 'NORMAL', 'Lucas', 'Phan'),
(27, 'NORMAL', 'Pouet', '_'),
(28, 'NORMAL', 'Aurélien', '_'),
(29, 'NORMAL', 'Alexandre', '_'),
(30, 'NORMAL', 'Léa', 'D'),
(31, 'NORMAL', 'pierre', 'chv'),
(32, 'NORMAL', 'Thomas', '_'),
(33, 'NORMAL', 'Iamhichem', '_'),
(34, 'NORMAL', 'Malak', '_'),
(35, 'NORMAL', '_', '_'),
(36, 'NORMAL', 'Elyyamine', '_'),
(37, 'NORMAL', 'Simon', '_'),
(38, 'NORMAL', 'Thibault', 'F'),
(39, 'NORMAL', 'Fabien', '_'),
(40, 'NORMAL', 'maeve', '_'),
(41, 'NORMAL', 'Maria', '_'),
(42, 'NORMAL', 'Lucas', 'B.'),
(43, 'NORMAL', 'Quentin', 'G'),
(44, 'NORMAL', 'INES', '-'),
(45, 'NORMAL', 'EfoleCharlesHenri', '_'),
(46, 'NORMAL', '_', '_'),
(47, 'NORMAL', 'Moha', '_'),
(48, 'NORMAL', '_', '_'),
(49, 'NORMAL', 'Vivian', '_'),
(50, 'NORMAL', 'Carl', '_'),
(51, 'NORMAL', 'Koya', '_'),
(52, 'NORMAL', '_', '_'),
(53, 'NORMAL', '_', '_'),
(54, 'NORMAL', 'Mathieu', '_'),
(55, 'NORMAL', '@everyone', 'PC2b/CMIPSI'),
(56, 'NORMAL', 'vermouth', '_'),
(57, 'NORMAL', 'abennani', '_'),
(58, 'NORMAL', 'Ablo', '_'),
(59, 'NORMAL', 'adan', '_'),
(60, 'NORMAL', 'adele', '_'),
(61, 'NORMAL', 'Adrien', 'Pons'),
(62, 'NORMAL', 'Alaa', '_'),
(63, 'NORMAL', 'albanprx', '_'),
(64, 'NORMAL', 'Alex413', '_'),
(65, 'NORMAL', 'Alexandre', '_'),
(66, 'NORMAL', 'Ali', 'Abakar'),
(67, 'NORMAL', 'Aline', '_'),
(68, 'NORMAL', 'Almulatham', 'الملثم'),
(69, 'NORMAL', 'Althéa', 'aka'),
(70, 'NORMAL', 'Aly', '_'),
(71, 'NORMAL', 'alyson', '_'),
(72, 'NORMAL', 'Alyssa', '_'),
(73, 'NORMAL', 'amossadek', '_'),
(74, 'NORMAL', 'Anaïs', 'Roumy'),
(75, 'NORMAL', 'Antoine', '_'),
(76, 'NORMAL', 'Antoine', 'Q'),
(77, 'NORMAL', 'Antoine', '_'),
(78, 'NORMAL', 'Armand', 'M.'),
(79, 'NORMAL', 'asma', '_'),
(80, 'NORMAL', 'Assya', '_'),
(81, 'NORMAL', 'Aubin', '_'),
(82, 'NORMAL', 'Auderic', '_'),
(83, 'NORMAL', 'Avit', 'Raphaël'),
(84, 'NORMAL', 'Aya', '_'),
(85, 'NORMAL', '_', '_'),
(86, 'NORMAL', 'Baptiste', 'Briffaud'),
(87, 'NORMAL', 'bast', '_'),
(88, 'NORMAL', 'Belkhiri', 'Med'),
(89, 'NORMAL', 'bidraa', '_'),
(90, 'NORMAL', 'Bixente', '_'),
(91, 'NORMAL', 'blackayou', '_'),
(92, 'NORMAL', 'BlackyChan17', '_'),
(93, 'NORMAL', 'Bobine', '_'),
(94, 'NORMAL', 'bob', '_'),
(95, 'NORMAL', 'bonito', 'flakes'),
(96, 'NORMAL', 'bouba', '_'),
(97, 'NORMAL', 'cams', '_'),
(98, 'NORMAL', 'Cams', '_'),
(99, 'NORMAL', 'Capoo', '_'),
(100, 'NORMAL', 'CARRE', 'Giovanni'),
(101, 'NORMAL', 'charle', '_'),
(102, 'NORMAL', 'Chloé', '_'),
(103, 'NORMAL', 'Cla', '_'),
(104, 'NORMAL', 'Cla', '_'),
(105, 'NORMAL', 'Clara', '_'),
(106, 'NORMAL', 'Clara', 'B'),
(107, 'NORMAL', 'Clement', '_'),
(108, 'NORMAL', 'Clémence', '5a'),
(109, 'NORMAL', 'clément', 'reulier'),
(110, 'NORMAL', 'Coline', '_'),
(111, 'NORMAL', 'Corentin', '-'),
(112, 'NORMAL', 'Cyprien', '_'),
(113, 'NORMAL', 'DaarSii', '_'),
(114, 'NORMAL', 'Delalom', '_'),
(115, 'NORMAL', 'Diallo', 'Thierno'),
(116, 'NORMAL', 'Diel', '_'),
(117, 'NORMAL', 'Diéjo', '_'),
(118, 'NORMAL', 'dona', '_'),
(119, 'NORMAL', 'Dorian', '_'),
(120, 'NORMAL', 'dylan', '_'),
(121, 'NORMAL', 'E\'ouann', 'Tressy'),
(122, 'NORMAL', 'eddy', '_'),
(123, 'NORMAL', 'Eliot', 'le'),
(124, 'NORMAL', 'Elvis', '_'),
(125, 'NORMAL', 'Eléa', '_'),
(126, 'NORMAL', 'Emma', '1A'),
(127, 'NORMAL', 'Emmanuella', '_'),
(128, 'NORMAL', 'enora', '_'),
(129, 'NORMAL', 'Enrique', '_'),
(130, 'NORMAL', 'Enzo', '_'),
(131, 'NORMAL', 'Eorix', '_'),
(132, 'NORMAL', 'Erwan', 'Breton'),
(133, 'NORMAL', 'Erwan', 'Jochault'),
(134, 'NORMAL', 'Estéban', 'Mével'),
(135, 'NORMAL', 'Fano', 'info'),
(136, 'NORMAL', 'Fedores', '_'),
(137, 'NORMAL', 'furkan', '_'),
(138, 'NORMAL', 'Félix', '_'),
(139, 'NORMAL', 'Gabriel', 'Blanchard'),
(140, 'NORMAL', 'Gabriel.V', '_'),
(141, 'NORMAL', 'ghazi', 'bouagila'),
(142, 'NORMAL', 'gomar', '_'),
(143, 'NORMAL', 'gtx', '_'),
(144, 'NORMAL', 'Gulsum', '_'),
(145, 'NORMAL', 'Guy', 'Keny'),
(146, 'NORMAL', 'gwenael', '_'),
(147, 'NORMAL', 'Hafsa', '_'),
(148, 'NORMAL', 'halphee', '_'),
(149, 'NORMAL', 'Harris', '_'),
(150, 'NORMAL', 'Houhou', 'A'),
(151, 'NORMAL', 'Hugo', '_'),
(152, 'NORMAL', 'hugo', '_'),
(153, 'NORMAL', 'Hugo', 'Vincent'),
(154, 'NORMAL', 'ibrahim_hamedD', '_'),
(155, 'NORMAL', 'Ibrahima', 'Bano'),
(156, 'NORMAL', 'Info2A', '_'),
(157, 'NORMAL', 'Joana', 'PC3'),
(158, 'NORMAL', 'Johanne', 'Mathien'),
(159, 'NORMAL', 'Joséphine', '_'),
(160, 'NORMAL', 'Jules', 'Ba'),
(161, 'NORMAL', 'JulesBdt', '_'),
(162, 'NORMAL', 'juliaj', '_'),
(163, 'NORMAL', 'Julie', 'Boulot'),
(164, 'NORMAL', 'Julie', 'Lapalus'),
(165, 'NORMAL', 'Julien', 'M'),
(166, 'NORMAL', 'kennethbal', '_'),
(167, 'NORMAL', 'kilian.g', '_'),
(168, 'NORMAL', 'Killian', '_'),
(169, 'NORMAL', 'KissMySword', '_'),
(170, 'NORMAL', '_', '_'),
(171, 'NORMAL', '_', '_'),
(172, 'NORMAL', 'lil\'b', '_'),
(173, 'NORMAL', 'Linaaa', '_'),
(174, 'NORMAL', 'Lisa', '_'),
(175, 'NORMAL', 'lnsangu', '_'),
(176, 'NORMAL', 'locoloco', '_'),
(177, 'NORMAL', 'Lou', 'M.'),
(178, 'NORMAL', 'Louis-Malo', 'Dousset'),
(179, 'NORMAL', 'Loïc', 'BERTHELOT'),
(180, 'NORMAL', 'lucas', '_'),
(181, 'NORMAL', 'Lucas', 'plns'),
(182, 'NORMAL', 'Lucien', '_'),
(183, 'NORMAL', 'Luckmaker', '_'),
(184, 'NORMAL', 'Lulu', '-'),
(185, 'NORMAL', 'Lysa', '_'),
(186, 'NORMAL', 'Léo', '_'),
(187, 'NORMAL', 'Léo', 'PC3'),
(188, 'NORMAL', 'Majorie', 'Hessou'),
(189, 'NORMAL', 'Malo', '_'),
(190, 'NORMAL', 'Mamadou', 'Bah'),
(191, 'NORMAL', 'Mameth', '8a'),
(192, 'NORMAL', 'manutomatoma', 'kyle'),
(193, 'NORMAL', 'Marc', 'Mrow'),
(194, 'NORMAL', 'Marchoud', 'souhail'),
(195, 'NORMAL', 'Margaux', '_'),
(196, 'NORMAL', 'Marie', 'H'),
(197, 'NORMAL', 'Marie', 'Legrand'),
(198, 'NORMAL', 'Martin', '_'),
(199, 'NORMAL', 'Martouz', '_'),
(200, 'NORMAL', 'Marvin972007', '_'),
(201, 'NORMAL', 'Matheo', '_'),
(202, 'NORMAL', 'Mathieu', '_'),
(203, 'NORMAL', 'Mathis', '_'),
(204, 'NORMAL', 'matls', '_'),
(205, 'NORMAL', 'matthieu', '_'),
(206, 'NORMAL', 'Mattys', '_'),
(207, 'NORMAL', 'Maureen', 'Poupard'),
(208, 'NORMAL', 'Maxence', 'D'),
(209, 'NORMAL', 'Maxime', '-'),
(210, 'NORMAL', 'Maxime', '_'),
(211, 'NORMAL', 'MAËL', '_'),
(212, 'NORMAL', 'Measter', '_'),
(213, 'NORMAL', 'Mehdi', '_'),
(214, 'NORMAL', 'Mehdi', '|'),
(215, 'NORMAL', 'melwa', '_'),
(216, 'NORMAL', 'michee', 'odd'),
(217, 'NORMAL', 'Milad', '_'),
(218, 'NORMAL', 'mobarkall', '_'),
(219, 'NORMAL', 'Mohamed', 'lamine'),
(220, 'NORMAL', 'Morgan', '_'),
(221, 'NORMAL', 'mouad', '_'),
(222, 'NORMAL', 'Moussa', '_'),
(223, 'NORMAL', 'Moutassim', '_'),
(224, 'NORMAL', 'Nada', 'Abbioui'),
(225, 'NORMAL', 'Nathan', '_'),
(226, 'NORMAL', 'Nawres', '_'),
(227, 'NORMAL', 'ngami', 'valerie'),
(228, 'NORMAL', 'Nina', 'Info-2B'),
(229, 'NORMAL', 'noar', '_'),
(230, 'NORMAL', 'Nolan', 'Info'),
(231, 'NORMAL', 'Noé', '_'),
(232, 'NORMAL', 'Noé', '_'),
(233, 'NORMAL', 'Néo', '_'),
(234, 'NORMAL', 'olislds', '_'),
(235, 'NORMAL', 'Olivia', 'M'),
(236, 'NORMAL', 'Orcheï', '_'),
(237, 'NORMAL', 'Orphé', 'info'),
(238, 'NORMAL', 'Oumou', '_'),
(239, 'NORMAL', 'ousmane', '_'),
(240, 'NORMAL', 'Oussama', '_'),
(241, 'NORMAL', 'P.Nouzille', '_'),
(242, 'NORMAL', 'PAPIN', 'Léo'),
(243, 'NORMAL', 'Pas', 'vraiment'),
(244, 'NORMAL', 'Paul', '_'),
(245, 'NORMAL', 'Pauline', '-'),
(246, 'NORMAL', 'pb_alegre', '_'),
(247, 'NORMAL', 'pierrechv', '_'),
(248, 'NORMAL', 'Pierrick', 'P.'),
(249, 'NORMAL', 'Powell', '_'),
(250, 'NORMAL', 'Princia', 'Laura'),
(251, 'NORMAL', 'Quentin', 'H.'),
(252, 'NORMAL', 'Quentin', 'R.'),
(253, 'NORMAL', 'Rachel.bes', '_'),
(254, 'NORMAL', 'Rachel.bes', '_'),
(255, 'NORMAL', 'rastaa49', '_'),
(256, 'NORMAL', 'Rayanmaz', '_'),
(257, 'NORMAL', 'S_CH', '[4A]'),
(258, 'NORMAL', 'samy', '_'),
(259, 'NORMAL', 'samy', '_'),
(260, 'NORMAL', 'saqlain', '_'),
(261, 'NORMAL', 'Sarah', 'Allaire'),
(262, 'NORMAL', 'Selma', '3b'),
(263, 'NORMAL', 'Shia', '_'),
(264, 'NORMAL', 'Simon', 'K'),
(265, 'NORMAL', 'Sofiane', 'B.'),
(266, 'NORMAL', 'souu', '_'),
(267, 'NORMAL', 'Stecy', 'Brenda'),
(268, 'NORMAL', 'Tarek', 'maths'),
(269, 'NORMAL', 'Thomas', '_'),
(270, 'NORMAL', 'Thomas', '[Admin]'),
(271, 'NORMAL', 'Thomas.L', '_'),
(272, 'NORMAL', 'Théo', 'Gueffier'),
(273, 'NORMAL', 'TOKY01', '_'),
(274, 'NORMAL', 'Tom', 'Chedmail'),
(275, 'NORMAL', 'Tom', 'MAUBOUSSIN'),
(276, 'NORMAL', 'tottii', '_'),
(277, 'NORMAL', 'Troft', '_'),
(278, 'NORMAL', 'un', 'alcoolique'),
(279, 'NORMAL', 'Valentine', 'frangeul'),
(280, 'NORMAL', 'Victor', 'L'),
(281, 'NORMAL', 'Victor', 'R'),
(282, 'NORMAL', 'vivi', '_'),
(283, 'NORMAL', 'wiame', '_'),
(284, 'NORMAL', 'Willy', '/'),
(285, 'NORMAL', 'Yamina', 'OUCHAOU'),
(286, 'NORMAL', 'yamina', 'ouchaou'),
(287, 'NORMAL', 'Yoskeï', '_'),
(288, 'NORMAL', 'Youness', 'Namaoui'),
(289, 'NORMAL', 'Youssef', 'Okaf'),
(290, 'NORMAL', 'Youssefokaf', '_'),
(291, 'NORMAL', 'Yurivie', '_'),
(292, 'NORMAL', 'yxra', 'wxy'),
(293, 'NORMAL', 'ZAIDOU', 'H.'),
(294, 'NORMAL', 'ziiadfyz', '_'),
(295, 'NORMAL', 'zkr', '_'),
(296, 'NORMAL', 'zouaoui', 'ilies'),
(297, 'NORMAL', 'Zoé-2A', '_'),
(298, 'NORMAL', 'špãŕřow', '_'),
(299, 'NORMAL', 'ADELEKE', 'Kismath'),
(300, 'NORMAL', 'Adrien', 'C.'),
(301, 'NORMAL', 'Aghiles', 'Bn'),
(302, 'NORMAL', 'Aimen', 'Selmane'),
(303, 'NORMAL', 'Alaa', 'KHALIL'),
(304, 'NORMAL', 'Alexandre', 'Monnier'),
(305, 'NORMAL', 'Anass', 'Khnouchi'),
(306, 'NORMAL', 'Ben', 'Moussa'),
(307, 'NORMAL', 'Boubacar', 'TOURE'),
(308, 'NORMAL', 'Bouker', 'Ayoub'),
(309, 'NORMAL', 'Thierno', 'Balde'),
(310, 'NORMAL', 'Bangoura', 'Alseny'),
(311, 'NORMAL', 'Bessé', 'YAO'),
(312, 'NORMAL', 'Charles', 'Sauvagnac'),
(313, 'NORMAL', 'Christophe', 'LAFARGUE'),
(314, 'NORMAL', 'Colin', 'BOULIGAND'),
(315, 'NORMAL', 'Constance', 'Langlais'),
(316, 'NORMAL', 'Corentin', 'Gauci'),
(317, 'NORMAL', 'Corentin', 'Maillochon'),
(318, 'NORMAL', 'César', 'Achard--Bonnet'),
(319, 'NORMAL', 'HUA Vi Quang', '_'),
(320, 'NORMAL', 'Rodin', 'Doré'),
(321, 'NORMAL', 'Mamadou Cellou', 'DIALLO'),
(322, 'NORMAL', 'DAOUDA', 'El-Anzizi'),
(323, 'NORMAL', 'Denis', 'B.'),
(324, 'NORMAL', 'Diallo', 'Fatoumata'),
(325, 'NORMAL', 'Diye', 'Ba'),
(326, 'NORMAL', 'Djamel', 'MANADI'),
(327, 'NORMAL', 'Dorian', 'garo'),
(328, 'NORMAL', 'Dorian', 'Letort'),
(329, 'NORMAL', 'EL HOUR', 'MOUNIR'),
(330, 'NORMAL', 'Erwan', 'Jochault'),
(331, 'NORMAL', 'Evan', 'Grolleau'),
(332, 'NORMAL', 'Elhadj Souleymane BAH', '_'),
(333, 'NORMAL', 'EugenePoubel', '_'),
(334, 'NORMAL', 'Ferhat', 'CHELLOUCHE'),
(335, 'NORMAL', 'Féréol', 'JOB'),
(336, 'NORMAL', 'Omar', 'RACHIDI'),
(337, 'NORMAL', 'G.', 'Olivier'),
(338, 'NORMAL', 'Guillaume', 'Grenon'),
(339, 'NORMAL', 'Guillaume', 'Massal'),
(340, 'NORMAL', 'Guillaume', 'V'),
(341, 'NORMAL', 'Lucas', 'Phan'),
(342, 'NORMAL', 'Ghilas', 'Maouche'),
(343, 'NORMAL', 'Victor', 'LOISEAU'),
(344, 'NORMAL', 'Haidar', 'E.'),
(345, 'NORMAL', 'Hassaballah', 'Abdelkhader'),
(346, 'NORMAL', 'Héloïse', 'Fontaine'),
(347, 'NORMAL', 'Julien', 'H'),
(348, 'NORMAL', 'Houhou', 'A'),
(349, 'NORMAL', 'Yakin Hichem Kaddour', '_'),
(350, 'NORMAL', 'Maël', 'E.'),
(351, 'NORMAL', 'Jack', 'H.'),
(352, 'NORMAL', 'Joseph', 'Oron'),
(353, 'NORMAL', 'Julien', 'L.'),
(354, 'NORMAL', 'Junior-damas', 'OYOUGOU'),
(355, 'NORMAL', 'Jérôme', 'URCUN'),
(356, 'NORMAL', 'Joani', 'ROBERT'),
(357, 'NORMAL', 'Théo', 'Gueffier'),
(358, 'NORMAL', 'Jules', 'B'),
(359, 'NORMAL', 'Kyanou', 'Low-Kein'),
(360, 'NORMAL', 'Théo', 'Oussalem'),
(361, 'NORMAL', 'LASNAMI', 'Sara'),
(362, 'NORMAL', 'Louis', 'Euvrard'),
(363, 'NORMAL', 'lucas', 'Adrole'),
(364, 'NORMAL', 'Léa Da Lage', '_'),
(365, 'NORMAL', 'Laachari', 'Taha'),
(366, 'NORMAL', 'Salah', 'CH.'),
(367, 'NORMAL', 'Linaaa', '_'),
(368, 'NORMAL', 'Léonie Angélique COLY', '_'),
(369, 'NORMAL', 'Masry', 'K.'),
(370, 'NORMAL', 'Mathias', 'R'),
(371, 'NORMAL', 'Maty Laye SOUARÉ', '_'),
(372, 'NORMAL', 'Maxime', 'MAURIN'),
(373, 'NORMAL', 'Milo', 'Léglise'),
(374, 'NORMAL', 'Mahamat', 'Youssouf'),
(375, 'NORMAL', 'Majorie', 'Hessou'),
(376, 'NORMAL', 'malikbelarif', '_'),
(377, 'NORMAL', 'Marchoud', 'souhail'),
(378, 'NORMAL', 'Nathan', 'Guenier'),
(379, 'NORMAL', 'Nathanael', 'Menard'),
(380, 'NORMAL', 'Nicolas', 'PASQUIER'),
(381, 'NORMAL', 'Samuel', 'Maillard'),
(382, 'NORMAL', 'Quentin', 'HÛ'),
(383, 'NORMAL', 'Quentin', 'RENARD'),
(384, 'NORMAL', 'Rayan', 'Mazouni'),
(385, 'NORMAL', 'Rayene', 'Guiassa'),
(386, 'NORMAL', 'RoyaleDeluxe', '_'),
(387, 'NORMAL', 'Touhaf', 'Aya'),
(388, 'NORMAL', 'Sarah', 'Allaire'),
(389, 'NORMAL', 'Tanguy', 'JOUVIN'),
(390, 'NORMAL', 'Teddy', 'Sicard'),
(391, 'NORMAL', 'Tom', 'CHEDMAIL'),
(392, 'NORMAL', 'Tom', 'RENAUDIN'),
(393, 'NORMAL', 'Taimane', 'Zerez'),
(394, 'NORMAL', 'Thomas', 'Lds'),
(395, 'NORMAL', 'Arthur', 'Papin'),
(396, 'NORMAL', 'Victor', 'Le Moan'),
(397, 'NORMAL', 'Vincent', 'IMARD'),
(398, 'NORMAL', 'Wele', 'oumar'),
(399, 'NORMAL', 'Xavier', 'HOUCHARD');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL,
  `nb_bloc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id`, `nom`, `description`, `nb_bloc`) VALUES
(10, 'L1 MPCIE', 'Lorem ipsum, dolor sit amet', 2),
(11, 'L2 MPCIE', 'Lorem ipsum, dolor sit amet', 2),
(12, 'L3 Info', 'Lorem ipsum, dolor sit amet', 2),
(13, 'LP Logiciel Libre', 'Lorem ipsum, dolor sit amet', 2),
(14, 'MASTER 1 Info', 'Lorem ipsum, dolor sit amet', 2),
(15, 'MASTER 2 ACDI', 'Lorem ipsum, dolor sit amet', 2),
(16, 'MASTER 2 ID', 'Lorem ipsum, dolor sit amet', 2);

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id` int(11) NOT NULL,
  `nom` varchar(25) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `groupe_options`
--

CREATE TABLE `groupe_options` (
  `id` int(11) NOT NULL,
  `compte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `groupe_options`
--

INSERT INTO `groupe_options` (`id`, `compte`) VALUES
(1, 2),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `incompatibilite`
--

CREATE TABLE `incompatibilite` (
  `id_matiere_a` int(11) NOT NULL,
  `id_matiere_b` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `incompatibilite`
--

INSERT INTO `incompatibilite` (`id_matiere_a`, `id_matiere_b`) VALUES
(11, 12),
(14, 15),
(13, 14),
(13, 15);

-- --------------------------------------------------------

--
-- Structure de la table `inscrit_formation`
--

CREATE TABLE `inscrit_formation` (
  `id_etudiant` int(11) NOT NULL,
  `id_formation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `inscrit_formation`
--

INSERT INTO `inscrit_formation` (`id_etudiant`, `id_formation`) VALUES
(5, 12),
(7, 12),
(8, 12),
(9, 10),
(10, 12),
(11, 10),
(12, 10),
(13, 12),
(14, 12),
(15, 13),
(16, 12),
(17, 10),
(18, 12),
(19, 10),
(20, 10),
(21, 10),
(22, 10),
(23, 10),
(24, 10),
(25, 10),
(26, 10),
(26, 10),
(27, 10),
(28, 10),
(29, 10),
(29, 10),
(30, 10),
(31, 10),
(32, 10),
(32, 10),
(33, 10),
(34, 10),
(35, 10),
(35, 10),
(35, 10),
(35, 10),
(35, 10),
(35, 10),
(35, 10),
(35, 10),
(36, 10),
(37, 10),
(38, 10),
(39, 10),
(40, 10),
(41, 10),
(42, 10),
(43, 10),
(44, 10),
(45, 10),
(47, 10),
(49, 10),
(50, 10),
(51, 10),
(54, 10),
(54, 10),
(55, 10),
(56, 10),
(57, 10),
(58, 10),
(59, 10),
(60, 10),
(61, 10),
(62, 10),
(63, 10),
(64, 10),
(66, 10),
(67, 10),
(68, 10),
(69, 10),
(70, 10),
(71, 10),
(72, 10),
(73, 10),
(74, 10),
(75, 10),
(75, 10),
(76, 10),
(78, 10),
(79, 10),
(80, 10),
(81, 10),
(82, 10),
(83, 10),
(84, 10),
(86, 10),
(87, 10),
(88, 10),
(89, 10),
(90, 10),
(91, 10),
(92, 10),
(93, 10),
(94, 10),
(95, 10),
(96, 10),
(97, 10),
(98, 10),
(99, 10),
(100, 10),
(101, 10),
(102, 10),
(103, 10),
(103, 10),
(105, 10),
(106, 10),
(107, 10),
(108, 10),
(109, 10),
(110, 10),
(111, 10),
(112, 10),
(113, 10),
(114, 10),
(115, 10),
(116, 10),
(117, 10),
(118, 10),
(119, 10),
(120, 10),
(121, 10),
(122, 10),
(123, 10),
(124, 10),
(125, 10),
(126, 10),
(127, 10),
(128, 10),
(129, 10),
(130, 10),
(131, 10),
(132, 10),
(133, 10),
(133, 10),
(134, 10),
(135, 10),
(136, 10),
(137, 10),
(138, 10),
(139, 10),
(140, 10),
(141, 10),
(142, 10),
(143, 10),
(144, 10),
(145, 10),
(146, 10),
(147, 10),
(148, 10),
(149, 10),
(150, 10),
(150, 10),
(151, 10),
(152, 10),
(153, 10),
(154, 10),
(155, 10),
(156, 10),
(157, 10),
(158, 10),
(159, 10),
(160, 10),
(161, 10),
(162, 10),
(163, 10),
(164, 10),
(165, 10),
(166, 10),
(167, 10),
(168, 10),
(169, 10),
(172, 10),
(173, 10),
(173, 10),
(174, 10),
(175, 10),
(176, 10),
(177, 10),
(178, 10),
(179, 10),
(180, 10),
(181, 10),
(182, 10),
(183, 10),
(184, 10),
(185, 10),
(186, 10),
(187, 10),
(188, 10),
(188, 10),
(189, 10),
(190, 10),
(191, 10),
(192, 10),
(193, 10),
(194, 10),
(194, 10),
(195, 10),
(196, 10),
(197, 10),
(198, 10),
(199, 10),
(200, 10),
(201, 10),
(203, 10),
(204, 10),
(205, 10),
(206, 10),
(207, 10),
(208, 10),
(209, 10),
(210, 10),
(211, 10),
(212, 10),
(213, 10),
(214, 10),
(215, 10),
(216, 10),
(217, 10),
(218, 10),
(219, 10),
(220, 10),
(221, 10),
(222, 10),
(223, 10),
(224, 10),
(225, 10),
(226, 10),
(227, 10),
(228, 10),
(229, 10),
(230, 10),
(231, 10),
(231, 10),
(233, 10),
(234, 10),
(235, 10),
(236, 10),
(237, 10),
(238, 10),
(239, 10),
(240, 10),
(241, 10),
(242, 10),
(243, 10),
(244, 10),
(245, 10),
(246, 10),
(247, 10),
(248, 10),
(249, 10),
(250, 10),
(251, 10),
(252, 10),
(253, 10),
(253, 10),
(255, 10),
(256, 10),
(257, 10),
(258, 10),
(258, 10),
(260, 10),
(261, 10),
(261, 10),
(262, 10),
(263, 10),
(264, 10),
(265, 10),
(266, 10),
(267, 10),
(268, 10),
(270, 10),
(271, 10),
(272, 10),
(272, 10),
(273, 10),
(274, 10),
(275, 10),
(276, 10),
(277, 10),
(278, 10),
(279, 10),
(280, 10),
(281, 10),
(282, 10),
(283, 10),
(284, 10),
(285, 10),
(286, 10),
(287, 10),
(288, 10),
(289, 10),
(290, 10),
(291, 10),
(292, 10),
(293, 10),
(294, 10),
(295, 10),
(296, 10),
(297, 10),
(298, 10),
(299, 12),
(300, 12),
(301, 10),
(302, 12),
(303, 10),
(304, 12),
(305, 10),
(306, 12),
(307, 12),
(308, 10),
(309, 12),
(310, 12),
(311, 12),
(312, 12),
(313, 12),
(314, 12),
(315, 12),
(316, 12),
(317, 12),
(318, 12),
(319, 12),
(320, 10),
(321, 12),
(322, 12),
(323, 12),
(324, 12),
(325, 12),
(326, 12),
(327, 10),
(328, 12),
(329, 12),
(331, 12),
(332, 12),
(333, 10),
(334, 12),
(335, 12),
(336, 12),
(337, 12),
(338, 12),
(339, 12),
(340, 12),
(342, 12),
(343, 10),
(344, 10),
(345, 12),
(346, 12),
(347, 12),
(349, 10),
(350, 10),
(351, 12),
(352, 12),
(353, 12),
(354, 12),
(355, 12),
(356, 12),
(358, 10),
(359, 12),
(360, 12),
(361, 12),
(362, 12),
(363, 10),
(364, 10),
(365, 12),
(366, 10),
(368, 12),
(369, 10),
(370, 12),
(371, 12),
(372, 12),
(373, 10),
(374, 12),
(376, 12),
(378, 12),
(379, 12),
(380, 12),
(381, 12),
(382, 10),
(383, 12),
(384, 10),
(385, 12),
(386, 10),
(387, 10),
(389, 12),
(390, 12),
(391, 10),
(392, 12),
(393, 12),
(394, 10),
(395, 12),
(396, 12),
(397, 12),
(398, 12),
(399, 12);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id` int(11) NOT NULL,
  `descriptif` varchar(100) COLLATE utf8_bin NOT NULL,
  `id_ue` int(11) NOT NULL,
  `id_groupe_opt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id`, `descriptif`, `id_ue`, `id_groupe_opt`) VALUES
(1, 'Anglais S5', 1, NULL),
(2, 'Fondements de l\'informatique', 2, NULL),
(3, 'Théorie des langages et compilation', 3, NULL),
(4, 'DCRA', 4, NULL),
(5, 'Théorie de l\'information et assembleur', 5, NULL),
(6, 'Programmation orientée objet en C++', 6, NULL),
(7, 'Algorithmique des graphes', 7, NULL),
(8, 'Base de donnée', 8, NULL),
(9, 'Développement web', 9, NULL),
(10, 'Programmation logique et fonctionnel', 10, NULL),
(11, 'Synthèse d\'images', 11, 1),
(12, 'Traitement de données en Python', 11, 1),
(13, 'Développement d\'interface graphiques avancées', 11, 1),
(14, 'Production automatisée de documents', 11, 1),
(15, 'Initiation à la programmation de système intélligent', 11, 1),
(16, '3PE', 13, NULL),
(17, 'Anglais S1', 18, NULL),
(18, 'Anglais S2', 24, NULL),
(19, '3PE', 24, NULL),
(20, 'Culture numérique', 24, NULL),
(21, 'Géométrie analytique', 25, NULL),
(22, 'Physique Chimie', 26, 2),
(23, 'Mathématique', 26, 2),
(24, 'Informatique', 26, 2),
(25, 'Math-Économie', 26, 2),
(26, 'EEO', 18, NULL),
(27, 'Anglais', 18, NULL),
(28, 'Analyse élémentaire', 19, NULL),
(29, 'Calcul algébrique élémentaire', 19, NULL),
(30, 'Algorithmique 1', 20, NULL),
(31, 'Mécanique du point 1', 21, NULL),
(32, 'Fondement de la chimie atomistique', 21, NULL),
(33, 'Introduction à l\'Économie', 22, NULL),
(34, 'Physique et Chimie 2', 23, 3),
(35, 'Économie 2', 23, 3),
(36, 'Anglais S6', 14, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `partie`
--

CREATE TABLE `partie` (
  `id` int(11) NOT NULL,
  `id_sous_matiere` int(11) NOT NULL,
  `type` enum('CM','TD','TP','CM-TD') COLLATE utf8_bin NOT NULL,
  `nb_etudiants` int(11) NOT NULL,
  `nb_heures` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `partie`
--

INSERT INTO `partie` (`id`, `id_sous_matiere`, `type`, `nb_etudiants`, `nb_heures`) VALUES
(1, 1, 'CM-TD', 40, 8),
(2, 1, 'TP', 20, 4),
(3, 2, 'TP', 20, 18),
(4, 3, 'CM-TD', 40, 40),
(5, 4, 'CM-TD', 40, 40),
(6, 5, 'CM-TD', 40, 31),
(7, 5, 'TP', 20, 24),
(8, 6, 'CM-TD', 40, 25.3),
(9, 7, 'CM-TD', 40, 25.3),
(10, 8, 'CM', 40, 20),
(11, 9, 'CM-TD', 40, 14.7),
(12, 10, 'TP', 20, 14.7),
(13, 11, 'CM-TD', 40, 30),
(14, 12, 'TP', 40, 18),
(15, 13, 'CM-TD', 40, 5.3),
(16, 13, 'TP', 20, 7.3),
(17, 14, 'TP', 20, 16),
(18, 15, 'CM-TD', 40, 52.3),
(19, 17, 'CM-TD', 40, 17.3),
(20, 18, 'CM-TD', 40, 30.7),
(21, 22, 'CM-TD', 40, 20),
(22, 22, 'TP', 20, 20),
(23, 16, 'CM-TD', 40, 22),
(24, 19, 'TP', 20, 15),
(25, 26, 'CM-TD', 40, 60),
(26, 23, 'CM-TD', 40, 44),
(27, 20, 'CM-TD', 40, 28),
(28, 20, 'TP', 20, 8),
(29, 27, 'CM-TD', 40, 70),
(30, 24, 'CM-TD', 40, 16),
(31, 24, 'TP', 20, 24),
(32, 28, 'CM-TD', 40, 36),
(33, 29, 'CM-TD', 40, 34),
(34, 21, 'CM-TD', 40, 39),
(35, 21, 'TP', 20, 10),
(36, 25, 'CM-TD', 40, 40),
(37, 25, 'TP', 20, 6);

-- --------------------------------------------------------

--
-- Structure de la table `regroupement`
--

CREATE TABLE `regroupement` (
  `id_groupe` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `sous_matiere`
--

CREATE TABLE `sous_matiere` (
  `id` int(11) NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `sous_matiere`
--

INSERT INTO `sous_matiere` (`id`, `description`) VALUES
(1, 'Expresion Écrite et Oral'),
(2, 'Anglais S1'),
(3, 'Analyse élémentaire'),
(4, 'Calcul algébrique élémentaire'),
(5, 'Algorithmique 1'),
(6, 'Mécanique du point 1'),
(7, 'Fondement de la chimie atomistique'),
(8, 'Introduction à l\'économie'),
(9, 'Mécanique du point 2'),
(10, 'Évolution d\'un système chimique'),
(11, 'Macroéconomie'),
(12, 'Anglais S2'),
(13, '3PE'),
(14, 'Culture numérique'),
(15, 'Géométrie analytique'),
(16, 'Electrostatique'),
(17, 'Electrocinétique'),
(18, 'Optique géométrique'),
(19, 'TP Physique'),
(20, 'Chimie Organique 1'),
(21, 'Chimie en solution aqueueuse 1'),
(22, 'Algorithmique 2'),
(23, 'Fondement de l\'informatique 1'),
(24, 'Dévelopemment web 1'),
(25, 'Théorie des langages'),
(26, 'Fondement de l\'analyse'),
(27, 'Arithmétique'),
(28, 'Micro économie 1'),
(29, 'Statistique descriptives'),
(30, 'Anglais S5'),
(31, 'Fondements de l\'informatique'),
(32, 'Théorie des langages et compilation'),
(33, 'Décomposition, Conception et réalisation d\'application'),
(34, 'Théorie de l\'information et architecture'),
(35, 'Programmation Orientée Objet en C++'),
(36, 'Algorthmique des graphes'),
(37, 'Base de données'),
(38, 'Développement web 3'),
(39, 'Programmation logique et fonctionnel'),
(41, 'Projet ou Stage'),
(42, 'Projet Personnel et Professionel de l\'Etudiant'),
(43, 'Anglais S6'),
(44, 'SI'),
(45, 'PY'),
(46, 'DIGA'),
(47, 'PAD'),
(48, 'ISI');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `suivi_etudiant_sous_matiere`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `suivi_etudiant_sous_matiere` (
`id_etu` int(11)
,`id_mat` int(11)
);

-- --------------------------------------------------------

--
-- Structure de la table `ue`
--

CREATE TABLE `ue` (
  `id` int(11) NOT NULL,
  `id_formation` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL,
  `bloc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `ue`
--

INSERT INTO `ue` (`id`, `id_formation`, `nom`, `description`, `bloc`) VALUES
(1, 12, 'UE1 - Anglais', 'Anglais (2 ECTS)', 1),
(2, 12, 'UE2 - Fondements', 'Fondements de l\'informatique (5 ECTS)', 1),
(3, 12, 'UE3 - THLC', 'Théorie des langages et compilation (5 ECTS)', 1),
(4, 12, 'UE4 - DCRA', 'Décomposition, Conception et réalisation d\'applications (5 ECTS)', 1),
(5, 12, 'UE5 - Assembleur', 'Théorie de l\'information et architecture (5 ECTS)', 1),
(6, 12, 'UE6 - POO C++', 'Programmation Orientée Objet en C++ (6 ECTS)', 1),
(7, 12, 'UE7 - Graphes', 'Algorthmique des graphes (2 ECTS)', 1),
(8, 12, 'UE1 - BDD', 'Base de données (5 ECTS)', 2),
(9, 12, 'UE2 - Dév. web', 'Développement web (5 ECTS)', 2),
(10, 12, 'UE3 - Paradigme', 'Programmation logique et fonctionnel (5 ECTS)', 2),
(11, 12, 'UE4 - Options', 'Options de spécialisation (3 ECTS)', 2),
(12, 12, 'UE5 - Stage', 'Projet ou Stage (5 ECTS)', 2),
(13, 12, 'UE6 - 3PE', 'Projet Personnel et Professionel de l\'Etudiant (2 ECTS)', 2),
(14, 12, 'UE7 - Anglais', 'Anglais (2 ECTS)', 2),
(18, 10, 'UE1 - MPCIE', 'Lorem pisumo', 1),
(19, 10, 'UE2 - MPCIE Math', 'Lorem pisumo', 1),
(20, 10, 'UE3 - MPCIE Informatique', 'Lorem pisumo', 1),
(21, 10, 'UE4 - MPCIE Phys. Chimie', 'Lorem pisumo', 1),
(22, 10, 'UE5 - MPCIE Économie', 'Lorem pisumo', 1),
(23, 10, 'UE6 - MPCIE Choix', 'Lorem pisumo', 1),
(24, 10, 'UE1 - MPCIE', 'Lorem pisumo', 2),
(25, 10, 'UE2 - MPCIE Math', 'Lorem pisumo', 2),
(26, 10, 'UE - Parcour', 'Lorem pisumo', 2);

-- --------------------------------------------------------

--
-- Structure de la vue `suivi_etudiant_sous_matiere`
--
DROP TABLE IF EXISTS `suivi_etudiant_sous_matiere`;

CREATE ALGORITHM=UNDEFINED DEFINER=`etudiant`@`localhost` SQL SECURITY DEFINER VIEW `suivi_etudiant_sous_matiere`  AS SELECT DISTINCT `inscrit_formation`.`id_etudiant` AS `id_etu`, `appartenance_matiere`.`id_sous_matiere` AS `id_mat` FROM (((`inscrit_formation` join `ue` on(`inscrit_formation`.`id_formation` = `ue`.`id_formation`)) join `matiere` on(`ue`.`id` = `matiere`.`id_ue`)) join `appartenance_matiere` on(`matiere`.`id` = `appartenance_matiere`.`id_matiere`)) ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appartenance_matiere`
--
ALTER TABLE `appartenance_matiere`
  ADD KEY `id_matiere` (`id_matiere`,`id_sous_matiere`),
  ADD KEY `id_sous_matiere` (`id_sous_matiere`);

--
-- Index pour la table `choix_etudiants`
--
ALTER TABLE `choix_etudiants`
  ADD KEY `id_matiere` (`id_matiere`,`id_etu`);

--
-- Index pour la table `choix_groupe`
--
ALTER TABLE `choix_groupe`
  ADD KEY `id_etu` (`id_etu`,`id_groupe`);

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_partie` (`id_partie`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `groupe_options`
--
ALTER TABLE `groupe_options`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `incompatibilite`
--
ALTER TABLE `incompatibilite`
  ADD KEY `id_matiere_a` (`id_matiere_a`),
  ADD KEY `id_matiere_b` (`id_matiere_b`);

--
-- Index pour la table `inscrit_formation`
--
ALTER TABLE `inscrit_formation`
  ADD KEY `id_etudiant` (`id_etudiant`,`id_formation`),
  ADD KEY `inscrit_formation_ibfk_2` (`id_formation`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ue` (`id_ue`),
  ADD KEY `id_groupe_opt` (`id_groupe_opt`);

--
-- Index pour la table `partie`
--
ALTER TABLE `partie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ue` (`id_sous_matiere`);

--
-- Index pour la table `regroupement`
--
ALTER TABLE `regroupement`
  ADD KEY `id_groupe` (`id_groupe`,`id_classe`);

--
-- Index pour la table `sous_matiere`
--
ALTER TABLE `sous_matiere`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `ue`
--
ALTER TABLE `ue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_formation` (`id_formation`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groupe_options`
--
ALTER TABLE `groupe_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `partie`
--
ALTER TABLE `partie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `sous_matiere`
--
ALTER TABLE `sous_matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT pour la table `ue`
--
ALTER TABLE `ue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartenance_matiere`
--
ALTER TABLE `appartenance_matiere`
  ADD CONSTRAINT `appartenance_matiere_ibfk_1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id`),
  ADD CONSTRAINT `appartenance_matiere_ibfk_2` FOREIGN KEY (`id_sous_matiere`) REFERENCES `sous_matiere` (`id`);

--
-- Contraintes pour la table `choix_etudiants`
--
ALTER TABLE `choix_etudiants`
  ADD CONSTRAINT `choix_etudiants_ibfk_2` FOREIGN KEY (`id_etu`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `choix_etudiants_ibfk_3` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id`);

--
-- Contraintes pour la table `choix_groupe`
--
ALTER TABLE `choix_groupe`
  ADD CONSTRAINT `choix_groupe_ibfk_1` FOREIGN KEY (`id_etu`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `choix_groupe_ibfk_2` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id`);

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`id_partie`) REFERENCES `partie` (`id`);

--
-- Contraintes pour la table `incompatibilite`
--
ALTER TABLE `incompatibilite`
  ADD CONSTRAINT `incompatibilite_ibfk_1` FOREIGN KEY (`id_matiere_a`) REFERENCES `matiere` (`id`),
  ADD CONSTRAINT `incompatibilite_ibfk_2` FOREIGN KEY (`id_matiere_b`) REFERENCES `matiere` (`id`);

--
-- Contraintes pour la table `inscrit_formation`
--
ALTER TABLE `inscrit_formation`
  ADD CONSTRAINT `inscrit_formation_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `inscrit_formation_ibfk_2` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id`);

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `matiere_ibfk_1` FOREIGN KEY (`id_ue`) REFERENCES `ue` (`id`),
  ADD CONSTRAINT `matiere_ibfk_2` FOREIGN KEY (`id_groupe_opt`) REFERENCES `groupe_options` (`id`);

--
-- Contraintes pour la table `partie`
--
ALTER TABLE `partie`
  ADD CONSTRAINT `partie_ibfk_1` FOREIGN KEY (`id_sous_matiere`) REFERENCES `sous_matiere` (`id`);

--
-- Contraintes pour la table `regroupement`
--
ALTER TABLE `regroupement`
  ADD CONSTRAINT `regroupement_ibfk_1` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `regroupement_ibfk_2` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id`);

--
-- Contraintes pour la table `ue`
--
ALTER TABLE `ue`
  ADD CONSTRAINT `ue_ibfk_1` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
