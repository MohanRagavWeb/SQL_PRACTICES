-- Switch to CollegeDB
USE CollegeDB;
GO

-- Insert student records
INSERT INTO Students VALUES
(1, 'Mohan', 'CSE', 85),
(2, 'Ravi', 'ECE', 78),
(3, 'Anu', 'CSE', 92),
(4, 'Kiran', 'MECH', 69);

-- View all students
SELECT * FROM Students;

-- Students with marks above 80
SELECT * FROM Students
WHERE Marks > 80;

-- Only CSE students
SELECT * FROM Students
WHERE Department = 'CSE';

-- Sort by marks (highest first)
SELECT * FROM Students
ORDER BY Marks DESC;
