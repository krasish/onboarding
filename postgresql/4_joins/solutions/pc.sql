SET SEARCH_PATH = movie, pc, ships;

-- TASK 1

SELECT
product.maker,
product.model,
product.type
FROM product
LEFT JOIN pc p ON product.model = p.model
LEFT JOIN laptop l ON product.model = l.model
LEFT JOIN printer p2 ON product.model = p2.model
WHERE p.code IS NULL
AND  l.code IS NULL
AND p2.code IS NULL;