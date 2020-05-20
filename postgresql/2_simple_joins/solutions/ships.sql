-- TASK 1

SELECT
name
FROM ships INNER JOIN classes ON ships.class = classes.class
WHERE displacement > 35000;

-- TASK 2

SELECT
name,
bore,
numguns
FROM ships INNER JOIN classes c ON ships.class = c.class
INNER JOIN outcomes o ON ships.name = o.ship
WHERE o.battle = 'Guadalcanal';

-- TASK 3

SELECT
country
FROM classes WHERE type = 'bb'
INTERSECT
SELECT
    country
FROM classes WHERE type = 'bc';


--

SELECT DISTINCT
c1.country
FROM classes c1 JOIN classes c2 ON c1.country = c2.country
WHERE (c1.type = 'bb' AND c2.type = 'bc') OR (c1.type = 'bv' AND c2.type = 'bb');


-- TASK 4

SELECT
*
FROM outcomes o1
JOIN battles b1 ON o1.battle = b1.name
JOIN outcomes o2 ON o1.ship = o2.ship
JOIN battles b2 ON b2.name = o2.battle
WHERE b1.date < b2.date
AND o1.result = 'damaged';




