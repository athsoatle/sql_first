SELECT *
	FROM MainTable.Продажи
	WHERE ((MONTH(Дата) = 1 AND YEAR(Дата) = YEAR(CURRENT_TIMESTAMP))
	AND Покупатель LIKE 'а%') OR (Колво > 5 AND Цена< 10)
