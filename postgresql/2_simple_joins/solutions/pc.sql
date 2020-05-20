-- TASK 1

SELECT
p.maker,
l.speed
FROM laptop l INNER JOIN product p ON l.model = p.model
WHERE l.hd >= 9;

-- TASK 2

SELECT
    product.model,
    l.price
FROM product INNER JOIN  laptop l ON product.model = l.model
WHERE product.maker LIKE 'B%'
UNION
SELECT
    product.model,
    pc.price
FROM product INNER JOIN  pc ON product.model = pc.model
WHERE product.maker LIKE 'B%'
UNION
SELECT
    product.model,
    p.price
FROM product INNER JOIN  printer p ON product.model = p.model
WHERE product.maker LIKE 'B%';

-- TASK 3

SELECT
    hd
FROM pc
GROUP BY hd
HAVING count(hd) > 2;

-- TASk 4

SELECT DISTINCT
p1.model,
p2.model
FROM pc p1 JOIN pc p2 ON p1.speed = p2.speed AND p1.ram = p2.ram
WHERE p1.model < p2.model;

-- TASK 5

SELECT DISTINCT
*
--pr1.maker
FROM pc p1
JOIN product pr1 ON p1.model = pr1.model
JOIN product pr2 ON pr2.maker = pr1.maker
JOIN pc p2 ON pr2.model = p2.model
WHERE p1.speed > 500
AND p1.model != p2.model;

