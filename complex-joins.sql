/* Table Info
movie table:               |  casting table:                    |  actor table:   |
  PK  id                   |    PK, FK  movieid                 |    PK  id       |
      title                |    PK, FK  actorid                 |        name     |
      yr (release year)    |            ord                     |                 |  
      budget               |-------------------------------------------------------                    
   FK director             |  
      gross                |      
----------------------------
*/

-- Select using JOIN and nested query
  -- Cast list for Casablanca
SELECT name FROM actor
  JOIN casting
    ON id = actorid
  WHERE movieid = 
    (SELECT id FROM movie
      WHERE title = 'Casablanca');
  -- Films with Harrison Ford
SELECT title FROM movie
  JOIN casting
    ON id = movieid
  WHERE actorid =
    (SELECT id FROM actor
      WHERE name = 'Harrison Ford');

-- Select using two JOINs
SELECT title, name FROM movie
  JOIN casting
    ON movie.id = movieid
  JOIN actor
    ON actorid = actor.id
  WHERE ord = 1 AND yr = 1962;

-- Select using JOIN, GROUP BY and HAVING
SELECT yr,COUNT(title) FROM movie
  JOIN casting
    ON movie.id=movieid
  JOIN actor
    ON actorid=actor.id
  WHERE name='Rock Hudson'
  GROUP BY yr
    HAVING COUNT(title) > 2;

-- Select using WITH and multiple JOINs --> Films with Julie Andrews as the lead
WITH movies AS
  (SELECT DISTINCT title, movieid FROM casting
    JOIN movie
      ON movieid = movie.id
    WHERE actorid =
      (SELECT id FROM actor
        WHERE name = 'Julie Andrews')),
leadactors AS
  (SELECT movieid, name FROM casting
    JOIN actor
      ON actorid = actor.id
    WHERE ord = 1)
SELECT title, name FROM movies /* Combining the temp tables */
  JOIN leadactors
    ON movies.movieid = leadactors.movieid;

-- Select using JOIN, GROUP BY and ORDER BY with an aggregate function --> 1978 films and their cast sizes, ordered by cast size (desc) then title (asc)
SELECT DISTINCT title, COUNT(actorid) 'cast size' FROM movie
  JOIN casting
    ON movieid = id
  WHERE yr = 1978
  GROUP BY title
  ORDER BY COUNT(actorid) DESC, title;

-- Select using WITH and JOINs --> people who have worked with Art Garfunkel
WITH artfilms AS
  (SELECT movieid FROM actor
    JOIN casting
      ON actor.id = actorid
    WHERE name = 'Art Garfunkel')
SELECT DISTINCT name FROM actor
  JOIN casting
    ON actorid = actor.id
  JOIN artfilms
    ON casting.movieid = artfilms.movieid
  WHERE name != 'Art Garfunkel'
