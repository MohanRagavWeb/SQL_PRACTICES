USE CollegeDB;
GO

-- Update marks
UPDATE Students
SET Marks = 88
WHERE StudentId = 2;

-- Delete a student
DELETE FROM Students
WHERE StudentId = 4;

-- View result
SELECT * FROM Students;
