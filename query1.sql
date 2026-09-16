

-- QUERY MINITASK 4 
SELECT * 
FROM movies
WHERE release_date >= '2020-01-01'
AND release_date <= '2020-12-31';

SELECT * FROM "actors"
WHERE lower(first_name) LIKE lower('%s');

SELECT * FROM "movies"
WHERE rating BETWEEN 4 AND 8
AND release_date BETWEEN '2004-01-01' AND '2010-12-31'
ORDER BY release_date ASC;  

