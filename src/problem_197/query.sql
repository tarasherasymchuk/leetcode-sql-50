SELECT w2.id
FROM weather w
JOIN weather w2 ON w.recordDate = w2.recordDate - INTERVAL '1 DAY'
WHERE w2.temperature > w.temperature;