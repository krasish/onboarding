-- TASK 1

SELECT DISTINCT
maker
FROM pc
JOIN product p ON pc.model = p.model
WHERE pc.speed >= 500;

-- TASK 2

SELECT
model printer
FROM printer
WHERE price = (SELECT MAX(price) FROM printer);

-- TASK 3

SELECT
model
FROM laptop
WHERE speed < ALL (SELECT speed FROM pc);

SELECT DISTINCT
model
FROM laptop
WHERE speed <= (SELECT speed
                FROM pc
                ORDER BY speed
                LIMIT 1);

-- TASK 4

SELECT
model,
price
FROM laptop
    UNION
SELECT
model,
price
FROM pc
    UNION
SELECT
model,
price
FROM printer
ORDER BY price DESC
LIMIT 1;

-- TASK 5

SELECT
maker
FROM printer
JOIN product p ON printer.model = p.model
WHERE color = 'y'
ORDER BY price
LIMIT 1;

-- TASK 6

SELECT
maker
FROM product JOIN pc p ON product.model = p.model
WHERE p.ram = (SELECT min(ram) from pc)
AND p.speed = (SELECT max(speed) from pc WHERE ram = (SELECT min(ram) from pc));


