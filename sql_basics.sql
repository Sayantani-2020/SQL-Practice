show databases
CREATE DATABASE if not exists my_newdatabase
USE my_newdatabase
SELECT database()

--Create ddl operation

CREATE TABLE employee
(
	EmpID		int AUTO_INCREMENT,
	FirstName	varchar(50) NOT NULL,
    LastName	varchar(50) NOT NULL,
    Age			INT NOT NULL,
    Salary		INT NOT NULL,
    Location	varchar(50) NOT NULL,
    PRIMARY KEY(EmpID)
)
--  DDL command drop,create,alter
DROP TABLE employee
DESC employee
SHOW tables

-- DML command insert
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Priya", "Bhatia", 26, 100000, "Bengaluru");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Sumedha", "Midha", 32, 50000, "Gurugram");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Rashmi", "Tanwar", 30, 20000, "Bengaluru");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Shivam", "Mishra", 28, 10000, "Noida");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Ajay", "Bhatia", 25, 5000, "Mumbai");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Ankit", "Sangwan", 34, 70000, "Bengaluru");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Alia", "Bhatt", 29, 50000, "Gurugram");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Sayantani", "Banerjee", 31, 50000, "Kolkata");


SELECT * FROM employee
Select salary from employee

SELECT FirstName, LastName, Salary 
FROM employee WHERE Salary >= 50000
ORDER BY Salary DESC
LIMIT 2

-- DML(data manipulation language) update,delete,insert 
update employee set lastname ="Tanwar"
where EmpID = 6

DELETE FROM employee
WHERE EmpID = 6

--Aggregation function and aliasing
SELECT COUNT(*) As Total_Num_Employee FROM employee
SELECT MAX(Salary) As Max_Salary FROM employee
SELECT MIN(Salary) As Min_Salary FROM employee
SELECT SUM(Salary) As Total_Cost_Company FROM employee

--DDL command Alter command used to change the schema of the table
--modify,add,delete col with alter command
ALTER TABLE employee MODIFY FirstName varchar(20)

CREATE TABLE Students(
StudentID	INT	AUTO_INCREMENT,
S_FirstName	varchar(50) NOT NULL,
S_LastName	varchar(50) NOT NULL,
S_Email varchar(50) NOT NULL,
S_Phone	varchar(50) NOT NULL,
S_EnrollmentDate timestamp NOT NULL,
Selected_Course	INT NOT NULL,
Years_Of_Exp INT NOT NULL,
S_Company varchar(50) NOT NULL,
Batch_Start_Date timestamp NOT NULL,
Location varchar(50) NOT NULL,
PRIMARY KEY(StudentID)
)

SHOW TABLES

CREATE TABLE Courses(
CourseID INT AUTO_INCREMENT,
CourseName	varchar(50) NOT NULL,
CourseDuration INT NOT NULL,
CourseFee INT NOT NULL,
PRIMARY KEY(CourseID)
)
DESC Courses
DROP TABLE Courses

INSERT INTO Courses(CourseName,CourseDuration,CourseFee) VALUES ("SQL mastery",3,1499)
INSERT INTO Courses(CourseName,CourseDuration,CourseFee) VALUES ("Java mastery",3,4999)
INSERT INTO Courses(CourseName,CourseDuration,CourseFee) VALUES ("Python mastery",3,3099)

SELECT * FROM Courses


CREATE TABLE Learner(
LearnerID	INT	AUTO_INCREMENT,
L_FirstName	varchar(20) NOT NULL,
L_LastName	varchar(20) NOT NULL,
L_EmailID varchar(30) NOT NULL,
L_Phone	varchar(50) NOT NULL,
S_EnrollmentDate timestamp NOT NULL,
Selected_Courses INT NOT NULL,
Years_Of_Exp INT NOT NULL,
L_Company VARCHAR(50) NOT NULL,
SourceofJoining VARCHAR(50),
Batch_Start_Date timestamp NOT NULL,
Location varchar(50) NOT NULL,
PRIMARY KEY(LearnerID),
UNIQUE KEY(L_EmailID ),
FOREIGN KEY(Selected_Courses) REFERENCES Courses(CourseID)
)

DESC Learner
DROP TABLE Learner

INSERT INTO Learner(L_FirstName, L_LastName, L_EmailID,L_Phone,S_EnrollmentDate, Selected_Courses, Years_Of_Exp , L_Company,SourceofJoining,Batch_Start_Date ,Location) 
VALUES ("Nimrat", "Ahuja","nimmi@gmail.com", "8907745667","2024-02-29",1,2,"Amazon","Naukri.com","2024-12-18","Punjab" )   
INSERT INTO Learner(L_FirstName, L_LastName, L_EmailID,L_Phone,S_EnrollmentDate, Selected_Courses, Years_Of_Exp , L_Company,SourceofJoining,Batch_Start_Date ,Location) 
VALUES ("Ash", "rai","ash@gmail.com", "8907899667","2024-02-29",1,2,"Google","Naukri.com","2024-12-18","Karnataka" )              
INSERT INTO Learner(L_FirstName, L_LastName, L_EmailID,L_Phone,S_EnrollmentDate, Selected_Courses, Years_Of_Exp , L_Company,SourceofJoining,Batch_Start_Date ,Location) 
VALUES ("Avisk", "bachhan","avh@gmail.com", "8907890067","2024-02-29",2,2,"Google","Naukri.com","2024-12-18","Karnataka" )  
INSERT INTO Learner(L_FirstName, L_LastName, L_EmailID,L_Phone,S_EnrollmentDate, Selected_Courses, Years_Of_Exp , L_Company,SourceofJoining,Batch_Start_Date ,Location) 
VALUES ("Amit", "bachhan","amit@gmail.com", "8955890067","2024-02-26",3,2,"Delloit","Naukri.com","2024-12-18","Karnataka" )  
INSERT INTO Learner(L_FirstName, L_LastName, L_EmailID,L_Phone,S_EnrollmentDate, Selected_Courses, Years_Of_Exp , L_Company,SourceofJoining,Batch_Start_Date ,Location) 
VALUES ("Jaya", "bhaduri","jaya77@gmail.com", "9955673006","2024-02-27",3,2,"Cdac","Linkedin","2024-12-18","Kolkata" )  

SELECT * FROM Learner

-- Data Analysis [employee,courses,Learner]
-- Find Employee with highest salary
select  max(Salary) as Highest_salary
from employee

select *
from employee
order by Salary desc limit 1

select * from employee

-- Find the record of the employee getting lowest salary and age is greater than 28
select min(Salary)
from employee
where age>28

select *
from employee
where Salary =(
		select min(Salary)
        from employee
        )
      and Age<30
      
-- find the no of enrollments in the website
select * from Learner

select count(LearnerID) as no_enrollments
from Learner

-- find the number of enrollment for the courseid =3
select count(LearnerID) as no_enrollments
from Learner
where Selected_Courses=3

--Count the no of learners enrolled in the month of feb 

select count(LearnerID) as tot_learner_in_feb
from Learner
where S_EnrollmentDate like "%-02-%"

-- update learners table

update Learner
set S_EnrollmentDate = "2024-01-31",Years_Of_Exp=5
where LearnerID = 2 

-- Count the number companies
select distinct L_Company
from Learner

select count( distinct L_Company)
from Learner

-- count the learners who joined course via diff platform
select SourceofJoining, count(*) as no_of_learners
from learner
group by SourceofJoining

-- note after selecting non aggregating coloumn
-- group by non aggregated col
-- and then write aggregated column as mentioned above,
-- aggregated column means count,min,max

-- corresponding to each course how many learners have enrolled

select Selected_Courses,count(*) as no_of_learners
from Learner
group by Selected_Courses;

-- coresponding to indivisual source of joining,give the max years of experience

select SourceofJoining ,max(Years_Of_Exp) as max_years_exp
from Learner
group by SourceofJoining

select SourceofJoining ,min(Years_Of_Exp) as avg_years_exp
from Learner
group by SourceofJoining;

-- display records of learners who hv joined the course via more than 1 source of joining

select SourceofJoining ,max(Years_Of_Exp) as max_years_exp
from Learner
group by SourceofJoining
having max_years_exp>2
-- Note never use where clause after group by,,use having clause if needs,you can use before as usual.

 
-- Logical operators between,and,not,or
 
select * 
from Learner
where Years_Of_Exp between 3 and 5

-- Alter command in SQL
desc employee
alter table employee add column jobposition varchar(50)
alter table employee modify column FirstName varchar(40)
alter table employee drop column jobposition

-- Delete vs Truncate  
-- Truncate delete all rows
-- Delete only particular rows
 
select * from employee
delete from employee where EmpID=3;
truncate table employee

-- Data types -->decimal 
-- decimal(3,1) means 12.5,77.9
CREATE TABLE Courses_update(
CourseID INT AUTO_INCREMENT,
CourseName	varchar(50) NOT NULL,
CourseDuration DECIMAL(3,1) NOT NULL,
CourseFee INT NOT NULL,
PRIMARY KEY(CourseID)
)
-- implicit type casting happend here
INSERT INTO Courses(CourseName,CourseDuration,CourseFee) VALUES ("SQL mastery",3.2,1499)
INSERT INTO Courses(CourseName,CourseDuration,CourseFee) VALUES ("Java mastery",11.9,4999)
INSERT INTO Courses(CourseName,CourseDuration,CourseFee) VALUES ("Python mastery",3,3099)

desc Courses
select * from Courses;
-- using decimal data types ..no such issue
INSERT INTO Courses_update(CourseName,CourseDuration,CourseFee) VALUES ("SQL mastery",3.2,1499)
INSERT INTO Courses_update(CourseName,CourseDuration,CourseFee) VALUES ("Java mastery",11.9,4999)
INSERT INTO Courses_update(CourseName,CourseDuration,CourseFee) VALUES ("Python mastery",3,3099)
desc Courses_update
select * from Courses_update;
-- timestap now() basically to generate logs in real life project
alter table Courses_update add column changed_at timestamp default now()

INSERT INTO Courses_update(CourseName,CourseDuration,CourseFee) VALUES ("New mastery Prog",3.5,3999)

update Courses_update
set CourseFee = 199
where CourseID=4

-- here now the problem is after updation ,timestap didnt changed

alter table Courses_update modify column changed_at timestamp default now() on update now()


update Courses_update
set CourseFee = 299
where CourseID=4
select * from Courses_update


-- employee table
select * from employee;
-- for each locaton,what is the count of each employee and avg salary of the employee


select Location,count(EmpID) as countofemp,avg(Salary) as avgsalary
from employee
group by Location 

-- also display firstname lastname coressponding to each record


select FirstName,LastName,employee.Location,count_of_emp,avgsalary
from employee
join
(select Location,count(EmpID) as count_of_emp,avg(Salary) as avgsalary
from employee
group by Location ) as temp
on employee.Location =temp.Location


