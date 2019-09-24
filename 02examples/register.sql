SELECT name, description FROM sys.fn_helpcollations() 
WHERE name = 'SQL_Latin1_General_CP1251_CI_AS';
 
SELECT name, description FROM sys.fn_helpcollations() 
WHERE name = 'sql_latin1_general_CP1251_CI_AS';
 
SELECT name, description FROM sys.fn_helpcollations() 
WHERE name COLLATE Latin1_General_CS_AS = 'sql_latin1_general_CP1251_CI_AS';