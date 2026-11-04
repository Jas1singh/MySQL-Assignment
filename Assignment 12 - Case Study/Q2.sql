
use Case_Study;

create table department (department_id int primary key, department_name varchar(100) not null, floor_no int not null);

create table doctor (doctor_id int primary key, doctor_name varchar(100) not null, specialization varchar(100), department_id int null, constraint fk_doctor_department foreign key (department_id) references department(department_id) on delete set null on update cascade) ;

create table patient (patient_id int primary key, patient_name varchar(100) not null, gender varchar(10), city varchar(100)) ;

create table appointment (appointment_id int primary key, appointment_date date not null, appointment_time time not null, patient_id int not null, doctor_id int null, department_id int null, status varchar(30) not null, constraint fk_appointment_patient foreign key (patient_id) references patient(patient_id) on delete cascade on update cascade, constraint fk_appointment_doctor foreign key (doctor_id) references doctor(doctor_id) on delete set null on update set null, constraint fk_appointment_department foreign key (department_id) references department(department_id) on delete set null on update cascade) ;

create table medicine (medicine_id int primary key, medicine_name varchar(100) not null, manufacturer varchar(100), price decimal(10,2) not null) ;

create table prescription (prescription_id int primary key, prescription_date date not null, appointment_id int not null, patient_id int not null, doctor_id int null, remarks varchar(255), constraint uq_prescription_appointment unique (appointment_id), constraint fk_prescription_appointment foreign key (appointment_id) references appointment(appointment_id) on delete cascade on update cascade, constraint fk_prescription_patient foreign key (patient_id) references patient(patient_id) on delete cascade on update cascade, constraint fk_prescription_doctor foreign key (doctor_id) references doctor(doctor_id) on delete set null on update set null) ;

create table prescription_medicine (prescription_id int not null, medicine_id int not null, dosage varchar(30), duration_days int not null, quantity int not null, primary key (prescription_id, medicine_id), constraint fk_pm_prescription foreign key (prescription_id) references prescription(prescription_id) on delete cascade on update cascade, constraint fk_pm_medicine foreign key (medicine_id) references medicine(medicine_id) on delete restrict on update cascade) ;

insert into department values (101, 'cardiology', 3), (102, 'neurology', 4), (103, 'orthopedics', 2), (104, 'dermatology', 1);

insert into doctor values (201, 'dr. rajesh sharma', 'cardiologist', 101), (202, 'dr. neha verma', 'neurologist', 102), (203, 'dr. amit jain', 'orthopedic', 103), (204, 'dr. priya singh', 'dermatologist', 104), (205, 'dr. karan mehta', 'cardiologist', 101);

insert into patient values (301, 'rahul verma', 'male', 'indore'), (302, 'sneha sharma', 'female', 'bhopal'), (303, 'amit patel', 'male', 'indore'), (304, 'pooja gupta', 'female', 'ujjain'), (305, 'rohan jain', 'male', 'dewas'), (306, 'neha patel', 'female', 'indore');

insert into medicine values (401, 'paracetamol', 'abc pharma', 30), (402, 'azithromycin', 'xyz pharma', 120), (403, 'pantoprazole', 'medlife', 80), (404, 'amoxicillin', 'healthcare pharma', 150), (405, 'ibuprofen', 'abc pharma', 60), (406, 'cetirizine', 'medlife', 45);

insert into appointment values (501, '2026-09-01', '10:00:00', 301, 201, 101, 'completed'), (502, '2026-09-01', '11:00:00', 302, 202, 102, 'completed'), (503, '2026-09-02', '09:30:00', 303, 203, 103, 'completed'), (504, '2026-09-02', '12:00:00', 304, 204, 104, 'cancelled'), (505, '2026-09-03', '10:30:00', 301, 205, 101, 'completed'), (506, '2026-09-03', '11:30:00', 305, 203, 103, 'completed'), (507, '2026-09-04', '09:00:00', 306, 201, 101, 'scheduled'), (508, '2026-09-04', '14:00:00', 302, 202, 102, 'scheduled');

insert into prescription values (601, '2026-09-01', 501, 301, 201, 'bp observation'), (602, '2026-09-01', 502, 302, 202, 'migraine treatment'), (603, '2026-09-02', 503, 303, 203, 'knee pain'), (604, '2026-09-03', 505, 301, 205, 'heart checkup'), (605, '2026-09-03', 506, 305, 203, 'back pain');

insert into prescription_medicine values (601, 401, '1-0-1', 5, 10), (601, 403, '1-0-0', 5, 5), (602, 403, '1-0-0', 7, 7), (602, 406, '0-0-1', 5, 5), (603, 405, '1-0-1', 5, 10), (603, 403, '1-0-0', 5, 5), (604, 401, '1-0-1', 3, 6), (604, 403, '1-0-0', 3, 3), (605, 405, '1-0-1', 7, 14);

select * from department;

select * from doctor;

select * from patient;

select * from appointment;

select * from medicine;

select * from prescription;

select * from prescription_medicine;

insert into appointment values (509, '2026-09-05', '10:00:00', 999, 201, 101, 'scheduled');


select * from appointment where patient_id = 306;

delete from patient where patient_id = 306;

select * from patient where patient_id = 306;

select * from appointment where appointment_id = 507;

select * from appointment where doctor_id = 203;

delete from doctor where doctor_id = 203;

select * from appointment where appointment_id in (503, 506);

select * from prescription where prescription_id in (603, 605);

select * from prescription_medicine where medicine_id = 406;

delete from medicine where medicine_id = 406;


select * from department;

select doctor_id, doctor_name, department_id from doctor;

select appointment_id, department_id from appointment;

update department set department_id = 1001 where department_id = 101;

select * from doctor;

select * from appointment;

update department set department_id = 1002 where department_id = 102;

update department set department_id = 1003 where department_id = 103;

update department set department_id = 1004 where department_id = 104;

select * from doctor where doctor_id = 203;

select * from appointment where doctor_id = 203;

select * from prescription where doctor_id = 203;

update doctor set doctor_id = 250 where doctor_id = 203;

select * from doctor where doctor_id = 250;

select * from appointment where appointment_id in (503, 506);

select * from prescription where prescription_id in (603, 605);

select * from doctor where department_id = 104;

delete from department where department_id = 104;

select * from doctor where doctor_id = 204;
