create table department
(
dept_id int primary key,
dept_name char(20),
dept_location char(15)
)
select * from department
insert into department values (1001,'FINANCE','SYDNEY'),(2001,'AUDIT','MELBOURNE'),(3001,'MARKETING','PERTH'),(4001,'PRODUCTION','BRISBANE')

create table employees
(
emp_id int primary key,
emp_name char(15),
job_name char(10),
manager_id int,
hire_date date,
salary decimal(10,2),
comission decimal(7,2),
dept_id int foreign key references department(dept_id)
)
insert into employees values (68319,'KAYLING','PRESIDENT','','1991-11-18',6000.0,0,1001)
select * from employees
insert into employees values (66928,'BLAZE','MANAGER',68319,'1991-05-01',2750.00,0,3001)
insert into employees values (67832,'CLARE','MANAGER',68319,'1991-06-09',2550.00,0,1001)
insert into employees values(65646,'JONAS','MANAGER',68319,'1991-04-02',2957.00,0,2001),
(67858,'SCARLET','ANALYST', 65646,'1997-04-19',3100.00,0,2001),(69062,'FRANK','ANALYST',65646,'1991-12-03',3100.00,0,2001),
(63679,'SANDRINE','CLERK',69062 ,'1990-12-18' ,900.00,0,2001),(64989,'ADELYN','SALESMAN',66928,'1991-02-20',1700.00 ,400.00,3001)
insert into employees values(65271,'WADE','SALESMAN',66928,'1991-02-22',1350.00 ,600.00,3001),(66564,'MADDEN','SALESMAN',66928,'1991-09-28',1350.00,1500.00,3001),
(68454,'TUCKER','SALESMAN',66928,'1991-09-08',1600.00,0.00 ,3001),(68736,'ADNRES','CLERK',67858,'1997-05-23',1200.00,0,2001),
(69000,'JULIUS','CLERK',66928,'1991-12-03',1050.00,0,3001),(69324,'MARKER','CLERK',67832,'1992-01-23',1400.00,0,1001)
---------------------
create table salary_grade
(
grade int primary key,
min_salary int,
max_salary int
)
select * from salary_grade
insert into salary_grade values (1 ,800,1300),(2,1301,1500),(3,1501,2100),(4,2101,3100),(5,3101,9999)

-------1--------
select distinct job_name from employees
-----------2-------

-----3-----------





