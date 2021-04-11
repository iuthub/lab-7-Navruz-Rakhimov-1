-- The names of all movies released in 1995
SELECT `name`
FROM `movies`
WHERE `year`=1995;


-- The number of people who played a part in the movie "Lost in Translation"
SELECT COUNT(*)
FROM `movies`
    JOIN `roles` ON movies.id = roles.movie_id
WHERE movies.name='Lost in Translation';


-- The names of the people who played a part in the movie "Lost in Translation"
SELECT a.first_name, a.last_name
FROM movies m
         JOIN roles r ON m.id = r.movie_id
         JOIN actors a ON a.id = r.actor_id
WHERE m.name = 'Lost in Translation';


-- Director of  the movie "Fight Club"
SELECT d.first_name, d.last_name
FROM directors d
    JOIN movies_directors md ON d.id = md.director_id
    JOIN movies m ON m.id = md.movie_id
WHERE m.name='Fight Club';


-- The number of movies Clint Eastwood has directed
SELECT COUNT(*)
FROM directors d
         JOIN movies_directors md ON d.id = md.director_id
WHERE d.first_name='Clint' AND d.last_name='Eastwood';


-- The names of all movies Clint Eastwood has directed
SELECT d.first_name, d.last_name, m.name
FROM directors d
         JOIN movies_directors md ON d.id = md.director_id
         JOIN movies m ON m.id = md.movie_id
WHERE d.first_name='Clint' AND d.last_name='Eastwood';


-- The names of all directors who have directed at least one horror film (along with the movie name)
SELECT d.first_name, d.last_name, m.name as movie_name, mg.genre
FROM directors d
         JOIN movies_directors md ON d.id = md.director_id
         JOIN movies_genres mg ON md.movie_id = mg.movie_id
         JOIN movies m ON m.id = mg.movie_id
WHERE mg.genre='Horror';

-- Names of actors who has appeared in a movie directed by Christopher Nolan
SELECT a.first_name, a.last_name
FROM directors d
         JOIN movies_directors md ON d.id = md.director_id
         JOIN roles r ON md.movie_id = r.movie_id
         JOIN actors a ON a.id = r.actor_id
WHERE d.first_name='Christopher' AND d.last_name='Nolan';