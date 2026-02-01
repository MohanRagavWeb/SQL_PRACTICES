USE CollegeDB;
GO

CREATE TABLE Departments (
    DeptId INT PRIMARY KEY,
    DeptName VARCHAR(30)
);

INSERT INTO Departments VALUES
(1, 'CSE'),
(2, 'ECE'),
(3, 'MECH');

-- Add DeptId to Students
ALTER TABLE Students
ADD DeptId INT;

ALTER TABLE Students
ADD CONSTRAINT FK_Dept
FOREIGN KEY (DeptId) REFERENCES Departments(DeptId);

UPDATE Students SET DeptId = 1 WHERE Department = 'CSE';
UPDATE Students SET DeptId = 2 WHERE Department = 'ECE';
UPDATE Students SET DeptId = 3 WHERE Department = 'MECH';
