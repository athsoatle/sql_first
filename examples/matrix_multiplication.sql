use test
go
create table T1 (i int NOT NULL , j int NOT NULL , val int NOT NULL)
insert into T1 values (1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(2, 1, 2),
(2, 2, 5),
(2, 3, 7);

create table T2 (i int NOT NULL , j int NOT NULL , val int NOT NULL)
insert into T2 values
(1, 1, 2),
(1, 2, 4),
(1, 3, 8),
(2, 1, 1),
(2, 2, 5),
(2, 3, 10),
(3, 1, 3),
(3, 2, 6),
(3, 3, 9);

select T1.i, T2.j, sum(T1.val * T2.val)
from T1 inner join T2 on T1.j = T2.i
group by T1.i, T2.j