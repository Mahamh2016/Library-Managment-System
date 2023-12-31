create table loginTable(
id int not null identity(1,1)primary key,
username varchar(50) not null,
password varchar(50) not null)
insert into loginTable (username,password)values('amal','amal');
select *from loginTable