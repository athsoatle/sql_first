USE CW1 --MSMS СУБД
GO

--пункт 1
DECLARE @id nvarchar(5)
SET @id = '5'

SELECT Student_ID, Date_of_Birth, Group_id, DATEDIFF(dd, Date_of_Birth, CURRENT_TIMESTAMP)
FROM Students
WHERE Group_id = @id
ORDER BY MONTH(Date_of_Birth) DESC

--пункт 2
SELECT TOP(1) WITH TIES *, (SumDur/Dur1Lsn) as Qty
FROM Courses
ORDER BY Dur1Lsn ASC

--пункт 3
SELECT T1.Course_id, COUNT(DISTINCT Student_id) as Amount_of_students
FROM Courses AS T1 INNER JOIN Student_courses AS T2 ON T1.Course_id = T2.Course_id
GROUP BY T1.Course_id

--пункт 4
SELECT T1.Dur1Lsn, All_courses, Courses_where_more_than_15_lessons
FROM (SELECT Dur1Lsn, COUNT(Course_id) All_courses
FROM Courses
GROUP BY Dur1Lsn) AS T1
INNER JOIN
(SELECT Dur1Lsn, COUNT(Course_id) Courses_where_more_than_15_lessons
FROM Courses
WHERE SumDur/Dur1Lsn > 15
GROUP BY Dur1Lsn) AS T2
ON T1.Dur1Lsn = T2.Dur1Lsn

--пункт 5
SELECT MONTH(Date_of_Birth) as BMonth, COUNT(DISTINCT Student_id) as Students_bd_in_this_month
FROM Students
GROUP BY Month(Date_of_Birth)
HAVING COUNT(DISTINCT Student_id) > 5

--пункт 6
SELECT TOP(1) WITH TIES Group_id, COUNT(DISTINCT Student_id) as Students
FROM Students
GROUP BY Group_id
ORDER BY Students ASC

--пункт 7
DECLARE @s_id INT
SET @s_id = 1

SELECT @s_id as Student_ID, Course
FROM(SELECT *
FROM Student_courses
WHERE Student_ID = @s_id) AS T1 INNER JOIN
Courses AS T2 ON T1.Course_id = T2.Course_ID

--пункт 8
SELECT T1.Course_id, All_att, Last_month_att
FROM(SELECT Course_ID, COUNT(Date_of_att) as All_att
	 FROM Attendance
	 GROUP BY Course_ID) AS T1 INNER JOIN
	 (SELECT Course_ID, COUNT(Date_of_att) as Last_month_att
	 FROM Attendance
	 WHERE DATEDIFF(mm, Date_of_att, CURRENT_TIMESTAMP) <= 1
	 GROUP BY Course_ID) AS T2
	 ON T1.Course_id = T2.Course_id
