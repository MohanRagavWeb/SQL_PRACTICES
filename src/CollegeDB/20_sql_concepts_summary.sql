USE CollegeDB;
GO

----------------------------------------------------
-- 1. DDL (Data Definition Language)
-- CREATE, ALTER, DROP
----------------------------------------------------

-- Create table
CREATE TABLE SampleDDL (
    Id INT,
    Name VARCHAR(50)
);

-- Alter table
ALTER TABLE SampleDDL ADD Age INT;

-- Drop table
-- DROP TABLE SampleDDL;


----------------------------------------------------
-- 2. DML (Data Manipulation Language)
-- INSERT, UPDATE, DELETE, SELECT
----------------------------------------------------

INSERT INTO Students VALUES (100, 'Test', 'CSE', 75, 1);

UPDATE Students
SET Marks = 80
WHERE StudentId = 100;

DELETE FROM Students
WHERE StudentId = 100;

SELECT * FROM Students;


----------------------------------------------------
-- 3. DCL (Data Control Language)
-- GRANT, REVOKE
----------------------------------------------------

-- Example syntax
-- GRANT SELECT ON Students TO UserName;
-- REVOKE SELECT ON Students FROM UserName;


----------------------------------------------------
-- 4. TCL (Transaction Control Language)
-- COMMIT, ROLLBACK, SAVE TRANSACTION
----------------------------------------------------

BEGIN TRANSACTION;

INSERT INTO Students VALUES (101, 'Temp', 'ECE', 70, 2);

ROLLBACK;

----------------------------------------------------
-- 5. JOINS
----------------------------------------------------

-- INNER JOIN
SELECT s.Name, d.DeptName
FROM Students s
JOIN Departments d
ON s.DeptId = d.DeptId;

----------------------------------------------------
-- 6. AGGREGATE FUNCTIONS
----------------------------------------------------

SELECT AVG(Marks) FROM Students;
SELECT MAX(Marks) FROM Students;
SELECT COUNT(*) FROM Students;

----------------------------------------------------
-- 7. SUBQUERY
----------------------------------------------------

SELECT *
FROM Students
WHERE Marks > (
    SELECT AVG(Marks) FROM Students
);

----------------------------------------------------
-- 8. VIEW
----------------------------------------------------

CREATE VIEW View_Test AS
SELECT Name, Marks
FROM Students;

SELECT * FROM View_Test;

----------------------------------------------------
-- 9. STORED PROCEDURE
----------------------------------------------------

CREATE PROCEDURE TestProcedure
AS
BEGIN
    SELECT * FROM Students;
END;

EXEC TestProcedure;

----------------------------------------------------
-- 10. CTE
----------------------------------------------------

WITH CTE_Test AS (
    SELECT Name, Marks
    FROM Students
)
SELECT * FROM CTE_Test;

----------------------------------------------------
-- 11. WINDOW FUNCTION
----------------------------------------------------

SELECT
    Name,
    Marks,
    ROW_NUMBER() OVER (ORDER BY Marks DESC) AS RowNum
FROM Students;
