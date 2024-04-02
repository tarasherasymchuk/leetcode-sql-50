WITH cte AS (
    SELECT p.product_id, SUM(p.price * u.units) AS total
    FROM prices p
    LEFT JOIN unitssold u ON p.product_id = u.product_id
        AND u.purchase_date BETWEEN p.start_date AND p.end_date
    GROUP BY p.product_id
)
SELECT c.product_id, COALESCE(ROUND(c.total / SUM(u.units)::DECIMAL, 2), 0) AS average_price
FROM unitssold u
RIGHT JOIN cte c ON u.product_id = c.product_id
GROUP BY c.product_id, c.total
