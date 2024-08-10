-- NATURAL JOIN: Automatically joins tables based on columns with the same name in both tables.

-- ANSI JOIN (using NATURAL JOIN)
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       JOB_ID,
       JOB_TITLE
FROM EMPLOYEES NATURAL JOIN JOBS
ORDER BY EMPLOYEE_ID;

-- TRADITIONAL JOIN: Using implicit syntax to join tables based on a condition.
SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME,
       E.JOB_ID,
       J.JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID
ORDER BY EMPLOYEE_ID; 


-------------------------


-- INNER JOIN: Retrieves records with matching values in both tables.

-- ANSI JOIN (using INNER JOIN)
SELECT E.LAST_NAME,
       E.DEPARTMENT_ID,
       D.DEPARTMENT_NAME,
       L.CITY
FROM EMPLOYEES E
    INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
ORDER BY E.LAST_NAME;

-- TRADITIONAL JOIN: Equivalent INNER JOIN using implicit syntax.
SELECT E.LAST_NAME,
       E.DEPARTMENT_ID,
       D.DEPARTMENT_NAME,
       L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
    AND D.LOCATION_ID = L.LOCATION_ID
ORDER BY E.LAST_NAME;


-------------------------


-- LEFT JOIN: Retrieves all records from the left table and the matched records from the right table. If no match, NULLs are returned for columns from the right table.

-- ANSI JOIN (using LEFT OUTER JOIN)
SELECT R.REGION_ID,
       REGION_NAME,
       C.COUNTRY_ID,
       C.COUNTRY_NAME,
       L.CITY
FROM REGIONS R
    LEFT OUTER JOIN COUNTRIES C ON R.REGION_ID = C.REGION_ID
    LEFT OUTER JOIN LOCATIONS L ON C.COUNTRY_ID = L.COUNTRY_ID;

-- TRADITIONAL JOIN: Equivalent LEFT JOIN using Oracle-specific syntax.
SELECT R.REGION_ID,
       REGION_NAME,
       C.COUNTRY_ID,
       C.COUNTRY_NAME,
       L.CITY
FROM REGIONS R, COUNTRIES C, LOCATIONS L
WHERE R.REGION_ID = C.REGION_ID(+)
    AND C.COUNTRY_ID = L.COUNTRY_ID(+);


-------------------------


-- RIGHT JOIN: Retrieves all records from the right table and the matched records from the left table. If no match, NULLs are returned for columns from the left table.

-- ANSI JOIN (using RIGHT OUTER JOIN)
SELECT D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME,
       E.EMPLOYEE_ID,
       E.LAST_NAME,
       E.SALARY
FROM EMPLOYEES E
    RIGHT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY 1, 2, 3, 4;

-- TRADITIONAL JOIN: Equivalent RIGHT JOIN using Oracle-specific syntax.
SELECT D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME,
       E.EMPLOYEE_ID,
       E.LAST_NAME,
       E.SALARY
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID(+) = D.DEPARTMENT_ID
ORDER BY 1, 2, 3, 4;
    

-------------------------


-- FULL JOIN: Combines results of both LEFT JOIN and RIGHT JOIN. Retrieves all records when there is a match in either left or right table records.

-- ANSI JOIN (using FULL OUTER JOIN)
SELECT D1.DEPARTMENT_ID AS "Dept1 ID",
       D1.DEPARTMENT_NAME AS "Dept1 Name",
       D2.DEPARTMENT_ID AS "Dept2 ID",
       D2.DEPARTMENT_NAME AS "Dept2 Name"
FROM DEPT1 D1
    FULL OUTER JOIN DEPT2 D2
        ON D1.DEPARTMENT_ID = D2.DEPARTMENT_ID
ORDER BY 1;
        
-- TRADITIONAL JOIN: Equivalent FULL JOIN using UNION of two LEFT OUTER JOINs.
SELECT D1.DEPARTMENT_ID AS "Dept1 ID",
       D1.DEPARTMENT_NAME AS "Dept1 Name",
       D2.DEPARTMENT_ID AS "Dept2 ID",
       D2.DEPARTMENT_NAME AS "Dept2 Name"
FROM DEPT1 D1, DEPT2 D2
WHERE D1.DEPARTMENT_ID(+) = D2.DEPARTMENT_ID
UNION
SELECT D1.DEPARTMENT_ID AS "Dept1 ID",
       D1.DEPARTMENT_NAME AS "Dept1 Name",
       D2.DEPARTMENT_ID AS "Dept2 ID",
       D2.DEPARTMENT_NAME AS "Dept2 Name"
FROM DEPT1 D1, DEPT2 D2
WHERE D1.DEPARTMENT_ID = D2.DEPARTMENT_ID(+)
ORDER BY 1;
        

-------------------------


-- SELF JOIN: Joins a table to itself to create relationships within the same table.

-- ANSI JOIN (using SELF JOIN)
SELECT E1.FIRST_NAME || ' ' || E1.LAST_NAME AS "Worker",
       E1.MANAGER_ID AS "Worker's Manager ID",
       E2.FIRST_NAME || ' ' || E2.LAST_NAME AS "Manager"
FROM EMPLOYEES E1
    JOIN EMPLOYEES E2 ON E1.MANAGER_ID = E2.EMPLOYEE_ID
ORDER BY E1.EMPLOYEE_ID;

-- TRADITIONAL JOIN: Equivalent SELF JOIN using implicit syntax.
SELECT E1.FIRST_NAME || ' ' || E1.LAST_NAME AS "Worker",
       E1.MANAGER_ID AS "Worker's Manager ID",
       E2.FIRST_NAME || ' ' || E2.LAST_NAME AS "Manager"
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID
ORDER BY E1.EMPLOYEE_ID;
               

-------------------------


-- CROSS JOIN: Produces a Cartesian product of the two tables, combining each row from the first table with every row from the second table.

-- ANSI JOIN (using CROSS JOIN)
SELECT LAST_NAME,
       DEPARTMENT_NAME
FROM EMPLOYEES CROSS JOIN DEPARTMENTS;

-- TRADITIONAL JOIN: Equivalent CROSS JOIN using implicit syntax.
SELECT LAST_NAME,
       DEPARTMENT_NAME
FROM EMPLOYEES, DEPARTMENTS;

-- Demonstrating the Cartesian product with the following counts:
SELECT COUNT (*) FROM EMPLOYEES; -- OUTPUT IS 99
SELECT COUNT (*) FROM DEPARTMENTS; -- OUTPUT IS 27
SELECT COUNT (*) FROM EMPLOYEES, DEPARTMENTS; -- OUTPUT IS 99 * 27 = 2673