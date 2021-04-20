-- Généré le :  ven. 16 avr. 2021 à 16:08
-- Dernière MAJ : ven. 16 avr. 2021 à 18:08
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12
-- Version phpMyAdmin : 4.9.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------
--
-- Base de données :  `formationua`
--
CREATE DATABASE IF NOT EXISTS `formationua` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `formationua`;

-- --------------------------------------------------------
--
--
-- Structure de la table `choixetu`
--

DROP TABLE IF EXISTS `choixetu`;
CREATE TABLE IF NOT EXISTS `choixetu` (
  `id_ue` int(11) NOT NULL,
  `id_etu` int(11) NOT NULL,
  KEY `id_ue` (`id_ue`),
  KEY `id_etu` (`id_etu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `choixgroupe`
--

DROP TABLE IF EXISTS `choixgroupe`;
CREATE TABLE IF NOT EXISTS `choixgroupe` (
  `id_etu` int(11) NOT NULL,
  `groupe` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  KEY `id_etu` (`id_etu`),
  KEY `id_groupe` (`id_groupe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_formation` int(11) NOT NULL,
  `categorie` enum('NORMAL','DA') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'NORMAL',
  PRIMARY KEY (`id`),
  KEY `id_formation` (`id_formation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `opt_count`
--

DROP TABLE IF EXISTS `opt_count`;
CREATE TABLE IF NOT EXISTS `opt_count` (
  `id_formation` int(11) NOT NULL,
  `id_gue` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  KEY `id_formation` (`id_formation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `opt_rest`
--

DROP TABLE IF EXISTS `opt_rest`;
CREATE TABLE IF NOT EXISTS `opt_rest` (
  `id_formation` int(11) NOT NULL,
  `id_ue_a` int(11) NOT NULL,
  `id_ue_b` int(11) NOT NULL,
  KEY `id_formation` (`id_formation`),
  KEY `id_ue_a` (`id_ue_a`),
  KEY `id_ue_b` (`id_ue_b`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

DROP TABLE IF EXISTS `participation`;
CREATE TABLE IF NOT EXISTS `participation` (
  `id_classe` int(11) NOT NULL,
  `id_ue` int(11) NOT NULL,
  `type` enum('CM','TD','TP') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  KEY `id_classe` (`id_classe`),
  KEY `id_ue` (`id_ue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `regroupement`
--

DROP TABLE IF EXISTS `regroupement`;
CREATE TABLE IF NOT EXISTS `regroupement` (
  `id_groupe` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  KEY `id_groupe` (`id_groupe`),
  KEY `id_classe` (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `ue`
--

DROP TABLE IF EXISTS `ue`;
CREATE TABLE IF NOT EXISTS `ue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_formation` int(11) NOT NULL,
  `nom` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `groupe` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_formation` (`id_formation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `uedata`
--

DROP TABLE IF EXISTS `uedata`;
CREATE TABLE IF NOT EXISTS `uedata` (
  `id_ue` int(11) NOT NULL,
  `type` enum('CM','TD','TP') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nb_etu` int(11) NOT NULL,
  `nb_heure` int(11) NOT NULL,
  KEY `id_ue` (`id_ue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `choixetu`
--
ALTER TABLE `choixetu`
  ADD CONSTRAINT `choixetu_ibfk_1` FOREIGN KEY (`id_ue`) REFERENCES `ue` (`id`),
  ADD CONSTRAINT `choixetu_ibfk_2` FOREIGN KEY (`id_etu`) REFERENCES `etudiant` (`id`);

--
-- Contraintes pour la table `choixgroupe`
--
ALTER TABLE `choixgroupe`
  ADD CONSTRAINT `choixgroupe_ibfk_1` FOREIGN KEY (`id_etu`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `choixgroupe_ibfk_2` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id`);

--
-- Contraintes pour la table `opt_count`
--
ALTER TABLE `opt_count`
  ADD CONSTRAINT `opt_count_ibfk_1` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id`);

--
-- Contraintes pour la table `opt_rest`
--
ALTER TABLE `opt_rest`
  ADD CONSTRAINT `opt_rest_ibfk_1` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id`),
  ADD CONSTRAINT `opt_rest_ibfk_2` FOREIGN KEY (`id_ue_a`) REFERENCES `ue` (`id`),
  ADD CONSTRAINT `opt_rest_ibfk_3` FOREIGN KEY (`id_ue_b`) REFERENCES `ue` (`id`);

--
-- Contraintes pour la table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `participation_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id`),
  ADD CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`id_ue`) REFERENCES `ue` (`id`);

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

--
-- Contraintes pour la table `uedata`
--
ALTER TABLE `uedata`
  ADD CONSTRAINT `uedata_ibfk_1` FOREIGN KEY (`id_ue`) REFERENCES `ue` (`id`);
COMMIT;
