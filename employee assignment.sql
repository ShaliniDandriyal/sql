create database shalini
use shalini
create table department
(
dep_id int primary key,
dep_name varchar(20),
dep_location varchar(15)
)
create table salary_grade
(
grade int primary key,
min_salary int,
max_salary int
)
create table employees
(emp_id int primary key,
emp_name varchar(15),
job_name varchar(10),
manager_id int,
hire_date date,
salary decimal(10,2),
commission decimal(7,2),
dep_id int foreign key references department(dep_id)
)
insert into department VALUES (1001,'FINANACE','SYDNEY'),(2001,'AUDIT','MELBOURNE'),(4001,'PRODUCTION','BRISBANE')
INSERT INTO department VALUES(3001,'MARKETING','PERTH')
SELECT * FROM department
insert into salary_grade values(1,800,1300),(2,1301,1500),(3,1501,2100),(4,2101,3100),(5,3101,9999)
select * from salary_grade
insert into employees values(68319,'KAYLING','PRESIDENT',NULL , '1991-11-18',6000.00,NULL ,1001)			
SELECT * FROM employees
insert into employees values(66928,'BLAZE','MANAGER',68319, '1991-05-01',2750.00,NULL ,3001)
INSERT INTO employees values
(67832,'CLARE ','MANAGER',68319,'1991-06-09',2550.00 ,NULL,1001),
(65646,'JONAS','MANAGER',68319,'1991-04-02',2957.00,NULL,2001),
(67858,'SCARLET','ANALYST',65646,'1997-04-19',3100.00,NULL,2001),
(69062,'FRANK ','ANALYST',65646,'1991-12-03',3100.00,NULL,2001)
insert into employees values
(63679,'SANDRINE','CLERK',69062,'1990-12-18',900.00,NULL,2001),
(64989,'ADELYN','SALESMAN',66928,'1991-02-20',1700.00,400.00,3001),
(65271,'WADE','SALESMAN',66928,'1991-02-22',1350.00,600.00,3001)
insert into employees values
(66564,'MADDEN','SALESMAN',66928,'1991-09-28',1350.00,1500.00,3001),
(68454,'TUCKER','SALESMAN',66928,'1991-09-08',600.00,0.00,3001),
(68736,'ADNRES','CLERK',67858,'1997-05-23',1200.00,NULL,2001),
(69000,'JULIUS','CLERK',66928,'1991-12-03',1050.00,NULL,3001),
(69324,'MARKER','CLERK',67832,'1992-01-23',1400.00,NULL,1001)							
select * from employees
-------1------
select * from employees where emp_id in (select manager_id from employees)
-----2------
select emp_id,emp_name,job_name,hire_date as joinin_date,DATEDIFF(YY,hire_date,GETDATE()) AS Experience from employees where emp_id in (select manager_id from employees) 
------3------
select * from employees where salary between (select min_salary from salary_grade where grade in (2,3)) and (select max_salary from salary_grade where grade in (2,3))
------4------
select * from employees where salary>(select salary from employees where emp_name='JONAS')
---5-------
select * from employees where DATEDIFF(YY,hire_date,getdate())> (select DATEDIFF(YY,hire_date,getdate()) from employees where emp_name='ADELYN')
-----6-------
SELECT * FROM employees WHERE job_name=(SELECT job_name FROM employees WHERE emp_name='MARKER')OR  salary>(SELECT salary FROM employees WHERE emp_name='ADELYN')
----7-----
SELECT * FROM employees WHERE salary> ALL(SELECT (salary+commission) FROM employees WHERE job_name='SALESMAN')
-----8--------
SELECT * FROM employees WHERE job_name IN(SELECT job_name FROM employees WHERE emp_name='SANDRINE'OR emp_name='ADELYN')
-----9--------
SELECT * FROM employees WHERE manager_id=(SELECT emp_id FROM employees WHERE emp_name='JONAS')
-----10-----
SELECT emp_name,dep_id from employees where  salary in(select max(salary) from employees group by dep_id)
---11-------
select * from employees where emp_id in (select manager_id from employees)
---12------
select * from employees where dep_id IN (select dep_id from department where dep_location='PERTH')
----13-----
SELECT * FROM employees WHERE dep_id=1001 and salary>(select salary from employees where emp_name='ADELYN')
----14-------
select * from employees where salary in (select salary from employees where emp_id)
-----15-------
select * from employees e , employees q where e.manager_id=q.manager_id and e.salary>q.salary 