create database college;

use college;

create table dept( dept_id INT primary key,dept_name varchar(30) );

create table staff
	(staff_id INT PRIMARY KEY,
	name varchar(30),
	designation varchar(30),
	type_of_appointment varchar(30),
	salary int,
	dept_id INT,
	foreign key(dept_id) references dept(dept_id));
    
    
insert into dept values(1,"CA"),(2,"Civil"),(3,"EC"),(4,"EEE");

insert into staff values(1,"Raj","Professor","Regular",30000,2),
(2,"Rahul","Asst.Professor","Contract",20000,2),
(3,"Ranbir","Assoc.Professor","Regular",60000,1),
(4,"Aman","Professor","Contract",55000,3),
(5,"Priyanka","Asst.Professor","Contract",55000,4);

insert into staff values(6,"Alia","Professor","Contract",35000,4);
insert into staff values(7,"Sara","Professor","Regular",50000,4);


select * from staff;



-- Q.1
select count(staff.dept_id),d.dept_name from staff , dept as d where type_of_appointment="Contract" and
staff.dept_id=d.dept_id group by staff.dept_id ;

-- Q.2 


select max(pcount),dept_name  from
(

(select (count(staff.dept_id)) as pcount,d.dept_name from staff,dept as d  where designation="Professor"
 and staff.dept_id=d.dept_id group by staff.dept_id )

as pros


) group by dept_name order by dept_name desc LIMIT 1;



select (count(staff.dept_id)) as pcount,dept_name from staff INNER JOIN dept ON staff.dept_id=dept.dept_id

 where designation="Professor"
  group by dept_name;
 




-- Q.3

select avg(salary),dept_name from staff INNER JOIN dept ON staff.dept_id=dept.dept_id where type_of_appointment="Contract"  group by dept_name;

-- Q.4

select * from dept;

select dept.dept_name,max(staff.salary) as maximum_salary
from dept,staff
where dept.dept_id=staff.dept_id
group by dept.dept_name;

-- q.5

select sum(salary) as MCA_total_salary
from dept,staff
where dept.dept_id=staff.dept_id;
