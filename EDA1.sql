show databases;
#single line comment
/* multiple line 
comment */

create database characters;
show databases;
use characters;

create table character_info(id integer auto_increment,first_name varchar(10),
last_name varchar(10),primary key(id));
create table power_info(power_name varchar(10) , power_intensity integer , 
use_case varchar(10),primary key(id));

show tables;

select * from character_info;

Insert into character_info(id,first_name,last_name) 
values (001,'lonely','meet'),(002,'crazy','cook'),
(003,'mad','women'),(004,'bad','bitch');
#drop database n table can also be used

truncate table character_info;

show tables;
select * from character_info;
Insert into character_info(id,first_name,last_name) 
values (001,'lonely','meet'),(002,'crazy','cook'),
(003,'mad','women'),(004,'bad','bitch');

#update statement

update character_info set first_name='crazy' where id=003;

#delete from charactter_info where id=

alter table character_info add money integer;

alter table character_info add bitch varchar(10);

alter table character_info modify bitch char(2);

use characters;
desc character_info;
/* drop column
alter table character_info drop column colummname 
*/
use characters;
create table student( id int not null, first_name varchar(25) not null, 
last_name varchar(25) not null , age int);
desc student;

use characters;
create table person(
id int not null,first_name varchar(25) not null, 
last_name varchar(25) not null , age int not null,
unique(id)
);

select * from person;
insert into person values(1,'jitika','gupta',26);

select * from person;
update person set first_name='jitisha',age=20 where id=1;
alter table person add unique(first_name);

alter table person add constraint uc_person unique(age, first_name);

alter table person drop index uc_person;

create table person1(id int not null,first_name varchar(25) not null, 
last_name varchar(25) not null , age int,
constraint pk_person1 primary key(id,last_name)
);

#alter table person1 drop primary key;/add primry key(id)
desc person1;

select * from laptop_data;

alter table laptop_dat rename to laptop_data;

#DESCRIPTIVE ANALYSIS 

SELECT Company, AVG(Price) AS avg_price
FROM laptop_data
GROUP BY Company; #What is the average price of laptops by brand?

SELECT Os, COUNT(*) AS total
FROM laptop_data
GROUP BY Os; #What is the count of laptops for each operating system?

SELECT Company, MAX(Ram) AS max_ram
FROM laptop_data
GROUP BY Company order by max_ram desc; #What is the maximum RAM offered by each brand in desencding order?

#FILTER AND CONDITIONS
SELECT Company AS average_ones
FROM laptop_data
WHERE SSD  >= 128 AND Ram >= 16  group by Company ;

#duplicate data
#based on column name
select TypeName , count(*) from laptop_data group by TypeName having count(*) >1;

#all columns
select * from laptop_data as rows_ where Ips in 
(select Ips from laptop_data
group by Ips having count(*) >1);



