# SQL-Sandbox
For learning and testing SQL
<!-- CZ2007 Part 1 -->

# What is SQL
- Structured Query Language (SQL) for relational databases
- Manage and query the database (a set of relations/tables)
- Is a declarative language (non-procedural).
- SQL is not a complete programming language
  - Has no control or iteration commands
  
  ## Stuffs support by SQL
    - Data Manipulation Language (DML)
      - Perform queries
      - Perform updates (add/delete/modify)
    - Data Definition Language (DDL)
      - Creates databases, tables, indices
      - Create views
      - Specify authorization
      - Specify integrity constraints
    - Embedded SQL
      - Wraps a high-level programming language around DML to do more sophisticated queries/updates
      
# Querying Single Relation
## Tables in SQL
- A *relation* or *table* in a multiset of tuples having the attributes specified by the schema.
- A *multiset* is an unordered list (or: a set with multiple duplicate instances allowed).
- An *attribute* (or *column*) is a typed data entry present in each tuple in the relation.
  - The number of attributes is the *arity* of the relation.
- A *tuple* or *row* is a single entry in the table having the attributes specified by the schema
  - The number of tuples is the *cardinality* of the relation.
- Atomic/Data Types (Every attribute must have an atomic type):
  - Characters: CHAR(20), VARCHAR(50)
  - Numbers: INT, BIGINT, SMALLINT, FLOAT
  - Others: MONEY, DATETIME, ...
- The *schema* of a table is the table name, its attributes, and their types
- A *key* is an attribute whose values are unique
  - Underline a primary key

## Principle Form of SQL
- Basic Structure of SQL
```
  SELECT desired attributes (A1, A2, ..., An)
  FROM one or more tables (R1, R2, ..., Rm)
  WHERE condition about tuples of the tables (P)
```
- Mapping to Relational Algebra (Will cover another time)

## SQL Syntax
- Reserved words/ Keywords
  - SELECT, FROM, WHERE, etc
- Case-insensitive
  - Use single quotes for constants: 'abc' instead of "abc"
- White-space ignored
- All statements end with a semi-colon (;)

## Simple SQL Query
### Selection
*Selection* is the operation of filtering a relation's tuples on some condition
```
  SELECT *
  FROM Product
  WHERE Category = 'Gadgets'
```

### Projection
*Projection* is the operation of producing an output table with tuples that have a subset of their prior attributes.
```
    SELECT PName, Price, Manufacturer
    FROM Product
    WHERE Category = 'Gadgets'
```
### DISTINCT
Eliminates duplicates
```
    SELECT DISTINCT Category
    FROM Product
```

### AS
Renames attributes
```
    SELECT PName AS Product, Price AS Cost, Manufacturer
    FROM Product
    WHERE Category = 'Gadgets'
```

### Expressions in SELECT Clause
```
    SELECT PName, Price*1.4 AS Cost_IN_SGD, Manufacturer
    FROM Product
    WHERE Category = 'Gadgets'
```

### 3-Valued Logic
TRUE, FALSE, UNKNOWN
AND
```
    SELECT PName, Price, Manufacturer
    FROM Product
    WHERE Category = 'Gadgets' AND Price < 20
```

OR
```
    SELECT PName, Price, Manufacturer
    FROM Product
    WHERE Category = 'Gadgets' OR Price < 20
```

NOT

### BETWEEN
```
    SELECT PName, Price, Manufacturer
    FROM Product
    WHERE Price BETWEEN 10 AND 20
```

### IN
```
    SELECT PName, Price, Manufacturer
    FROM Product
    WHERE Manufacturer IN ('GizmoWorks', 'Samsung', 'Hitachi')
```

### LIKE
- s LIKE p: pattern matching on strings (*case-sensitive*)
- May contain two symbols:
    - %   = any sequence of Characters
    - _   = any single character
```
    SELECT *
    FROM Product
    WHERE PName LIKE '%gizmo%'
```
```
    'Jozel%' - Matches any string beginning with "Jozel"
    '%ozel%' - Matches any string containing "ozel" as substring
    '_ _ _' - Matches any string of exactly three characters
    '_ _ _%' - Matches any string of at least three characters
    'Cr\%sh%' - Match all strings beginning with "Cr%sh"
```

### NULL
Tuples in SQL relations can have NULL as a value for one or more attributes
Either *Missing value* or *Inapplicable*
#### NOT NULL and Default
```
    CREATE TABLE Drinkers(
        address VARCHAR(50) DEFAULT '123 Sesame St',
        phone CHAR(10) NOT NULL
    )
```

<!-- Part 2-->
# Ordering Tuples

## ORDER BY
Sorting the Results
- Default: Ascending
- Unless specify ```DESC```
- NULL normally treated as less than all non-null values
```
    SELECT PName, Price, Manufacturer
    FROM Product
    WHERE Category = 'Gadgets' AND Price < 50
    ORDER BY Price, PName
```

# Multi-relation Queries
```
    SELECT S1.sname, S2.sname
    FROM Sailors S1, Sailor AS S2
    WHERE S1.age < 30 AND S2.age < 30
    AND S1.sname < S2.sname
```

# Subqueries
- ORDER BY clause may not be used in a subquery

## Scalar Subquery
- Returns a *single value* which is then used in a comparison
- If query expects a single value from a subquery, but it returns multiple/no values, a *run-time error* occurs

```
    SELECT bar
    FROM Sells
    WHERE beer = 'Heineken' AND
        price = (
            SELECT price
            FROM Sells
            WHERE bar = 'WOOBAR'
            AND beer = 'Bud'
        );
```

## Row Subquery
- Returns a *single row* which may have multiple columns
- Keyword NOT can proceed any of the operations

### IN
Is true if and only if the tuple is a member of the relation
```
    SELECT *
    FROM Beers
    WHERE name IN (
        SELECT beer
        FROM Likes
        WHERE drinker = 'Fred'
    );
```

### ALL
x <> ALL(<relation>) is true if and only if for every tuple in the relation, x is not equal to t
```
    SELECT beer
    FROM Sells
    WHERE price >= ALL (
        SELECT price
        FROM Sells
    );
```

### SOME
- Is a boolean condition where it is equal to at least one tuple in the relation

```
    SELECT agent_code, agent_name
    FROM Agents
    WHERE agent_code = SOME (
        SELECT agent_code
        FROM Customer
        WHERE cust_country = 'UK'
    );
```

## Table Subquery
- Returns *one or more columns* and *multiple rows*

```
    SELECT p1.name
    FROM Product p1
    WHERE p1.maker = 'Gizmo-Works'
    AND EXISTS (
        SELECT *
        FROM Product p2
        WHERE p2.maker <> 'Gizmo-Works'
        AND p1.name = p2.name
    );
```

# (Un)correlated Subqueries
## Uncorrelated Subqueries
Subquery is not related to the outer query
```
    SELECT *
    FROM Beers
    WHERE name IN (
        SELECT beer
        FROM Likes
        WHERE drinker = 'Fred'
        );
```

## Correlated Subqueries
- If it contains a reference to an attribute in the outer query
- If it must be *re-computed for every tuple* produced by the outside query

```
    SELECT p1.name
    FROM Product p1
    WHERE p1.maker = 'Gizmo-Works'
    AND EXISTS (
        SELECT *
        FROM Product p2
        WHERE p2.maker <> 'Gizmo-Works'
        AND p1.name = p2.name
    )
```

<!-- Part 3 Lecture -->
# Set Operations
- They are generally used to combine the results of two separate SQL queries
## INTERSECT
(SELECT hq_city, name
FROM Company, Product
WHERE maker = name AND factory_loc = 'US'

INTERSECT

SELECT hq_city, name
FROM Company, Product
WHERE maker = name AND factory_loc = 'China')

## SELECT INTO 
Creates a new physical table.
```
    SELECT hq_city, name
    INTO HQ_Name
    FROM Company, Product;
```

## UNION
```
    SELECT R.A
    FROM R, S
    WHERE R.A = S.A

    UNION

    SELECT R.A
    FROM R, T
    WHERE R.A = T.A
```

## EXCEPT
```
    SELECT R.A
    FROM R, S
    WHERE R.A = S.A

    EXCEPT

    SELECT R.A
    FROM R, T
    WHERE R.A = T.A
```

# Bag Semantics vs Set Semantics
- Set semantics -> No duplicates, each item appears only once
- Bag semantics -> Duplicates allowed, i.e. a multiset

Default for SELECT-FROM-WHERE is *bag*
Default for UNION, INTERSECT, and EXCEPT is *set*

- Force set semantics with DISTINCT after SELECT
- Force bag semantics with ALL after UNION, etc

# JOIN
- Joins multiple tables
```
    SELECT PName, Price
    FROM Product
    JOIN Company ON Manufacturer = Cname
        AND Country = 'Japan'
    WHERE Price <= 200
```

# Aggregation
```
    SELECT AVG(price)
    SELECT MAX(sum)
    SELECT COUNT(*)
    SELECT MIN(price)
    SELECT MIN(find)
    SELECT SUM(players)
```
- COUNT applies to duplicates (Use DISTINCT to eliminate)

# Types of SQL Join
## Theta Join
- R JOIN S ON <condition>
- A theta-join using <condition> for selection
```
    SELECT PName, Price
    FROM Product
    JOIN Company ON Manufacturer = Cname
        AND Country = 'Japan'
        AND StockPrice >= 300
```

## Inner Join
- R INNER JOIN S USING (<attribute list>)
- R INNER JOIN S ON R.column_name = S.column_name

## Natural Join
- R NATURAL JOIN S

## Outer Join
- R OUTER JOIN S is the core of an outerjoin expression

<!-- Part 4 Lecture -->
# GROUPINGS
```
    SELECT product, SUM(price * quantity) AS TotalSales
    FROM Purchase
    WHERE date > '10/1/2005'
    GROUP BY product
```

## HAVING
```
    SELECT product, SUM(price * quantity)
    FROM purchase
    WHERE date > '10/01/2005'
    GROUP BY product
    HAVING SUM(quantity) > 100
```

```
    SELECT beer, AVG (price) AS AvgPrice
    FROM Sells
    GROUP BY beer
    HAVING COUNT(beer) >= 2
```

# Creation of Tables
## Create/Drop Table
```
    CREATE TABLE <name> (
        <list of elements>
    );

    DROP TABLE <name>;
```

## Alter Table
```
    ALTER TABLE Bars
    ADD phone CHAR(10)
        DEFAULT 'unlisted';
```
```
    ALTER TABLE Bars
    DROP    license;
```

# Database Modification
## Insert
```
    INSERT INTO Likes (beer, drinker)
    VALUES('Bud', 'Sally');
```

## Delete
```
    DELETE FROM Likes
    WHERE drinker = 'Sally'
```

## Update
```
    UPDATE Drinkers
    SET phone = '6555-1212'
    WHERE name = 'Fred'
```

# Constraints
A relationship among data elements that a DBMS is required to enforce.
 ## Primary Key and Unique
 - There can be only one PRIMARY KEY, but several UNIQUE attributes
 - UNIQUE may have NULL's
 - Single attribute key:
    - Place PRIMARY KEY or UNIQUE after the type
    ```
        CREATE TABLE Beers(
            name CHAR(20) UNIQUE,
            manf VARCHAR(20)
        )
    ```
 - Multi-attributes key:
    - Declare key separately
    ```
        CREATE TABLE Sells(
            bar CHAR(20),
            beer VARCHAR(20),
            price REAL,
            PRIMARY KEY (bar, beer)
        )
    ```

## Foreign Key
Referenced attributes must be declared as Primary Key in other table
```
    CREATE TABLE Sells(
        bar CHAR(20),
        beer CHAR(30),
        price REAL,
        FOREIGN KEY beer REFERENCES Beers(name)
    );
```
### Foreign Key Violation
To specify: ON [UPDATE,DELETE] [SET NULL, CASCADE]

## Quantifiers
- An *existential quantifier* is a logical quantifier of the form "there exists"
```
    SELECT DISTINCT Company.cname
    FROM Company, Product
    WHERE Company.name = Product.company
        AND Product.price <100
```

- A *universal quantifier* is of the form "for all"
```
    SELECT DISTINCT Company.cname
    FROM Company
    WHERE Company.name NOT IN(
        SELECT Product.company
        FROM Product.price >= 100
    )
```

<!-- Part 5 -->
## Attribute-based Checks
Is checked only when a value for that attribute is inserted or updated, not checked at deletion.
```
    CREATE TABLE Sells(
        bar CHAR(20),
        beer CHAR(30),
            CHECK (beer IN(SELECT name FROM Beers)),
        price REAL CHECK(price<=18.00)
    )
```
## Tuple-based Checks
Checked whenever a tuple is inserted/updated
```
    CREATE TABLE Sells(
        bar CHAR(20),
        beer CHAR(30),
        price REAL,
        CHECK (bar = 'WOOBAR' OR price <= 10.00)
    );
```

## Assertions
Condition can refer to any relation or attribute in the database schema
Check every ASSERTION after every modification to any relation of the database

```
    CREATE ASSERTION FewBars CHECK (
        (SELECT COUNT(*) FROM Bars) <=
        (SELECT COUNT(*) FROM Drinkers)
    );
```

# Views
- A *view* is the dynamic result of a query over the *base relations* to produce another relation.
- Considered *virtual*

```
    CREATE VIEW CanDrink AS
    SELECT drinker, beer
    FROM Frequents, Sells
    WHERE Frequents.bar = Sells.bar;
```

## Update with views
- Updatable only if derived from a single relation by selection and projection
- Not for views defined using *groups and aggregate functions* or *multiple tables using joins*
```
    INSERT INTO CanDrink
    VALUES('Mephico', 'Coke')
```

## Temporary Views
WITH clause - only available to the query in which the WITH clause occuers
```
    WITH CanDrink(drinker, beer) AS
        SELECT drinker, beer
        FROM Frequents, Sells
        WHERE Frequents.bar = Sells.bar
    SELECT drinker
    FROM CanDrink
    WHERE beer = 'Tiger';
```
<!-- Part 6 -->
# Triggers
Syntax
```
    CREATE TRIGGER <triggerName>
    {BEFORE|AFTER|INSTEAD OF}
        {INSERT|DELETE|UPDATE [OF <column-name-list>]}
    ON <table-name>
        [REFERENCING
            [OLD ROW AS <var-to-refer-to-old-tuple>]
            [NEW ROW AS <var-to-refer-to-new-tuple>]
            [OLD TABLE AS <var-to-refer-to-old-table>]
            [NEW TABLE AS <var-to-refer-to-new-table>]
            ]
    [FOR EACH {ROW|STATEMENT}]
    [WHEN <precondition>]
    [BEGIN]
    <statement-list>;
    [END];
```
- Trigger Execution Granularity
    - *Row Level* triggers exectued once for each modified tuple/row
    - (Default) *Statement Level* triggers executed only one for an SQL statement, regardless of no. of modified tuples

- Trigger Referencing (Row Level)
    - INSERT statement (only for New Tuple)
    - DELETE statement (only for Old Tuple)
    - UPDATE statement (for both)
    - Syntax (Case-sensitive)
        - REFERENCING NEW ROW as N
        - REFERENCING OLD ROW as O

- Trigger Referencing (Statement Level)
    - INSERT statement (only for New Table)
    - DELETE statement (only for Old Table)
    - UPDATE statement (for both)
    - Syntax (Case-sensitive)
        - REFERENCING NEW TABLE as N
        - REFERENCING OLD TABLE as O

<!-- Part 7 END-->
# Indexes
```
    CREATE INDEX doubleindex
    ON Customer(age, city)
```
## Pros
- Existence of an index on attribute may greatly speed up queries in which a value, or a range of values is specified on that attribute
- May speed up joins involving that attribute

## Cons
- Make insertion, deletions and updates on a relation more complex and time consuming
