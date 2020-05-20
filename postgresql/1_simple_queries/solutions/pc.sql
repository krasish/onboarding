-- Task 1

SELECT
model,
speed mhz,
hd gb
FROM pc
WHERE price < 1200;

-- Task 2

SELECT DISTINCT
maker
FROM product
WHERE type = 'Printer';

-- Task 3

SELECT
model,
hd,
screen
FROM laptop
WHERE price > 1000;

-- Task 4

SELECT
model
FROM printer
WHERE color = 'y';

-- Task 5

SELECT
model,
speed,
hd
FROM pc
WHERE cd IN ('12x', '16x')
AND  price < 2000;


