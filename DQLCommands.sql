CREATE DATABASE DQL;
USE DQL;

CREATE TABLE CUSTOMER (
	ID INTEGER PRIMARY KEY,
	CNAME VARCHAR(255),
	ADDRESS VARCHAR(255),
    GENDER CHAR(2),
    CITY VARCHAR(255),
    PINCODE INTEGER
);

INSERT INTO CUSTOMER (ID, CNAME, ADDRESS, GENDER, CITY, PINCODE) VALUES
		(1, 'John Doe', '123 Maple Street', 'M', 'New York', 10001),
		(2, 'Jane Smith', '456 Oak Avenue', 'F', 'Los Angeles', 90001),
		(3, 'Michael Johnson', '789 Pine Road', 'M', 'Chicago', 60601),
		(4, 'Emily Davis', '321 Birch Blvd', 'F', 'Houston', 77001),
		(5, 'David Wilson', '654 Cedar Lane', 'M', 'Phoenix', 85001);

CREATE TABLE ORDER_DETAILS (
	ORDER_ID INT PRIMARY KEY,
    DELIVERY_DATE DATE,
    CUST_ID INT,
    FOREIGN KEY (CUST_ID) 
		REFERENCES CUSTOMER(ID)
		ON DELETE CASCADE
);

INSERT INTO ORDER_DETAILS (ORDER_ID, DELIVERY_DATE, CUST_ID) VALUES
		(1, '2024-06-01', 1),
		(2, '2024-06-02', 2),
		(3, '2024-06-03', 3),
		(4, '2024-06-04', 4),
		(5, '2024-06-05', 2),
        (6, '2024-06-06', 5);
        
CREATE TABLE ACCOUNT (
	ACCOUNT_ID INT PRIMARY KEY,
    NAME VARCHAR(255) UNIQUE,
    BALANCE INT,
    CONSTRAINT ACC_BALANCE_CHK CHECK(BALANCE > 1000)
);

INSERT INTO ACCOUNT(ACCOUNT_ID, NAME, BALANCE) VALUES
		(1, "A", 10000),
        (2, 'B', 25000);

INSERT INTO ACCOUNT(ACCOUNT_ID, NAME, BALANCE) VALUES
        (3, "A", 100);-- ERROR , SINCE NAME SHOULD BE UNIQUE AND BALANCE > 1000
        
SELECT * FROM ACCOUNT; 

-- DEFAULT CLAUSE
CREATE TABLE ACCOUNT2 (
	ACCOUNT_ID INT PRIMARY KEY,
    NAME VARCHAR(255) UNIQUE,
    BALANCE INT NOT NULL DEFAULT 0
);

INSERT INTO ACCOUNT2(ACCOUNT_ID, NAME) VALUES
        (1, "A");

SELECT * FROM ACCOUNT2; 
DESC ACCOUNT2;

-- ALTER TABLE COMMANDS
-- ADD NEW COLUMN
ALTER TABLE ACCOUNT2 ADD INTEREST FLOAT NOT NULL DEFAULT 0;

-- MODIFY ATTRIBUTE TYPE
ALTER TABLE ACCOUNT2 MODIFY INTEREST DOUBLE NOT NULL DEFAULT 0;

-- CHANGE COLUMN (RENAME AND/OR MODIFY THE COLUMN)
ALTER TABLE ACCOUNT2 CHANGE COLUMN INTEREST SAVING_INTEREST FLOAT NOT NULL DEFAULT 0;

-- DROP COLUMN
ALTER TABLE ACCOUNT2 DROP COLUMN SAVING_INTEREST;

-- RENAME TABLE
ALTER TABLE ACCOUNT2 RENAME TO ACCOUNT_DETAILS;
ALTER TABLE ACCOUNT_DETAILS RENAME TO ACCOUNT2;

