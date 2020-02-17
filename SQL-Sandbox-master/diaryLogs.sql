IF OBJECT_ID('users', 'U') IS NOT NULL
DROP TABLE users
GO
CREATE TABLE users (
    id INT identity(1,1) PRIMARY KEY,
    name TEXT);

IF OBJECT_ID('diary_logs', 'U') IS NOT NULL
DROP TABLE diary_logs
GO

CREATE TABLE diary_logs (
    id INT identity(1,1) PRIMARY KEY,
    user_id INT,
    date TEXT,
    content TEXT
    );

--Changing rows to Update and Delete
/* After user submitted their new diary log */
INSERT INTO diary_logs (user_id, date, content) VALUES (1, N'2015-04-01',
    N'I had a horrible fight with the Penguin and I buried my woes in a tub of chocolate ice cream.');
INSERT INTO diary_logs (user_id, date, content) VALUES (1, N'2015-04-02',
    N'We made up and now we are best friends forever and we celebrated with a tub of half eaten chocolate ice cream.');

--SELECT * FROM diary_logs;

UPDATE diary_logs SET content = N'I contacted Rusty to sort out life together.'
    where id = 1;
--SELECT * FROM diary_logs;

DELETE FROM diary_logs WHERE id = 2;

--SELECT * FROM diary_logs;

--Alter Tables

ALTER TABLE diary_logs ADD emotion TEXT default N'unknown';

INSERT INTO diary_logs (user_id, date, content, emotion) VALUES (1, N'2019-11-02',
    N'We went to Bollywood!', N'happy');
    
SELECT * FROM diary_logs;

--DROP TABLE diary_logs;