
IF OBJECT_ID('dbo.groceries', 'U') IS NOT NULL
DROP TABLE dbo.groceries
GO
CREATE TABLE dbo.groceries (id INT PRIMARY KEY, name [NVARCHAR](50), quantity INT , aisle INT);

INSERT INTO groceries VALUES (1, N'Bananas', 54, 7);
INSERT INTO groceries VALUES (2, N'Peanut Butter', 1, 2);
INSERT INTO groceries VALUES (3, N'Dark chocolate bars', 2, 2);
INSERT INTO groceries VALUES(4, N'Ice cream', 1, 12);
INSERT INTO groceries VALUES(5, N'Cherries', 6, 2);
INSERT INTO groceries VALUES(6, N'Chocolate syrup', 1, 4);

--Querying
--SELECT * FROM groceries;
--SELECT name FROM groceries;
--SELECT * FROM groceries ORDER BY aisle;
--SELECT * FROM groceries WHERE aisle > 5 ORDER BY aisle;

--Aggregating Data
--SELECT SUM(quantity) FROM groceries;
--SELECT MAX(quantity) FROM groceries;
SELECT aisle, SUM(quantity) FROM groceries GROUP BY aisle;
