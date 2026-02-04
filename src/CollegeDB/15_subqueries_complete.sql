USE CollegeDB;
GO

----------------------------------------------------
-- 1. Single-row subquery
-- Students scoring above average marks
----------------------------------------------------
SELECT *
FROM Students
WHERE Marks > (
    SELECT AVG(Marks)
    FROM Students
);

----------------------------------------------------
-- 2. Subquery using IN
-- Students belonging to selected departments
----------------------------------------------------
SELECT *
FROM Students
WHERE DeptId IN (
    SELECT DeptId
    FROM Departments
    WHERE DeptName IN ('CSE', 'ECE')
);

----------------------------------------------------
-- 3. Subquery using ANY
-- Students scoring more than ANY CSE student
----------------------------------------------------
SELECT *
FROM Students
WHERE Marks > ANY (
    SELECT Marks
    FROM Students
    WHERE Department = 'CSE'
);

----------------------------------------------------
-- 4. Subquery using ALL
-- Students scoring more than ALL ECE students
----------------------------------------------------
SELECT *
FROM Students
WHERE Marks > ALL (
    SELECT Marks
    FROM Students
    WHERE Department = 'ECE'
);

----------------------------------------------------
-- 5. Correlated subquery
-- Students with highest marks in each department
----------------------------------------------------
SELECT *
FROM Students s
WHERE Marks = (
    SELECT MAX(Marks)
    FROM Students
    WHERE Department = s.Department
);

----------------------------------------------------
-- 6. Subquery using EXISTS
-- Departments that have students
----------------------------------------------------
SELECT *
FROM Departments d
WHERE EXISTS (
    SELECT 1
    FROM Students s
    WHERE s.DeptId = d.DeptId
);