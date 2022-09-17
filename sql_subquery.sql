create database assignment
use assignment
select * from employee_database
select * from salesman
select * from customer
delete from salesman where name='' OR name IS NULL
----------1--------
select * from employee_database where salesman_id=(select salesman_id from salesman where name='Paul Adam')
----------2--------------
select * from employee_database where salesman_id=(select salesman_id from salesman where city='London')
--------3----------
select * from employee_database where purch_amt>(select AVG(purch_amt) from employee_database where ord_date='2012-10-10')
------4---------
select grade,COUNT(*) from customer group by grade having grade>(select avg(grade) from customer where city='New York')
--------5---------
select ord_no,purch_amt,ord_date,salesman_id from employee_database where salesman_id in (select salesman_id from salesman where commission=(select MAX(commission) from salesman))
-------6--------
select * from salesman where city in (select city from customer)
------7---------
select * from salesman where city= any(select city from customer)
------8--------
select * from employee_database where purch_amt>=(select purch_amt from employee_database where ord_date='2012-09-10')
select * from employee_database where purch_amt > ANY(select purch_amt from employee_database where ord_date='2012-09-10')
--------9---------
select * from customer where grade> Any(select grade from customer where city='New York')
select * from customer where grade> All(select grade from customer where city='New York')
----10-------
select * from customer where grade != any(select grade from customer where city='London')
select * from customer where grade not in (select grade from customer where city='London')
---------------11-----------
select * from customer where grade not in (select grade from customer where city='Paris')