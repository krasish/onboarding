-- TASK 1

SELECT class
country
FROM classes
WHERE numguns < 10;

-- TASK 2

SELECT
name
FROM ships
WHERE launched < 1918;

-- TASK 3

SELECT
ship,
battle
FROM outcomes
WHERE result = 'sunk';

-- TASK 4

SELECT
name
FROM ships s
WHERE s.name = s.class;


-- TASK 5

SELECT
name
FROM ships
WHERE name LIKE 'R%';

-- TASK 6

SELECT
name
FROM ships
WHERE name LIKE '% %' AND name NOT LIKE '% % %'; -- maybe split and array count?