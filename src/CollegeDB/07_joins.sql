USE CollegeDB;
GO

SELECT 
    s.StudentId,
    s.Name,
    d.DeptName,
    s.Marks
FROM Students s
INNER JOIN Departments d
ON s.DeptId = d.DeptId;
