-- Part 1.1
SELECT 
    s.student_name,
    c.course_title,
    e.semester,
    e.grade
FROM Enrollment e
JOIN Student s ON e.student_id = s.student_id
JOIN Course c ON e.course_id = c.course_id;

-- Part 1.2
SELECT 
    s.student_name
FROM Student s
JOIN Enrollment e ON s.student_id = e.student_id
WHERE e.course_id = 'CS101';

-- Part 1.3
SELECT 
    s.student_name,
    c.course_title,
    e.grade
FROM Enrollment e
JOIN Student s ON e.student_id = s.student_id
JOIN Course c ON e.course_id = c.course_id
ORDER BY e.student_id, e.course_id;

-- Part 2.1
INSERT INTO Student (student_id, student_name, major)
VALUES ('S005', 'Priya Rao', 'Computer Science');

-- Part 2.2
SELECT 
    s.student_name,
    e.course_id
FROM Student s
LEFT JOIN Enrollment e ON s.student_id = e.student_id;

-- Part 2.3
SELECT 
    s.student_id,
    s.student_name
FROM Student s
LEFT JOIN Enrollment e ON s.student_id = e.student_id
WHERE e.course_id IS NULL;

-- Part 3.1
SELECT COUNT(*) AS total_enrollments
FROM Enrollment;

-- Part 3.2
SELECT AVG(credit_hours) AS avg_credit_hours
FROM Course;

-- Part 3.3
SELECT 
    s.student_id,
    s.student_name,
    COUNT(e.course_id) AS enrolled_courses
FROM Student s
LEFT JOIN Enrollment e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name
ORDER BY s.student_id;

-- Part 3.4
SELECT 
    s.student_id,
    s.student_name,
    SUM(c.credit_hours) AS total_credit_hours
FROM Student s
JOIN Enrollment e ON s.student_id = e.student_id
JOIN Course c ON e.course_id = c.course_id
GROUP BY s.student_id, s.student_name
ORDER BY total_credit_hours DESC;

-- Part 4.1
SELECT 
    s.student_id,
    s.student_name,
    COUNT(e.course_id) AS course_count
FROM Student s
JOIN Enrollment e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name
HAVING COUNT(e.course_id) > 1;

-- Part 4.2
SELECT 
    c.course_id,
    c.course_title,
    COUNT(e.student_id) AS student_count
FROM Course c
JOIN Enrollment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 1;
