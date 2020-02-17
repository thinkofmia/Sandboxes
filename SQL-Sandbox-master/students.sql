IF OBJECT_ID('students', 'U') IS NOT NULL
DROP TABLE students
GO

CREATE TABLE students (id INT IDENTITY(1,1) PRIMARY KEY,
    first_name [NVARCHAR](50),
    last_name [NVARCHAR](50),
    email [NVARCHAR](100),
    phone [NVARCHAR](50),
    birthdate [NVARCHAR](50),
    buddy_id INT);

INSERT INTO students
    VALUES (N'Peter', N'Rabbit', N'peter@rabbit.com', N'555-6666', N'2002-06-24', 2);
INSERT INTO students
    VALUES (N'Alice', N'Wonderland', N'alice@wonderland.com', N'555-4444', N'2002-07-04', 1);
INSERT INTO students 
    VALUES (N'Aladdin', N'Lampland', N'aladdin@lampland.com', N'555-3333', N'2001-05-10', 4);
INSERT INTO students 
    VALUES (N'Simba', N'Kingston', N'simba@kingston.com', N'555-1111', N'2001-12-24', 3);


IF OBJECT_ID('student_grades', 'U') IS NOT NULL
DROP TABLE student_grades
GO

CREATE TABLE student_grades (id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    test [NVARCHAR](50),
    grade INT);

INSERT INTO student_grades (student_id, test, grade)
    VALUES (1, N'Nutrition', 95);
INSERT INTO student_grades (student_id, test, grade)
    VALUES (2, N'Nutrition', 92);
INSERT INTO student_grades (student_id, test, grade)
    VALUES (1, N'Chemistry', 85);
INSERT INTO student_grades (student_id, test, grade)
    VALUES (2, N'Chemistry', 95);

---SELECT * FROM student_grades;

--JOINing Related Tables

/* cross join */
--SELECT * FROM student_grades, students;

/* implicit inner join */
/*SELECT * FROM student_grades, students
    WHERE student_grades.student_id = students.id;*/

/* explicit inner join - JOIN */
--SELECT * FROM students
/*SELECT students.first_name, students.last_name, students.email, student_grades.test, student_grades.grade FROM students
    JOIN student_grades
    ON students.id = student_grades.student_id
    WHERE grade > 90;
*/
IF OBJECT_ID('student_projects', 'U') IS NOT NULL
DROP TABLE student_projects
GO

CREATE TABLE student_projects (id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    title [NVARCHAR](50));
    
INSERT INTO student_projects (student_id, title)
    VALUES (1, N'Carrotapault');
INSERT INTO student_projects (student_id, title)
    VALUES (2, N'Mad Hattery');
INSERT INTO student_projects (student_id, title)
    VALUES (3, N'Carpet Physics');
INSERT INTO student_projects (student_id, title)
    VALUES (4, N'Hyena Habitats');

--Outer JOIN
--Inner join on gives matching items/records
/*SELECT students.first_name, students.last_name, student_projects.title
    FROM students
    JOIN student_projects
    ON students.id = student_projects.student_id;*/

/* outer join */ 
/*SELECT students.first_name, students.last_name, student_projects.title
    FROM students
    --RIGHT OUTER JOIN
    --FULL OUTER JOIN
    LEFT OUTER JOIN student_projects
    ON students.id = student_projects.student_id;
*/
--SELF JOINS
--SELECT id, first_name, last_name, buddy_id FROM students;
/*SELECT Student.first_name, Student.last_name, Buddy.email AS Buddy_Email
    FROM students Student
    JOIN students Buddy
    ON Student.buddy_id = Buddy.id;*/

--Combining Multiple Joins
IF OBJECT_ID('project_pairs', 'U') IS NOT NULL
DROP TABLE project_pairs
GO
CREATE TABLE project_pairs (id INT IDENTITY(1,1) PRIMARY KEY,
    project1_id INT,
    project2_id INT);

INSERT INTO project_pairs (project1_id, project2_id)
    VALUES(1, 2);
INSERT INTO project_pairs (project1_id, project2_id)
    VALUES(3, 4);

SELECT a.title, b.title FROM project_pairs
    JOIN student_projects a
    ON project_pairs.project1_id = a.id
    JOIN student_projects b
    ON project_pairs.project2_id = b.id;