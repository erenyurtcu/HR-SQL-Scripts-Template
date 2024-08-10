--MATHEMATICAL FUNCTIONS

-- Use the SIGN function to determine the sign of numbers
SELECT SIGN(-3), SIGN(3) FROM DUAL;
-- Output: -1 for negative, 1 for positive

-- Get the salary and its sign for each employee
SELECT SALARY, SIGN(SALARY) FROM EMPLOYEES;
-- Uses SIGN to determine if the salary is positive or zero

-- Calculate the absolute value of a negative number
SELECT ABS(-15) FROM DUAL;
-- Output: 15

-- Use CASE with SIGN to determine if the expression result is negative
SELECT 
    CASE WHEN SIGN(-3*15+1) = -1 THEN 'MINUS' ELSE '' END AS SIGN_TEXT,
    (-3*15+1) AS RESULT, 
    ABS(-3*15+1)
FROM DUAL;
-- Output includes the original result and its absolute value

-- Calculate the cosine of 30 degrees
SELECT COS(30 * 3.1415 / 180) FROM DUAL;
-- Converts degrees to radians before calculation

-- Calculate the sine of 30 degrees
SELECT SIN(30 * 3.1415 / 180) FROM DUAL;
-- Converts degrees to radians before calculation

-- Calculate the sine of 0 degrees
SELECT SIN(0) FROM DUAL;
-- Output: 0

-- Calculate the cosine of 0 degrees
SELECT COS(0) FROM DUAL;
-- Output: 1

-- Calculate the tangent of 45 degrees without rounding
SELECT TAN(45 * 3.1415 / 180) FROM DUAL;
-- Converts degrees to radians before calculation

-- Calculate the tangent of 45 degrees with rounding
SELECT ROUND(TAN(45 * 3.1415 / 180), 4) FROM DUAL;
-- Rounds the result to four decimal places

-- Use CEIL and FLOOR to round numbers up and down
SELECT CEIL(123.456), CEIL(-5.6), FLOOR(123.456), FLOOR(-5.6) FROM DUAL;
-- CEIL rounds up, FLOOR rounds down

-- Calculate exponential functions
SELECT EXP(1), EXP(2) FROM DUAL;
-- Calculates e^1 and e^2

-- Calculate natural logarithms
SELECT LN(1), LN(2) FROM DUAL;
-- Output: LN(1) is 0, LN(2) is the natural log of 2

-- Verify EXP and LN are inverses
SELECT EXP(LN(1)) FROM DUAL;
-- Output: 1, since EXP and LN cancel each other out

-- Calculate logarithms with base 10
SELECT LOG(10, 10), LOG(10, 100), ROUND(LOG(3, 81)) FROM DUAL;
-- LOG(10, 10) is 1, LOG(10, 100) is 2, LOG(3, 81) rounded is 4

-- Calculate modulo values
SELECT MOD(5, 2), MOD(98, 5) FROM DUAL;
-- Output: 1 and 3, which are the remainders of divisions

-- Use MOD in conjunction with LEVEL to produce a sequence of results
SELECT LEVEL, MOD(100, LEVEL), MOD(23456, LEVEL)
FROM DUAL CONNECT BY LEVEL < 12;
-- Uses hierarchical query to generate sequence of levels

-- Calculate powers and roots
SELECT POWER(3, 2), POWER(2, 3) FROM DUAL;
-- Output: 9 and 8, which are 3 squared and 2 cubed

-- Calculate square roots
SELECT SQRT(25), SQRT(625) FROM DUAL;
-- Output: 5 and 25

-- Calculate large power and its modulo
SELECT POWER(1923, 6), MOD(POWER(1923, 6), 10) FROM DUAL;
-- Output: large number and its remainder when divided by 10

-- Rounding numbers with different precisions
SELECT ROUND(1234.5678, 0), ROUND(1234.5678) FROM DUAL;
-- Rounds to nearest integer

SELECT ROUND(1234.5678, 2) FROM DUAL;
-- Rounds to two decimal places

SELECT ROUND(1234.5678, -1), ROUND(1234.5678, -2) FROM DUAL;
-- Rounds to nearest 10 and 100

-- Rounding using LEVEL in hierarchical queries
SELECT LEVEL - 1, ROUND(1234.5678, LEVEL - 1)
FROM DUAL CONNECT BY LEVEL < 6;
-- Demonstrates rounding at various levels

SELECT -LEVEL + 1, ROUND(1234.5678, -LEVEL + 1)
FROM DUAL CONNECT BY LEVEL < 6;
-- Demonstrates rounding with negative precision


--------------------------------------------------


--STRING MANIPULATION FUNCTIONS

-- Perform various string operations on DEPARTMENT_NAME
SELECT DEPARTMENT_NAME,
    LOWER(DEPARTMENT_NAME),             -- Convert to lowercase
    UPPER(DEPARTMENT_NAME),             -- Convert to uppercase
    INITCAP(UPPER(DEPARTMENT_NAME)),    -- Capitalize first letter of each word
    SUBSTR(DEPARTMENT_NAME, 1, 3),      -- Substring from position 1, length 3
    SUBSTR(DEPARTMENT_NAME, 2),         -- Substring from position 2 to end
    SUBSTR(DEPARTMENT_NAME, -5, 3),     -- Substring from 5th from last, length 3
    LENGTH(DEPARTMENT_NAME)             -- Length of the string
FROM DEPARTMENTS;

-- Use INSTR to find positions of characters
SELECT 
    INSTR('EREN YURTCU', 'E'),          -- First occurrence of 'E'
    INSTR('EREN YURTCU', 'E', 2, 1),    -- Occurrence of 'E' after 2nd position
    INSTR('EREN YURTCU', 'E', 1, 2),    -- Second occurrence of 'E'
    INSTR('EREN YURTCU', 'E', -10, 1)   -- First occurrence of 'E' within -10 to end
FROM DUAL;

-- Use REPLACE to substitute characters
SELECT 
    REPLACE('EREN YURTCU', 'EREN', 'E.'), -- Replace 'EREN' with 'E.'
    REPLACE('EREN YURTCU', 'U', 'O'),     -- Replace 'U' with 'O'
    REPLACE('EREN YURTCU', 'X', '/')      -- Attempt to replace 'X' with '/' (no change)
FROM DUAL;

-- Replace parts of JOB_ID for IT roles in EMPLOYEES table
SELECT FIRST_NAME, JOB_ID,
    REPLACE(JOB_ID, 'IT', 'BT'),          -- Replace 'IT' with 'BT'
    REPLACE(JOB_ID, 'IT', 'BÝL')          -- Replace 'IT' with 'BÝL'
FROM EMPLOYEES
WHERE JOB_ID LIKE '%IT%';

-- TRANSLATE function to map specific characters
SELECT TRANSLATE('Oracle SQL', 'rOaS', '1234') FROM DUAL;
-- Translates 'r' to '1', 'O' to '2', 'a' to '3', 'S' to '4'

-- Encrypt a message by shifting each letter
SELECT 'Hello World!' AS REAL_MESSAGE,
    TRANSLATE('Hello World!',
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
        'BCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzA') AS ENCRYPTED_MESSAGE
FROM DUAL;
-- Shifts each letter to the next in the alphabet

-- Decrypt a shifted message
SELECT 'Ifmmp Xpsme!' AS ENCRYPTED_MESSAGE,
    TRANSLATE('Ifmmp Xpsme!',
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
        'zABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxy') AS REAL_MESSAGE
FROM DUAL;
-- Shifts each letter back to the original

-- Padding strings with RPAD and LPAD
SELECT LAST_NAME,
    RPAD(LAST_NAME, 20, '*'),            -- Right-pad with '*' to length 20
    LPAD(LAST_NAME, 20, '*')             -- Left-pad with '*' to length 20
FROM EMPLOYEES;

-- Trim whitespace using LTRIM, RTRIM, TRIM
SELECT ('       EREN YURTCU       '),
    LTRIM('       EREN YURTCU       '),  -- Trim leading spaces
    RTRIM('       EREN YURTCU       '),  -- Trim trailing spaces
    TRIM('       EREN YURTCU       ')    -- Trim leading and trailing spaces
FROM DUAL;

-- Concatenate strings using CONCAT and ||
SELECT FIRST_NAME, LAST_NAME,
    CONCAT(FIRST_NAME, LAST_NAME),                  -- Concatenate without space
    CONCAT(FIRST_NAME, CONCAT(' ', LAST_NAME)),     -- Concatenate with space
    FIRST_NAME || ' ' || LAST_NAME                  -- Concatenate using ||
FROM EMPLOYEES;

-- Construct full sentence from employee details
SELECT CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME), ' is a '), REPLACE(INITCAP(JOB_ID), '_', ' ')), '.') 
FROM EMPLOYEES;

-- Alternative sentence construction using ||
SELECT FIRST_NAME || ' ' || LAST_NAME || ' is a ' || REPLACE(INITCAP(JOB_ID), '_', ' ') || '.' 
FROM EMPLOYEES;


--------------------------------------------------


--NULL HANDLING FUNCTIONS

-- Handle null commission values with NVL
SELECT FIRST_NAME, COMISSION_PCT,
    NVL(COMISSION_PCT, 0)                 -- Replace null with 0
FROM EMPLOYEES;

-- Calculate new salary considering commission using NVL2
SELECT FIRST_NAME, SALARY, COMISSION_PCT,
    NVL2(COMISSION_PCT, SALARY * (1 + COMISSION_PCT), SALARY) AS NEW_SALARY
FROM EMPLOYEES;
-- If commission is not null, calculate new salary with commission

-- Use NULLIF to compare SALARY and adjusted value
SELECT FIRST_NAME, SALARY, COMISSION_PCT,
    NULLIF(SALARY, SALARY - NVL(COMISSION_PCT, 0))
FROM EMPLOYEES;
-- Returns NULL if SALARY equals SALARY minus commission (otherwise returns SALARY)


--------------------------------------------------


--COMPARISON FUNCTIONS

-- Determine greatest and least values from lists
SELECT
    GREATEST(-926, -920, 1, 23, 456, 789101, 999921) AS MAX_VALUE,
    GREATEST('Mehmet', 'Eren', 'Yurtcu', 'Zeynep') AS MAX_STRING,
    LEAST(-926, -920, 1, 23, 456, 789101, 999921) AS MIN_VALUE,
    LEAST('Mehmet', 'Eren', 'Yurtcu', 'Zeynep') AS MIN_STRING
FROM DUAL;
-- MAX_VALUE and MIN_VALUE return the largest and smallest numbers
-- MAX_STRING and MIN_STRING return lexicographically largest and smallest strings

-- Use DECODE for simple conditional logic on DEPARTMENT_ID
SELECT LAST_NAME, DEPARTMENT_ID,
    DECODE(DEPARTMENT_ID,
        10, 'Accounting',
        20, 'R' || '&' || 'D',
        30, 'Purchasing',
        40, 'HR',
        50, 'IT',
        'OTHER') AS DEPARTMENT
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;
-- Maps DEPARTMENT_ID to department names, default to 'OTHER'

-- Use CASE for similar logic as DECODE
SELECT LAST_NAME, DEPARTMENT_ID,
    CASE DEPARTMENT_ID
        WHEN 10 THEN 'Accounting'
        WHEN 20 THEN 'R' || '&' || 'D'
        WHEN 30 THEN 'Purchasing'
        WHEN 40 THEN 'HR'
        WHEN 50 THEN 'IT'
        ELSE 'OTHER'
    END AS DEPARTMENT
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;
-- More flexible and readable alternative to DECODE


--------------------------------------------------


--USER AND ENVIRONMENT FUNCTIONS

-- Retrieve user information
SELECT UID, USER FROM DUAL;
-- UID returns the numeric user identifier, USER returns the username

-- Use SYS_CONTEXT to get session and system information
SELECT 
    SYS_CONTEXT('USERENV', 'SESSION_USER') AS USERNAME,
    SYS_CONTEXT('USERENV', 'ISDBA') AS ISDBA,
    SYS_CONTEXT('USERENV', 'HOST') AS HOST,
    SYS_CONTEXT('USERENV', 'INSTANCE') AS INSTANCE,
    SYS_CONTEXT('USERENV', 'IP_ADDRESS') AS IP,
    SYS_CONTEXT('USERENV', 'DB_NAME') AS DB_NAME
FROM DUAL;
-- Retrieves various details about the current database session


--------------------------------------------------


--AGGREGATE FUNCTIONS

-- Aggregate salary information for all employees
SELECT 
    ROUND(AVG(SALARY), 2) AS AVG_SALARY,      -- Average salary
    MAX(SALARY) AS MAX_SALARY,                -- Maximum salary
    MIN(SALARY) AS MIN_SALARY,                -- Minimum salary
    SUM(SALARY) AS TOTAL_SALARY,              -- Total salary
    COUNT(SALARY) AS SALARY_COUNT,            -- Count of salaries
    ROUND(STDDEV(SALARY), 2) AS SALARY_STDDEV, -- Standard deviation
    ROUND(VARIANCE(SALARY), 2) AS SALARY_VARIANCE -- Variance
FROM EMPLOYEES;

-- Aggregate salary information by department
SELECT DEPARTMENT_ID,
    ROUND(AVG(SALARY), 2) AS AVG_SALARY,
    MAX(SALARY) AS MAX_SALARY,
    MIN(SALARY) AS MIN_SALARY,
    SUM(SALARY) AS TOTAL_SALARY,
    COUNT(SALARY) AS SALARY_COUNT,
    ROUND(STDDEV(SALARY), 2) AS SALARY_STDDEV,
    ROUND(VARIANCE(SALARY), 2) AS SALARY_VARIANCE
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(SALARY) > 1                  -- Only include departments with more than one employee
ORDER BY DEPARTMENT_ID;

-- Use analytic functions to calculate running totals
SELECT FIRST_NAME, SALARY,
    SUM(SALARY) OVER(ORDER BY FIRST_NAME) AS TOTAL_SALARY
FROM EMPLOYEES;
-- Calculates cumulative salary total ordered by FIRST_NAME

-- Partition and order by DEPARTMENT_ID for running totals
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID,
    SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY) AS TOTAL_SUM
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;
-- Provides running total within each department


--------------------------------------------------


--DATE AND TIME FUNCTIONS

-- Display current date and system date
SELECT 
    TO_CHAR(CURRENT_DATE, 'DD-MM-YYYY HH24:MI:SS') AS CURRENT_DATE_TIME,
    TO_CHAR(SYSDATE, 'DD-MM-YYYY HH24:MI:SS') AS SYSDATE_TIME
FROM DUAL;
-- CURRENT_DATE considers session time zone; SYSDATE returns server time

-- Get the current session timezone
SELECT SESSIONTIMEZONE FROM DUAL;

-- Change the session timezone
ALTER SESSION SET TIME_ZONE = '+2:0';

-- Display current timestamp
SELECT SYSTIMESTAMP FROM DUAL;

-- Use TO_CHAR to extract date parts
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'D') AS THE_DAY_OF_THE_WEEK,       -- Day of the week (1-7)
    TO_CHAR(SYSDATE, 'DD') AS THE_DAY_OF_THE_MONTH,     -- Day of the month (01-31)
    TO_CHAR(SYSDATE, 'DDD') AS THE_DAY_OF_THE_YEAR,     -- Day of the year (001-366)
    TO_CHAR(SYSDATE, 'DAY') AS THE_DAY_NAME,            -- Full day name
    TO_CHAR(SYSDATE, 'DY') AS THE_SHORT_DAY_NAME,       -- Abbreviated day name
    TO_CHAR(SYSDATE, 'W') AS THE_WEEK_OF_THE_MONTH,     -- Week number of the month
    TO_CHAR(SYSDATE, 'WW') AS THE_WEEK_OF_THE_YEAR,     -- Week number of the year
    TO_CHAR(SYSDATE, 'MM') AS THE_MONTH_NR,             -- Month number
    TO_CHAR(SYSDATE, 'MONTH') AS THE_MONTH_NAME,        -- Full month name
    TO_CHAR(SYSDATE, 'YYYY') AS THE_YEAR,               -- Year number
    TO_CHAR(SYSDATE, 'YEAR') AS THE_YEAR_BY_LETTER,     -- Year spelled out
    TO_CHAR(SYSDATE, 'HH24:MI:SS') AS THE_ACTUAL_TIME,  -- Current time
    TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') AS THE_TIME -- Full date and time
FROM DUAL;
-- Provides comprehensive date and time information