-- TASK 1

SELECT
s.name,
c.country,
c.numguns,
s.launched
FROM ships s
JOIN classes c ON s.class = c.class;

-- TASK 2

SELECT
o.ship
FROM outcomes o
JOIN battles b ON o.battle = b.name
WHERE extract(YEAR FROM b.date) = 1942;

-- TASK 3

SELECT
ships.name
FROM ships
JOIN classes c ON ships.class = c.class
LEFT JOIN outcomes o ON ships.name = o.ship
WHERE o.battle IS NUll;