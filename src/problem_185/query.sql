WITH cte AS(
    SELECT e.id, e.name, e.salary, e.departmentId,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS r
    FROM employee e
)
SELECT d.name AS Department, e.name AS Employee, c.salary AS Salary
FROM employee e
JOIN cte c ON c.id = e.id
JOIN department d ON d.id = c.departmentId
WHERE c.r <= 3