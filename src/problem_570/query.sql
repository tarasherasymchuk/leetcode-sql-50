SELECT m.name
FROM employee e
JOIN employee m ON m.id = e.managerId
WHERE e.managerId IS NOT NULL
GROUP BY m.name, m.id
HAVING COUNT(e.id) >= 5