--2  
SELECT DISTINCT CAST(Дата as date)
	FROM [test].[MainTable].[Продажи]
--3
SELECT DISTINCT Покупатель
	FROM [test].[MainTable].[Продажи]
 	ORDER BY Покупатель
--4
SELECT DISTINCT Товар
	FROM [test].[MainTable].[Продажи]	WHERE Цена > 100
--5
SELECT DISTINCT Покупатель, Дата
  FROM MainTable.Продажи
  WHERE Дата >=DATEADD(WEEK,DATEDIFF(WEEK,0,CURRENT_TIMESTAMP)-1,0)
  AND Дата < DATEADD(WEEK,DATEDIFF(WEEK,0,CURRENT_TIMESTAMP)  ,0)
--6
SELECT *, (Цена * Колво) AS 'Стоимость'
  FROM [test].[MainTable].[Продажи]
--7
SELECT *
	FROM MainTable.Продажи
	WHERE ((MONTH(Дата) = 1 AND YEAR(Дата) = YEAR(CURRENT_TIMESTAMP))
	AND Покупатель LIKE 'а%') OR (Колво > 5 AND Цена< 10)
--8
SELECT DISTINCT TOP(5) Покупатель
	FROM MainTable.Продажи
	WHERE MONTH(Дата) = 9 AND YEAR(Дата) = YEAR(CURRENT_TIMESTAMP) - 1
	ORDER BY Покупатель
--9
DECLARE @goods nvarchar(50)
	SET @goods = 'Корова'
	SELECT DISTINCT Покупатель
	FROM [test].[MainTable].[Продажи]
	WHERE Товар = @goods
--10
SELECT TOP(1) with ties нДок
	FROM MainTable.Продажи
	ORDER BY Цена * Колво DESC
--11
SELECT нДок, SUM(Цена * Колво)
	FROM MainTable.Продажи
	GROUP BY нДок



