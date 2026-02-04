USE CollegeDB;
GO

----------------------------------------------------
-- 1. Simple CTE
-- Students with marks greater than 80
----------------------------------------------------
WITH HighScorers AS (
    SELECT StudentId, Name, Marks
    FROM Students
    WHERE Marks > 80
)
SELECT * FROM HighScorers;

----------------------------------------------------
-- 2. CTE with JOIN
----------------------------------------------------
WITH StudentDept AS (
    SELECT
        s.StudentId,
        s.Name,
        d.DeptName,
        s.Marks
    FROM Students s
    JOIN Departments d
    ON s.DeptId = d.DeptId
)
SELECT * FROM StudentDept;

----------------------------------------------------
-- 3. CTE with aggregation
-- Department-wise average marks
----------------------------------------------------
WITH DeptAverage AS (
    SELECT
        DeptId,
        AVG(Marks) AS AvgMarks
    FROM Students
    GROUP BY DeptId
)
SELECT
    d.DeptName,
    da.AvgMarks
FROM DeptAverage da
JOIN Departments d
ON da.DeptId = d.DeptId;

----------------------------------------------------
-- 4. Recursive CTE (example using numbers)
-- Generate numbers from 1 to 5
----------------------------------------------------
WITH NumberCTE AS (
    SELECT 1 AS Num
    UNION ALL
    SELECT Num + 1
    FROM NumberCTE
    WHERE Num < 5
)
SELECT * FROM NumberCTE;