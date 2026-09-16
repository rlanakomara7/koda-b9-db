SELECT 
d.first_name,
d.last_name,
COUNT(DISTINCT m.genre_id) AS jumlah_genre
FROM directors d
JOIN movies m ON d.id = m.director_id
GROUP BY d.id, d.first_name, d.last_name;

SELECT 
a.first_name,
a.last_name,
COUNT(ma.role) AS jumlah_peran
FROM actors a
JOIN movies_actors ma ON a.id = ma.actor_id
GROUP BY a.id, a.first_name, a.last_name
HAVING COUNT(ma.role) > 5;

SELECT 
d.first_name,
d.last_name,
COUNT(m.id) AS jumlah_film
FROM directors d
JOIN movies m ON d.id = m.director_id
GROUP BY d.id, d.first_name, d.last_name
ORDER BY jumlah_film DESC
LIMIT 1;

SELECT 
EXTRACT(YEAR FROM release_date) AS tahun,
COUNT(*) AS jumlah_film
FROM movies
GROUP BY tahun
ORDER BY jumlah_film DESC
LIMIT 1;

SELECT 
    m.title,
    STRING_AGG(a.first_name || ' ' || a.last_name, ', ') AS list_actors
FROM movies m
JOIN movies_actors ma ON m.id = ma.movie_id
JOIN actors a ON ma.actor_id = a.id
GROUP BY m.id, m.title;