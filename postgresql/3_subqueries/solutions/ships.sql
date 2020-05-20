-- TASK 1


SELECT DISTINCT
country
FROM classes
WHERE numguns = (SELECT max(numguns) FROM classes);

-- TASK 2

SELECT DISTINCT
classes.class
FROM classes
JOIN ships s ON classes.class = s.class
JOIN outcomes o ON s.name = o.ship
WHERE result = 'sunk';

SELECT
class
FROM classes
WHERE class IN (SELECT
                class
    FROM ships JOIN outcomes ON ships.name = outcomes.ship
    WHERE result = 'sunk'
    )         ;

-- TASK 3

SELECT DISTINCT
name
FROM ships
JOIN classes c ON ships.class = c.class
WHERE bore = 16;

-- TASK 4

SELECT
battle
FROM ships s
JOIN outcomes o ON s.name = o.ship
WHERE s.class = 'Kongo';

-- TASK 5

SELECT
s.name
FROM ships s
JOIN classes c ON s.class = c.class
WHERE numguns = (SELECT max(numguns) FROM classes WHERE c.bore = classes.bore);
