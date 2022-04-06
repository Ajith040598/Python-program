create database DB4;
use DB4;
drop table EmployeeInfo;
create table EmployeeInfo(EmpId int auto_increment primary key,EmpFname varchar(50),
EmpLname varchar(50),Department enum('HR','Admin','Account'),Project varchar(10),
Address varchar(50),DOB date);
insert into EmployeeInfo(EmpFname,EmpLname,Department,Project,Address,DOB) 
values('Sanjay','Mehra','HR','P1','Hyderabad(HYD)','1976/12/01'),
('Ananya','Mishra','Admin','P2','Delhi(DEL)','1968/05/02'),
('Rohan','Diwan','Account','P3','Mumbai(BOM)','1980/01/01'),
('Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','1992/05/02'),
('Ankit','Kapoor','Admin','P2','Delhi(DEL)','1994/07/03');
select * from EmployeeInfo;

drop table EmployeePosition;
create table EmployeePosition(EmpID int,EmpPosition varchar(50),DateOfJoining date,Salary int);
insert into EmployeePosition(EmpID,EmpPosition,DateOfJoining,Salary)
values(1,'Manager','2022/05/01',500000), 
(2,'Executive','2022/05/02',75000),
(3,'Manager','2022/05/01',90000),
(2,'Lead','2022/05/02',85000),
(1,'Executive','2022/05/01',300000);
select * from EmployeePosition;


select upper(EmpFname) As EmpName from EmployeeInfo;

Select count(*) from EmployeeInfo Where Department = 'HR';

select CURDATE() AS Today;

select substring(EmpFname,1,4) from EmployeeInfo;

select substring_index(Address,'(',1) from EmployeeInfo;

create table NewTable AS select * from EmployeeInfo;
select * from NewTable;

select * from EmployeePosition where Salary between 50000 and 100000;

select * from EmployeeInfo where EmpFname like 'S%';

select * from EmpPosition ORDER BY Salary desc limit 1;

select CONCAT(EmpFname, ' ', EmpLname) AS 'FullName' from EmployeeInfo;

show databases;


