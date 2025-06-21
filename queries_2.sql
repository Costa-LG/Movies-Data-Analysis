-- lista de filmes de drama criminal
WITH `drama_movies` AS(
	SELECT * FROM `movies`
	WHERE `genre` LIKE '%drama%'
),
`crime_movies` AS (
	SELECT * FROM `movies`
	WHERE `genre` LIKE '%crime%'
)
SELECT * FROM `drama_movies`
INTERSECT
SELECT * FROM `crime_movies`;

-- top 10 directores que mais fizeram filmes
SELECT `director`, COUNT(*) AS `quantidade` FROM `directs`
JOIN `movies` ON `movies`.`id` = `directs`.`movie_id`
JOIN `directors` ON `directors`.`id` = `directs`.`director_id`
GROUP BY `director`
ORDER BY `quantidade` DESC
LIMIT 10;

-- top 10 diretores mais lucrativos
SELECT `director`, ROUND(AVG(`gross`), 0) AS `gross income médio` FROM `directs`
JOIN `movies` ON `movies`.`id` = `directs`.`movie_id`
JOIN `directors` ON `directors`.`id` = `directs`.`director_id`
GROUP BY `director`
ORDER BY `gross income médio` DESC
LIMIT 10;

-- top 10 diretores mais bem conceituados
SELECT `director`, ROUND((AVG(`IMDB_rating`) + AVG(`meta_score`) / 10) / 2, 2) AS `avarage score out of 10` FROM `directs`
JOIN `movies` ON `movies`.`id` = `directs`.`movie_id`
JOIN `directors` ON `directors`.`id` = `directs`.`director_id`
GROUP BY `director`
ORDER BY `avarage score out of 10` DESC
LIMIT 10;

-- top 10 atores mais contratados
SELECT `actor`, COUNT(*) AS `quantidade` FROM `acts`
JOIN `movies` ON `movies`.`id` = `acts`.`movie_id`
JOIN `actors` ON `actors`.`id` = `acts`.`actor_id`
WHERE `actor` != ''
GROUP BY `actor`
ORDER BY `quantidade` DESC
LIMIT 10;

-- top 10 atores de romance mais contratados
WITH `romance_movies` AS(
	SELECT * FROM `movies`
	WHERE `genre` LIKE '%romance%'
)
SELECT `actor`, COUNT(*) AS `quantidade` FROM `acts`
JOIN `romance_movies` ON `romance_movies`.`id` = `acts`.`movie_id`
JOIN `actors` ON `actors`.`id` = `acts`.`actor_id`
WHERE `actor` != ''
GROUP BY `actor`
ORDER BY `quantidade` DESC
LIMIT 10;

