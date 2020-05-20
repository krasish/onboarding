-- PREP

SET search_path TO movies, pc, ships;

-- Task 1

SELECT
address
FROM movies.studio
WHERE name = 'MGM';

-- Task 2

SELECT
birthdate
FROM moviestar
WHERE name = 'Sandra Bullock';

-- Task 3

SELECT
starname
FROM starsin
WHERE movietitle LIKE '%Love%'
AND movieyear = 1980;

-- Task 4

SELECT
name
FROM movieexec
where networth >= 10000000;

-- Task 5

SELECT
name
FROM moviestar
WHERE address = 'Malibu';

