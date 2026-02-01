USE CollegeDB;
GO

CREATE VIEW StudentDetails AS
SELECT 
    s.StudentId,
    s.Name,
    d.DeptName,
    s.Marks
FROM Students s
JOIN Departments d
ON s.DeptId = d.DeptId;

-- Use the view
SELECT * FROM StudentDetails;
