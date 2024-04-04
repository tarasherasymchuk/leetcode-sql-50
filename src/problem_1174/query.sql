WITH cte AS (
    SELECT d.delivery_id, DENSE_RANK() OVER (PARTITION BY d.customer_id ORDER BY d.order_date) AS order_number
    FROM delivery d
)
SELECT ROUND((COUNT(*) FILTER (WHERE order_date = customer_pref_delivery_date) / COUNT(*)::DECIMAL) * 100, 2) AS immediate_percentage
FROM delivery d
JOIN cte c ON c.delivery_id = d.delivery_id AND c.order_number = 1
