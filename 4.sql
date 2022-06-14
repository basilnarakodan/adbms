create database staff;
use staff;
CREATE TABLE `department` (
  `dept_id` int NOT NULL,
  `dept_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
);
INSERT INTO `department` VALUES (100,'mca'),(101,'cs'),(102,'eee');

CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `appointment_type` varchar(45) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
);
INSERT INTO `staff` VALUES 
(10,'assist proff','pg','guest',100,25000),
(11,'assist proff','pg','permanent',101,45000),
(12,'assos proff','phd','permanent',100,50000),
(13,'clerk','ug','guest',102,25000),
(14,'hod','phd','permanent',100,65000),
(15,'hod','phd','guest',101,50000),
(16,'assist prof','pg','permanent',102,35000),
(17,'assos proff','pg','guest',102,35000),
(18,'programmer','ug','permanent',100,45000),
(19,'programmer','pg','guest',101,35000);

/*1*/
select department.dept_name as department,count(staff.staff_id) as 'no of guest staff' from staff 
inner join department on staff.dept_id=department.dept_id 
where staff.appointment_type='guest' group by department.dept_name;

/*2*/
select department.dept_name from department inner join staff on department.dept_id=staff.dept_id 
where staff.qualification='phd' group by department.dept_name order by count(staff.staff_id) desc limit 1;

/*3*/
select dept_name,avg(salary) from department inner join staff on department.dept_id=staff.dept_id 
where appointment_type='guest' group by dept_name;

/*4*/
select dept_name,staff_id,salary from staff 
inner join (select dept_id,max(salary) as maxsalary from staff group by dept_id) e 
on staff.dept_id=e.dept_id and staff.salary=e.maxsalary
inner join department on department.dept_id=staff.dept_id;

/*5*/
select sum(salary) from department inner join (select salary,dept_id from staff) f
on f.dept_id=department.dept_id where dept_name='mca';