-- Select all rows from the DEPARTMENTS table and order by DEPARTMENT_ID in ascending order
SELECT * FROM DEPARTMENTS ORDER BY DEPARTMENT_ID;

-- Create a new table DEPT1 with rows from DEPARTMENTS where DEPARTMENT_ID is less than or equal to 160
CREATE TABLE DEPT1 AS 
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID <= 160;

-- Create a new table DEPT2 with rows from DEPARTMENTS where DEPARTMENT_ID is greater than or equal to 100
CREATE TABLE DEPT2 AS 
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID >= 100;

-- Select all rows from DEPT1 and order by the first column (likely DEPARTMENT_ID)
SELECT * FROM DEPT1 ORDER BY 1;

-- Combine unique rows from DEPT1 and DEPT2, ordering by the first column
SELECT * FROM DEPT1
UNION 
SELECT * FROM DEPT2
ORDER BY 1;

-- Select only the common rows between DEPT1 and DEPT2
SELECT * FROM DEPT1
INTERSECT 
SELECT * FROM DEPT2;

-- Select rows from DEPT1 that are not present in DEPT2
SELECT * FROM DEPT1
MINUS 
SELECT * FROM DEPT2;

-- Select rows from DEPT2 that are not present in DEPT1
SELECT * FROM DEPT2
MINUS 
SELECT * FROM DEPT1;
