-- CREATING AND SELECTING `imdb` SCHEMA
CREATE DATABASE IF NOT EXISTS `imdb`;
USE `imdb`;


-- RESETING TABLES
-- tempararily deactivating foreign key constraint verification
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `acted`;
DROP TABLE IF EXISTS `directed`;
DROP TABLE IF EXISTS `plots`;
DROP TABLE IF EXISTS `movies`;
DROP TABLE IF EXISTS `actors`;
DROP TABLE IF EXISTS `directors`;

SET FOREIGN_KEY_CHECKS = 1;



-- CREATING TABLES
CREATE TABLE `movies` (
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(100),
    `released_year` YEAR,
    `certificate` VARCHAR(10), -- ENUM('','')
    `runtime_in_minutes` INT,
    `genre` VARCHAR(100), -- SET('','')
    `IMDB_rating` DECIMAL(2,1),
    `meta_score` INT,
    `votes` INT,
    `gross` INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `actors` (
	`id` INT AUTO_INCREMENT,
    `actor` VARCHAR(100),
    PRIMARY KEY (`id`)
);

CREATE TABLE `directors` (
	`id` INT AUTO_INCREMENT,
    `director` VARCHAR(100),
    PRIMARY KEY (`id`)
);

CREATE TABLE `plots` (
	`movie_id` INT,
    `plot` TEXT,
    FOREIGN KEY (`movie_id`) REFERENCES `movies`(`id`)
);


-- CREATING JUNCTION TABLES
CREATE TABLE `directed` (
	`movie_id` INT,
    `director_id` INT,
    FOREIGN KEY (`movie_id`) REFERENCES `movies`(`id`),
    FOREIGN KEY (`director_id`) REFERENCES `directors`(`id`)
);

CREATE TABLE `acts` (
	`movie_id` INT,
    `actor_id` INT,
    FOREIGN KEY (`movie_id`) REFERENCES `movies`(`id`),
    FOREIGN KEY (`actor_id`) REFERENCES `actors`(`id`)
);
