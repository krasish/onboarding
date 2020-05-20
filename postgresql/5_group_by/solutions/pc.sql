SET SEARCH_PATH = pc, ships;

-- TASK 1

SELECT
avg(speed)
FROM pc;

-- TASK 2

SELECT
maker,
avg(screen)
FROM laptop JOIN product p ON laptop.model = p.model
GROUP BY maker;

-- TASK 3

SELECT
avg(speed)
FROM laptop
WHERE price > 1000;

-- TASK 4

SELECT
avg(price)
FROM pc
JOIN product p ON pc.model = p.model
WHERE maker = 'A';

-- TASK 5

SELECT
avg(pc_laptop.price)
FROM (SELECT
    pc.price AS price,
    maker
    FROM pc JOIN product ON pc.model = product.model
  --  WHERE maker = 'B'
    UNION
    SELECT
    laptop.price AS price,
    maker
    FROM laptop JOIN product ON laptop.model = product.model
--    WHERE maker = 'B'
    ) pc_laptop
WHERE pc_laptop.maker = 'B';

-- TASK 6

SELECT
speed,
avg(price)
FROM pc
GROUP BY
pc.pc.speed;

-- TASK 7

SELECT
maker,
count(p.code)
FROM product
JOIN pc p ON product.model = p.model
GROUP BY maker
HAVING
count(p.code) >= 3;

-- TASK 8

SELECT --DISTINCT
maker
FROM product
WHERE model IN (SELECT
                model
                FROM pc
                WHERE price = (SELECT max(price) FROM pc));

SELECT
maker
FROM product JOIN pc ON product.model = pc.model
WHERE pc.price = (SELECT max(price) FROM pc);

-- TASK 9

SELECT
speed,
avg(price)
FROM pc
GROUP BY speed
HAVING speed > 800;

-- TASK 10 -- QUESTION

SELECT
maker
--,avg(hd)
FROM product
LEFT JOIN printer p ON product.model = p.model
JOIN pc ON product.model = pc.model
WHERE p.code IS NOT NULL;
--GROUP BY maker;

SELECT
maker
FROM pc
JOIN product p ON pc.model = p.model
GROUP BY maker
HAVING maker IN (SELECT
    maker
    FROM  product
    WHERE type = 'Printer');


-- TASK 11

SELECT
screen,
(MAX(price) - MIN(price)) as diff
FROM laptop
GROUP BY screen
ORDER BY screen;