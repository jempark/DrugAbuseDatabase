drop database if exists drg;

create database drg;

use drg; 

-- Creates the user table
drop table if exists User;
create table if not exists User (
User_id int primary key NOT NULL,
sex int NOT NULL,
race int NOT NULL
);

-- Creates the General health table
drop table if exists General_Health;
create table if not exists General_Health (
User_id int NOT NULL, 
BMI decimal(10,4) NOT NULL,
Health_status int NOT NULL, 
Mental_health int NOT NULL,
primary key (User_id),
constraint health_fk_user foreign key (User_id) references User(User_id) 
);

-- Creates the employment and education table
drop table if exists Edu_Employ; 
create table if not exists Edu_Employ (
User_id int NOT NULL, 
Education int NOT NULL,
Employment int NOT NULL, 
Income int NOT NULL,
primary key (User_id),
constraint edu_fk_user foreign key (User_id) references User(User_id) 
);

-- Creates the treatment answers table
drop table if exists Treatment_Answers; 
create table if not exists Treatment_Answers (
User_id int NOT NULL, 
Need_treatment int NOT NULL,
Couldnt_afford int NOT NULL, 
Treatment_not_covered int NOT NULL,
Distance_from_rehab int NOT NULL,
Time_since_last int NOT NULL,
primary key (User_id),
constraint treatment_fk_user foreign key (User_id) references User(User_id) 
);

-- Creates the drugs table
drop table if exists Drugs;
create table if not exists Drugs (
Drug_id int primary key NOT NULL,
Drug_Name varchar(20) NOT NULL
);

-- Creates the drug answers table
drop table if exists Drug_Answers;
create table if not exists Drug_Answers (
User_id int NOT NULL, 
Drug_id int NOT NULL, 
Ever_used int NOT NULL,
Age_first_used int NOT NULL, 
Time_last_used int NOT NULL,
Days_Per_Month int NOT NULL,
Days_Per_Week int NOT NULL,
Days_in_past_30 int NOT NULL,
primary key (User_id, Drug_id),
constraint users_fk_answers foreign key (User_id) references User(User_id), 
constraint drugs_fk_answers foreign key (Drug_id) references Drugs(Drug_id)
);

-- Creates a temporary marijuana table
drop table if exists marijuana;
create temporary table marijuana 
(
User_id int NOT NULL, 
Drug_id int NOT NULL, 
Ever_used int NOT NULL,
Age_first_used int NOT NULL, 
Time_last_used int NOT NULL,
Days_Per_Month int NOT NULL,
Days_Per_Week int NOT NULL,
Days_in_past_30 int NOT NULL
);

-- Creates a temporary cocaine table
drop table if exists cocaine;
create temporary table cocaine 
(
User_id int NOT NULL, 
Drug_id int NOT NULL, 
Ever_used int NOT NULL,
Age_first_used int NOT NULL, 
Time_last_used int NOT NULL,
Days_Per_Month int NOT NULL,
Days_Per_Week int NOT NULL,
Days_in_past_30 int NOT NULL
);

-- Creates a temporary crack table
drop table if exists crack;
create temporary table crack 
(
User_id int NOT NULL, 
Drug_id int NOT NULL, 
Ever_used int NOT NULL,
Age_first_used int NOT NULL, 
Time_last_used int NOT NULL,
Days_Per_Month int NOT NULL,
Days_Per_Week int NOT NULL,
Days_in_past_30 int NOT NULL
);

-- Creates a temporary heroin table
drop table if exists heroin;
create temporary table heroin 
(
User_id int NOT NULL, 
Drug_id int NOT NULL, 
Ever_used int NOT NULL,
Age_first_used int NOT NULL, 
Time_last_used int NOT NULL,
Days_Per_Month int NOT NULL,
Days_Per_Week int NOT NULL,
Days_in_past_30 int NOT NULL
);

-- Creates a temporary hallucinogen table
drop table if exists hallucinogen;
create temporary table hallucinogen 
(
User_id int NOT NULL, 
Drug_id int NOT NULL, 
Ever_used int NOT NULL,
Age_first_used int NOT NULL, 
Time_last_used int NOT NULL,
Days_Per_Month int NOT NULL,
Days_Per_Week int NOT NULL,
Days_in_past_30 int NOT NULL
);

-- Creates a temporary meth table
drop table if exists meth;
create temporary table meth 
(
User_id int NOT NULL, 
Drug_id int NOT NULL, 
Ever_used int NOT NULL,
Age_first_used int NOT NULL, 
Time_last_used int NOT NULL,
Days_Per_Month int NOT NULL,
Days_Per_Week int NOT NULL,
Days_in_past_30 int NOT NULL
);

-- Insert information from the temporary table into the Drug_answers table
insert into drug_answers
select * from marijuana;

insert into drug_answers
select * from cocaine;

insert into drug_answers
select * from crack;

insert into drug_answers
select * from heroin;

insert into drug_answers
select * from hallucinogen;

insert into drug_answers
select * from meth;