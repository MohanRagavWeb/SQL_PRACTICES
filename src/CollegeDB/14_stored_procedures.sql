USE CollegeDB;
GO

----------------------------------------------------
-- Example 1: Simple Stored Procedure (SELECT)
----------------------------------------------------
CREATE PROCEDURE GetAllStudents
AS
BEGIN
    SELECT * FROM Students;
END;
GO

-- Execute the procedure
EXEC GetAllStudents;
GO

----------------------------------------------------
-- Example 2: Stored Procedure with INPUT parameter
----------------------------------------------------
CREATE PROCEDURE GetStudentsByDepartment
    @DeptName VARCHAR(30)
AS
BEGIN
    SELECT *
    FROM Students
    WHERE Department = @DeptName;
END;
GO

-- Execute with parameter
EXEC GetStudentsByDepartment 'CSE';
GO

----------------------------------------------------
-- Example 3: Stored Procedure with multiple parameters
----------------------------------------------------
CREATE PROCEDURE InsertStudent
    @StudentId INT,
    @Name VARCHAR(50),
    @Department VARCHAR(30),
    @Marks INT,
    @DeptId INT
AS
BEGIN
    INSERT INTO Students
    VALUES (@StudentId, @Name, @Department, @Marks, @DeptId);
END;
GO

-- Execute insert procedure
EXEC InsertStudent 20, 'Rohit', 'ECE', 82, 2;
GO

----------------------------------------------------
-- Example 4: ALTER Stored Procedure
----------------------------------------------------
ALTER PROCEDURE GetAllStudents
AS
BEGIN
    SELECT StudentId, Name, Department, Marks
    FROM Students;
END;
GO

-- Execute altered procedure
EXEC GetAllStudents;
GO

----------------------------------------------------
-- Example 5: DROP Stored Procedure
----------------------------------------------------
-- (Use carefully)

-- DROP PROCEDURE GetStudentsByDepartment;
-- DROP PROCEDURE InsertStudent;