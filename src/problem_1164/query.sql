WITH dt AS (
    SELECT t.product_id, t.new_price AS price
    FROM (
        SELECT product_id, new_price, change_date,
            ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rn
        FROM Products
        WHERE change_date <= '2019-08-16'
    ) AS t
    WHERE t.rn = 1
)
SELECT * FROM dt
UNION
SELECT product_id, 10 
FROM Products
WHERE change_date > '2019-08-16' AND product_id NOT IN (SELECT product_id FROM dt)