create database DB3;
use DB3;
create table movies(id int primary key,title varchar(50),director varchar(50),years int,length int);
insert into movies values(1,'toy story','john lasseter',1995,81),
(2,'A bug"s life','john lacesseter',1998,95),
(3,'Toy Story 2','john lasseseter',1999,93),
(4,'Monsters, Inc.','Pete Docter',2001,92),
(5,'Finding Nemo','Andrew Stanton',2003,107),
(6,'The Incredibles','Brad Bird',2004,116),
(7,'Cars','John Lasseter',2006,117),
(8,'Ratatouille','Brad Bird',2007,115),
(9,'WALL-E','Andrew Stanton',2008,104),
(10,'Up','Pete Docter',2009,101),
(11,'Toy Story 3','Lee Unkrich',2010,103),
(12,'Cars 2','John Lasseter',2011,120),
(13,'Brave','Brenda Chapman',2012,102),
(14,'Monsters University','Dan Scanlon',2013,110);

select * from movies;

create table boxoffice(Movie_id int,Rating float,Domestic_sales int,International_sales int,
constraint fk_Movie_id foreign key(movie_id) references movies(id));

insert into boxoffice values(5,8.2,380843261,555900000),
(14,7.4,268492764,475066843),
(8,8,206445654,417277164),
(12,6.4,191452396,368400000),
(3,7.9,245852179,239163000),
(3,8,261441092,370001000),
(9,8.5,223808164,297503696),
(11,8.4,415004880,648167031),
(1,8.3,191796233,170167031),
(7,7.2,244082982,217900167),
(11,8.3,293004164,438338580),
(4,8.1,289916256,272900000),
(2,7.2,162798565,200600000),
(13,7.2,237283207,301700000);


select * from boxoffice;


select title,director,years,sum(boxoffice.Domestic_sales),sum(boxoffice.International_sales) from movies join boxoffice on
movies.id=boxoffice.Movie_id
group by title,director,years;



select title,boxoffice.Domestic_sales,boxoffice.International_sales from movies inner join
boxoffice on
movies.id=boxoffice.Movie_id;



select movies.title,movies.years,max(International_sales+Domestic_sales) As blockbuster from boxoffice
inner join movies on movies.id=boxoffice.Movie_id 
group by title,years
order by blockbuster desc;


drop table employee;
create table employee
(sno int auto_increment primary key,
eid int not null,
ename varchar(30) not null,
eage int not null,
check (eage>=18),
efield enum('Software','Medical','Business','Wage'),
esalary bigint not null,
ejoindate datetime not null,
eaddress char(20),
Email blob null,
ecode int not null default 10);

select * from employee;



Alter table employee add constraint chk_eage check(eage>=21);

ALTER TABLE employee DROP CONSTRAINT chk_eage;


insert into employee(eid ,ename ,eage,efield ,esalary,ejoindate,eaddress,Email)
values(101,'aaa',22,'Software',20000000000,'2022-03-23','chennai','Ajithkumar@gmail.com'),
(102,'bbb',22,'Medical',30000000000,'2022-04-23','bangalore','Sarathkumar@gmail.com'),
(103,'ccc',23,'Business',30000000000,'2022-05-23','kolkatha','pravinkumar@gmail.com'),
(104,'ddd',24,'Wage',40000000000,'2022-06-23','andhra','kavin@gmail.com');


create table student(sid int primary key,sname varchar(200),marks int default 100,gender char);
alter table student add constraint pk_sid primary key(sid);
insert into student(sid,sname,gender)
values
(1,'aaa','F'),
(2,'bbb','M'),
(3,'ccc','M'),
(4,'ddd','F');
alter table student add column age int not null;
update student set mark=23 where sid=1;
update student set mark=24 where sid=2;
update student set mark=25 where sid=3;
update student set mark=23 where sid=4;

alter table student drop marks;
alter table student add column mark int;

select * from student;
show databases;
show columns from employee;

select * from employee cross join student;


select sid,sname,mark,s.age from student s cross join employee e;

select *  
from employee E,student S
where sid=1;
select * from student s inner join employee e on s.sid=e.sno;

select gender,count(*),sum(mark),max(mark),min(mark) from student group by gender having mark>=50;

select * from student order by mark desc,sname,gender;













