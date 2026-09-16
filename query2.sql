--MINITASK 5

SELECT
movies.id,
movies.title,
movies.release_date,
movies.rating,
directors.first_name AS director_first_name,
directors.last_name AS director_last_name,
genres.name AS genre
FROM movies
JOIN directors
ON movies.director_id = directors.id
JOIN genres 
ON movies.genre_id = genres.id
LIMIT 50;


