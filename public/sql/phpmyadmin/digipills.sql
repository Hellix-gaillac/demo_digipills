-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 19 juin 2019 à 19:21
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

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
-- Structure de la table `prise`
--

DROP TABLE IF EXISTS `prise`;
CREATE TABLE IF NOT EXISTS `prise` (
  `id_prise` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` int(10) UNSIGNED NOT NULL,
  `code_cis` int(8) NOT NULL,
  `denomination` varchar(50) CHARACTER SET utf8 NOT NULL,
  `indication_therapeutique` mediumtext CHARACTER SET utf8 NOT NULL,
  `unite_dosage` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`id_prise`),
  KEY `fk_prise_user1_idx` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `prise`
--

INSERT INTO `prise` (`id_prise`, `id_user`, `code_cis`, `denomination`, `indication_therapeutique`, `unite_dosage`, `date_fin`) VALUES
(4, 1, 61651634, 'IMODIUM 2 mg, gélule', 'Traitement symptomatique des diarrhées aiguës et chroniques.<br>Le traitement ne dispense pas de mesures diététiques et d\'une réhydratation si elle est nécessaire.<br>L\'importance de la réhydratation par soluté de réhydratation orale ou par voie intraveineuse doit être adaptée en fonction de l\'intensité de la diarrhée, de l\'âge et des particularités du patient (maladies associées,...,).<br><i>Plus d\'information <a href=\"http://base-donnees-publique.medicaments.gouv.fr/affichageDoc.php?specid=61651634&typedoc=R\" target=\"_blank\">en cliquant ici</a></i>', 'unité(s)', NULL),
(5, 1, 65196753, 'DOLIPRANE 500 mg, comprimé effervescent', 'Traitement symptomatique des douleurs d\'intensité légère à modérée et/ou des états fébriles.<br>Cette présentation est réservée à l\'adulte et à l\'enfant à partir de 27 kg (soit à partir d’environ 8 ans).<br><i>Plus d\'information <a href=\"http://base-donnees-publique.medicaments.gouv.fr/affichageDoc.php?specid=65196753&typedoc=R\" target=\"_blank\">en cliquant ici</a></i>', 'unité(s)', NULL),
(6, 1, 64533477, 'AMOXICILLINE RATIOPHARM 500 mg, gélule', 'Elles procèdent de l\'activité antibactérienne et des caractéristiques pharmacocinétiques de l\'amoxicilline. Elles tiennent compte à la fois des études cliniques auxquelles a donné lieu ce médicament et de sa place dans l\'éventail des produits antibactériens actuellement disponibles.<br>Elles sont limitées aux infections dues aux germes définis comme sensibles:<br><b><u>Chez l\'adulte et l\'enfant:</u></b><ul><li> <u>en traitement initial des</u>:</li><ul><li>o pneumopathies aiguës,</li><li>o surinfections de bronchites aiguës et exacerbations de bronchites chroniques,</li><li>o infections ORL (otite, sinusite, angine documentée à streptocoque A bêta-hémolytique) et stomatologiques,</li><li>o infections urinaires,</li><li>o infections génitales masculines et infections gynécologiques,</li><li>o infections digestives et biliaires,</li><li>o maladie de Lyme: traitement de la phase primaire (érythème chronique migrant) et de la phase primo-secondaire (érythème chronique migrant associé à des signes généraux: asthénie, céphalées, fièvre, arthralgies...),</li></ul><li> <u>en traitement de relais</u> de la voie injectable des endocardites, septicémies,</li><li> <u>en traitement prophylactique</u> de l\'endocardite bactérienne.</li></ul><b><u>Chez l\'adulte uniquement:</u></b><ul><li> en association à un autre antibiotique (clarithromycine ou imidazolé) et à un antisécrétoire, éradication de <i>Helicobacter pylori</i> en cas de maladie ulcéreuse gastro-duodénale de l\'adulte.</li></ul>Il convient de tenir compte des recommandations officielles concernant l\'utilisation appropriée des antibactériens.<br><i>Plus d\'information <a href=\"http://base-donnees-publique.medicaments.gouv.fr/affichageDoc.php?specid=64533477&typedoc=R\" target=\"_blank\">en cliquant ici</a></i>', 'unité(s)', NULL),
(7, 2, 65196753, 'DOLIPRANE 500 mg, comprimé effervescent', 'Traitement symptomatique des douleurs d\'intensité légère à modérée et/ou des états fébriles.<br>Cette présentation est réservée à l\'adulte et à l\'enfant à partir de 27 kg (soit à partir d’environ 8 ans).<br><i>Plus d\'information <a href=\"http://base-donnees-publique.medicaments.gouv.fr/affichageDoc.php?specid=65196753&typedoc=R\" target=\"_blank\">en cliquant ici</a></i>', 'unité(s)', NULL),
(8, 2, 64533477, 'AMOXICILLINE RATIOPHARM 500 mg, gélule', 'Elles procèdent de l\'activité antibactérienne et des caractéristiques pharmacocinétiques de l\'amoxicilline. Elles tiennent compte à la fois des études cliniques auxquelles a donné lieu ce médicament et de sa place dans l\'éventail des produits antibactériens actuellement disponibles.<br>Elles sont limitées aux infections dues aux germes définis comme sensibles:<br><b><u>Chez l\'adulte et l\'enfant:</u></b><ul><li> <u>en traitement initial des</u>:</li><ul><li>o pneumopathies aiguës,</li><li>o surinfections de bronchites aiguës et exacerbations de bronchites chroniques,</li><li>o infections ORL (otite, sinusite, angine documentée à streptocoque A bêta-hémolytique) et stomatologiques,</li><li>o infections urinaires,</li><li>o infections génitales masculines et infections gynécologiques,</li><li>o infections digestives et biliaires,</li><li>o maladie de Lyme: traitement de la phase primaire (érythème chronique migrant) et de la phase primo-secondaire (érythème chronique migrant associé à des signes généraux: asthénie, céphalées, fièvre, arthralgies...),</li></ul><li> <u>en traitement de relais</u> de la voie injectable des endocardites, septicémies,</li><li> <u>en traitement prophylactique</u> de l\'endocardite bactérienne.</li></ul><b><u>Chez l\'adulte uniquement:</u></b><ul><li> en association à un autre antibiotique (clarithromycine ou imidazolé) et à un antisécrétoire, éradication de <i>Helicobacter pylori</i> en cas de maladie ulcéreuse gastro-duodénale de l\'adulte.</li></ul>Il convient de tenir compte des recommandations officielles concernant l\'utilisation appropriée des antibactériens.<br><i>Plus d\'information <a href=\"http://base-donnees-publique.medicaments.gouv.fr/affichageDoc.php?specid=64533477&typedoc=R\" target=\"_blank\">en cliquant ici</a></i>', 'unité(s)', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `prise_occasionnelle`
--

DROP TABLE IF EXISTS `prise_occasionnelle`;
CREATE TABLE IF NOT EXISTS `prise_occasionnelle` (
  `id_prise_occasionnelle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_prise` int(10) UNSIGNED NOT NULL,
  `dose_max` decimal(4,2) DEFAULT NULL,
  `heure_entre_prises` int(3) DEFAULT NULL,
  `date_der_prise` datetime DEFAULT NULL,
  PRIMARY KEY (`id_prise_occasionnelle`),
  KEY `fk_prise_occasionnelle_user1_idx` (`id_prise`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `prise_occasionnelle`
--

INSERT INTO `prise_occasionnelle` (`id_prise_occasionnelle`, `id_prise`, `dose_max`, `heure_entre_prises`, `date_der_prise`) VALUES
(5, 5, '1.00', 6, '2019-06-19 13:00:00'),
(6, 7, '2.00', 6, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `prise_reguliere`
--

DROP TABLE IF EXISTS `prise_reguliere`;
CREATE TABLE IF NOT EXISTS `prise_reguliere` (
  `id_prise_reguliere` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_prise` int(10) UNSIGNED NOT NULL,
  `heure` time NOT NULL,
  `dose` decimal(4,2) NOT NULL,
  `validation_prise` datetime DEFAULT NULL,
  PRIMARY KEY (`id_prise_reguliere`),
  KEY `fk_dose_heure_prise1_idx` (`id_prise`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `prise_reguliere`
--

INSERT INTO `prise_reguliere` (`id_prise_reguliere`, `id_prise`, `heure`, `dose`, `validation_prise`) VALUES
(16, 4, '07:00:00', '1.00', NULL),
(17, 4, '13:00:00', '2.00', NULL),
(18, 4, '20:00:00', '0.25', NULL),
(19, 5, '20:00:00', '1.00', NULL),
(20, 5, '07:00:00', '2.00', NULL),
(21, 6, '08:00:00', '3.00', NULL);

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
  `nom` varchar(50) CHARACTER SET utf8 NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8 NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Contraintes pour la table `prise`
--
ALTER TABLE `prise`
  ADD CONSTRAINT `fk_prise_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `prise_occasionnelle`
--
ALTER TABLE `prise_occasionnelle`
  ADD CONSTRAINT `fk_prise_occasionnelle_prise1` FOREIGN KEY (`id_prise`) REFERENCES `prise` (`id_prise`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `prise_reguliere`
--
ALTER TABLE `prise_reguliere`
  ADD CONSTRAINT `fk_dose_heure_prise1` FOREIGN KEY (`id_prise`) REFERENCES `prise` (`id_prise`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
