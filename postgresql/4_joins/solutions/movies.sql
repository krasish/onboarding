SET SEARCH_PATH = movies, pc, ships;

-- TASK 1

SELECT
m.title,
m.year,
s.name studio,
s.address
FROM movie m JOIN studio s ON m.studioname = s.name
WHERE m.length > 120;

-- TASK 2

SELECT DISTINCT
m.studioname,
starsin.starname
FROM starsin
JOIN movie m ON starsin.movietitle = m.title AND starsin.movieyear = m.year
ORDER BY m.studioname;

-- TASK 3

SELECT DISTINCT
m.name
FROM movie
JOIN starsin s ON movie.title = s.movietitle AND movie.year = s.movieyear
JOIN movieexec m ON movie.producercnum = m.certnum
WHERE starname = 'Harrison Ford';

-- TASK 4

SELECT DISTINCT
moviestar.name
FROM moviestar JOIN starsin s ON moviestar.name = s.starname
JOIN movie m ON s.movietitle = m.title AND s.movieyear = m.year
WHERE m.studioname = 'MGM'
AND moviestar.gender = 'F';

-- TASK 5

SELECT
m2.name,
m1.title
FROM movie m1
JOIN movieexec m2 ON m1.producercnum = m2.certnum
WHERE m2.name = (SELECT
                name
                FROM movie JOIN movieexec ON movie.producercnum = movieexec.certnum
                WHERE title = 'Star Wars');

-- ADD SOMEONE WHO HAS NEVER PLAYED IN A MOVIE

INSERT INTO moviestar (name, address, gender, birthdate)
VALUES ('Krasi Shontov', 'Dospat', 'M', '1999-08-24');


-- TASK 6

SELECT
name
FROM moviestar
LEFT JOIN starsin s ON moviestar.name = s.starname
WHERE movietitle IS NULL;