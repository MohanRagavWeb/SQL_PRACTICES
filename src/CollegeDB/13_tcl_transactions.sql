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

-- Data is now permanently stored
SELECT * FROM Students;

----------------------------------------------------
-- Example 2: ROLLBACK
-- Undo changes made in the transaction
----------------------------------------------------
BEGIN TRANSACTION;

INSERT INTO Students VALUES
(11, 'Rahul', 'ECE', 75, 2);

-- Undo the insert
ROLLBACK;

-- Record will NOT be present
SELECT * FROM Students;

----------------------------------------------------
-- Example 3: SAVEPOINT
-- Partial rollback
----------------------------------------------------
BEGIN TRANSACTION;

INSERT INTO Students VALUES
(12, 'Sneha', 'CSE', 88, 1);
SAVEPOINT SP1;

INSERT INTO Students VALUES
(13, 'Amit', 'MECH', 70, 3);
SAVEPOINT SP2;

-- Rollback only second insert
ROLLBACK TRANSACTION SP1;

-- Only Sneha record remains
SELECT * FROM Students;

----------------------------------------------------
-- Example 4: Commit after savepoint rollback
----------------------------------------------------
COMMIT;