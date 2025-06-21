USE `imdb`;

SELECT `title`,
ROUND((`IMDB_rating` + `meta_score` / 10) / 2, 2) AS `avarage score`,
`gross`
FROM `movies`
ORDER BY `gross` DESC
LIMIT 10;

SELECT `title`,
ROUND((`IMDB_rating` + `meta_score` / 10) / 2, 2) AS `avarage score`,
`gross`
FROM `movies`
ORDER BY `avarage score` DESC
LIMIT 10;

SELECT 
ROUND(AVG(`IMDB_rating`), 2) AS `avarage imdb rating`, 
ROUND(AVG(`meta_score`), 2) AS `avarage metascore`,
ROUND((AVG(`IMDB_rating`) + AVG(`meta_score`) / 10) / 2, 2) AS `avarage score out of 10` 
FROM `movies`;

SELECT `certificate`, COUNT(*) AS `quantidade` FROM `movies`
GROUP BY `certificate`
ORDER BY `quantidade` DESC;

SELECT `certificate`, COUNT(*) AS `quantidade` FROM `movies`
GROUP BY `certificate`
ORDER BY `quantidade` DESC;


