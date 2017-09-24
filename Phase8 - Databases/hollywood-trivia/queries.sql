-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.

  SELECT title, rating
   FROM movies
   WHERE rating IS NOT NULL
   ORDER BY movies.rating ASC
   LIMIT 50;

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

  SELECT title
   FROM movies
   WHERE rating IS NULL
   ORDER BY title ASC;

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

  SELECT title
   FROM movies
   WHERE synopsis LIKE '%thrilling%'
   ORDER BY title ASC;

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

  SELECT movies.title, movies.year, movies.rating
   FROM movies JOIN genres
    ON movies.genre_id = genres.id
   WHERE (movies.year BETWEEN 1980 AND 1989) AND
          genres.id = 17
   ORDER BY movies.rating DESC;

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

  SELECT actors.name AS actor_name, movies.title AS movie_title, movies.year
  FROM movies
    JOIN cast_members ON movies.id = cast_members.movie_id
    JOIN actors ON cast_members.actor_id = actors.id
  WHERE cast_members.character LIKE 'James Bond'
  ORDER BY movies.year ASC;

-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

  SELECT movies.title AS movie, movies.year, genres.name AS genre
  FROM movies
    JOIN cast_members ON movies.id = cast_members.movie_id
    JOIN actors ON cast_members.actor_id = actors.id
    JOIN genres ON movies.genre_id = genres.id
  WHERE actors.name LIKE 'Julianne Moore'
  ORDER BY genres.name ASC, movies.title ASC;

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

  SELECT movies.title AS movie, movies.year, studios.name AS studio
  FROM movies
    JOIN genres ON movies.genre_id = genres.id
    RIGHT OUTER JOIN studios ON movies.studio_id = studios.id
  WHERE genres.id = 2
  ORDER BY movies.year ASC
  LIMIT 5;
