-- ANSI JOIN: This query selects the employee ID, last name, and department name 
-- from the EMPLOYEES table and DEPARTMENTS table using an ANSI JOIN.
SELECT 
    E.EMPLOYEE_ID,
    E.LAST_NAME,
    D.DEPARTMENT_NAME
FROM EMPLOYEES E
    JOIN DEPARTMENTS D ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
ORDER BY 1; -- Orders the results by EMPLOYEE_ID

-- SUBQUERY IN SELECT: This query uses a subquery to fetch the department name for each employee.
-- The subquery is less efficient as it executes for every row in the EMPLOYEES table.
SELECT 
    E.EMPLOYEE_ID,
    E.LAST_NAME,
    (SELECT DEPARTMENT_NAME FROM DEPARTMENTS D WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID) AS DEPT_NAME
FROM EMPLOYEES E
ORDER BY 1; -- Orders the results by EMPLOYEE_ID

-- SUBQUERY AS DERIVED TABLE: This query uses a subquery as a derived table to join REGIONS and COUNTRIES,
-- then it joins the result with the LOCATIONS table.
SELECT REGION_NO, NAME_COUNTRY 
FROM (
    SELECT 
        R.REGION_ID AS REGION_NO,
        R.REGION_NAME AS NAME_REGION,
        C.COUNTRY_ID AS COUNTRY_NO,
        C.COUNTRY_NAME AS NAME_COUNTRY
    FROM REGIONS R 
        JOIN COUNTRIES C ON C.REGION_ID = R.REGION_ID
) X
JOIN LOCATIONS L ON L.COUNTRY_ID = X.COUNTRY_NO;
-- You can filter results for a specific region by uncommenting the WHERE clause:
-- WHERE X.NAME_REGION = 'Europe';

-- SUBQUERY IN WHERE: This query finds employees hired after a specific employee named 'Davies'.
SELECT LAST_NAME, TO_CHAR(HIRE_DATE, 'DD/MM/YYYY') AS "DATE" 
FROM EMPLOYEES
WHERE HIRE_DATE > (SELECT HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME = 'Davies');

-- QUERY WITH CONDITION: This query selects details for the employee 'Taylor' with a specific ID.
SELECT 
    EMPLOYEE_ID,
    LAST_NAME,
    JOB_ID,
    SALARY
FROM EMPLOYEES 
WHERE LAST_NAME = 'Taylor' AND EMPLOYEE_ID = 176;

-- This query selects employees in the 'SA_REP' job who earn more than $8600.
SELECT 
    LAST_NAME,
    JOB_ID,
    SALARY
FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP' AND SALARY > 8600;

-- SUBQUERY WITH SALARY COMPARISON: This query selects employees whose salary is greater than 'Taylor's salary.
SELECT 
    LAST_NAME,
    JOB_ID,
    SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Taylor' AND EMPLOYEE_ID = 176)
AND
JOB_ID = (SELECT JOB_ID FROM EMPLOYEES WHERE LAST_NAME = 'Taylor' AND EMPLOYEE_ID = 176);

-- SIMPLE AGGREGATION: This query finds the minimum salary among all employees.
SELECT MIN(SALARY) FROM EMPLOYEES;

-- QUERY BY SPECIFIC SALARY: This query selects employees with a specific salary.
SELECT LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE SALARY = 2100;

-- SUBQUERY WITH DEPARTMENT NAME: This query selects employees with the minimum salary and their department names.
SELECT LAST_NAME, JOB_ID, SALARY,
    (SELECT DEPARTMENT_NAME FROM DEPARTMENTS D
    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
    ) AS "Department Name"
FROM EMPLOYEES E
WHERE SALARY = (
    SELECT MIN(SALARY) FROM EMPLOYEES);

-- GROUP BY WITH HAVING CLAUSE: This query finds the minimum salary per department, filtering out salaries less than $2100.
SELECT 
    DEPARTMENT_ID, 
    MIN(SALARY) 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MIN(SALARY) > 2100;

-- MINIMUM SALARY IN SPECIFIC DEPARTMENT: This query finds the minimum salary in department 50.
SELECT MIN(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = 50;

-- SUBQUERY IN HAVING CLAUSE: This query finds departments with minimum salaries higher than the minimum salary in department 50.
SELECT 
    DEPARTMENT_ID, 
    MIN(SALARY) 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MIN(SALARY) > (SELECT MIN(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = 50);

-- SELECTING EMPLOYEES FROM A DEPARTMENT: This query selects employees from department 60.
SELECT 
    DEPARTMENT_ID,
    LAST_NAME,
    SALARY
FROM EMPLOYEES WHERE DEPARTMENT_ID = 60;

-- MAXIMUM SALARY IN A DEPARTMENT: This query finds the maximum salary in department 50.
SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = 50; -- 8200

-- UPDATE SALARY USING A FIXED VALUE: This query updates salaries in department 60 to 8200.
UPDATE EMPLOYEES 
SET SALARY = 8200
WHERE DEPARTMENT_ID = 60;

-- SUBQUERY IN UPDATE: This query updates salaries in department 60 to the maximum salary in department 50.
UPDATE EMPLOYEES 
SET SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = 50)
WHERE DEPARTMENT_ID = 60;

-- CREATE TABLE FROM SELECT: This command creates a new table EMPLOYEES2 with data copied from the EMPLOYEES table.
CREATE TABLE EMPLOYEES2
AS
SELECT * FROM EMPLOYEES;

-- ROWID SELECTION: This query selects ROWID and salary for all employees.
SELECT ROWID, LAST_NAME, SALARY FROM EMPLOYEES;

-- GROUP BY WITH DUPLICATES CHECK: This query finds duplicate last names in EMPLOYEES2.
SELECT LAST_NAME, COUNT(*) 
FROM EMPLOYEES2 
GROUP BY LAST_NAME 
HAVING COUNT(*) > 1;

-- DELETE DUPLICATES: This query deletes duplicate rows from EMPLOYEES2, keeping the latest entry by ROWID.
DELETE FROM EMPLOYEES2
WHERE ROWID NOT IN (SELECT MAX(ROWID) FROM EMPLOYEES2 GROUP BY LAST_NAME);