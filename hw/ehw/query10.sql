SELECT нДок, SUM(Цена * Колво)
	FROM MainTable.Продажи
	GROUP BY нДок
