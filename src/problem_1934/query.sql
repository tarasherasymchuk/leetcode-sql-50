SELECT s.user_id, 
    CASE WHEN COUNT(c.user_id)::DECIMAL = 0
    THEN 0
    ELSE ROUND(COUNT(c.user_id) FILTER (WHERE c.action = 'confirmed') / COUNT(c.user_id)::DECIMAL, 2)
    END AS confirmation_rate
FROM signups s
LEFT JOIN confirmations c ON c.user_id = s.user_id
GROUP BY s.user_id
