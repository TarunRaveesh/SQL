CREATE DATABASE DML;
USE DML;

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

SELECT * FROM CUSTOMER;

-- INSERT CLAUSE
INSERT INTO CUSTOMER (ID, CNAME) VALUES (6, 'Tarun Raveesh');

-- UPDATE CLAUSE
UPDATE CUSTOMER SET ADDRESS = '342 Air Force', GENDER = 'M', CITY = 'Coimbatore', PINCODE = 641401 WHERE ID = 6;

-- UPDATE MULTIPLE ROWS
SET SQL_SAFE_UPDATES = 0; -- WITHOUT THIS U WILL FACE ERROR IF UPDATING WITHOUT WHERE CLAUSE
UPDATE CUSTOMER SET PINCODE = 110000;
UPDATE CUSTOMER SET PINCODE = PINCODE + 1;
SET SQL_SAFE_UPDATES = 1; -- RESTORE SAFETY

-- DELETE CLAUSE
DELETE FROM CUSTOMER WHERE ID = 6;
DELETE FROM CUSTOMER;

-- REFERNTIAL CONSTRAINTS

CREATE TABLE CUSTOMER (
	ID INTEGER PRIMARY KEY,
	CNAME VARCHAR(255),
	ADDRESS VARCHAR(255),
    GENDER CHAR(2),
    CITY VARCHAR(255),
    PINCODE INTEGER
);
SELECT * FROM CUSTOMER;
TRUNCATE TABLE CUSTOMER;
INSERT INTO CUSTOMER (ID, CNAME, ADDRESS, GENDER, CITY, PINCODE) VALUES
		(1, 'John Doe', '123 Maple Street', 'M', 'New York', 10001);

INSERT INTO CUSTOMER (ID, CNAME, ADDRESS, GENDER, CITY, PINCODE) VALUES
		(4, 'Emily Davis', '321 Birch Blvd', 'F', 'Houston', 77001),
		(5, 'David Wilson', '654 Cedar Lane', 'M', 'Phoenix', 85001);
        
CREATE TABLE ORDER_DETAILS (
	ORDER_ID INT PRIMARY KEY,
    DELIVERY_DATE DATE,
    CUST_ID INT,
    FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(ID) ON DELETE SET NULL
        -- ON DELETE CASCADE
);
SELECT * FROM ORDER_DETAILS;
TRUNCATE TABLE ORDER_DETAILS;
DROP TABLE ORDER_DETAILS;
INSERT INTO ORDER_DETAILS (ORDER_ID, DELIVERY_DATE, CUST_ID) VALUES -- CAN'T INSERT IN CHILD IF PARENT IS EMPTY (INSERT CONSTRAINT)
		(1, '2024-06-01', 1),
        (2, '2024-06-02', 1);
        
DELETE FROM CUSTOMER WHERE ID = 1; -- ERROR WITHOUT NULL OR CASCADE (DELETE CONSTRAINT)

-- REPLACE CLAUSE
REPLACE INTO CUSTOMER (ID, CITY) VALUES -- NEED TO SPECIFY PRIMARY KEY
		(1, 'Texas');
	
REPLACE INTO CUSTOMER (ID, CNAME, CITY) VALUES -- NEED TO SPECIFY PRIMARY KEY
		(2, 'Sova', 'Delhi');

-- DIFF SYNTAX
REPLACE INTO CUSTOMER SET ID = 3, CNAME = 'Raze', CITY = 'Brazil';

REPLACE INTO CUSTOMER (ID, CNAME, CITY) -- SETS UNSELECTED ATTRIBUTE VALUES TO NULL
	SELECT ID, CNAME, CITY
    FROM CUSTOMER WHERE ID = 4;























