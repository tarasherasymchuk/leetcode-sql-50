SELECT f.user_id, COUNT(f.follower_id) AS followers_count
FROM followers f
GROUP BY f.user_id
ORDER BY f.user_id