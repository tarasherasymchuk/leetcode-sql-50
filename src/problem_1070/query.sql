SELECT t.product_id, t.year AS first_year, t.quantity, t.price FROM (
    SELECT s.product_id, s.quantity, s.price, s.year,
        DENSE_RANK() OVER (PARTITION BY s.product_id ORDER BY s.year) AS r
    FROM sales s
) AS t
WHERE t.r = 1