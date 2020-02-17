/*
Q6 Find the manufacturer(s) of computer (PC or laptop) with the highest available speed
*/

--Drop Tables
IF OBJECT_ID('PC', 'U') IS NOT NULL
DROP TABLE PC
GO
IF OBJECT_ID('LAPTOP', 'U') IS NOT NULL
DROP TABLE LAPTOP
GO
IF OBJECT_ID('PRODUCT', 'U') IS NOT NULL
DROP TABLE PRODUCT
GO

--Create Tables
CREATE TABLE PRODUCT (
    model INT PRIMARY KEY,
    manufacturer TEXT,
    type TEXT
    );
CREATE TABLE PC (
    model INT FOREIGN KEY REFERENCES PRODUCT(model),
    speed INT,
    ram INT,
    hd INT,
    price INT
    );
CREATE TABLE LAPTOP (
    model INT FOREIGN KEY REFERENCES PRODUCT(model),
    speed INT,
    ram INT,
    hd INT,
    screen TEXT,
    price INT
    );

--Insert Data
----Product Data
INSERT INTO PRODUCT VALUES(1, 'Windows', 'PC');
INSERT INTO PRODUCT VALUES(2, 'Apple', 'Laptop');
INSERT INTO PRODUCT VALUES(3, 'Samsung', 'Laptop');
INSERT INTO PRODUCT VALUES(4, 'Galaxy', 'PC');
----PC Data
INSERT INTO PC VALUES(1, 900, 4, 720, 699);
INSERT INTO PC VALUES(4, 2300, 2, 360, 499);
----Laptop Data
INSERT INTO LAPTOP VALUES(2, 1900, 4, 1080, 'Extra Wide', 2699);
INSERT INTO LAPTOP VALUES(3, 2200, 7, 480, 'Saturn', 1499);

--Display Table
--SELECT * FROM PRODUCT;
--SELECT * FROM PC;
--SELECT * FROM LAPTOP;

--Answer??
DROP TABLE New_Table;

SELECT model, speed
INTO New_Table
FROM (
    SELECT PRODUCT.model AS model, PC.speed AS speed
    FROM PRODUCT
    JOIN PC
    ON PRODUCT.model = PC.model
    UNION
    SELECT PRODUCT.model AS model, Laptop.speed AS speed
    FROM PRODUCT
    JOIN LAPTOP
    ON PRODUCT.model = Laptop.model
    ) a;


(SELECT PC.model, PC.speed
FROM PC
WHERE  PC.speed = (
        SELECT MAX(PC.speed)
        FROM PC
    )
UNION
----Case for fastest laptop
SELECT L.model, L.speed
FROM LAPTOP L
WHERE L.speed = (
        SELECT MAX(speed)
        FROM LAPTOP
    )
);
--Havent figured out yet
SELECT *
FROM PRODUCT
LEFT OUTER JOIN LAPTOP
ON PRODUCT.model = LAPTOP.model 
LEFT OUTER JOIN PC
ON PC.model = PRODUCT.model
;

    
