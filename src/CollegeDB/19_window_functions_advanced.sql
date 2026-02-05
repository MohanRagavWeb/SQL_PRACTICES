USE CollegeDB;
GO

----------------------------------------------------
-- 1. LAG()
-- Get previous row value
----------------------------------------------------
SELECT
    StudentId,
    Name,
    Marks,
    LAG(Marks) OVER (ORDER BY StudentId) AS PreviousMarks
FROM Students;

----------------------------------------------------
-- 2. LEAD()
-- Get next row value
----------------------------------------------------
SELECT
    StudentId,
    Name,
    Marks,
    LEAD(Marks) OVER (ORDER BY StudentId) AS NextMarks
FROM Students;

----------------------------------------------------
-- 3. FIRST_VALUE()
-- First value in the window
----------------------------------------------------
SELECT
    StudentId,
    Name,
    Department,
    Marks,
    FIRST_VALUE(Marks) OVER (
        PARTITION BY Department
        ORDER BY Marks DESC
    ) AS HighestMarksInDept
FROM Students;

----------------------------------------------------
-- 4. LAST_VALUE()
-- Last value in the window
----------------------------------------------------
SELECT
    StudentId,
    Name,
    Department,
    Marks,
    LAST_VALUE(Marks) OVER (
        PARTITION BY Department
        ORDER BY Marks DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LowestMarksInDept
FROM Students;

----------------------------------------------------
-- 5. NTILE()
-- Divide rows into groups
----------------------------------------------------
SELECT
    StudentId,
    Name,
    Marks,
    NTILE(3) OVER (ORDER BY Marks DESC) AS PerformanceGroup
FROM Students;

----------------------------------------------------
-- 6. Window frame example
-- Running average
----------------------------------------------------
SELECT
    StudentId,
    Name,
    Marks,
    AVG(Marks) OVER (
        ORDER BY StudentId
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS RunningAverage
FROM Students;