-- Part 1.1
UPDATE Student
SET major = 'Data Science'
WHERE student_id = 'S005';

-- Part 1.2
DELETE FROM Enrollment
WHERE student_id = 'S004' 
  AND course_id = 'ACC301';

-- Part 2.1
SELECT course_id, course_title, credit_hours
FROM Course
WHERE credit_hours > (
    SELECT AVG(credit_hours)
    FROM Course
);

--Part 2.2
SELECT s.student_id, s.student_name, COUNT(e.course_id) AS enrollment_count
FROM Student s
JOIN Enrollment e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name
HAVING COUNT(e.course_id) > (
    SELECT AVG(course_count)
    FROM (
        SELECT COUNT(course_id) AS course_count
        FROM Enrollment
        GROUP BY student_id
    )
);

--Part 2.3
SELECT student_name
FROM Student
WHERE student_id IN (
    SELECT student_id
    FROM Enrollment
    WHERE course_id IN (
        SELECT course_id
        FROM Course
        WHERE credit_hours = 4
    )
);

--Part 2.4
SELECT course_title
FROM Course
WHERE credit_hours = (
    SELECT credit_hours
    FROM Course
    WHERE course_id = 'CS101'
)
AND course_id <> 'CS101';

--Part 3.1
SELECT student_name
FROM Student
WHERE major = 'Marketing'
UNION
SELECT s.student_name
FROM Student s
JOIN Enrollment e ON s.student_id = e.student_id
WHERE e.course_id = 'CS101';

--Part 4.1
CREATE OR REPLACE VIEW v_student_credit_totals AS
SELECT 
    s.student_id,
    s.student_name,
    SUM(c.credit_hours) AS total_credit_hours
FROM Student s
JOIN Enrollment e ON s.student_id = e.student_id
JOIN Course c ON e.course_id = c.course_id
GROUP BY s.student_id, s.student_name;

--Part 4.2
SELECT student_id, student_name, total_credit_hours
FROM v_student_credit_totals
WHERE total_credit_hours > 3;
