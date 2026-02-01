USE CollegeDB;
GO

-- Add new column
ALTER TABLE Students
ADD Age INT;

-- Modify data
UPDATE Students
SET Age = 20
WHERE StudentId = 1;

-- Drop column
ALTER TABLE Students
DROP COLUMN Age;
