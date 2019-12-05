-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 18 août 2019 à 13:29
-- Version du serveur :  5.7.26
-- Version de PHP :  5.6.40

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
  `code_cis` int(8) DEFAULT NULL,
  `denomination` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notice` mediumtext COLLATE utf8mb4_unicode_ci,
  `unite_dosage` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`id_prise`),
  KEY `fk_prise_user1_idx` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `prise`
--

INSERT INTO `prise` (`id_prise`, `id_user`, `code_cis`, `denomination`, `notice`, `unite_dosage`, `date_fin`) VALUES
(115, 69, 67559559, 'JOSACINE 500 mg/5 ml, granulés pour suspension buvable', 'Elles sont limitées aux infections dues aux germes définis comme sensibles: angines documentées à streptocoque A bêta-hémolytique, en alternative au traitement par bêta-lactamines, particulièrement lorsque celui-ci ne peut être utilisé. sinusites aiguës. Compte-tenu du profil microbiologique de ces infections, les macrolides sont indiqués lorsqu\'un traitement par une bêta-lactamine est impossible. surinfections des bronchites aiguës. exacerbations des bronchites chroniques. pneumopathies communautaires chez des sujets:o sans facteurs de risque,o sans signes de gravité clinique,o en l\'absence d\'éléments cliniques évocateurs d\'une étiologie pneumococcique.En cas de suspicion de pneumopathie atypique, les macrolides sont indiqués quels que soient la gravité et le terrain. infections cutanées bénignes: impétigo, impétiginisation des dermatoses, ecthyma, dermo-hypodermite infectieuse (en particulier, érysipèle), érythrasma. infections stomatologiques. infections génitales non gonococciques. chimioprophylaxie des rechutes du RAA en cas d\'allergie aux bêta-lactamines.Il convient de tenir compte des recommandations officielles concernant l\'utilisation appropriée des antibactériens.', 'unité(s)', NULL),
(117, 69, 61849146, 'FYCOMPA 12 mg, comprimé pelliculé', ' Vous trouverez les indications thérapeutiques de ce médicament dans le paragraphe 4.1 du RCP ou dans le paragraphe 1 de la notice. Ces documents sont disponibles en cliquant ici ', 'mg', NULL),
(119, 71, 66778233, 'DEXPANTHENOL BAILLEUL 5 %, pommade', 'Irritations de la peau, notamment en cas d\'érythème fessier (fesses rouges) du nourrisson.', 'unité(s)', NULL),
(120, 67, 69118175, 'AMOXICILLINE BIOGARAN 500 mg, gélule', 'Elles procèdent de l\'activité antibactérienne et des caractéristiques pharmacocinétiques de l\'amoxicilline. Elles tiennent compte à la fois des études cliniques auxquelles a donné lieu ce médicament et de sa place dans l\'éventail des produits antibactériens actuellement disponibles.Elles sont limitées aux infections dues aux germes définis comme sensibles:Chez l\'adulte et l\'enfant: En traitement initial des:o pneumopathies aiguës,o surinfections de bronchites aiguës et exacerbations de bronchites chroniques,o infections ORL (otite, sinusite, angine documentée à streptocoque A bêta-hémolytique) et stomatologiques,o infections urinaires,o infections génitales masculines et infections gynécologiques,o infections digestives et biliaires,o maladie de Lyme: traitement de la phase primaire (érythème chronique migrant) et de la phase primo-secondaire (érythème chronique migrant associé à des signes généraux: asthénie, céphalées, fièvre, arthralgies...). En traitement de relais de la voie injectable des endocardites, septicémies. En traitement prophylactique de l\'endocardite bactérienne.Chez l\'adulte uniquement: En association à un autre antibiotique (clarithromycine ou imidazolé) et à un antisécrétoire, éradication de Helicobacter pylori en cas de maladie ulcéreuse gastro-duodénale de l\'adulte.Il convient de tenir compte des recommandations officielles concernant l\'utilisation appropriée des antibactériens.', 'unité(s)', NULL),
(121, 67, 65196753, 'DOLIPRANE 500 mg, comprimé effervescent', 'Traitement symptomatique des douleurs d\'intensité légère à modérée et/ou des états fébriles.Cette présentation est réservée à l\'adulte et à l\'enfant à partir de 27 kg (soit à partir d’environ 8 ans).', 'unité(s)', NULL),
(122, 67, 61833327, 'AERIUS 5 mg, comprimé pelliculé', ' Vous trouverez les indications thérapeutiques de ce médicament dans le paragraphe 4.1 du RCP ou dans le paragraphe 1 de la notice. Ces documents sont disponibles en cliquant ici ', 'unité(s)', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `prise_occasionnelle`
--

DROP TABLE IF EXISTS `prise_occasionnelle`;
CREATE TABLE IF NOT EXISTS `prise_occasionnelle` (
  `id_prise_occasionnelle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_prise` int(10) UNSIGNED DEFAULT NULL,
  `dose_max` decimal(4,2) DEFAULT NULL,
  `heure_entre_prises` time DEFAULT NULL,
  `date_der_prise` datetime DEFAULT NULL,
  PRIMARY KEY (`id_prise_occasionnelle`),
  KEY `fk_prise_occasionnelle_user1_idx` (`id_prise`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `prise_occasionnelle`
--

INSERT INTO `prise_occasionnelle` (`id_prise_occasionnelle`, `id_prise`, `dose_max`, `heure_entre_prises`, `date_der_prise`) VALUES
(53, 115, '2.50', '23:02:00', NULL),
(56, 119, '1.00', '10:00:00', NULL),
(57, 121, '2.00', '06:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `prise_reguliere`
--

DROP TABLE IF EXISTS `prise_reguliere`;
CREATE TABLE IF NOT EXISTS `prise_reguliere` (
  `id_prise_reguliere` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_prise` int(10) UNSIGNED DEFAULT NULL,
  `heure` time NOT NULL,
  `dose` decimal(4,2) NOT NULL,
  `validation_prise` datetime DEFAULT NULL,
  PRIMARY KEY (`id_prise_reguliere`),
  KEY `fk_dose_heure_prise1_idx` (`id_prise`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `prise_reguliere`
--

INSERT INTO `prise_reguliere` (`id_prise_reguliere`, `id_prise`, `heure`, `dose`, `validation_prise`) VALUES
(151, 117, '12:00:00', '1.00', NULL),
(155, 120, '07:00:00', '1.00', NULL),
(156, 120, '12:00:00', '1.00', NULL),
(157, 120, '19:00:00', '1.00', NULL),
(158, 122, '21:00:00', '1.00', NULL);

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

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`sid`, `data`, `date_maj`) VALUES
('044a8sbg1orm672ea20k8o1obp', '', '2019-08-01 09:04:11'),
('0a22h83qst7sergmle90v71vo5', '', '2019-08-18 11:21:35'),
('0bo5samshmq96vd96vdjr3saus', '', '2019-08-01 09:33:34'),
('0c67uq3juh9jl4maanr8oo9jnu', '', '2019-08-01 09:02:04'),
('0gt64n3mrua92fmm2d1495lcod', '', '2019-07-31 15:38:31'),
('0j23faej94plpg2f9ln7eumlne', '', '2019-08-01 09:01:19'),
('0jf0m0jc2cke768c3vg2ofp8fi', '', '2019-08-01 16:59:15'),
('0kmtuifg6k0fd3t8jti6oblql1', '', '2019-08-17 22:44:44'),
('0nqisa939umjcpvipna72e5d7t', '', '2019-08-01 11:32:44'),
('0qf1sfefhq858aqm036vdsed2m', '', '2019-07-31 15:37:20'),
('19lhcilkh4m14ukep7agncmvps', '', '2019-07-31 15:37:19'),
('1a3f9la6chbu0qfbamdv8b6if8', '', '2019-08-01 09:03:08'),
('1k81ovrvhgtf8kfr58j3b4c1cr', '', '2019-08-01 09:15:41'),
('1rivk7oma552btjin17dlbd9h3', '', '2019-08-18 11:22:42'),
('1up2j3n0pan42u042tc8lm6l4j', '', '2019-08-01 08:46:13'),
('2drmhfv4c94fe5vvjit8j68qln', '', '2019-07-31 16:08:38'),
('2e1vbbjeop2o1inp1mg0qphpmh', '', '2019-07-31 16:12:33'),
('2kfg0jo6bd1sb92bpri6eulihn', '', '2019-07-31 15:38:13'),
('2m1apgk2lj5iptmu9ghne4oqq1', '', '2019-08-18 11:21:45'),
('2roai6hvcrhq4dkbvvi018bulp', '', '2019-08-01 08:56:40'),
('2trhrbd9a4et36phqodsn38ggs', '', '2019-07-31 15:23:50'),
('2u6i7t4oglkkho95s2nf0e9oli', '', '2019-07-31 17:25:48'),
('2u8eck12h43b2b5gmd79l6nim1', '', '2019-08-18 11:20:09'),
('2ulmfqiivtneulg4q7k8rs76j6', '', '2019-07-31 15:39:09'),
('329kpcc7bknpnu7so20bf1ea9f', '', '2019-08-01 08:48:56'),
('32p5kopcqfpjki79a9rt2ei85v', '', '2019-08-01 11:29:20'),
('33a7uu4sbnbi4ahs5ksurspb90', '', '2019-08-17 22:47:49'),
('38jtajot8n8r32sl5gkg80l0n1', '', '2019-07-31 15:23:15'),
('3nd9d0ikkf0v05167dud6b4i17', '', '2019-08-01 08:47:44'),
('3nq5fr41aqr1cs1ojhmusp6con', '', '2019-07-31 16:20:31'),
('3qid3fo55fo45o11a09d1qa0r6', '', '2019-07-31 15:48:21'),
('3rfnlgckciq04th9sh1tglqi36', '', '2019-08-18 10:34:20'),
('3ueso8kkheu66kuefm56dc8s18', '', '2019-08-01 09:04:07'),
('45dcur36efb2pjp7eca98t3pc5', '', '2019-07-31 15:30:10'),
('470enhn7dro0066q9kkdfknn2k', '', '2019-08-01 09:35:22'),
('48oaunj3m7gafd8u84mukate8c', '', '2019-07-31 16:15:26'),
('4e0v50n2190a0mgrap7u3232d2', '', '2019-08-18 10:34:06'),
('4hjf93l5kja97dhfciujock3fg', '', '2019-07-31 15:30:10'),
('4nnag7u3ipr7ut1l30clo3ge8p', '', '2019-07-31 15:23:15'),
('4rqqmbbub5l0il105l40pvr2vv', '', '2019-07-31 16:20:31'),
('4s7tgplsmfdq4o3bkpcv0dup17', '', '2019-08-18 11:21:35'),
('4t8u4963qcan0ala73iq8ku9ud', '', '2019-08-01 11:32:22'),
('4vehrvvsavc1sgs05pntur8g93', '', '2019-07-31 15:22:47'),
('59dlm22ltu1b89gl7tfehttaps', '', '2019-07-31 15:49:52'),
('5fjbmcbehp43qjp24oqenvuu02', '', '2019-08-18 11:22:42'),
('5hkqu50t3mlmhset7l7pbrk3pk', '', '2019-08-01 08:41:30'),
('5jvernlafn0pa2ok5uqte3j2t1', '', '2019-08-18 10:34:33'),
('5kqqo903oagq9ngs9eduknj6df', '', '2019-08-01 08:48:15'),
('5lhm1p6kh4thmv3f1cbjo7h0cb', '', '2019-07-31 15:39:09'),
('5upk7e0uigfs0fr6sg2d6l92k2', '', '2019-08-01 09:33:09'),
('60lr1f4h2f1ptcahcdng8u59lc', '', '2019-08-01 09:03:15'),
('60maqfss7dhrt40kgaqbb4t30l', '', '2019-08-01 17:15:55'),
('627prj6ve8mqqrv2j4va5ml06r', '', '2019-08-01 11:36:55'),
('6d66uj5u2uqbmqfj7jf60s99er', '', '2019-08-01 09:02:58'),
('6fotlfnvcntl3dj14mga27g1us', '', '2019-08-01 17:11:49'),
('6mm1jt2e12sjdfe1hrqrtk64gs', '', '2019-07-31 17:12:50'),
('6qs6q094v6grf3t9rprong1k28', '', '2019-07-31 17:11:06'),
('6sr8hajdd5h0d2obj4qqfb5h9r', '', '2019-08-01 11:15:14'),
('7g0t56dbvk8q8fh6ms4al1iu75', '', '2019-08-01 09:32:27'),
('7ja9ieqklublhd3ij090lld2bs', '', '2019-08-01 08:41:35'),
('7mad1ii7jbui8610e1k9t7madd', '', '2019-07-31 16:08:30'),
('7mrek98h421tplu35fn7gsin52', '', '2019-08-01 09:05:30'),
('7rl69254vjnfoatc7ru250lk3q', '', '2019-08-01 09:03:45'),
('7shuhnvpqcu88r2taqdphlkbe6', '', '2019-08-17 22:47:57'),
('7uo2c6vfasju7bos104aq2dpv5', '', '2019-08-01 11:32:22'),
('81rht0c2ljcii7i73bnolojm6q', '', '2019-08-01 16:43:37'),
('87euhvsvhqdh84g8cst34uhg8f', '', '2019-07-31 15:32:41'),
('8n0jbf9r75ov10bd4s3tjlco0n', '', '2019-08-01 17:17:03'),
('8ot0bl8d3iu5od57b5s3afbcua', '', '2019-08-01 17:14:52'),
('8pb5j4gonp5pal9otnbufqopn2', '', '2019-08-01 17:12:48'),
('9107gcdjcsu6hn94r97lprnic1', '', '2019-07-31 17:27:45'),
('932boiumrfnngvrogmd8qh8lq2', '', '2019-08-01 17:19:02'),
('938ddroacudb6e51ki9jrpo6de', '', '2019-07-31 15:58:24'),
('94th45pjc10bafvsnl768njh6b', '', '2019-08-01 17:09:06'),
('9c1g6mj5sj0jaek3eppsam7an8', '', '2019-07-31 16:12:28'),
('9hvmv9pqsl765o937itfmhtgsk', '', '2019-08-01 16:47:42'),
('9nit17tuao5kudacj28euqd7n4', '', '2019-08-18 10:34:32'),
('9qonk46fvbt6260t9ahifo6oo0', '', '2019-08-18 10:33:37'),
('9sa1kghni08qoud5fisbc77bng', '', '2019-07-31 15:31:56'),
('9tsoiapvm6gpfa5n5s8fh30dc0', '', '2019-08-17 22:44:44'),
('a0gjhptci9850ufh5gfephjvcq', '', '2019-08-01 08:59:52'),
('a18t7jmnbmfhgkvtt0me76o55v', '', '2019-07-31 15:50:25'),
('a2hnnedq8vbeu76bp3lcq7i9e2', '', '2019-08-01 08:55:03'),
('a3f9r15lbl024pu9darajcjvhh', '', '2019-08-01 17:15:33'),
('a6a66u5ma4mgv42a67cb60ut90', '', '2019-08-18 11:20:17'),
('a75i8pa52adnhk6oh95s3t4rbk', '', '2019-08-01 11:36:45'),
('a7odrcmtnknob4qlsr192q0pcd', '', '2019-08-01 09:15:35'),
('aesisn8omll8skp5geljv820r2', '', '2019-08-17 22:48:09'),
('ag1chdo2otjs5bofbi4gq8db2l', '', '2019-07-31 15:34:22'),
('anful9dslel6b7t0sq1s764p4r', '', '2019-08-01 09:03:03'),
('arkqg3mnho0rm1lma84b6m76o6', '', '2019-08-17 22:48:09'),
('atv1kur7mtk8i67ncc90ite7hq', '', '2019-08-01 09:03:34'),
('au3j4eq8p0q1bde2mc56gd0ojp', '', '2019-07-31 15:30:32'),
('b39kb85etc972btncmjc7sbrav', '', '2019-08-01 11:36:34'),
('b7ca13fvmmefm250ahsiqe7q2t', '', '2019-07-31 15:22:22'),
('b9lv2codii2jq9e8qfr1pq67gb', '', '2019-08-01 09:00:13'),
('bcli00sloj5uc6b7mtc2i3us52', '', '2019-07-31 15:44:40'),
('bgfsceqg0862fbf4mo23m06anp', '', '2019-08-01 17:14:57'),
('bk97j8lldut1gvm8rf7fijk34s', '', '2019-08-01 17:09:35'),
('blqb36137mk1on8kg2n6d8v4ki', '', '2019-07-31 15:38:56'),
('boufbhln06v07j2h4om9p8p376', '', '2019-07-31 17:27:59'),
('bp1g74vgahujobcmmjopd4008a', '', '2019-08-01 11:36:27'),
('cbqr90mh025cieg0vsl9l94btu', '', '2019-08-01 11:36:49'),
('cdkuch4el9o3j4p17r7q5b5dtv', '', '2019-08-01 09:03:28'),
('ceh9g066fp9png23n2a998s0l1', '', '2019-08-01 08:59:22'),
('ceq1p05f4ej3kn42il2nt4fud0', '', '2019-07-31 17:27:47'),
('cieftub3ceiti3t0obhuq9i4fi', '', '2019-08-01 11:36:27'),
('cj2c84rfmdgg0ud9ee8dmm044v', '', '2019-08-01 17:03:29'),
('cj3ndhpe31e8lf8np3idmu7fgo', '', '2019-07-31 17:25:14'),
('cjn68j61dg7hrh91mcbdm39vd1', '', '2019-08-01 17:11:49'),
('cna0oe1sub2pjatjfc3ronp57q', '', '2019-07-31 15:48:21'),
('coe4n3kq2bhukgjkve1raq1bvf', '', '2019-08-01 08:46:01'),
('csib6pcegvumpadt0b2qguvc6g', '', '2019-08-01 09:04:46'),
('d3p2kgkpa5b2cqqebja714k720', '', '2019-08-01 17:15:11'),
('dad7ftmos3hkcnetsdglac16a2', '', '2019-08-17 22:48:01'),
('dd811celueso3o4tin26v039qc', '', '2019-08-01 09:02:08'),
('doaio1q3s5n583scfmn1fpomk0', '', '2019-08-18 11:19:13'),
('dqqn82jlnk6na0s409mlcc3t2t', '', '2019-07-31 15:57:59'),
('dtaorkrd5idef3bcgv6ttnc3ko', '', '2019-08-01 08:47:30'),
('dv1v4d9dhitf2jjiisnt8ss0se', '', '2019-08-01 17:14:57'),
('dvv8lltkt4s8aelea0ggeuv7qu', '', '2019-08-01 08:46:17'),
('e78cdqcr0l7ngv250ver3rk32q', '', '2019-08-01 08:49:19'),
('em5gb8s6dsd68j3pi9kdehl63m', '', '2019-08-01 08:47:25'),
('eu4727ag0h54j3au2c8bj9mi6k', '', '2019-08-01 17:14:44'),
('f32ncd5n0ov0m2sosulfbsbtu8', '', '2019-07-31 16:15:26'),
('fc7ij0fur8hhrc5t054br10l35', '', '2019-08-01 11:14:50'),
('fhjstkfe3cfam04deo8elofv96', '', '2019-08-18 11:20:13'),
('fhuet5h0ics3v5plnmh5tuer21', '', '2019-08-17 22:47:57'),
('fmaokka6sasg7qg247t97tm3i2', '', '2019-07-31 15:49:34'),
('fn6q3nenktnjfekcakhvsd0uph', '', '2019-08-01 09:33:34'),
('fv4jl2nje6jkpt56p7obcql8f7', '', '2019-08-01 09:32:27'),
('g71ntujlvubqagcns503dq4c7n', '', '2019-08-01 17:09:35'),
('g7dob2tio8i87omvvecsku878a', '', '2019-08-01 09:00:20'),
('gcso70dgdsjk6a69gupvr4gjc1', '', '2019-08-18 10:29:18'),
('gdqlj7sbun8e46ioa6kclsarvs', '', '2019-08-01 17:04:00'),
('ghnlvvfbluhk3s89l63dmn6vur', '', '2019-08-01 08:51:26'),
('gjh3ohsmhnm69cgau9vu4ekvbg', '', '2019-08-01 08:54:40'),
('gsr61vr4mr5uokht0b69hvqhkl', '', '2019-07-31 15:53:29'),
('gutd1k85f8trhgsae3f1jtdpjv', '', '2019-07-31 16:12:33'),
('gvibpjs7j1o00ltua8vh2r8917', '', '2019-08-17 22:45:38'),
('h091jeana2r41tf483urtu320h', '', '2019-08-01 17:03:29'),
('h0r09aqfobt1huqc2j838dhorn', '', '2019-08-01 11:35:57'),
('h1itl8a0osb4gv1lim44kscl63', '', '2019-08-01 08:46:31'),
('h2grb941e5h3hrmen4errcjvve', '', '2019-08-01 17:04:00'),
('h3c54982st71mc9i6rs59rkdpm', '', '2019-08-01 09:02:56'),
('h8bere7flm5csllafq02k0js50', '', '2019-08-18 11:20:17'),
('ha9u4bpqt5brij8ffla9t1766q', '', '2019-08-01 11:14:37'),
('haojggkbhu3ndm87p329nrtg3i', '', '2019-08-01 11:29:53'),
('hdr2f6vh9ac3uria0dcrib0nv3', '', '2019-08-01 11:29:20'),
('hmu30g4ejgmj8sndnsdv4gm1aa', '', '2019-07-31 15:38:56'),
('hopumqbtl9438sh0i7gmlnk2qd', '', '2019-07-31 15:30:32'),
('hubv049gvj3kcc3t0f5n2ncba5', '', '2019-08-18 10:33:37'),
('i5g7aksc71jutuhep48s27uhcr', '', '2019-08-01 17:15:40'),
('i7t66018nd7khgtrhmjhcq268n', '', '2019-07-31 15:39:04'),
('i877jkaiv17ud9qn953atfam1d', '', '2019-08-01 16:43:47'),
('i9ksh2r8dhbduupoki9ft70e3h', '', '2019-07-31 17:25:48'),
('idm57qslr10d8fo1ltbhnqtrfg', '', '2019-08-01 08:41:30'),
('ieqiaet0htah3torjbmhc9hetj', '', '2019-07-31 16:12:25'),
('ihbqgdimk11gbabe97i150cfo9', '', '2019-07-31 17:26:13'),
('ik1trvk19nsfquqfl80nqjaif5', '', '2019-08-01 08:49:16'),
('ir69484e2th0046jc24nab8rrf', '', '2019-08-01 09:03:00'),
('itvmbnvqdrmmitshpc8o6pmf8k', '', '2019-08-01 09:06:00'),
('ivcukvsf1rig4bm0mifsqlaapf', '', '2019-08-01 08:59:52'),
('j14bqm5ep40lsmug1ikpjdfdk5', '', '2019-07-31 15:32:41'),
('j2fptsd0heme039vqjulacsc2s', '', '2019-08-01 17:18:28'),
('j926kpc80bha0op81a2ep9i8nn', '', '2019-07-31 17:28:15'),
('jc8p5q8bd7h00e8kv5ghkk43un', '', '2019-07-31 15:32:21'),
('jej40irn34fv4mi3jkk1r9ilcr', '', '2019-07-31 15:37:57'),
('jel2cuu95sraa0lmppqh6verhp', '', '2019-07-31 15:44:14'),
('jipravhh2vhf0u02gqips70s11', '', '2019-08-01 16:58:59'),
('jknudkeif04k6cjb7872o5oq85', '', '2019-08-18 11:21:01'),
('k02rl52ii77a9g9ekgdk6o606g', '', '2019-07-31 17:00:26'),
('k5ra7t3a0p4ittlt7sqkr38b6i', '', '2019-08-01 08:42:59'),
('k906mk474ba7t0ashidfi3abpi', '', '2019-08-01 11:13:04'),
('kheu9do381bnbmci22m9jc0fb5', '', '2019-08-17 22:47:49'),
('kmpm37sk7ahfoviol3gv2tvtka', '', '2019-07-31 16:12:40'),
('kmr4pqk4hkee3a6kprrkcm3eco', '', '2019-07-31 17:02:40'),
('knfk1u6celok82ccbmj3louep3', '', '2019-08-01 08:47:37'),
('kpar270tj077jg4hh7v4a4v4m1', '', '2019-08-18 11:20:08'),
('kqk2c2fuluoupv69lplhk90vtq', '', '2019-08-01 08:48:59'),
('ksvhkvrufudvftr45l6camqfr9', '', '2019-08-01 11:13:04'),
('l5s2triu3qeg708jpatn6liu4m', '', '2019-08-01 09:36:18'),
('l7i38t5s2mtqh98cv3pl1no803', '', '2019-08-01 16:58:10'),
('lad4fine3n0rmrcsj2p0ghtkkk', '', '2019-08-01 17:16:00'),
('lisqb0hpnu436il1918mfjjv41', '', '2019-08-01 17:15:36'),
('lk2c1eqmusbjbbq0brts3ng6o1', '', '2019-08-01 17:14:44'),
('lpk5r2sebomvhi1e0jltqa2pc1', '', '2019-08-01 17:15:40'),
('lqnmuvkmbjkgf9n1c763c96fao', '', '2019-07-31 17:02:34'),
('lun7fqqv6n7q42n712nj5vd74e', '', '2019-07-31 15:53:19'),
('m1b0amtr5i5kg1g7oq2rdtguqu', '', '2019-07-31 16:08:31'),
('mavoqp03uveslqu3qbu2fule88', '', '2019-08-01 17:14:52'),
('mompl82t9gkhpk76lpu696nihk', '', '2019-07-31 15:45:41'),
('n72dn4soo11mu9cu8qnrupj9k0', '', '2019-08-18 11:20:13'),
('n7l9e2gds2ut1p58isc8f16gml', '', '2019-07-31 15:53:56'),
('n9pk71r0m94ne9sb5rgvv9q2ng', '', '2019-08-01 09:33:39'),
('nn1lc0ccjiqscb6bhh77u23ki4', '', '2019-07-31 15:23:50'),
('nockpe6i1elid2jqhrfg9t60sp', '', '2019-08-01 08:46:11'),
('nqhi5qg311qra0qnigeibdqpv8', '', '2019-08-01 17:15:36'),
('o2ln3bjre4vac7tfvbmcshgnca', '', '2019-08-01 17:09:06'),
('o486o715frpjl7jr4fjhqi4lde', '', '2019-08-01 17:12:48'),
('o65911sqnprjos9263l7oj6o2m', '', '2019-07-31 17:28:15'),
('o6duc0hs4sl3uf5tcbcb0qp3fq', '', '2019-07-31 15:38:04'),
('ocorffqdbn7bc227db48mqok0o', '', '2019-08-01 09:33:39'),
('ods93mc2h52ieuoa56lv6qdcel', '', '2019-08-01 09:30:27'),
('oe1htkfmgg1jj3joergmthvaos', '', '2019-07-31 15:37:58'),
('og5rjih3mbk0debm0h7l8ju75i', '', '2019-07-31 17:00:10'),
('ohgifc1ulul08p5k6ha88kdfdu', '', '2019-08-01 11:35:57'),
('ok2nr3r7fhqp3qjeg91mp2n2v9', '', '2019-08-01 09:15:38'),
('okbcfgl4o4781f9vofbnsrn05p', '', '2019-08-01 16:43:47'),
('ond8hpemrca8i493ovf1rig7p7', '', '2019-08-18 10:30:22'),
('ong814rn57e9e0mceob9qparr9', '', '2019-08-01 08:47:07'),
('onuc733b81qmnjjo8hj09rbfd5', '', '2019-08-01 16:59:15'),
('oo63nttgu3ajh33d5eefenu0lb', '', '2019-07-31 15:37:19'),
('ootsm114rgkkv8t8nphqp37obh', '', '2019-08-01 09:14:39'),
('oqvnjk920q280972ic365va8u9', '', '2019-07-31 17:25:14'),
('osvutdd6gfb52lb362lp4biges', '', '2019-08-01 11:35:36'),
('ou82gp920k3pqe6gpo2j00knli', '', '2019-07-31 17:01:46'),
('p2jirhl3om7jvh4d7nupeok13g', '', '2019-07-31 15:59:00'),
('p39nqspiiap4vi7dqsoovm292k', '', '2019-07-31 16:48:38'),
('p9q8nhhv231i008qb7gft7a76k', '', '2019-07-31 15:22:30'),
('pa7ld00i1e2nkulhci65lhbb23', '', '2019-07-31 15:39:03'),
('pbohbpvha4cgr5ill1t1vkpatg', '', '2019-08-01 17:19:19'),
('pcvd2tgu3cp5mv0qqrbfd2k3b4', '', '2019-08-01 09:31:12'),
('pdr5lsjo73oge2et5n8amqn154', '', '2019-07-31 17:00:14'),
('pe88ipfvpclmkm0bm29qjgnfs8', '', '2019-07-31 17:28:54'),
('pf8cdb6occt0tbdst4s56cubnv', '', '2019-08-01 09:35:22'),
('pguai7cbvlgbkgrbv035htk1ve', '', '2019-07-31 17:27:52'),
('q1a768po4a504s99tt2amt2l2o', '', '2019-08-01 11:29:53'),
('q8lbcj1f1qvu4201jbihgl8vll', '', '2019-08-01 16:37:26'),
('qbc5lstg0bije27g4o7h25abam', '', '2019-08-01 09:05:30'),
('qbnol0eame7437idjhr9trslo3', '', '2019-07-31 15:38:31'),
('qcd3mhfl5vo4j8od2bh93h2fk4', '', '2019-08-18 10:29:18'),
('qcjbjpki6spmrc63c2d86qcr22', '', '2019-08-01 08:47:08'),
('qio5ejoer72g0fap162n68am65', '', '2019-07-31 15:59:00'),
('qniirjrm121pgnb3ek92ebnb6r', '', '2019-07-31 17:00:26'),
('quaqkjbecscg6acs6i1gnspjm2', '', '2019-08-01 09:00:13'),
('r1eftpatgr3a4k95qf52hn06f9', '', '2019-07-31 15:53:44'),
('r67ug9ifs6140ad3hkjuu6j6th', '', '2019-08-01 17:37:22'),
('r6gmmnlamg95m8re9mlk94bupl', '', '2019-08-01 17:17:03'),
('r7opkr3hg2pp8iramgalm36krp', '', '2019-08-01 09:36:24'),
('r80eg244oo5qm2do573hn8t9q2', '', '2019-08-01 17:19:02'),
('r8nem5uehj4l42g16v7g954dgn', '', '2019-08-01 08:47:11'),
('rchsk342qdjii8bagqcj245ds2', '', '2019-07-31 15:53:56'),
('rjkggv5v8ud5aqc8careajd8sn', '', '2019-08-01 17:19:19'),
('rkd1g2fml1vo45bi954b6t8mmj', '', '2019-07-31 17:09:44'),
('rkgoafju6g687muf9re29btiv2', '', '2019-07-31 15:46:27'),
('rllholm5su8rn1sc0admtha3pv', '', '2019-08-01 17:18:01'),
('rn89lb0kbppvo0gkacdsavmsrf', '', '2019-07-31 15:22:47'),
('roah8iuen5bb43a63lotf0tab8', '', '2019-08-01 09:36:18'),
('rokp1jj6r6bjk1artv68hlqegs', '', '2019-08-01 11:36:54'),
('s18ip4dukgqtijt5j1nkp9sanr', '', '2019-07-31 15:45:42'),
('s2kafqen14135752uubittlha4', '', '2019-08-18 11:21:01'),
('s4c4nj78kr5eanq9r19su4clcf', '', '2019-08-01 16:58:59'),
('s73s31vluulgm1t5gs2ebbn45q', '', '2019-08-01 09:36:24'),
('s9dkrt1c4mi0189811pa0p5qh5', '', '2019-07-31 15:22:30'),
('sdoblengv7a4107uund41766b7', '', '2019-07-31 17:28:52'),
('sfccdi2nung65j7k3ulr943e5c', '', '2019-08-01 09:33:09'),
('ssnr5v3ebebf1t279hodfiltob', '', '2019-08-01 08:47:25'),
('t3oduiq3a3cgsi0m8r3sit497m', '', '2019-08-01 11:36:42'),
('ta79p3b302p5otpm14h9menmv5', '', '2019-07-31 17:09:59'),
('tb9o22pbooj860feifk7p0gi0i', '', '2019-08-01 08:46:11'),
('tcoqa1riig6mbre8idul9uekr4', '', '2019-07-31 17:09:20'),
('tpvbo77f9ci9nkp12n3c15git0', '', '2019-08-01 09:04:28'),
('tt6n9n3tun8ascl7j1d6ep0pu7', '', '2019-08-01 11:36:49'),
('tv8l7ftsfidlsiod5p8egqcert', '', '2019-08-01 17:01:13'),
('u8oate1i8su0fgtsprlogravgg', '', '2019-07-31 15:46:27'),
('ua02qq1s71gu9b7ip9thep2lec', '', '2019-07-31 15:44:40'),
('uliltqoepgdp1hsirqgsej308v', '', '2019-08-01 17:15:11'),
('umdgu28qfc36l0neq2g21pj6ti', '', '2019-08-01 09:14:32'),
('ussu8crdv5mn223scv93lh2rbg', '', '2019-08-01 17:01:13'),
('uuh163jjsq70sur91ue4l3nneo', '', '2019-07-31 17:03:25'),
('uve0bn2ktf9pbjjqmkr8h780mh', '', '2019-07-31 15:38:13'),
('v1djvb28h3ce66lelkn9mguvo6', '', '2019-07-31 17:10:22'),
('v1n05e4h114pev1tekljdq6175', '', '2019-07-31 15:58:24'),
('v2jucl92iceu10g6197a1kj457', '', '2019-08-17 22:48:01'),
('v2lv4pp710sl1iq9m74ibi1054', '', '2019-08-01 17:10:00'),
('v66c225ftqi8q07ko3uqo7r762', '', '2019-07-31 17:10:50'),
('vb3d8hq69k0bdgr1srktghn55e', '', '2019-07-31 17:09:44'),
('vium0b2qgsnmknsqt1spevmp00', '', '2019-08-18 10:34:19'),
('vma58953e0ska4a5g2cvbdo41s', '', '2019-07-31 15:31:56'),
('vou276ma3vgpk8ppj94dg01si2', '', '2019-07-31 15:32:21'),
('vvhton4k4hqr1t56grah9f94fp', '', '2019-08-01 17:16:00');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mdp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `jwt` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nom` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `prenom` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `log`, `mdp`, `jwt`, `nom`, `prenom`, `email`) VALUES
(66, 'cjg', '$2y$10$n2XTX2NNqumDzMQkLDZoi./VgbH.ImR3wEv8/0BCLPhT9gU1LdiSi', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ3d3cuYXBwbGljYXRpb24td2ViLXByb2dyZXNzaXZlLmZyXC9hcGkiLCJzdWIiOiJ0b2tlbkp3dCIsImF1ZCI6Ind3dy5hcHBsaWNhdGlvbi13ZWItcHJvZ3Jlc3NpdmUuZnIiLCJ1c2VyIjoiQ2FtaWxsZSBKdWxlcyBHYXN0b24iLCJhZG1pbiI6ZmFsc2V9.WL1iFjM9Gq3IKFs5cMo6Czfh1JtcddawRSPshhA3oHA=', 'Jules Gaston', 'Camille', 'cjg@gm.fr'),
(67, 'loupx', '$2y$10$bKQZxeNUFWUZ4SRGPhXDX.tMJ7aovLy8mU.2U.s27bLO6289jlxTO', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ3d3cuYXBwbGljYXRpb24td2ViLXByb2dyZXNzaXZlLmZyXC9hcGkiLCJzdWIiOiJ0b2tlbkp3dCIsImF1ZCI6Ind3dy5hcHBsaWNhdGlvbi13ZWItcHJvZ3Jlc3NpdmUuZnIiLCJ1c2VyIjoiWGF2aWVyIExPVVAiLCJhZG1pbiI6ZmFsc2V9.ERb3+J544az2cQwN6EUyoCiChnRfybsw+5JciiZQQxQ=', 'LOUP', 'Xavier', 'loupx@hot.fr'),
(68, 'xl', '$2y$10$zGsgCDpywrpBR7LlzpZYPOc0xWWq6.0MoCQMjSQYf/5qkRWgS5.fK', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ3d3cuYXBwbGljYXRpb24td2ViLXByb2dyZXNzaXZlLmZyXC9hcGkiLCJzdWIiOiJ0b2tlbkp3dCIsImF1ZCI6Ind3dy5hcHBsaWNhdGlvbi13ZWItcHJvZ3Jlc3NpdmUuZnIiLCJ1c2VyIjoiTG91cCBEdSBTaWRvYnJlIiwiYWRtaW4iOmZhbHNlfQ==.YFh0Pnxfs+Eapq6dHTrhGq50V+iOMz3uvHyoM339TMU=', 'Du Sidobre', 'Loup', 'sid@hot.fr'),
(69, 'lx', '$2y$10$PShpeBwYl3KoSpq1.9reROqVc3geP24IuO4PleDkqEWjSjPS5pf6K', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ3d3cuYXBwbGljYXRpb24td2ViLXByb2dyZXNzaXZlLmZyXC9hcGkiLCJzdWIiOiJ0b2tlbkp3dCIsImF1ZCI6Ind3dy5hcHBsaWNhdGlvbi13ZWItcHJvZ3Jlc3NpdmUuZnIiLCJ1c2VyIjoibG91IGxvdSIsImFkbWluIjpmYWxzZX0=.Hv211/8w5Altc1qc0vTcKV1td9xJOIO6c7uXCSwJWng=', 'lou', 'lou', 'lx.fr'),
(70, 'as', '$2y$10$IgQ08KyVccCDQm6xHTJ3i.Ig7bhitZzm3N5q/G4aspCubdM8swaZG', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ3d3cuYXBwbGljYXRpb24td2ViLXByb2dyZXNzaXZlLmZyXC9hcGkiLCJzdWIiOiJ0b2tlbkp3dCIsImF1ZCI6Ind3dy5hcHBsaWNhdGlvbi13ZWItcHJvZ3Jlc3NpdmUuZnIiLCJ1c2VyIjoiYXMgYXMiLCJhZG1pbiI6ZmFsc2V9.5epyBm8LfjUkPoNVDzsfeXz3bxrPz6DEsmuWeXMrsWg=', 'as', 'as', 'as'),
(71, 'ad', '$2y$10$DPQnk.Gbf67FSQvtTvR1DOwLVf3dAJWV5DKE2CPibUlDDJxbcHAEq', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ3d3cuYXBwbGljYXRpb24td2ViLXByb2dyZXNzaXZlLmZyXC9hcGkiLCJzdWIiOiJ0b2tlbkp3dCIsImF1ZCI6Ind3dy5hcHBsaWNhdGlvbi13ZWItcHJvZ3Jlc3NpdmUuZnIiLCJ1c2VyIjoiYWQgYWQiLCJhZG1pbiI6ZmFsc2V9.9fyAMZNZCTruRmYV6kr8dc5Fditzqv620w8wFsibdKE=', 'ad', 'ad', 'ad');

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
