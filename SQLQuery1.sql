create database 
use library1
create table NewBook (
bid int not null identity(1,1) primary key ,
bName varchar (250) not null ,
bAuthor varchar (250) not null,
bPubl varchar (250) not null,
bPDate varchar (250) not null,
bPrice bigint not null,
bQuan bigint not null ,
dpt_Id int 
)
create table NewStudent(
stuid int NOT NULL IDENTITY(1,1) primary key,
sname varchar(250) not null,
enroll varchar(250) not null,
dep varchar(250) not null,
sem varchar(250) not null,
contact bigint not null,
email varchar(250) not null,
sess_Id int ,
prog_Id int
)
create table IRBook(
id int not null Identity(1,1) primary key,
std_enroll varchar(250) not null,
std_name varchar(250) not null,
std_dep varchar(250) not null,
std_sem varchar(250) not null,
std_contact bigint not null,
std_email varchar(250) not null,
book_name varchar(250) not null,
Book_issue_date varchar(250) not null,
Book_return_date varchar(250),
bid int foreign key references NewBook(bid) ,
stuid int foreign key references NewStudent(stuid)
)


create table Designation(
deg_id int not null Identity(1,1) primary key,
designation nvarchar(50) not null,
) 

create table Library_Staff(
staff_Id int not null Identity(1,1) primary key,
deg_Id int not null foreign key references Designation (deg_id) ,
 name nvarchar(100) not null,
fathername nvarchar(100) not null,
address nvarchar(200) not null,
gender nvarchar(10) not null,
contactno nvarchar(20) not null,
)

create table Department(
dpt_Id int not null Identity(1,1) primary key,
dpt_Name nvarchar(100) not null,
establish_Date date,
description nvarchar(200) 
)

alter table NewBook add foreign key (dpt_Id) references Department(dpt_Id) ;

create table Session(
sess_Id int not null Identity(1,1) primary key,
sess_Name nvarchar(100) not null,
start_Date date,
end_Date date,
description nvarchar(200)  null 
)

alter table NewStudent add foreign key (sess_Id) references Session(sess_Id) ;

create table Programme(
prog_Id int not null Identity(1,1) primary key,
prog_Name nvarchar(100) not null,
description nvarchar(200)  null
)
alter table NewStudent add foreign key (prog_Id) references Programme(prog_Id) ;

create table Admin (
username nvarchar(50)not null  primary key,
password nvarchar(50) not null,
)

create table UserPrevialiges(
prevId int not null Identity(1,1) primary key,
staff_Id int not null,
id int not null
)

alter table UserPrevialiges add foreign key (id) references NewBook(bid) ;
alter table UserPrevialiges add foreign key (staff_Id) references Library_Staff(staff_Id) ;