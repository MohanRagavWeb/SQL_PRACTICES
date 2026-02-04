USE CollegeDB;
GO

----------------------------------------------------
-- 1. ROW_NUMBER()
-- Assigns a unique number to each row
----------------------------------------------------
SELECT
    StudentId,
    Name,
    Department,
    Marks,
    ROW_NUMBER() OVER (ORDER BY Marks DESC) AS RowNum
FROM Students;

----------------------------------------------------
-- 2. RANK()
-- Same rank for same values (with gaps)
----------------------------------------------------
SELECT
    StudentId,
    Name,
    Department,
    Marks,
    RANK() OVER (ORDER BY Marks DESC) AS RankValue
FROM Students;

----------------------------------------------------
-- 3. DENSE_RANK()
-- Same rank for same values (no gaps)
----------------------------------------------------
SELECT
    StudentId,
    Name,
    Department,
    Marks,
    DENSE_RANK() OVER (ORDER BY Marks DESC) AS DenseRankValue
FROM Students;

----------------------------------------------------
-- 4. PARTITION BY
-- Ranking within each department
----------------------------------------------------
SELECT
    StudentId,
    Name,
    Department,
    Marks,
    RANK() OVER (
        PARTITION BY Department
        ORDER BY Marks DESC
    ) AS DeptRank
FROM Students;

----------------------------------------------------
-- 5. Aggregate Window Function
-- Average marks per department (without GROUP BY)
----------------------------------------------------
SELECT
    StudentId,
    Name,
    Department,
    Marks,
    AVG(Marks) OVER (PARTITION BY Department) AS DeptAvgMarks
FROM Students;

----------------------------------------------------
-- 6. Running Total
----------------------------------------------------
SELECT
    StudentId,
    Name,
    Marks,
    SUM(Marks) OVER (
        ORDER BY StudentId
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM Students;