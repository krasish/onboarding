SET SEARCH_PATH = ships;

-- TASK 1

SELECT
count(*)
FROM classes;

-- TASK 2

SELECT
avg(numguns)
FROM classes
JOIN ships s ON classes.class = s.class
WHERE s.launched IS NOT NULL;

-- TASK 3

SELECT
classes.class,
       min(s.launched) AS first_year,
       max(s.launched) AS last_year
FROM classes
JOIN ships s ON classes.class = s.class
GROUP BY classes.class;

-- TASK 4

SELECT
s.class,
count(o.ship)
FROM ships s
JOIN outcomes o ON s.name = o.ship
WHERE result = 'sunk'
GROUP BY s.class;

-- TASK 5

SELECT
class,
count(s.name)
FROM ships s JOIN outcomes o ON s.name = o.ship
WHERE result = 'sunk'
GROUP BY class
HAVING class IN (SELECT
class
FROM ships
GROUP BY class
HAVING count(name) > 4);

-- TASK 6

SELECT
country,
avg(displacement)
FROM classes
GROUP BY country;