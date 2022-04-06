use test;
create table demo(shippingdate date);
insert into demo values(STR_TO_DATE('30-03-2022','%d-%m-%Y'));
select * from demo;
update demo set shippingdate='2022-01-03' ;
set autocommit=off;

delete from demo;

rollback;

delete from demo where shippingdate;

use DB_Test;


select * from student;
select * from employee;

create table student_1 As select * from student;
select * from student_1;

select * from student union All select * from student_1;

select sid from student union  select eid from employee;






select sum(marks) from student;

create view stu_view As select * from student;


select * from stu_view;


drop view stu_view;


create index stu_index on student(sid);

show index from student;

drop index stu_index on student;




create table sales(
fiscal_year year,sales_emp varchar(250),sale float,total_sale float);

insert into sales values('2000','dghasf',150,450),
('2021','ytyjgtuyg',140,675),
('2022','ytugjhbhj',150,140),
('2020','weser',328,160),
('2019','bvbvcb',123,675),
('2018','vghvm',235,866);

select * from sales;

select sum(total_sale) from sales;

select fiscal_year,
sales_emp,
sale,SUM(sale) over (Partition by fiscal_year) total_sale from sales; 





select fiscal_year,
sales_emp,
sale,Dense_rank() over (Partition by fiscal_year order by sale desc)sale_rank from sales;


create temporary table temp_new select * from student;

S
select * from temp_new;









