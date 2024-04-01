SELECT c.id, c.movie, c.description, c.rating
FROM cinema c
WHERE c.description <> 'boring' AND MOD(c.id, 2) <> 0
ORDER BY c.rating DESC;