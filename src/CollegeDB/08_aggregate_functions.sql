USE CollegeDB;
GO

-- Total students
SELECT COUNT(*) AS TotalStudents FROM Students;

-- Average marks
SELECT AVG(Marks) AS AverageMarks FROM Students;

-- Department-wise average
SELECT DeptId, AVG(Marks) AS AvgMarks
FROM Students
GROUP BY DeptId;
