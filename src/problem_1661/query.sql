WITH cte AS (
    SELECT s.machine_id, s.process_id, SUM(e.timestamp - s.timestamp) AS processing_time
    FROM activity s
    JOIN activity e ON s.machine_id = e.machine_id 
        AND s.process_id = e.process_id
    WHERE s.activity_type = 'start' AND e.activity_type = 'end'
    GROUP BY s.machine_id, s.process_id
)
SELECT c.machine_id, ROUND(AVG(CAST(c.processing_time AS DECIMAL)), 3) AS processing_time
FROM cte c
GROUP BY c.machine_id