WITH emp_dep AS (
    SELECT employee_id, COUNT(employee_id) AS deps
    FROM Employee
    GROUP BY employee_id
)
SELECT e.employee_id, department_id
FROM Employee e
JOIN emp_dep ed ON ed.employee_id = e.employee_id
WHERE e.primary_flag = 'Y' OR ed.deps = 1