CREATE DATABASE MDZ3
GO
 
USE MDZ3
GO

CREATE TABLE Docs (DocNum int primary key, Data datetime, Cust_ID int, Total float)
CREATE TABLE Docs_data (DocNum int, Good_id int, Price float, Qty int, primary key(DocNum, Good_id))
CREATE TABLE Goods (Good_id int primary key, Good nvarchar(50), Price float, QtyInStock int, Volume float, Mass float)
CREATE TABLE Customers (Cust_id int primary key, Customer nvarchar(50), City nvarchar(50))
 
INSERT INTO Docs VALUES (1,'20180901 15:00:00',1,186)
INSERT INTO Docs VALUES (2,'20180913 18:00:00',2,955)
INSERT INTO Docs VALUES (3,'20180915 10:00:00',10,10660)
INSERT INTO Docs VALUES (4,'20180915 12:30:00',8,500)
INSERT INTO Docs VALUES (5,'20180923 14:00:00',6,1365)
INSERT INTO Docs VALUES (6,'20180925 12:00:00',4,3571)
INSERT INTO Docs VALUES (7,'20180926 13:15:00',5,772)
INSERT INTO Docs VALUES (8,'20180929 12:50:00',2,80)
INSERT INTO Docs VALUES (9,'20181001 10:30:00',3,467)
INSERT INTO Docs VALUES (10,'20181005 14:30:00',7,204)
INSERT INTO Docs VALUES (11,'20181006 18:30:00',9,808)
INSERT INTO Docs VALUES (12,'20181010 11:30:00',1,470)
INSERT INTO Docs VALUES (13,'20181015 12:30:00',3,6377)
INSERT INTO Docs VALUES (14,'20181016 16:30:00',6,10830)
INSERT INTO Docs VALUES (15,'20181020 10:30:00',8,2351)
 
 
INSERT INTO Docs_data VALUES (1,1,147,1)
INSERT INTO Docs_data VALUES (1,2,13,3)
INSERT INTO Docs_data VALUES (2,3,191,5)
INSERT INTO Docs_data VALUES (3,4,891,2)
INSERT INTO Docs_data VALUES (3,5,1609,4)
INSERT INTO Docs_data VALUES (3,6,407,6)
INSERT INTO Docs_data VALUES (4,7,10,1)
INSERT INTO Docs_data VALUES (4,8,483,1)
INSERT INTO Docs_data VALUES (5,9,94,1)
INSERT INTO Docs_data VALUES (5,10,169,3)
INSERT INTO Docs_data VALUES (5,1,135,4)
INSERT INTO Docs_data VALUES (5,2,32,7)
INSERT INTO Docs_data VALUES (6,3,197,1)
INSERT INTO Docs_data VALUES (6,4,894,2)
INSERT INTO Docs_data VALUES (6,5,1586,1)
INSERT INTO Docs_data VALUES (7,6,386,2)
INSERT INTO Docs_data VALUES (8,7,28,3)
INSERT INTO Docs_data VALUES (9,8,467,1)
INSERT INTO Docs_data VALUES (10,9,102,2)
INSERT INTO Docs_data VALUES (11,10,160,4)
INSERT INTO Docs_data VALUES (11,1,168,1)
INSERT INTO Docs_data VALUES (12,2,30,3)
INSERT INTO Docs_data VALUES (12,3,190,2)
INSERT INTO Docs_data VALUES (13,4,911,7)
INSERT INTO Docs_data VALUES (14,5,1587,6)
INSERT INTO Docs_data VALUES (14,6,416,3)
INSERT INTO Docs_data VALUES (14,7,15,4)
INSERT INTO Docs_data VALUES (15,8,451,5)
INSERT INTO Docs_data VALUES (15,9,96,1)
 
INSERT INTO Goods VALUES (1,'Монитор Samsung 17 белый',150,5,19.8,3.35)
INSERT INTO Goods VALUES (2,'Мышка A4Tech 5 кнопок красная',20,50,3.083282475,0.575)
INSERT INTO Goods VALUES (3,'Принтер HP лазерный',200,2,61.4321,9)
INSERT INTO Goods VALUES (4,'Компьютер Никс S5000',900,1,4.65,1.45)
INSERT INTO Goods VALUES (5,'Ноутбук Lenovo',1600,3,21.02479335,3.2)
INSERT INTO Goods VALUES (6,'Монитор Philips 27 черный',400,7,87.528,7.74)
INSERT INTO Goods VALUES (7,'Клавиатура Logitech белая',10,20,2.013244779,0.454)
INSERT INTO Goods VALUES (8,'Смартфон HTC розовый',470,8,2.1638547,0.685)
INSERT INTO Goods VALUES (9,'Процессор Intel',100,6,0.00703125,0.027)
INSERT INTO Goods VALUES (10,'Материнская плата Gigabyte',150,7,3.54228615,0.681)
 
INSERT INTO Customers VALUES (1,'ООО Технологии','Москва')
INSERT INTO Customers VALUES (2,'ОАО Дальневосточная техника','Владивосток')
INSERT INTO Customers VALUES (3,'ООО Компьютеры для всех','Новосибирск')
INSERT INTO Customers VALUES (4,'ИП Хомякова Светлана Ивановна','Москва')
INSERT INTO Customers VALUES (5,'ЗАО Радость в каждый дом','Омск')
INSERT INTO Customers VALUES (6,'ОАО Уральские компьютеры','Екатеринбург')
INSERT INTO Customers VALUES (7,'ООО Айти модерн','Санкт-Петербург')
INSERT INTO Customers VALUES (8,'ООО Компьютеры для студентов','Долгопрудный')
INSERT INTO Customers VALUES (9,'ООО Ракета','Химки')
INSERT INTO Customers VALUES (10,'ОАО Мыльные пузыри','Санкт-Петербург')

--пункт 1
DECLARE @volume INT
SET @volume = 100

SELECT Good
FROM Goods 
WHERE @volume < QtyInStock * Volume

--пункт 2
SELECT CASE WHEN COUNT(DISTINCT Cust_id) < 5 THEN City END
FROM Customers
GROUP BY City

--пункт 3
DECLARE @customer nvarchar(50), @customer_id int, @docnum int
SET @customer = 'ООО Ракета'

SET @customer_id = (SELECT Cust_id
					FROM Customers
					WHERE Customer = @customer)

SET @docnum = (SELECT DocNum
			   FROM Docs
			   WHERE Cust_ID = @customer_id)

SELECT T3.DocNum, T3.Data, T4.Good, T3.Qty, T3.Price
FROM(SELECT T1.DocNum, T1.Data, T2.Good_id AS id, T2.Qty, T2.Price
	 FROM(Docs AS T1 INNER JOIN Docs_data AS T2 ON T1.DocNum = T2.DocNum)
	 WHERE T1.DocNum = @docnum AND T2.DocNum = @docnum) AS T3 INNER JOIN Goods AS T4
	 ON T3.id = T4.Good_id

--пункт 4
SELECT DISTINCT Good
FROM(SELECT T1.Data, T2.Good_id
	 FROM Docs AS T1 INNER JOIN Docs_data AS T2 ON T1.DocNum = T2.DocNum) AS T3 
	 INNER JOIN Goods AS T4 ON T3.Good_id = T4.Good_id
WHERE MONTH(T3.Data) = 10 AND YEAR(T3.Data) = 2018

--пункт 5
DECLARE @good nvarchar(50)
SET @good = 'Монитор Philips 27 черный'

SELECT DISTINCT City
FROM(SELECT T4.Cust_ID
	 FROM(SELECT T2.DocNum
		  FROM Goods AS T1
			INNER JOIN 
			Docs_data AS T2 ON T1.Good_id = T2.Good_id
			WHERE T1.Good = @good) AS T3 
			INNER JOIN Docs AS T4 ON T3.DocNum = T4.DocNum) AS T5
			INNER JOIN Customers AS T6 ON T5.Cust_ID = T6.Cust_id

--пункт 6
SELECT T4.Customer
FROM (SELECT TOP(1) WITH TIES Cust_id
	  FROM (SELECT DocNum, Cust_ID
			FROM Docs
			WHERE MONTH(Data) = 10 AND YEAR(Data) = 2018) AS T1 
			INNER JOIN Docs_data AS T2 ON  T1.DocNum = T2.DocNum
			ORDER BY Price) AS T3 
			INNER JOIN Customers AS T4 ON T3.Cust_id = T4.Cust_id

--пункт 7
SELECT SUM(Qty * Volume)
FROM(SELECT Qty, Good_id
	 FROM(SELECT DocNum
		  FROM Docs
		  WHERE MONTH(Data) = 10 AND YEAR(Data) = 2018) AS T1
		  INNER JOIN Docs_data AS T2 ON T1.DocNum = T2.DocNum) AS T3
		  INNER JOIN Goods AS T4 ON T3.Good_id = T4.Good_id

--пункт 8
SELECT TOP(1) WITH TIES City, SUM(sumPrice) as sumPrice
FROM (SELECT Cust_ID, SumPrice
	  FROM (SELECT Qty*Price as sumPrice, DocNum
			FROM Docs_data) AS T1 
			INNER JOIN Docs AS T2 ON T1.DocNum = T2.DocNum) AS T3
			INNER JOIN Customers AS T4 on T3.Cust_ID = T4.Cust_id
GROUP BY City
ORDER BY sumPrice DESC

--пункт 9(1)
SELECT Cust_ID, SUM(Qty) as Qty, SUM(Volume*Qty) as Volume, SUM(Qty*Mass) as Mass, SUM(T3.Price*Qty) as Price
	 FROM (SELECT Cust_ID, Total, Good_id, Qty, T1.DocNum, T2.Price
		   FROM Docs AS T1 
		   INNER JOIN Docs_data AS T2 ON T1.DocNum = T2.DocNum) AS T3
		   INNER JOIN Goods AS T4 ON T3.Good_id = T4.Good_id
GROUP BY Cust_ID

--пункт 9(2)
DECLARE @name nvarchar(50)
SET @name = '%монитор%'

SELECT Cust_ID, SUM(Qty) as Qty, SUM(Volume*Qty) as Volume, SUM(Qty*Mass) as Mass, SUM(T3.Price*Qty) as Price
FROM(SELECT Cust_ID, Total, Good_id, Qty, T1.DocNum, T2.Price
	 FROM Docs AS T1 
	 INNER JOIN Docs_data AS T2 ON T1.DocNum = T2.DocNum) AS T3
	 INNER JOIN Goods AS T4 ON T3.Good_id = T4.Good_id
	 WHERE Good LIKE @name
GROUP BY Cust_ID

--пункт 10

SELECT T1.DocNum
FROM(SELECT DocNum, Total
	 FROM Docs) AS T1
	 INNER JOIN
	(SELECT DocNum, SUM(Qty*Price) as totalPrice
	FROM Docs_data
	GROUP BY DocNum) AS T2 ON T1.DocNum = T2.DocNum
WHERE totalPrice != Total
