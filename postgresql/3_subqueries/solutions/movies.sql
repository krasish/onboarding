SET SEARCH_PATH = movies, pc, ships;

-- TASK 1

SELECT
m1.name
FROM moviestar m1
JOIN movieexec m2 ON m1.name = m2.name
AND networth > 10000000
AND gender = 'F';


SELECT DISTINCT
moviestar.name
FROM moviestar JOIN (SELECT
                name
                FROM
                movieexec
                WHERE
                networth > 10000000) t ON moviestar.name = t.name
WHERE
moviestar.gender = 'F';

-- TASK 2

SELECT
m1.name
FROM moviestar m1
LEFT JOIN movieexec m2 ON m1.name = m2.name
WHERE m2.name IS NULL;

SELECT
name
FROM moviestar
WHERE name NOT IN (SELECT
    name
    FROM movieexec);

-- TASK 3

SELECT
title
FROM movie
WHERE
length > (SELECT
            length
            FROM
            movie
            WHERE title = 'Terms of Endearment');

-- TASK 4

SELECT
m.name,
movie.title
FROM movie
JOIN movieexec m ON movie.producercnum = m.certnum
WHERE networth > ALL (SELECT
                        networth
                        FROM
                        movieexec
                        WHERE
                        m.name = 'Mary Griffin');
