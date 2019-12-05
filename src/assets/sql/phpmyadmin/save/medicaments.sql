-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 11 juin 2019 à 19:50
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
-- Base de données :  `medicaments`
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `medicament_api`
--

INSERT INTO `medicament_api` (`id_medoc_api`, `code_cis`, `denomination`, `forme_pharmaceutique`, `voie_administration`, `indication_therapeutique`, `substance_active`, `dosage_substance`) VALUES
(1, 61651634, 'IMODIUM 2 mg, gélule', 'gélule', 'orale', 'Traitement symptomatique des diarrhées aiguës et chroniques.<br>Le traitement ne dispense pas de mesures diététiques et d\'une réhydratation si elle est nécessaire.<br>L\'importance de la réhydratation par soluté de réhydratation orale ou par voie intraveineuse doit être adaptée en fonction de l\'intensité de la diarrhée, de l\'âge et des particularités du patient (maladies associées,...,).<br><i>Plus d\'information <a href=\"http://base-donnees-publique.medicaments.gouv.fr/affichageDoc.php?specid=61651634&typedoc=R\" target=\"_blank\">en cliquant ici</a></i>', 'LOPÉRAMIDE (CHLORHYDRATE DE)', '2 mg'),
(2, 65196753, 'DOLIPRANE 500 mg, comprimé effervescent', 'comprimé effervescent(e)', 'orale', 'Traitement symptomatique des douleurs d\'intensité légère à modérée et/ou des états fébriles.<br>Cette présentation est réservée à l\'adulte et à l\'enfant à partir de 27 kg (soit à partir d’environ 8 ans).<br><i>Plus d\'information <a href=\"http://base-donnees-publique.medicaments.gouv.fr/affichageDoc.php?specid=65196753&typedoc=R\" target=\"_blank\">en cliquant ici</a></i>', 'PARACÉTAMOL', '500 mg'),
(3, 64533477, 'AMOXICILLINE RATIOPHARM 500 mg, gélule', 'gélule', 'orale', 'Elles procèdent de l\'activité antibactérienne et des caractéristiques pharmacocinétiques de l\'amoxicilline. Elles tiennent compte à la fois des études cliniques auxquelles a donné lieu ce médicament et de sa place dans l\'éventail des produits antibactériens actuellement disponibles.<br>Elles sont limitées aux infections dues aux germes définis comme sensibles:<br><b><u>Chez l\'adulte et l\'enfant:</u></b><ul><li> <u>en traitement initial des</u>:</li><ul><li>o pneumopathies aiguës,</li><li>o surinfections de bronchites aiguës et exacerbations de bronchites chroniques,</li><li>o infections ORL (otite, sinusite, angine documentée à streptocoque A bêta-hémolytique) et stomatologiques,</li><li>o infections urinaires,</li><li>o infections génitales masculines et infections gynécologiques,</li><li>o infections digestives et biliaires,</li><li>o maladie de Lyme: traitement de la phase primaire (érythème chronique migrant) et de la phase primo-secondaire (érythème chronique migrant associé à des signes généraux: asthénie, céphalées, fièvre, arthralgies...),</li></ul><li> <u>en traitement de relais</u> de la voie injectable des endocardites, septicémies,</li><li> <u>en traitement prophylactique</u> de l\'endocardite bactérienne.</li></ul><b><u>Chez l\'adulte uniquement:</u></b><ul><li> en association à un autre antibiotique (clarithromycine ou imidazolé) et à un antisécrétoire, éradication de <i>Helicobacter pylori</i> en cas de maladie ulcéreuse gastro-duodénale de l\'adulte.</li></ul>Il convient de tenir compte des recommandations officielles concernant l\'utilisation appropriée des antibactériens.<br><i>Plus d\'information <a href=\"http://base-donnees-publique.medicaments.gouv.fr/affichageDoc.php?specid=64533477&typedoc=R\" target=\"_blank\">en cliquant ici</a></i>', 'AMOXICILLINE TRIHYDRATÉE', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `medicament_occasionnel`
--

INSERT INTO `medicament_occasionnel` (`id_medoc_occas`, `id_user`, `id_medoc_api`, `dose`, `frequence_prise`, `date_der_prise`) VALUES
(1, 1, 2, '2.00', '06:00:00', '2019-06-11 00:00:00'),
(2, 2, 2, '1.00', '06:00:00', NULL);

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
  `lundi` int(1) UNSIGNED DEFAULT NULL,
  `mardi` int(1) UNSIGNED DEFAULT NULL,
  `mercredi` int(1) UNSIGNED DEFAULT NULL,
  `jeudi` int(1) UNSIGNED DEFAULT NULL,
  `vendredi` int(1) UNSIGNED DEFAULT NULL,
  `samedi` int(1) UNSIGNED DEFAULT NULL,
  `dimanche` int(1) UNSIGNED DEFAULT NULL,
  `cycle_avec` int(2) UNSIGNED DEFAULT NULL,
  `cycle_sans` int(2) UNSIGNED DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`id_medoc_ordo`),
  KEY `id_medoc_api` (`id_medoc_api`),
  KEY `id_ordonnance` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `medicament_ordonnance`
--

INSERT INTO `medicament_ordonnance` (`id_medoc_ordo`, `id_user`, `id_medoc_api`, `dose_nbr`, `dose_ml`, `dose_mg`, `dose_matin`, `dose_midi`, `dose_soir`, `dose_nuit`, `lundi`, `mardi`, `mercredi`, `jeudi`, `vendredi`, `samedi`, `dimanche`, `cycle_avec`, `cycle_sans`, `date_debut`, `date_fin`) VALUES
(1, 1, 3, 1, 0, 0, '2.00', '1.00', '2.00', NULL, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, '2019-06-11 00:00:00', '2019-06-17 00:00:00'),
(2, 1, 1, NULL, NULL, 1, '10.00', NULL, NULL, '5.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4, '2019-06-05 00:00:00', '2019-07-09 00:00:00'),
(3, 2, 3, 0, 1, 0, '2.00', '2.00', '2.00', '0.00', 1, NULL, 1, NULL, 1, NULL, 1, NULL, NULL, '2019-06-12 00:00:00', '2019-06-26 00:00:00'),
(4, 2, 1, 1, 0, 0, '1.50', '0.25', '3.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 8, '2019-06-11 00:00:00', '2019-08-14 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `log`, `mdp`, `nom`, `prenom`, `email`) VALUES
(1, 'loupx', 'loupx', 'Loup', 'Xavier', 'loupx@hotmail.fr'),
(2, 'xloup', 'xloup', 'Sidobre', 'Crouzettol', 'xav.loup@hotmail.fr');

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
  ADD CONSTRAINT `medicament_ordonnance_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
