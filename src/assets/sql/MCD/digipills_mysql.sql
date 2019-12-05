CREATE DATABASE IF NOT EXISTS `DIGIPILLS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `DIGIPILLS`;

CREATE TABLE `USER` (
  `id_user` INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `log` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mdp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(50),
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `MEDICAMENT_OCCASIONNEL` (
  `id_medoc_occas` INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `id_user` INT(10) UNSIGNED,
  `id_medoc_api` INT(10) UNSIGNED,
  `dose` DECIMAL(4,2),
  `frequence_prise` TIME,
  `date_der_prise` DATETIME,
  PRIMARY KEY (`id_medoc_occas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ORDONNANCE` (
  `id_ordonnance` INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `id_user` INT(10) UNSIGNED,
  `date_fin` DATETIME,
  PRIMARY KEY (`id_ordonnance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `MEDICAMENT_ORDONNANCE` (
  `id_medoc_ordo` INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `id_ordonnance` INT(10) UNSIGNED,
  `id_medoc_api` INT(10) UNSIGNED,
  `dose_matin` DECIMAL(4,2),
  `dose_midi` DECIMAL(4,2),
  `dose_soir` DECIMAL(4,2),
  `dose_nuit` DECIMAL(4,2),
  `date_fin` DATETIME,
  PRIMARY KEY (`id_medoc_ordo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `MEDICAMENT_API` (
  `id_medoc_api` INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `code_cis` INT(8) NOT NULL,
  `denomination` VARCHAR(50) NOT NULL,
  `forme_pharmaceutique` VARCHAR(50),
  `voie_administration` VARCHAR(50),
  `indication_therapeutique` MEDIUMTEXT,
  `substance` VARCHAR(50),
  `dosage_substance` VARCHAR(50),
  PRIMARY KEY (`id_medoc_api`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `MEDICAMENT_OCCASIONNEL` ADD FOREIGN KEY (`id_medoc_api`) REFERENCES `MEDICAMENT_API` (`id_medoc_api`);
ALTER TABLE `MEDICAMENT_OCCASIONNEL` ADD FOREIGN KEY (`id_user`) REFERENCES `USER` (`id_user`);
ALTER TABLE `ORDONNANCE` ADD FOREIGN KEY (`id_user`) REFERENCES `USER` (`id_user`);
ALTER TABLE `MEDICAMENT_ORDONNANCE` ADD FOREIGN KEY (`id_medoc_api`) REFERENCES `MEDICAMENT_API` (`id_medoc_api`);
ALTER TABLE `MEDICAMENT_ORDONNANCE` ADD FOREIGN KEY (`id_ordonnance`) REFERENCES `ORDONNANCE` (`id_ordonnance`);