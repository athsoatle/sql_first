DECLARE @T TABLE (txt1 nvarchar(50), txt2 varchar(50), txt3 nchar(50), txt4 char(50), txt5 int)
INSERT INTO @T VALUES ('12345', '12345', '12345', '12345', 12345)
SELECT DATALENGTH(txt1), DATALENGTH(txt2), DATALENGTH(txt3), DATALENGTH(txt4), DATALENGTH(txt5)
FROM @T
SELECT LEN(txt1), LEN(txt2), LEN(txt3), LEN(txt4), LEN(txt5)
FROM @T