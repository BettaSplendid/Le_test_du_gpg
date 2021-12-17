CREATE DATABASE tp_transports1;

USE tp_transports1;

CREATE TABLE trajets (
    `trajet_id` INT PRIMARY KEY NOT NULL,
    `nom_trajet` VARCHAR(255) NOT NULL
);

CREATE TABLE users (
    `user_entr_id` INT PRIMARY KEY NOT NULL,
    `nom` VARCHAR(255) NOT NULL,
    `prenom` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `genre` TINYINT(2) NOT NULL,
    `salaire` VARCHAR(255) NOT NULL,
    `ref_status_id` INT(4) NOT NULL,
    `ref_entrepot_id` INT NOT NULL
);

CREATE TABLE status_pro (
    `status_id` INT PRIMARY KEY NOT NULL,
    `nom_status` VARCHAR(255) NOT NULL
);

CREATE TABLE entrepot (
    `entrepot_id` INT PRIMARY KEY NOT NULL,
    `nom_entrepot` VARCHAR(255) NOT NULL
);

CREATE TABLE activite (
    `activite_id` INT PRIMARY KEY NOT NULL,
    `nom_activite` VARCHAR(255) NOT NULL
);

CREATE TABLE activite_de_entrepot (
    `jour_semaine` INT PRIMARY KEY NOT NULL,
    `nom_activite` VARCHAR(255) NOT NULL,
    `ref_activite_id` INT(4) NOT NULL,
    `ref_entrepot_id` INT(4) NOT NULL
);

CREATE TABLE trajet_entrepot_user (
    `activite_id` INT PRIMARY KEY NOT NULL,
    `nom_activite` VARCHAR(255) NOT NULL,
    `ref_user_id` INT(4) NOT NULL,
    `ref_entrepot_id` INT(4) NOT NULL,
    `ref_trajet_id` INT NOT NULL
);

ALTER TABLE
    activite_de_entrepot
ADD
    CONSTRAINT `fk_entrepot_id` FOREIGN KEY (`ref_entrepot_id`) REFERENCES `entrepot`(`entrepot_id`),
    CONSTRAINT `fk_entrepot_activite_id` FOREIGN KEY (`ref_activite_id`) REFERENCES `activite`(`activite_id`);

ALTER TABLE
    users
ADD
    CONSTRAINT `fk_entrepot_id` FOREIGN KEY (`ref_status_id`) REFERENCES `entrepot`(`entrepot_id`),
    CONSTRAINT `fk_entrepot_activite_id` FOREIGN KEY (`ref_entrepot_id`) REFERENCES `entrepot`(`activite_id`);

