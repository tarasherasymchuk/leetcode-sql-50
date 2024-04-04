WITH cte AS (
    SELECT DATE_PART('day', LEAD(a.event_date, 1) OVER (ORDER BY a.player_id, a.event_date)::TIMESTAMP - a.event_date::TIMESTAMP) AS days_diff,
        DENSE_RANK() OVER (PARTITION BY a.player_id ORDER BY a.event_date) AS r
    FROM activity a
),
cte_total AS (
    SELECT COUNT(DISTINCT player_id) AS total
    FROM activity
)
SELECT COALESCE(ROUND(SUM(c.days_diff)::DECIMAL / (SELECT total FROM cte_total), 2), 0) AS fraction
FROM cte c
WHERE c.days_diff = 1 AND c.r = 1
