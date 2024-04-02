SELECT r.contest_id, ROUND((COUNT(r.user_id) / (SELECT COUNT(u.user_id)::DECIMAL FROM users u)) * 100, 2) AS percentage
FROM register r
JOIN users u ON u.user_id = r.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC