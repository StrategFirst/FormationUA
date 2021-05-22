-- phpMyAdmin SQL Dump
-- version 5.0.4deb2~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : sam. 22 mai 2021 à 07:23
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

-- --------------------------------------------------------

--
-- Structure de la table `choix_etudiants`
--

CREATE TABLE `choix_etudiants` (
  `id_matiere` int(11) NOT NULL,
  `id_etu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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

-- --------------------------------------------------------

--
-- Structure de la table `incompatibilite`
--

CREATE TABLE `incompatibilite` (
  `id_matiere_a` int(11) NOT NULL,
  `id_matiere_b` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `inscrit_formation`
--

CREATE TABLE `inscrit_formation` (
  `id_etudiant` int(11) NOT NULL,
  `id_formation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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

-- --------------------------------------------------------

--
-- Structure de la table `suivi`
--

CREATE TABLE `suivi` (
  `id_classe` int(11) NOT NULL,
  `id_partie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
-- Structure de la table `token`
--

CREATE TABLE `token` (
  `token` varchar(128) COLLATE utf8_bin NOT NULL,
  `access_level` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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

-- --------------------------------------------------------

--
-- Structure de la vue `suivi_etudiant_sous_matiere`
--
DROP TABLE IF EXISTS `suivi_etudiant_sous_matiere`;

CREATE ALGORITHM=UNDEFINED DEFINER=`etudiant`@`localhost` SQL SECURITY DEFINER VIEW `suivi_etudiant_sous_matiere`  AS SELECT DISTINCT `inscrit_formation`.`id_etudiant` AS `id_etu`, `appartenance_matiere`.`id_sous_matiere` AS `id_mat` FROM (((`inscrit_formation` join `ue` on(`inscrit_formation`.`id_formation` = `ue`.`id_formation`)) join `matiere` on(`ue`.`id` = `matiere`.`id_ue`)) join `appartenance_matiere` on(`matiere`.`id` = `appartenance_matiere`.`id_matiere`)) WHERE `matiere`.`id_groupe_opt` is null ;

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
-- Index pour la table `suivi`
--
ALTER TABLE `suivi`
  ADD KEY `id_classe` (`id_classe`,`id_partie`),
  ADD KEY `id_partie` (`id_partie`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groupe_options`
--
ALTER TABLE `groupe_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `partie`
--
ALTER TABLE `partie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sous_matiere`
--
ALTER TABLE `sous_matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ue`
--
ALTER TABLE `ue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- Contraintes pour la table `suivi`
--
ALTER TABLE `suivi`
  ADD CONSTRAINT `suivi_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id`),
  ADD CONSTRAINT `suivi_ibfk_2` FOREIGN KEY (`id_partie`) REFERENCES `partie` (`id`);

--
-- Contraintes pour la table `ue`
--
ALTER TABLE `ue`
  ADD CONSTRAINT `ue_ibfk_1` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
