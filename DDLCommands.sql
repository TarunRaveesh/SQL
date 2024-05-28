CREATE DATABASE DDL;
SHOW DATABASES;
USE DDL;

CREATE TABLE WORKER (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO WORKER (FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
		('John', 'Doe', 50000, '2023-01-10 09:00:00', 'HR'),
		('Jane', 'Smith', 60000, '2022-02-15 10:30:00', 'Finance'),
		('Robert', 'Brown', 55000, '2021-03-20 11:45:00', 'IT'),
		('Emily', 'Davis', 65000, '2020-04-25 08:20:00', 'Marketing'),
		('Michael', 'Wilson', 70000, '2019-05-30 12:00:00', 'Sales'),
		('Sarah', 'Taylor', 75000, '2018-06-05 13:10:00', 'Operations'),
		('David', 'Anderson', 80000, '2017-07-10 14:40:00', 'Development'),
		('Laura', 'Thomas', 85000, '2016-08-15 15:55:00', 'Support'),
		('James', 'Martin', 52000, '2023-03-12 10:00:00', 'HR'),
		('Sophia', 'Lee', 62000, '2022-04-18 11:30:00', 'Finance'),
		('William', 'Harris', 56000, '2021-05-22 14:45:00', 'IT'),
		('Olivia', 'Clark', 67000, '2020-06-26 09:20:00', 'Marketing');

SELECT * FROM WORKER;

CREATE TABLE BONUS (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID) 
		REFERENCES WORKER(WORKER_ID)
		ON DELETE CASCADE
);

INSERT INTO BONUS (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES 
		(1, 5000, '2023-06-15 09:00:00'),
		(2, 6000, '2022-12-20 10:30:00'),
		(3, 5500, '2021-11-25 11:45:00'),
		(4, 6500, '2020-10-30 08:20:00'),
		(5, 7000, '2019-09-05 12:00:00'),
		(6, 7500, '2018-08-10 13:10:00'),
		(7, 8000, '2017-07-15 14:40:00'),
		(8, 8500, '2016-06-20 15:55:00'),
		(1, 4500, '2024-01-10 10:00:00'),
		(2, 5500, '2023-02-14 11:30:00'),
		(3, 5000, '2022-03-18 14:45:00'),
		(4, 6000, '2021-04-22 09:20:00');

CREATE TABLE TITLE(
	WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTIED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) 
		REFERENCES WORKER(WORKER_ID)
		ON DELETE CASCADE
);

INSERT INTO TITLE (WORKER_REF_ID, WORKER_TITLE, AFFECTIED_FROM) VALUES 
		(1, 'HR Manager', '2023-01-10 09:00:00'),
		(2, 'Finance Analyst', '2022-02-15 10:30:00'),
		(3, 'IT Specialist', '2021-03-20 11:45:00'),
		(4, 'Marketing Coordinator', '2020-04-25 08:20:00'),
		(5, 'Sales Executive', '2019-05-30 12:00:00'),
		(6, 'Operations Manager', '2018-06-05 13:10:00'),
		(7, 'Development Lead', '2017-07-10 14:40:00'),
		(8, 'Support Engineer', '2016-08-15 15:55:00'),
		(1, 'Senior HR Manager', '2024-01-10 10:00:00'),
		(2, 'Senior Finance Analyst', '2023-02-14 11:30:00'),
		(3, 'Senior IT Specialist', '2022-03-18 14:45:00'),
		(4, 'Senior Coordinator', '2021-04-22 09:20:00');


SELECT FIRST_NAME, SALARY FROM WORKER;

-- We can use SELECT without FROM Keyword using Dual Tables. For eg:
SELECT 31 + 9;
SELECT now();
SELECT LCASE("TARUN");
SELECT UCASE('PawaN');

-- WHERE CLAUSE
SELECT * FROM WORKER;
SELECT * FROM WORKER WHERE SALARY >= 65000;
SELECT * FROM WORKER WHERE DEPARTMENT = 'HR';

-- BETWEEN CLAUSE (AGE BETWEEN 0 AND 25 -> [0, 25] (BOTH INCLUSIVE))
SELECT * FROM WORKER WHERE SALARY BETWEEN 60000 AND 80000;

-- IN CLAUSE (REDUCES OR STATEMENTS)
SELECT * FROM WORKER WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Finance' OR DEPARTMENT = 'IT';
SELECT * FROM WORKER WHERE DEPARTMENT IN ('HR', 'Finance', 'IT');

-- NOT CLAUSE
SELECT * FROM WORKER WHERE DEPARTMENT NOT IN ('HR', 'Operations');

INSERT INTO WORKER VALUES
		(13, 'David', 'Anderson', NULL, '2024-05-26 14:40:00', 'Development');

-- UPDATE CLAUSE
UPDATE WORKER SET FIRST_NAME = 'Ryan', LAST_NAME = 'Jackson' WHERE WORKER_ID = 13;

-- IS NULL CLAUSE
SELECT * FROM WORKER WHERE SALARY IS NULL;

-- PATTERN SEARCHING / WILDCARD('%' - (WORKS LIKE * IN REGEX,
--                              '_' - (ONLY ONE CHARARCTER)) USE LIKE KEYWORD
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%i%';
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '_a%';

-- DELETE CLAUSE
DELETE FROM WORKER WHERE WORKER_ID = 13;

-- SORTING
SELECT * FROM WORKER ORDER BY SALARY; -- DEFAULT ASC
SELECT * FROM WORKER ORDER BY SALARY ASC;
SELECT * FROM WORKER ORDER BY SALARY DESC;

-- DISTINCT VALUES
SELECT DEPARTMENT FROM WORKER;
SELECT DISTINCT DEPARTMENT FROM WORKER;

-- DATA GROUPING (AGGREGATION) - GROUP BY KEYWORD
-- THE SELECTED COLUMN/ATTRIBUTE SAME AS THE ONE WE WANT TO GROUP
SELECT DEPARTMENT FROM WORKER GROUP BY DEPARTMENT;
-- WHEN NO AGGREGATION FUNCTION IS GIVEN GROUP BY WORKS LIKE DISTINCT

-- COUNT AGGREGATION
SELECT DEPARTMENT, COUNT(*) FROM WORKER GROUP BY DEPARTMENT;
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT; -- PREFERABLE

-- AVG AGGREGATION
SELECT DEPARTMENT, AVG(SALARY) FROM WORKER GROUP BY DEPARTMENT;

-- MIN AGGREGATION
SELECT DEPARTMENT, MIN(SALARY) FROM WORKER GROUP BY DEPARTMENT;

-- MAX AGGREGATION
SELECT DEPARTMENT, MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT;

-- SUM AGGREGATION (TOTAL SALARY)
SELECT DEPARTMENT, SUM(SALARY) FROM WORKER GROUP BY DEPARTMENT;


-- GROUP BY HAVING CLAUSE
-- SELECT USES WHERE FOR FILTERING
-- SIMILARLY, GROUP BY USES HAVING FOR FILTERING
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT;
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) > 1;

