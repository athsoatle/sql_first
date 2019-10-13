use test
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [PassengerId]
      ,[Survived]
      ,[Pclass]
      ,[Name]
      ,[Sex]
      ,[Age]
      ,[SibSp]
      ,[Parch]
      ,[Ticket]
      ,[Fare]
      ,[Cabin]
      ,[Embarked]
  FROM Titanic
  order by Ticket

  SELECT Ticket, Fare
  From titanic
  order by ticket
--пункт 1
 SELECT COUNT(*) people, SUM(Survived) survived, CAST(SUM(Survived)AS float) / COUNT(*)
	FROM Titanic
-- пункт 2
SELECT Ticket, COUNT(*) people, SUM(Survived) survived, CAST(SUM(Survived)AS float) / COUNT(*)
FROM Titanic
GROUP BY Ticket 
-- пункт 3
SELECT Pclass, Sex, Count(*) people, SUM(Survived) survived, CAST(SUM(Survived)AS float) / COUNT(*)
FROM Titanic
GROUP BY Pclass, Sex
-- пункт 4
SELECT Embarked, COUNT(*) people, SUM(Survived) survived, CAST(SUM(Survived)AS float) / COUNT(*)
FROM Titanic
GROUP BY Embarked
-- пункт 5
SELECT TOP(1) Embarked
FROM Titanic
GROUP BY Embarked
ORDER BY COUNT(*)  DESC
--пункт 6
SELECT Ticket, AVG(Age) AS Avg_age, AVG(CASE Survived WHEN 0 THEN NULL ELSE Age END) AS Avg_age_survived
FROM Titanic
GROUP BY Ticket, Sex
--пункт 7
SELECT TOP(10) *
FROM Titanic
ORDER BY Fare DESC--ответ - нет
--пункт 8
SELECT  Ticket
FROM Titanic
GROUP BY Ticket 
HAVING COUNT(DISTINCT Fare) > 1
SELECT  Embarked
FROM Titanic
GROUP BY Embarked 
HAVING COUNT(DISTINCT Fare) > 1
--пункт 9
SELECT COUNT(*) people, SUM(Survived) survived 
FROM Titanic
GROUP BY Ticket, Pclass, Fare, Embarked
--пункт 10
SELECT Ticket
From Titanic
GROUP BY Ticket HAVING (COUNT(PassengerId) >= 1 AND SUM(Survived) = COUNT(PassengerId))
--пункт 11
SELECT CAST(SUM(Survived)AS float) / COUNT(*) as survivibility
FROM Titanic
WHERE Name LIKE '%Mary%'
UNION
SELECT CAST(SUM(Survived)AS float) / COUNT(*)
FROM Titanic
WHERE Name LIKE '%Elizabeth%'

