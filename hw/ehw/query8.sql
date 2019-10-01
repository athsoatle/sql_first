DECLARE @goods nvarchar(50)
SET @goods = 'Корова'
SELECT DISTINCT Покупатель
FROM [test].[MainTable].[Продажи]
WHERE Товар = @goods
