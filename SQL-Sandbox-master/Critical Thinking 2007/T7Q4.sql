/*
Q4 Find the eids of the employees who make the second highest salary
*/
--Clearing Table
IF OBJECT_ID('EMPLOYEES', 'U') IS NOT NULL
DROP TABLE EMPLOYEES
GO

--Create Table
CREATE TABLE EMPLOYEES (
    eid INT IDENTITY(1,1) PRIMARY KEY,
    ename TEXT,
    salary INT
    );

--Insert Data
INSERT INTO EMPLOYEES(ename, salary) VALUES ('Riho', 9000);
INSERT INTO EMPLOYEES(ename, salary) VALUES ('Hangman Adam Page', 4000);
INSERT INTO EMPLOYEES(ename, salary) VALUES ('Jon Moxley', 7000);
INSERT INTO EMPLOYEES(ename, salary) VALUES ('Dr Britt Baker', 7000);
INSERT INTO EMPLOYEES(ename, salary) VALUES ('Kenny Omega', 2000);

--Display Original Table
SELECT * FROM EMPLOYEES;

--Answer (Not sure if correct)
SELECT E2.eid
FROM EMPLOYEES E2
WHERE E2.salary = (
    SELECT MAX(others.salary)
    FROM EMPLOYEES others
    WHERE others.salary < (
        SELECT MAX(E1.salary)
        FROM EMPLOYEES E1)
)
; 