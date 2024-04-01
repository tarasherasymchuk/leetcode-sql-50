SELECT s.student_id, s.student_name, c.subject_name, count(e.subject_name) AS attended_exams
FROM students s
CROSS JOIN subjects c
LEFT JOIN examinations e ON s.student_id = e.student_id AND e.subject_name = c.subject_name
GROUP BY s.student_id, s.student_name, c.subject_name
ORDER BY s.student_id, c.subject_name