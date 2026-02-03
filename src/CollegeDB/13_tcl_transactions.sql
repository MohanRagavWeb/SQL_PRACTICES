USE CollegeDB;
GO

----------------------------------------------------
-- Example 1: COMMIT
-- Changes are permanently saved
----------------------------------------------------
BEGIN TRANSACTION;

INSERT INTO Students VALUES
(10, 'Karthik', 'CSE', 81, 1);

COMMIT;

-- Verify commit
SELECT * FROM Students
WHERE StudentId = 10;

----------------------------------------------------
-- Example 2: ROLLBACK
-- Undo changes made in the transaction
----------------------------------------------------
BEGIN TRANSACTION;

INSERT INTO Students VALUES
(11, 'Rahul', 'ECE', 75, 2);

-- Undo the insert
ROLLBACK;

-- Verify rollback (no record)
SELECT * FROM Students
WHERE StudentId = 11;

----------------------------------------------------
-- Example 3: SAVE TRANSACTION (SAVEPOINT)
-- Partial rollback
----------------------------------------------------
BEGIN TRANSACTION;

-- First insert
INSERT INTO Students VALUES
(12, 'Sneha', 'CSE', 88, 1);

-- Savepoint
SAVE TRANSACTION SP1;

-- Second insert
INSERT INTO Students VALUES
(13, 'Amit', 'MECH', 70, 3);

-- Savepoint
SAVE TRANSACTION SP2;

-- Rollback only to SP1 (undo Amit insert)
ROLLBACK TRANSACTION SP1;

-- Verify partial rollback
SELECT * FROM Students
WHERE StudentId IN (12, 13);

----------------------------------------------------
-- Commit remaining changes
----------------------------------------------------
COMMIT;