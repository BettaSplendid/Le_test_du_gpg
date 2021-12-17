CREATE TABLE immeuble (
    `numero` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Adresse` varchar(255) NOT NULL,
    `Fibre_optique` BOOLEAN DEFAULT 0,
    `Parking_privatif` BOOLEAN DEFAULT 0
);

CREATE TABLE appartement (
    `Appart_num` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Description` float DEFAULT (0) NOT NULL,
    `Loyer_mensuel` float DEFAULT (0) NOT NULL,
    `Classe_conso` varchar(100) NOT NULL,
    `superficie_total` float DEFAULT 0 NOT NULL,
    `Terrasse` BOOLEAN DEFAULT 0 NOT NULL,
    `Chauffage_EG` varchar(100) NOT NULL,
    `Place_parking` BOOLEAN DEFAULT 0,
    `Prix_parking` float DEFAULT 0 NOT NULL,
    `reference_immeuble_id` INT NOT NULL
);

CREATE TABLE piece (
    `numb` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `superficie` float DEFAULT 0 NOT NULL,
    `fonction` varchar(255) NOT NULL,
    `reference_appartment_id` INT NOT NULL
);

CREATE TABLE photo (
    `reference` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Titre` varchar(255) NOT NULL,
    `Description` varchar(255) NOT NULL,
    `URI` varchar(255) NOT NULL,
    `reference_appartment_id` INT NOT NULL
);

ALTER TABLE
    appartement
ADD
    CONSTRAINT `fk_immeuble_id` FOREIGN KEY (`reference_immeuble_id`) REFERENCES `immeuble`(`numero`);

ALTER TABLE
    piece
ADD
    CONSTRAINT `fk_appartment_id` FOREIGN KEY (`reference_appartment_id`) REFERENCES `appartement`(`Appart_num`);

ALTER TABLE
    photo
ADD
   CONSTRAINT `fk_photo_appartment_id` FOREIGN KEY (`reference_appartment_id`) REFERENCES `appartement`(`Appart_num`);
