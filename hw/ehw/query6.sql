 SELECT *
	FROM [test].[MainTable].[Продажи]
	WHERE ('01.02.1994' > Дата 
	AND Дата > '31.12.1994' 
	AND Покупатель LIKE 'а%') OR (Колво > 5 AND Цена< 10)
