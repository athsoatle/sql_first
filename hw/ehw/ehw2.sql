USE test
GO
--пункт 1
 SELECT COUNT(*) people, SUM(Survived) survived, CAST(SUM(Survived)AS float) / COUNT(*)
	FROM Titanic
-- пункт 2 updated
SELECT Pclass, COUNT(*) people, SUM(Survived) survived, CAST(SUM(Survived)AS float) / COUNT(*)
FROM Titanic
GROUP BY Pclass 
-- пункт 3
SELECT Pclass, Sex, Count(*) people, SUM(Survived) survived, CAST(SUM(Survived)AS float) / COUNT(*)
FROM Titanic
GROUP BY Pclass, Sex
-- пункт 4
SELECT Embarked, COUNT(*) people, SUM(Survived) survived, CAST(SUM(Survived)AS float) / COUNT(*)
FROM Titanic
GROUP BY Embarked
-- пункт 5 updated
SELECT  Embarked
FROM Titanic
GROUP BY Embarked
HAVING Count(PassengerId) = (SELECT TOP 1 COUNT(PassengerId) FROM Titanic GROUP BY Embarked)
ORDER BY COUNT(*)  DESC
--пункт 6 updated
SELECT Ticket, Sex, AVG(Age) AS Avg_age, AVG(CASE Survived WHEN 0 THEN NULL ELSE Age END) AS Avg_age_survived
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
--пункт 9 updated
SELECT Ticket, Pclass, Fare, Embarked, COUNT(*) people, SUM(Survived) survived 
FROM Titanic
GROUP BY Ticket, Pclass, Fare, Embarked
--пункт 10 updated
SELECT Ticket, COUNT(DISTINCT PassengerId) as 'Passengers', SUM(Survived) as 'Survived'
From Titanic
GROUP BY Ticket HAVING (COUNT(DISTINCT PassengerId) > 1 AND SUM(Survived) = COUNT(DISTINCT PassengerId))
--пункт 11
SELECT CAST(SUM(Survived)AS float) / COUNT(*) as survivibility
FROM Titanic
WHERE Name LIKE '%Mary%'
UNION
SELECT CAST(SUM(Survived)AS float) / COUNT(*)
FROM Titanic
WHERE Name LIKE '%Elizabeth%'