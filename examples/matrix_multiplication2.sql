use test
go
create table matrix (id int NOT NULL, i int NOT NULL , j int NOT NULL , val int NOT NULL)
insert into matrix values (1, 1, 1, 1),
(1, 1, 2, 2),
(1, 1, 3, 3),
(1, 2, 1, 2),
(1, 2, 2, 5),
(1, 2, 3, 7),
(2, 1, 1, 2),
(2, 1, 2, 4),
(2, 1, 3, 8),
(2, 2, 1, 1),
(2, 2, 2, 5),
(2, 2, 3, 10),
(2, 3, 1, 3),
(2, 3, 2, 6),
(2, 3, 3, 9);

select m1.i, m2.j, SUM(m1.val * m2.val) as val
from matrix as m1 inner join matrix as m2 on m1.j = m2.i
where m1.id = 1 and m2.id = 2
group by m1.i, m2.j
