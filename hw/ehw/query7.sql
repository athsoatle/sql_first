SELECT TOP(5) Покупатель
	FROM [test].[MainTable].[Продажи]
	WHERE Дата < '01.10.1993' AND Дата > '31.08.1993'
	ORDER BY Покупатель
