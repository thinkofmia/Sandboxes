IF OBJECT_ID('exercise_logs', 'U') IS NOT NULL
DROP TABLE exercise_logs
GO

CREATE TABLE exercise_logs
    (id INT IDENTITY(1,1) PRIMARY KEY,
    type [NVARCHAR](50),
    minutes INT, 
    calories INT,
    heart_rate INT);

INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES (N'biking', 30, 100, 110);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES (N'biking', 10, 30, 105);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES (N'dancing', 15, 200, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES (N'tree climbing', 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES (N'tree climbing', 25, 72, 80);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES (N'rowing', 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES (N'hiking', 60, 80, 85);

--SELECT * FROM exercise_logs;
--SELECT * FROM exercise_logs WHERE calories > 50 ORDER BY calories;
/* AND */
--SELECT * FROM exercise_logs WHERE calories > 50 AND minutes < 30;
/* OR */
--SELECT * FROM exercise_logs WHERE calories > 50 OR heart_rate > 100;

--SELECT * FROM exercise_logs WHERE type = "biking" OR type = "hiking" OR type = "tree climbing" OR type = "rowing";
/* IN */
--SELECT * FROM exercise_logs WHERE type NOT IN (N'biking', N'hiking', N'tree climbing', N'rowing');
--SELECT * FROM exercise_logs WHERE type IN (N'biking', N'hiking', N'tree climbing', N'rowing');

IF OBJECT_ID('drs_favorites', 'U') IS NOT NULL
DROP TABLE drs_favorites
GO

CREATE TABLE drs_favorites
    (id INT IDENTITY(1,1) PRIMARY KEY,
    type [NVARCHAR](50),
    reason [NVARCHAR](150));

INSERT INTO drs_favorites(type, reason) VALUES (N'biking', N'Improves endurance and flexibility.');
INSERT INTO drs_favorites(type, reason) VALUES (N'hiking', N'Increases cardiovascular health.');

--SELECT * FROM drs_favorites;
--SELECT type FROM drs_favorites;
/* Subquery */
/* SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM drs_favorites); */
/* SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM drs_favorites WHERE reason = "Increases cardiovascular health"); */

/* LIKE */
/*SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM drs_favorites WHERE reason LIKE "%cardiovascular%");
*/

/*Restricing groups with HAVING*/
/*SELECT type, SUM(calories) AS total_calories FROM exercise_logs GROUP BY type;*/
/*SELECT type, SUM(calories) AS total_calories FROM exercise_logs
    WHERE calories > 150
    GROUP BY type;
*/
/*SELECT type, SUM(calories) AS total_calories FROM exercise_logs
    GROUP BY type
    HAVING SUM(calories) > 150
    ;*/
/*SELECT type, AVG(calories) AS avg_calories FROM exercise_logs
    GROUP BY type
    HAVING AVG(calories) > 70
    ; 
*/
--SELECT type FROM exercise_logs GROUP BY type HAVING COUNT(*) >= 2;

--Case
--SELECT COUNT(*) AS Count FROM exercise_logs WHERE heart_rate > 220 - 30;
/* 50-90% of max*/
/*SELECT COUNT(*) AS Count FROM exercise_logs WHERE
    heart_rate >= ROUND(0.50 * (220-30),2) 
    AND  heart_rate <= ROUND(0.90 * (220-30),2);*/
/* CASE */
SELECT type, heart_rate,
    CASE 
        WHEN heart_rate > 220-30 THEN N'above max'
        WHEN heart_rate > ROUND(0.90 * (220-30),2) THEN N'above target'
        WHEN heart_rate > ROUND(0.50 * (220-30),2) THEN N'within target'
        ELSE N'below target'
    END as N'hr_zone'
FROM exercise_logs
--GROUP BY hr_zone; Have to use something else 
;

