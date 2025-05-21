-- CREATING AND SELECTING `imdb` SCHEMA
CREATE DATABASE IF NOT EXISTS `imdb`;
USE `imdb`;

-- RESETING TABLES
DROP TABLE IF EXISTS `movies`;
DROP TABLE IF EXISTS `actors`;
DROP TABLE IF EXISTS `acted`;
DROP TABLE IF EXISTS `directors`;
DROP TABLE IF EXISTS `directed`;
DROP TABLE IF EXISTS `plot`;

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

