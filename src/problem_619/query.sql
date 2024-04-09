SELECT MAX(t.num) AS num
FROM (
    SELECT m.num
    FROM mynumbers m
    GROUP BY m.num
    HAVING COUNT(m.num) = 1
) AS t