WITH quality_cte AS (
    SELECT q.query_name, COUNT(*) total, SUM(q.rating / q.position::DECIMAL) total_q,
        COUNT(*) FILTER (WHERE q.rating < 3)::DECIMAL AS poor_query
    FROM queries q
    GROUP BY q.query_name
)
SELECT qc.query_name, ROUND(qc.total_q / qc.total, 2) AS quality, 
    ROUND((qc.poor_query / qc.total) * 100, 2) AS poor_query_percentage
FROM quality_cte qc
WHERE qc.query_name IS NOT NULL