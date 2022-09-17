select * from sys.tables

create database Scm_jc836688
use Scm_jc836688

create table Theatre
(theatre_id numeric(1) primary key,
theatre_description VARCHAR(100),
theatre_total_rows numeric(3) not null
)
select* from  Theatre
create table Theatre_Row
(row_id numeric(4) primary key,
theatre_id numeric(1) foreign key references Theatre(theatre_id) ON DELETE CASCADE not null,
row_name VARCHAR(2) not null,
row_total_seats numeric(3) not null
)
select* from  Theatre_Row

create table Seat
(seat_id numeric(5) primary key,
row_id numeric(4)foreign key references Theatre_Row(row_id) ON DELETE CASCADE not null,
seat_number numeric(3) not null
)
select* from  Seat

create table Movie
(movie_id numeric(4) primary key,
movie_title VARCHAR(100) not null,
movie_rating VARCHAR(10) not null,
movie_released_date DATE not null,
movie_description VARCHAR(400),
movie_length numeric(3) not null
)
select* from  Movie

create table Screening_Plan
(plan_id numeric(4) primary key,
movie_id numeric(4) foreign key references Movie(movie_id) ON DELETE CASCADE not null,
plan_start_date DATE not null,
plan_end_date DATE not null,
plan_min_start_hh24 numeric(2) check(plan_min_start_hh24 >=09)DEFAULT 09 not null,
plan_max_start_hh24 numeric(2) check(plan_max_start_hh24 <=22)DEFAULT 22 not null,
plan_no_of_screenings numeric(2) check(plan_no_of_screenings>=1)DEFAULT 1 not null,

)
select * from Screening_Plan

create table Screening
(
screening_id numeric(6) primary key,
plan_id numeric(4) foreign key references Screening_Plan(plan_id) ON DELETE CASCADE not null,
theatre_id numeric(1) foreign key references Theatre(theatre_id) ON DELETE CASCADE not null,
screening_date DATE not null,
screening_start_hh24 numeric(2) not null,
screening_start_mm60 numeric(2) not null 
)

create table Ticket_Type
(t_type_id numeric(1) primary key,
t_type VARCHAR(20) not null,
t_type_price numeric(4,2) not null,
t_type_start_date DATE not null,
t_type_end_date DATE 

)
select * from Ticket_Type

create table Ticket
(ticket_id numeric(8) primary key,
t_type_id numeric(1) foreign key references Ticket_Type(t_type_id) ON DELETE CASCADE not null,
screening_id numeric(6) foreign key references Screening(screening_id) ON DELETE CASCADE not null,
seat_id numeric(5) foreign key references Seat(seat_id) ON DELETE no action not null,
ticket_date DATE not null
)
select * from Ticket

create table Employee
(
e_id numeric(3) primary key,
e_fname VARCHAR(30) NOT NULL,
e_lname VARCHAR(30) NOT NULL,
e_email VARCHAR(50) NOT NULL,
e_phone VARCHAR(20) NOT NULL,
e_street VARCHAR(50) NOT NULL,
e_suburb VARCHAR(30) NOT NULL,
e_postcode VARCHAR(4) NOT NULL,
e_gender VARCHAR(1) NOT NULL,
date_employed DATE not null
)
select * from Employee


---------TASK 3------------
alter table Theatre add check(theatre_id>=1 and theatre_id<5)
alter table Theatre add check(theatre_total_rows>1 and theatre_total_rows<26)

alter table Theatre_Row add check(row_id>0)
alter table Theatre_Row add check(row_name LIKE '%[A-Z]%')
alter table Theatre_Row add check(row_total_seats>=1)
alter table Theatre_Row add unique(theatre_id,row_name)

alter table Seat add check(seat_id>0)
alter table Seat add check(seat_number>=1)
alter table Seat add unique(row_id,seat_number)

alter table Movie add check(movie_id>0)
alter table Movie add check(movie_rating='G' OR movie_rating='PG' OR movie_rating='M' or movie_rating='MA15+' OR movie_rating='R18+' )
alter table Movie add default GETDATE() FOR movie_released_date

alter table Screening_Plan add check(plan_id>0)
---alter table Screening_Plan add default NEXT_DAY(SYSDATE,'MON') FOR plan_start_date
-----alter table Screening_Plan add default NEXT_DAY(SYSDATE,'MON') FOR plan_end_date
alter table Screening_Plan add check(plan_min_start_hh24>=9 and plan_min_start_hh24<=22)
alter table Screening_Plan add check(plan_max_start_hh24>=9 and plan_max_start_hh24<=22)
alter table Screening_Plan add check(plan_max_start_hh24>=plan_min_start_hh24)
alter table Screening_Plan add check(plan_no_of_screenings>=1)
alter table Screening_Plan add unique(movie_id,plan_start_date)

alter table Screening add check(screening_id>0)
alter table Screening add default GETDATE() FOR screening_date
alter table Screening add check(screening_start_hh24>9 and screening_start_hh24<22)
alter table Screening add check(screening_start_mm60>0 and screening_start_mm60<59)
alter table Screening add unique(theatre_id,screening_date,screening_start_hh24,screening_start_mm60)

alter table Ticket_type add check(t_type_id>0)
alter table Ticket_type add check(t_type_price>0)
alter table Ticket_type add check(t_type_end_date=Null or t_type_end_date>=t_type_start_date )
alter table Ticket_type add unique(t_type,t_type_start_date )

alter table Ticket add check(ticket_id>0)
alter table Ticket add default GETDATE() FOR ticket_date
alter table Ticket add unique(screening_id,seat_id )

alter table Employee add check(e_id>0)
ALTER TABLE Employee ADD UNIQUE (e_email)
ALTER TABLE Employee ADD check (e_email like '%@%')
alter table Employee  alter column e_postcode numeric(4)
alter table Employee add check(e_postcode>=0200 or e_postcode<=9999 )
alter table Employee add check(e_gender='M' OR e_gender='F')
alter table Employee add default GETDATE() FOR date_employed
alter table Employee add unique(e_fname,e_lname )


-----TASK4-----
select * from Theatre
insert into Theatre values (1,'',2)
insert into Theatre values (2,'',2),(3,'',3),(4,'',2)

select * from Theatre_Row
insert into Theatre_Row values (1,1,'A',3),(2,1,'B',3),(3,2,'A',3),(4,2,'B',4),(5,3,'A',3),(6,3,'B',4),
(7,3,'C',5),(8,4,'A',3),(9,4,'B',3)


SELECT * FROM Seat
insert into Seat values (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,3,1),(8,3,2),(9,3,3),(10,4,1),(11,4,2),
(12,4,3),(13,4,4),(14,5,1),(15,5,2),(16,5,3),(17,6,1),(18,6,2),(19,6,3),(20,6,4),(21,7,1),(22,7,2),(23,7,3),
(24,7,4),(25,7,5),(26,8,1),(27,8,2),(28,8,3),(29,9,1),(30,9,2),(31,9,3)


SELECT * FROM Movie
insert into Movie values (1,'The Monuments Men','G','10-1-2014','An unlikely',118)
insert into Movie values (2,'Non-Stop','MA15+','2014-4-20','An air',106)
insert into Movie values(3,'Rise of an Empire','M','2014-1-12','Greek',102),(4,'Tracks','PG','2014-4-20','A young',118)

select * from Screening_Plan
insert into Screening_Plan values (1,1,'2015-12-1','2016-2-9',9,17,4)
insert into Screening_Plan values (2,2,'2015-12-1','2016-2-9',9,22,6)
insert into Screening_Plan values (3,3,'2015-12-1','2016-2-9',9,22,5),(4,4,'2015-12-1','2016-2-9',9,17,4)


select * from Screening
insert into Screening values (100001,1,1,'2014-4-12',17,20)
insert into Screening values (100002,2,2,'2016-4-15',12,10)
insert into Screening values (100003,3,3,'2016-4-2',16,24),(100004,4,4,'2016-4-30',18,40)


select * from Ticket_Type
insert into Ticket_Type values (1,'Adult',10.95,'2015-12-1','2016-5-31'),(2,'Concession',5.5,'2015-12-1','2016-5-31')


select * from Ticket
insert into Ticket values (10000001,1,100001,1,'2016-6-30'),
(10000002,2,100002,2,'2016-6-24')

select * from Employee
insert into Employee values (1,'John','Smith','j.smith@uni.edu',0736560877,'12 Smith St','Dakota',4212,'M','2014-12-1')
insert into Employee values (2,'Jane','Rooster','j.rooster@uni.edu',0736560877,'665 Angelside Mwy','Poolamatta',4246,'F','2014-12-1')
insert into Employee values (3,'Percy Bisshe','Shelley','pb.shelley@uni.edu',0735982154,'3 Cigar Smoke Lane','Dakota',4623,'F','2014-12-1')
insert into Employee values (4,'Mary','Shelley','m.shelley@uni.edu',0737855764,'17 Exam Way','Dakota',4214,'F','2014-12-1')
