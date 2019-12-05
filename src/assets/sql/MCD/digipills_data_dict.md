| Attribut | Informations |
|----------|-------------|
| id_user | _INT(10) UNSIGNED AUTO_INCREMENT NOT NULL_ |
| log | _VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL_ |
| mdp | _varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL_ |
| nom | _varchar(50) NOT NULL_ |
| prenom | _varchar(50) NOT NULL_ |
| email | _varchar(50)_ |
| id_medoc_occas | _INT(10) UNSIGNED AUTO_INCREMENT NOT NULL_ |
| dose | _DECIMAL(4,2)_ |
| frequence_prise | _TIME_ |
| date_der_prise | _DATETIME_ |
| id_ordonnance | _INT(10) UNSIGNED AUTO_INCREMENT NOT NULL_ |
| date_fin | _DATETIME_ |
| id_medoc_ordo | _INT(10) UNSIGNED AUTO_INCREMENT NOT NULL_ |
| dose_matin | _DECIMAL(4,2)_ |
| dose_midi | _DECIMAL(4,2)_ |
| dose_soir | _DECIMAL(4,2)_ |
| dose_nuit | _DECIMAL(4,2)_ |
| date_fin | _DATETIME_ |
| id_medoc_API | _INT(10) UNSIGNED AUTO_INCREMENT NOT NULL_ |
| code_cis | _INT(8) NOT NULL_ |
| denomination | _VARCHAR(50)_ |
| forme_pharmaceutique | _VARCHAR(50)_ |
| voie_administration | _VARCHAR(50)_ |
| indication_therapeutique | _MEDIUMTEXT_ |
| substance | _VARCHAR(50)_ |
| dosage_substance | _VARCHAR(50)_ |
| sid | _CHAR(32)_ |
| data | _MEDIUMTEXT_ |
| date_maj | _DATETIME_ |