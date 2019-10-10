SELECT DISTINCT TOP(5) Покупатель
	FROM MainTable.Продажи
	WHERE MONTH(Дата) = 9 AND YEAR(Дата) = YEAR(CURRENT_TIMESTAMP) - 1
	ORDER BY Покупатель
