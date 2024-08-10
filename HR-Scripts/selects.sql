-- Retrieve all columns for all employees
SELECT * FROM EMPLOYEES;

-- Retrieve first name, last name, and email of all employees
SELECT FIRST_NAME, LAST_NAME, EMAIL FROM EMPLOYEES;

-- Select manager ID, first name, last name, and email with aliases for columns
SELECT MANAGER_ID MAN, FIRST_NAME NAME, LAST_NAME SURNAME, EMAIL FROM EMPLOYEES;

-- Select manager ID, first name, last name, and email with aliases using quotes
SELECT MANAGER_ID "MANAGER ID", FIRST_NAME "NAME", LAST_NAME "LAST NAME", EMAIL FROM EMPLOYEES;

-- Retrieve all employees in department 90
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 90;

-- Retrieve all employees in department 30
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 30;

-- Retrieve all employees in departments 30 and 90 using IN
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN (30,90);

-- Retrieve all employees in departments 30 and 90 using OR
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 90;

-- Retrieve all employees whose last name starts with 'M'
SELECT * FROM EMPLOYEES WHERE LAST_NAME LIKE 'M%';

-- Retrieve all employees whose last name contains 'ma'
SELECT * FROM EMPLOYEES WHERE LAST_NAME LIKE '%ma%';

-- Retrieve all employees whose last name matches the pattern '_a_e%'
SELECT * FROM EMPLOYEES WHERE LAST_NAME LIKE '_a_e%';

-- Retrieve employees with a salary greater than 10,000 and a non-null commission percentage
SELECT * FROM EMPLOYEES WHERE SALARY > 10000 AND COMMISSION_PCT IS NOT NULL;

-- Order employees by department descending, salary ascending, then job ID
SELECT * FROM EMPLOYEES ORDER BY DEPARTMENT_ID DESC, SALARY ASC, JOB_ID;

-- Select employees with aliases and order by manager ID
SELECT MANAGER_ID MAN, FIRST_NAME NAME, LAST_NAME SURNAME, EMAIL FROM EMPLOYEES ORDER BY MANAGER_ID;

-- Select employees with aliases and order by the first column
SELECT MANAGER_ID MAN, FIRST_NAME NAME, LAST_NAME SURNAME, EMAIL FROM EMPLOYEES ORDER BY 1;

-- Selects employee details and manager hierarchy
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID
FROM EMPLOYEES
-- Connect by clause establishes a parent-child relationship 
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;

-- Selects employee details starting from a specific employee
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID, LEVEL
FROM EMPLOYEES
-- Specifies the starting point of the hierarchy
START WITH EMPLOYEE_ID = 100
-- Establishes parent-child relationship and includes LEVEL for depth
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID
-- Orders siblings by last name at each level
ORDER SIBLINGS BY LAST_NAME;

-- Retrieves employees and their management hierarchy path for a specific department
SELECT LAST_NAME EMPLOYEES, 
    CONNECT_BY_ROOT LAST_NAME MANAGER,
    LEVEL - 1 "LEVEL",
    SYS_CONNECT_BY_PATH(LAST_NAME, '->') PATH
FROM EMPLOYEES
-- Filters for a specific department
WHERE DEPARTMENT_ID = 80 AND LEVEL > 1
-- Establishes parent-child relationship
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;


