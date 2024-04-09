SELECT c.customer_id
FROM customer c
JOIN product p ON p.product_key = c.product_key
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(*) FROM product)