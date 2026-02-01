USE CollegeDB;
GO

CREATE TABLE Teachers (
    TeacherId INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Experience INT CHECK (Experience >= 0),
    Salary INT DEFAULT 30000
);
