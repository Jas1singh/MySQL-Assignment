

create database Case_Study;

use Case_Study;

create table departments (departmentid int primary key auto_increment, departmentname varchar(100) not null unique);

create table employees (employeeid int primary key auto_increment, employeename varchar(100) not null, salary decimal(10,2) not null, departmentid int not null, foreign key (departmentid) references departments(departmentid) on delete cascade);

insert into departments (departmentname) values ('hr'), ('it'), ('finance');

insert into employees (employeename, salary, departmentid) values ('rahul', 30000, 1), ('amit', 40000, 2), ('priya', 35000, 1), ('neha', 45000, 3), ('rohit', 50000, 2);

select employeeid, employeename, salary, (select departmentname from departments where departments.departmentid = employees.departmentid) as departmentname from employees;

update employees set departmentid = 3 where employeeid = 1;

delete from departments where departmentid = 1;

select * from employees;


create table doctors (doctorid int primary key auto_increment, doctorname varchar(100) not null, specialization varchar(100) not null unique);

create table patients (patientid int primary key auto_increment, patientname varchar(100) not null, doctorid int not null, foreign key (doctorid) references doctors(doctorid) on delete cascade);

insert into doctors (doctorname, specialization) values ('dr. sharma', 'cardiology'), ('dr. verma', 'neurology'), ('dr. gupta', 'orthopedics');

insert into patients (patientname, doctorid) values ('aman', 1), ('riya', 1), ('karan', 2), ('pooja', 3), ('mohit', 2);

select * from doctors;

select * from patients;

update patients set doctorid = 3 where patientid = 1;

delete from doctors where doctorid = 2;

select * from patients;


create table authors (authorid int primary key auto_increment, authorname varchar(100) not null unique);

create table books (bookid int primary key auto_increment, booktitle varchar(150) not null unique, authorid int, foreign key (authorid) references authors(authorid) on delete set null);

insert into authors (authorname) values ('chetan bhagat'), ('r.k. narayan'), ('rabindranath tagore');

insert into books (booktitle, authorid) values ('five point someone', 1), ('2 states', 1), ('malgudi days', 2), ('the guide', 2), ('gitanjali', 3);

select * from authors;

select * from books;

delete from authors where authorid = 1;

select * from books;

update books set authorid = 2 where bookid = 1;


create table students (studentid int primary key auto_increment, studentname varchar(100) not null);

create table exams (examid int primary key auto_increment, subjectname varchar(100) not null unique);

create table results (resultid int primary key auto_increment, studentid int not null, examid int not null, score int not null check (score between 0 and 100), foreign key (studentid) references students(studentid) on delete cascade, foreign key (examid) references exams(examid) on update cascade);

insert into students (studentname) values ('rahul'), ('amit'), ('priya');

insert into exams (subjectname) values ('dbms'), ('java'), ('python');

insert into results (studentid, examid, score) values (1, 1, 85), (1, 2, 90), (2, 1, 75), (2, 3, 80), (3, 2, 95);

select * from students;

select * from exams;

select * from results;

delete from students where studentid = 1;

select * from results;

update exams set subjectname = 'advanced java' where examid = 2;

select * from exams;

select * from results;
