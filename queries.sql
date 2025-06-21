USE `imdb`;

-- atualizando valorez incorretos para NULL

UPDATE `movies`
SET `gross` = NULL
WHERE `gross` = -1;

UPDATE `movies`
SET `certificate` = NULL
WHERE `certificate` = '-1';

UPDATE `movies`
SET `votes` = NULL
WHERE `votes` = -1;

UPDATE `movies`
SET `IMDB_rating` = NULL
WHERE `IMDB_rating` = -1;

UPDATE `movies`
SET `meta_score` = NULL
WHERE `meta_score` = -1;

-- top 10 filmes mais bem sucedidos
SELECT `title`,
ROUND((`IMDB_rating` + `meta_score` / 10) / 2, 2) AS `avarage score`,
`gross`
FROM `movies`
ORDER BY `gross` DESC
LIMIT 10;

-- top 10 filmes de melhor crítica
SELECT `title`,
ROUND((`IMDB_rating` + `meta_score` / 10) / 2, 2) AS `avarage score`,
`gross`
FROM `movies`
ORDER BY `avarage score` DESC
LIMIT 10;

-- comparação entre as notas dos diferentes sites
SELECT 
ROUND(AVG(`IMDB_rating`), 2) AS `avarage imdb rating`, 
ROUND(AVG(`meta_score`), 2) AS `avarage metascore`,
ROUND((AVG(`IMDB_rating`) + AVG(`meta_score`) / 10) / 2, 2) AS `avarage score out of 10` 
FROM `movies`;

-- quantidade ordenada de filme de cada categoria
SELECT `certificate`, COUNT(*) AS `quantidade` FROM `movies`
GROUP BY `certificate`
ORDER BY `quantidade` DESC;

-- quantidade de filmes lançadas por ano
SELECT `released_year`, COUNT(*) AS `quantidade` FROM `movies`
GROUP BY `released_year`
ORDER BY `released_year`;


