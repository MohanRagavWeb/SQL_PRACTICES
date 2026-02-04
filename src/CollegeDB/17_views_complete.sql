USE CollegeDB;
GO

----------------------------------------------------
-- 1. Simple View
----------------------------------------------------
CREATE VIEW View_StudentsBasic
AS
SELECT StudentId, Name, Department, Marks
FROM Students;
GO

-- Use the view
SELECT * FROM View_StudentsBasic;
GO

----------------------------------------------------
-- 2. View with WHERE condition
----------------------------------------------------
CREATE VIEW View_HighScorers
AS
SELECT StudentId, Name, Marks
FROM Students
WHERE Marks > 80;
GO

SELECT * FROM View_HighScorers;
GO

----------------------------------------------------
-- 3. View with JOIN
----------------------------------------------------
CREATE VIEW View_StudentDepartment
AS
SELECT
    s.StudentId,
    s.Name,
    d.DeptName,
    s.Marks
FROM Students s
JOIN Departments d
ON s.DeptId = d.DeptId;
GO

SELECT * FROM View_StudentDepartment;
GO

----------------------------------------------------
-- 4. View with Aggregation
----------------------------------------------------
CREATE VIEW View_DepartmentAverage
AS
SELECT
    d.DeptName,
    AVG(s.Marks) AS AverageMarks
FROM Students s
JOIN Departments d
ON s.DeptId = d.DeptId
GROUP BY d.DeptName;
GO

SELECT * FROM View_DepartmentAverage;
GO

----------------------------------------------------
-- 5. Update data through View
-- (Works only for simple views)
----------------------------------------------------
UPDATE View_StudentsBasic
SET Marks = 90
WHERE StudentId = 1;
GO

-- Verify update
SELECT * FROM Students WHERE StudentId = 1;
GO

----------------------------------------------------
-- 6. Drop View
----------------------------------------------------
-- DROP VIEW View_HighScorers;
-- DROP VIEW View_StudentDepartment;
-- DROP VIEW View_DepartmentAverage;