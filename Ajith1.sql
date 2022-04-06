create database DB_Test;
show databases;
use DB_Test;
drop table student;
create table student(sid int auto_increment primary key, sname varchar(200) not null,age int check(age>=15),
address varchar(300),marks int null,attendence char(1),registerno bigint not null,
dept enum('IT','CSE','EEE','MECH','ECEE','CIVIL'),skills decimal(10,1),subject blob null);
select * from student;
insert into student(sname,age,address,marks,attendence,registerno,dept,skills,subject)
values('ajith',24,'vaniyambadi',50,'P',510515205002,'IT',5.1,'AI'),
('ashok',27,'chennai',60,'P','32423523542','CSE',5.3,'DBMS'),
('romananand',25,'bangalore',80,'P',6596597057,'MECH',7.2,'Biology'),
('aarthi',21,'ambur',null,'A','23354556656','ECEE',6.0,'art and science');
alter table student add column subject2 int null unique;
alter table student add column subject3 blob;
update student set subject2=null where sid=2;

alter table student add column DOB date;
alter table student modify column DOB date;
alter table student change column subject subject1 blob null;
alter table student drop column DOB;
update student set DOB='1998/05/04' where sid=3;

delete from student where sid=3;
set autocommit=off;
set autocommit=on;
rollback;



alter table student add constraint pk_sid primary key(sid);
alter table student drop primary key;
drop table employee;
create table employee(eid int,ename varchar(200) not null, age int, salary smallint,joingdate date);
insert into employee(eid,ename,age,salary,joingdate)values(4,'xxxxx',23,3285,'2022-03-23'),
(2,'yyyy',14,2341,'2022-03-24'),
(1,'zzzz',16,1241,'2022-03-25');

select * from employee;


alter table employee add constraint fk_eid foreign key(eid) references student(sid);

alter table employee drop constraint fk_eid;

alter table employee add primary key(eid);
alter table employee drop primary key;

insert into employee(eid,ename,age,salary,joingdate)values(5,'eeeee',35,24344,'2022-03-26');

delete from empolyee where eid=5;

select s.sid,e.eid,s.sname,e.ename from student s, employee e;

select s.age,count(*) from student s cross join employee e  where s.sid=e.eid  group by s.age  having sum(s.age)>1 order by s.age desc;
select * from employee e cross join student s;
select * from employee e cross join student s where s.sid=e.eid;


select * from student s inner join employee e on s.sid=e.eid;

select * from student s left outer join employee e on s.sid=e.eid;

select * from student s right outer join employee e on s.sid=e.eid;

select * from student s full outer join employee e on s.sid=e.eid;

select A.age, A.sid, A.sname,B.sid,B.sname from student A, student B where A.sid=B.sid  order by B.age;


select * from student where sname='aaa' or sid=2 order by age;
select distinct sname from student;
select count(*) from student;

alter table student drop column registerno;

select * from student limit 2,4;

alter table student add column height int;
alter table student add column weight int default 60;

update student set height=5.5;

select * from student where age=23 or age=24;

select * from student where age in(23, 24);

select * from student where age between 20 and 23;

show columns from student;


select * from student order by age desc,sname;

alter table student add column gender varchar(5);


select * from student;
update student set gender='M' where sname not in ('ajith','ashok');

update student set gender='F' where sname in('ajith','ashok');

select gender,count(*),max(marks) from student group by gender having age>=20;

select gender,sum(marks),min(marks),max(marks)from student group by gender having sum(marks)>80;


create index idx_sname on student (sid,sname);

alter table student drop index idx_sname;

show index from student;

select * from student;

show databases;



create view v_grp_student1 as select gender, sid,sname,count(*),sum(marks) from student group by gender having sum(marks)>=110;

select * from v_grp_student1;

drop view v_grp_student;


set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');




select lower(sname),upper(address) from student;
select upper(sname) from student;
select ltrim('   werwoejri23jnk4n2kj3nrk' );
select replace('sql tutorial','sql','html');
select replace('ename ','ajith','') from employee;
select reverse(sname)from student;
select substr(sname,5,2) from student;
select substr('sql tutorial',5,5);
select substr('sql tutorial',5,5);
select instr('sql tutorial','l',2);
select abs(-543543);
select sign(5646556.765765);
select current_date();
select current_time();
select datediff('2022-03-26',2022-06-15);
select dayname('2022-03-26');



select current_user();
select database();
select version();
select ifnull(null,'sample');


create table products(orderid int not null auto_increment primary key,
quentity int, productname varchar(50), unitprice int, unitstock int, unitsonorder int);
insert into products(quentity,productname,unitprice,unitstock,unitsonorder)
values(30,'adjhasfgh',3674,3278,2983498),
(40,'shjfgashjdfg',347278,78687,19238),
(26,'vfjhasg',8069,6576,1235);

select * from products;




select orderid,quentity,
case when quentity>30 then 'the q is greater than 30' 
when quentity==30 then 'is equel'
else 'the quentity under 30'
end
from products;

select productname,unitprice *(unitstock+ifnull(unitsonorder,1)) from products;

select productname,unitprice *(unitstock+coalesce(unitsonorder,0)) from products;





create table t
(c1 int primary key,
c2 int not null,
c3 int not null,
c4 varchar(4),
index(c1,c2)
);

create index idx_ta on t (c1,c2,c3,c4);

select * from t;

show index from t;



select date(now());
select date_format(curdate(),'%m/%d/%yy') today;











select * from employee;





create table employee1
(emp_name varchar(10),empsalary int,companyname varchar(10));
select * from employee1;

insert into employee1 values('asdasd',234124,'wrqwr');
insert into employee1 values('dfhg',1467,'ertret');

Select emp_name, empsalary, @companyName = companyname from employee1;


select 
'2022-01-01' start,
date_add('2022-01-01',interval 1 day)'one day later',
date_add('2022-01-01',interval 1 week)'one week later',
date_add('2022-01-01',interval 1 month)'one month later',
date_add('2022-01-01',interval 1 year)'one year later';
select 
'2022-01-01' start,
date_sub('2022-01-01',interval 1 day)'one day before',
date_sub('2022-01-01',interval 1 week)'one week before',
date_sub('2022-01-01',interval 1 month)'one month before',
date_sub('2022-01-01',interval 1 year)'one year before';

select day('2000-12-31') day,
month('2000-12-31')month,
quarter('2000-12-31')quarter,
year('2000-12-31') year;

select
weekday('2000-12-31')weekday,
week('2000-12-31')week,
weekofyear('2000-12-31')weekofyear;



-- select * from student;
-- select * from employee;

--   subquery select * from student where sid in(select eid from employee where ename='yyyy');








