-- PREP
SET search_path TO movies, pc, ships;

-- TASK 1

SELECT
m.name
FROM moviestar m INNER JOIN starsin s ON m.name = s.starname
WHERE m.gender = 'M' AND s.movietitle = 'Terms of Endearment';

-- TASK 2

SELECT
m.name
FROM moviestar m INNER JOIN starsin s ON m.name = s.starname
INNER JOIN  movie m2 ON s.movietitle = m2.title AND s.movieyear = m2.year
WHERE m2.year = 1995 AND m2.studioname = 'MGM';

-- TASK 3

SELECT
s.name
FROM studio s INNER JOIN movieexec m ON s.prescnum = m.certnum
WHERE s.name = 'MGM';

-- TASK 4

SELECT
m.title
FROM movie m
WHERE m.length > (SELECT length FROM movie m2 WHERE m2.title = 'Star Wars');

-- TASK 4.1

SELECT
m.title
FROM movie m CROSS JOIN movie m2
WHERE m.length > m2.length
AND m2.title = 'Star Wars';


SELECT
*
FROM movie m1 CROSS JOIN movie m2;