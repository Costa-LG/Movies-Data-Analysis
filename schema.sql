-- CREATING AND SELECTING `imdb` SCHEMA
CREATE DATABASE IF NOT EXISTS `imdb`;
USE `imdb`;

-- RESETING TABLE
DROP TABLE IF EXISTS `movies`;
DROP VIEW IF EXISTS `top_10_gross_income`;

-- CREATING THE `imdb_top_1000` TABLE
CREATE TABLE `imdb_top_1000` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `poster_link` TEXT,
    `series_title` VARCHAR(100),
    `released_year` YEAR DEFAULT NULL,
    `certificate` VARCHAR(10), -- ENUM('','')
    `runtime` VARCHAR(10),
    `genre` VARCHAR(50), -- SET('','')
    `IMDB_rating` DECIMAL(5,2) NOT NULL,
    `overview` TEXT,
    `meta_score` INT NULL,
    `director` VARCHAR(50),
    `star1` VARCHAR(50),
    `star2` VARCHAR(50),
    `star3` VARCHAR(50),
    `star4` VARCHAR(50),
    `votes` INT UNSIGNED,
    `gross` TEXT,
    PRIMARY KEY (`id`)
);

DESCRIBE `imdb_top_1000`;
-- CREATE VIEW `top_10_gross_income` AS
-- SELECT `series_title`, `director`, `star1`, `star2`, `star3`, `gross` FROM `imdb_top_1000`
-- ORDER BY `gross` DESC
-- LIMIT 10;

