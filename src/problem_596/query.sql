SELECT c.class
FROM courses c
GROUP BY c.class
HAVING COUNT(c.class) >= 5