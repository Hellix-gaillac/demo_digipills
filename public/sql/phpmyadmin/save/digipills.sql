-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 11 juin 2019 à 11:37
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `digipills`
--

-- --------------------------------------------------------

--
-- Structure de la table `medicament_api`
--

DROP TABLE IF EXISTS `medicament_api`;
CREATE TABLE IF NOT EXISTS `medicament_api` (
  `id_medoc_api` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code_cis` int(8) NOT NULL,
  `denomination` varchar(50) NOT NULL,
  `forme_pharmaceutique` varchar(50) DEFAULT NULL,
  `voie_administration` varchar(50) DEFAULT NULL,
  `indication_therapeutique` mediumtext,
  `substance_active` varchar(50) DEFAULT NULL,
  `dosage_substance` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_medoc_api`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `medicament_occasionnel`
--

DROP TABLE IF EXISTS `medicament_occasionnel`;
CREATE TABLE IF NOT EXISTS `medicament_occasionnel` (
  `id_medoc_occas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` int(10) UNSIGNED DEFAULT NULL,
  `id_medoc_api` int(10) UNSIGNED DEFAULT NULL,
  `dose` decimal(4,2) UNSIGNED DEFAULT NULL,
  `frequence_prise` time DEFAULT NULL,
  `date_der_prise` datetime DEFAULT NULL,
  PRIMARY KEY (`id_medoc_occas`),
  KEY `id_medoc_api` (`id_medoc_api`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `medicament_ordonnance`
--

DROP TABLE IF EXISTS `medicament_ordonnance`;
CREATE TABLE IF NOT EXISTS `medicament_ordonnance` (
  `id_medoc_ordo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` int(10) UNSIGNED DEFAULT NULL,
  `id_medoc_api` int(10) UNSIGNED DEFAULT NULL,
  `dose_nbr` int(1) UNSIGNED DEFAULT NULL,
  `dose_ml` int(1) UNSIGNED DEFAULT NULL,
  `dose_mg` int(1) UNSIGNED DEFAULT NULL,
  `dose_matin` decimal(4,2) UNSIGNED DEFAULT NULL,
  `dose_midi` decimal(4,2) UNSIGNED DEFAULT NULL,
  `dose_soir` decimal(4,2) UNSIGNED DEFAULT NULL,
  `dose_nuit` decimal(4,2) UNSIGNED DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`id_medoc_ordo`),
  KEY `id_medoc_api` (`id_medoc_api`),
  KEY `id_ordonnance` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ordonnance`
--

DROP TABLE IF EXISTS `ordonnance`;
CREATE TABLE IF NOT EXISTS `ordonnance` (
  `id_ordonnance` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` int(10) UNSIGNED DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`id_ordonnance`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `sid` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `date_maj` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mdp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `medicament_occasionnel`
--
ALTER TABLE `medicament_occasionnel`
  ADD CONSTRAINT `medicament_occasionnel_ibfk_1` FOREIGN KEY (`id_medoc_api`) REFERENCES `medicament_api` (`id_medoc_api`),
  ADD CONSTRAINT `medicament_occasionnel_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `medicament_ordonnance`
--
ALTER TABLE `medicament_ordonnance`
  ADD CONSTRAINT `medicament_ordonnance_ibfk_1` FOREIGN KEY (`id_medoc_api`) REFERENCES `medicament_api` (`id_medoc_api`),
  ADD CONSTRAINT `medicament_ordonnance_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `ordonnance` (`id_ordonnance`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
