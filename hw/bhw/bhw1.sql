use test
go

--пункт 1

create table polinom (id int, power int, coeff float)
insert into polinom values
(1, 2, 1), (1, 1, 2),  (1, 0, 1);
insert into polinom values
(2, 2, 0), (2, 1, 2),  (2, 0, 0);
delete from polinom
where id = 3
delete from polinom 
where id = 4
delete from polinom
where id = 14
delete from polinom
where id = 15
delete from polinom
where id = 9
delete from polinom
where id = 8
insert into polinom values
(4, 2, 3), (4, 1, 6),  (4, 0, -4);
insert into polinom values
(3, 3, 1), (3, 2, 0),  (3, 1, 1), (3, 0 , 0);
insert into polinom values
(5, 3, 1), (5, 2, 1),  (5, 1, 0), (5, 0 , 0);
insert into polinom values
(6, 2, 1),  (6, 1, 0), (6, 0 , 6);
insert into polinom values
(7, 2, 1),  (7, 1, 4), (7, 0 , 4);
insert into polinom values
(8, 5, 0), (8, 4, 0), (8, 3, 1), (8, 2, -1);
insert into polinom values
(9, 5, 1.5), (9, 4, 2), (9, 3, 3), (9, 2, 0);
insert into polinom values
(10, 1, 4), (10, 0, 6);
insert into polinom values
(11, 2, 1), (11, 1, -5), (11, 0, 4);
insert into polinom values
(12, 2, 1), (12, 1, 5), (12, 0, 4);
insert into polinom values
(13, 2, 1);
insert into polinom values
(14, 2, 2), (14, 1, 4), (14, 0, 2);
insert into polinom values
(15, 2, 6), (15, 1, 1), (15, 0, 1);
insert into polinom values
(16, 3, 1), (16, 2, 0), (16, 1, 2), (16, 0, 0);
insert into polinom values
(17, 5, 1), (17, 2, -1), (17, 3, 0), (17, 1, 1), (17, 0, 6);
insert into polinom values
(18, 8, 1), (18, 6, 2), (18, 5, -1), (18, 4, 1), (18, 3, 4), (18, 2, 2), (18, 1, 12);
select *
from polinom
--пункт 2
DECLARE @id INT, @txt NVARCHAR(50)
SET @id = 1
SET @txt = ''

SELECT @txt = @txt + CAST(coeff as nvarchar(5)) + '*x^' + CAST(power as nvarchar(5)) + '+'
FROM polinom
WHERE id = @id
ORDER BY power DESC

SELECT REVERSE(STUFF(REVERSE(@txt),1,1,''))
--пункт 3
SELECT DISTINCT id
FROM polinom
WHERE coeff = 0
--пункт 4
DECLARE @number float, @id int, @txt nvarchar(50)
SET @id = 1
SET @number = 3.5
SET @txt = ''

SELECT @txt = @txt + CAST((coeff * @number) as nvarchar(5)) + '*x^' + CAST(power as nvarchar(5)) + '+'
FROM polinom
WHERE id = @id
ORDER BY power DESC

SELECT REVERSE(STUFF(REVERSE(@txt),1,1,''))
--пункт 5
DECLARE @n INT, @id INT
SET @n = 2
SET @id = 1

SELECT TOP(1) (CASE WHEN power = @n THEN 'YES' ELSE 'NO' END)
FROM polinom
WHERE id = @id AND coeff != 0
ORDER BY power desc
--пункт 6
DECLARE @id1 INT, @id2 INT, @txt NVARCHAR(50)
SET @id1 = 5
SET @id2 = 6
SET @txt = ''

SELECT @txt = @txt + CAST(coeff as nvarchar(5)) + '*x^' + CAST(power as nvarchar(5)) + '+'
FROM (SELECT ISNULL(p1.coeff, 0) + ISNULL(p2.coeff, 0) as coeff, p1.power as power
	  FROM polinom as p1 full join polinom as p2 on (p1.id = @id1 and p2.id = @id2 and p1.power = p2.power)
	  WHERE p1.id = @id1 or p2.id = @id2
	  ) AS T1
WHERE coeff != 0
ORDER BY power DESC

SELECT REVERSE(STUFF(REVERSE(@txt),1,1,''))
--пункт 7
DECLARE @id1 INT, @id2 INT, @txt NVARCHAR(50)
SET @id1 = 3
SET @id2 = 4
SET @txt = ''

SELECT @txt = @txt + CAST(coeff as nvarchar(5)) + '*x^' + CAST(pow as nvarchar(5)) + '+'
FROM(SELECT pow, SUM(coeff) as coeff
	FROM(SELECT p1.power + p2.power as pow, p1.coeff * p2.coeff as coeff
		  FROM polinom as p1 cross join polinom as p2
		  WHERE p1.id = @id1 and p2.id = @id2
		  ) AS T1
	GROUP BY pow
) AS T2
WHERE coeff != 0
ORDER BY pow DESC

SELECT REVERSE(STUFF(REVERSE(@txt),1,1,''))
--пункт 8
DECLARE @id INT, @n FLOAT, @txt NVARCHAR(50)
SET @id = 3
SET @n = 2.5
SET @txt = ''

SELECT SUM(coeff*power(@n,power))
FROM Polinom
WHERE id = @id
--пункт 9
DECLARE @id INT
SET @id = 7


SELECT CASE WHEN cast(c1 as float)/2 = sqrt(cast(c2 as float)) THEN 'YES' ELSE 'NO' END
FROM(SELECT coeff as c1
	 FROM polinom
	 WHERE id = @id and power = 1) AS T1,
	 (SELECT coeff as c2
	 FROM polinom
	 WHERE id = @id and power = 0) AS T2
--пункт 10
DECLARE @id INT, @zero INT, @pos INT, @neg INT
SET @id = 8
SET @zero = 0
SET @pos = 0
SET @neg = 0

SELECT @pos = @pos + (CASE WHEN coeff > 0 THEN 1 ELSE 0 END),
	   @neg = @neg + (CASE WHEN coeff > 0 THEN 1 ELSE 0 END),
	   @zero = (SELECT MAX(power) - COUNT(power) + 1
				FROM polinom
				WHERE coeff != 0 and id = @id)
FROM(SELECT *
	 FROM polinom
	 WHERE coeff != 0 and id = @id
) AS T1
ORDER BY T1.power DESC

SELECT @pos as positive_coeff, @neg as negative_coeff, @zero as zero_coeff
--пункт 11
DECLARE @id INT
SET @id = 9

SELECT CASE WHEN(SELECT COUNT(*)
				 FROM polinom
				 WHERE @id = id AND coeff != CAST(coeff as INT)) != 0 THEN 'NO' ELSE 'YES' END
--пункт 12 
DECLARE @id INT
SET @id = 10

SELECT CASE WHEN(SELECT TOP(1) power
				 FROM polinom
				 WHERE id = @id AND coeff != 0
				 ORDER BY power DESC) = 1 
			THEN (SELECT coeff
				FROM polinom
				WHERE @id = id and power = 0
				) /
				(SELECT coeff
				FROM polinom
				WHERE @id = id AND power = 1)
			END
--пункт 13
DECLARE @id INT, @a FLOAT, @b FLOAT, @c FLOAT, @max_pow INT
SET @id = 14
SET @a = 0
SET @b = 0
SET @c = 0
SET @max_pow = 0

SELECT @max_pow = (SELECT MAX(power)
				   FROM polinom
				   WHERE id = @id and coeff != 0)
SELECT @a = ISNULL(@a + (SELECT coeff 
			 FROM polinom
			 WHERE @id = id and power = 2), 0)
SELECT @b = ISNULL(@b + (SELECT coeff
			 FROM polinom
			 WHERE @id = id and power = 1), 0)
SELECT @c = ISNULL(@c + (SELECT coeff
			 FROM polinom
			 WHERE @id = id and power = 0), 0)
 
SELECT CASE WHEN @max_pow != 2
			THEN 'NO'
			WHEN @b*@b - 4*@a*@c < 0
			THEN 'YES, HAS NO REAL ROOT'
			WHEN (@b = 0) and(@c/@a >= 0)
			THEN CAST((-@c)/(@a) AS nvarchar(5))
			WHEN @b * @b - 4 * @a * @c = 0
			THEN CAST((-@b)/(2*@a) AS nvarchar(5))
			ELSE (CAST((-@b + sqrt(@b*@b - 4*@a * @c))/(2*@a) AS nvarchar(5))) + ' ' + (CAST((-@b - sqrt(@b*@b - 4*@a * @c))/(2*@a) AS nvarchar(5)))
			END
--пункт 13

DECLARE @id INT, @a FLOAT, @b FLOAT, @c FLOAT, @max_pow INT, @D FLOAT
SET @id = 14
SET @a = 0
SET @b = 0
SET @c = 0
SET @max_pow = 0
SET @D = 0
SELECT @a = @a + (CASE WHEN power = 2 THEN coeff ELSE 0 END),
	   @b = @b + (CASE WHEN power = 1 THEN coeff ELSE 0 END), 
	   @c = @c + (CASE WHEN power = 0 THEN coeff ELSE 0 END),
	   @D = @b * @b - 4 * @a * @c, 
	   @max_pow = @max_pow + (CASE WHEN power > @max_pow THEN power - @max_pow ELSE 0 END)
FROM polinom
WHERE @id = id
IF(@max_pow = 2)
	IF @c = 0
		SELECT CAST((-@b / @a) as nvarchar(10)) + ' AND ' + CAST(0 as nvarchar(10))
		ELSE
			IF @b = 0
				IF @c >= 0
					SELECT(CAST(SQRT(@c) as nvarchar(10)))
				ELSE
					SELECT 'NO ROOTS'
			ELSE
				IF @D >= 0
					SELECT CAST((SQRT(@D) - @b) / (2 *@a) as nvarchar(10)) + ' AND ' + CAST((-SQRT(@D) - @b) / (2 *@a) as nvarchar(10))
				ELSE
					SELECT 'NO ROOTS'
	ELSE
		SELECT 'NOT A 2nd POWER POLYNOMIAL'
--пункт 14
DECLARE @id_res INT, @id1 INT, @id2 INT, @txt NVARCHAR(50), @polynomial nvarchar(50)
SET @txt = ''
SET @polynomial = ''
SET @id_res = 18
SET @id1 = 16
SET @id2 = 17
SELECT @txt = @txt + CAST(coeff as nvarchar(5)) + '*x^' + CAST(pow as nvarchar(5)) + '+'
FROM(SELECT pow, SUM(coeff) as coeff
	FROM(SELECT p1.power + p2.power as pow, p1.coeff * p2.coeff as coeff
		  FROM polinom as p1 cross join polinom as p2
		  WHERE p1.id = @id1 and p2.id = @id2
		  ) AS T1
	GROUP BY pow
) AS T2
WHERE coeff != 0
ORDER BY pow DESC

SELECT @polynomial = @polynomial + CAST(coeff as nvarchar(5)) + '*x^' + CAST(power as nvarchar(5)) + '+'
FROM polinom
WHERE id = @id_res
ORDER BY power DESC

SELECT CASE WHEN @txt = @polynomial THEN '1' ELSE '0' END
--пункт 15 divisible/divisor = private => divisible = private * divivsor
DECLARE @id_divisible INT, @id_divisor INT, @id_private INT, @txt NVARCHAR(50), @polynomial nvarchar(50)
SET @txt = ''
SET @polynomial = ''
SET @id_divisible = 18
SET @id_divisor = 17
SET @id_private = 16

SELECT @txt = @txt + CAST(coeff as nvarchar(5)) + '*x^' + CAST(pow as nvarchar(5)) + '+'
FROM(SELECT pow, SUM(coeff) as coeff
	FROM(SELECT p1.power + p2.power as pow, p1.coeff * p2.coeff as coeff
		  FROM polinom as p1 cross join polinom as p2
		  WHERE p1.id = @id_divisor and p2.id = @id_private
		  ) AS T1
	GROUP BY pow
) AS T2
WHERE coeff != 0
ORDER BY pow DESC

SELECT @polynomial = @polynomial + CAST(coeff as nvarchar(5)) + '*x^' + CAST(power as nvarchar(5)) + '+'
FROM polinom
WHERE id = @id_divisible
ORDER BY power DESC

SELECT CASE WHEN @txt = @polynomial THEN '1' ELSE '0' END
