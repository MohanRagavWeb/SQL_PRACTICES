USE CollegeDB;
GO

-- Example 1: Create a SQL Server Login (Admin task)
CREATE LOGIN StudentUser
WITH PASSWORD = 'Student@123';
GO
-- Example 2: Create a Database User
CREATE USER StudentUser FOR LOGIN StudentUser;
GO
-- Example 3: GRANT permissions
-- Allow SELECT on Students table
GRANT SELECT ON Students TO StudentUser;

-- Allow INSERT on Students table
GRANT INSERT ON Students TO StudentUser;

-- Allow UPDATE on Students table
GRANT UPDATE ON Students TO StudentUser;

--Example 4: Check permissions (conceptual)
USE CollegeDB;
GO

SELECT  
    dp.name AS UserName,
    dp.type_desc AS UserType,
    perm.permission_name,
    perm.state_desc,
    obj.name AS ObjectName
FROM sys.database_permissions perm
JOIN sys.database_principals dp
    ON perm.grantee_principal_id = dp.principal_id
LEFT JOIN sys.objects obj
    ON perm.major_id = obj.object_id
WHERE dp.name = 'StudentUser';

-- Example 5: REVOKE permissions
-- Remove UPDATE permission
REVOKE UPDATE ON Students FROM StudentUser;

-- Remove INSERT permission
REVOKE INSERT ON Students FROM StudentUser;

----------------------------------------------------
-- Example 6: Grant ALL permissions
----------------------------------------------------
GRANT ALL ON Students TO StudentUser;

----------------------------------------------------
-- Example 7: Revoke ALL permissions
----------------------------------------------------
REVOKE ALL ON Students FROM StudentUser;

----------------------------------------------------
-- Example 8: Drop user and login (cleanup)
----------------------------------------------------
DROP USER StudentUser;
DROP LOGIN StudentUser;


SELECT
    SUSER_NAME(),
    USER_NAME(),
    IS_SRVROLEMEMBER('sysadmin');




