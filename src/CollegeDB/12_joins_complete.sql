use collegeDB
go

----------------------------------------------------
-- 1. INNER JOIN
-- Returns records that have matching values
----------------------------------------------------
SELECT
    s.StudentId,
    s.Name,
    d.DeptName,
    s.Marks
FROM Students s
INNER JOIN Departments d
ON s.DeptId = d.DeptId;

----------------------------------------------------
-- 2. LEFT JOIN
-- Returns all records from left table (Students)
----------------------------------------------------
SELECT
    s.StudentId,
    s.Name,
    d.DeptName,
    s.Marks
FROM Students s
LEFT JOIN Departments d
ON s.DeptId = d.DeptId;

----------------------------------------------------
-- 3. RIGHT JOIN
-- Returns all records from right table (Departments)
----------------------------------------------------
SELECT
    s.StudentId,
    s.Name,
    d.DeptName,
    s.Marks
FROM Students s
RIGHT JOIN Departments d
ON s.DeptId = d.DeptId;

----------------------------------------------------
-- 4. FULL OUTER JOIN
-- Returns all records when there is a match or not
----------------------------------------------------
SELECT
    s.StudentId,
    s.Name,
    d.DeptName,
    s.Marks
FROM Students s
FULL OUTER JOIN Departments d
ON s.DeptId = d.DeptId;

----------------------------------------------------
-- 5. JOIN with WHERE condition
----------------------------------------------------
SELECT
    s.StudentId,
    s.Name,
    d.DeptName,
    s.Marks
FROM Students s
INNER JOIN Departments d
ON s.DeptId = d.DeptId
WHERE s.Marks > 80;

----------------------------------------------------
-- 6. COUNT students department-wise (JOIN + GROUP BY)
----------------------------------------------------
SELECT
    d.DeptName,
    COUNT(s.StudentId) AS TotalStudents
FROM Departments d
LEFT JOIN Students s
ON d.DeptId = s.DeptId
GROUP BY d.DeptName;