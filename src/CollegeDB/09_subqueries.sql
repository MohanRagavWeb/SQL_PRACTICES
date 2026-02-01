USE CollegeDB;
GO

-- Students with marks above average
SELECT *
FROM Students
WHERE Marks > (
    SELECT AVG(Marks) FROM Students
);
