
SELECT *
FROM MIPT. Students
 

--Вывести ФИО студентов и их номера телефонов:
SELECT Last_name, First_name, Phone
FROM MIPT.Students
 

--Вывести ФИО студентов и их номера телефонов c псевдонимами:
SELECT Last_name AS Фамилия, First_name AS 'Имя', Phone Телефон -- демонстрация разных вариантов применения псевдонимов
FROM MIPT.Students
 

--Вывести ФИО студентов и их номера телефонов c псевдонимами:
SELECT Last_name AS Фамилия, First_name AS 'Имя', Phone Телефон -- демонстрация разных вариантов применения псевдонимов
FROM MIPT.Students

--Вывести Список студентов по алфавиту с указанием дня рождения:
SELECT Last_name AS Фамилия, First_name AS 'Имя', Birthday AS "Дата рождения" -- демонстрация разных вариантов применения псевдонимов
FROM MIPT.Students
ORDER BY Last_name, First_name

--Вывести Самого младшего студента
SELECT TOP 1 *
FROM MIPT.Students
ORDER BY Birthday DESC

--Вывести уникальные имена, встречающиеся среди студентов, отсортировав по алфавиту
SELECT DISTINCT First_name
FROM MIPT.Students
ORDER BY First_name ASC
