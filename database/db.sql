-- Généré le :  mer. 21 avr. 2021 à 06:07
-- Version du serveur : 5.7.24
-- Version de PHP : 7.2.14
-- Version de phpMyAdmin : 4.8.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données :  `sectionnement`
--
CREATE DATABASE IF NOT EXISTS `sectionnement` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `sectionnement`;

-- --------------------------------------------------------

--
-- Structure de la table `choix_etudiants`
--

DROP TABLE IF EXISTS `choix_etudiants`;
CREATE TABLE IF NOT EXISTS `choix_etudiants` (
  `id_ue` int(11) NOT NULL,
  `id_etu` int(11) NOT NULL,
  KEY `id_ue` (`id_ue`),
  KEY `id_etu` (`id_etu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `choix_groupe`
--

DROP TABLE IF EXISTS `choix_groupe`;
CREATE TABLE IF NOT EXISTS `choix_groupe` (
  `id_etu` int(11) NOT NULL,
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
  `id_partie` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_partie` (`id_partie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` enum('NORMAL','DA') COLLATE utf8_bin NOT NULL DEFAULT 'NORMAL',
  `nom` varchar(25) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(25) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `groupe_options`
--

DROP TABLE IF EXISTS `groupe_options`;
CREATE TABLE IF NOT EXISTS `groupe_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `incompatibilite`
--

DROP TABLE IF EXISTS `incompatibilite`;
CREATE TABLE IF NOT EXISTS `incompatibilite` (
  `id_matiere_a` int(11) NOT NULL,
  `id_matiere_b` int(11) NOT NULL,
  KEY `id_matiere_a` (`id_matiere_a`),
  KEY `id_matiere_b` (`id_matiere_b`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descriptif` varchar(100) COLLATE utf8_bin NOT NULL,
  `id_ue` int(11) NOT NULL,
  `id_groupe_opt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ue` (`id_ue`),
  KEY `id_groupe_opt` (`id_groupe_opt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `partie`
--

DROP TABLE IF EXISTS `partie`;
CREATE TABLE IF NOT EXISTS `partie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_matiere` int(11) NOT NULL,
  `type` enum('CM','TD','TP') COLLATE utf8_bin NOT NULL,
  `nb_etudiants` int(11) NOT NULL,
  `nb_heures` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ue` (`id_matiere`)
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
  `nom` varchar(20) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL,
  `groupe` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_formation` (`id_formation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `choix_etudiants`
--
ALTER TABLE `choix_etudiants`
  ADD CONSTRAINT `choix_etudiants_ibfk_1` FOREIGN KEY (`id_ue`) REFERENCES `ue` (`id`),
  ADD CONSTRAINT `choix_etudiants_ibfk_2` FOREIGN KEY (`id_etu`) REFERENCES `etudiant` (`id`);

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
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `matiere_ibfk_1` FOREIGN KEY (`id_ue`) REFERENCES `ue` (`id`),
  ADD CONSTRAINT `matiere_ibfk_2` FOREIGN KEY (`id_groupe_opt`) REFERENCES `groupe_options` (`id`);

--
-- Contraintes pour la table `partie`
--
ALTER TABLE `partie`
  ADD CONSTRAINT `partie_ibfk_1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id`);

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
