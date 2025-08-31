use characters;
show tables;
select * from train;
alter table aug_train rename to train;

--- Data Cleaning
#1.Remove Duplicates
#2.Standarize Data
#3.Null Values or Blank values
#4.Remove rows and columns

#copy data from original to new to make changes and compare 
create table train_1 like train;
Select * from train_1;
insert train_1 select * from train;

#remove duplicates
with duplicates_1 as
(
Select * , Row_number() over(
partition by enrollee_id,city,relevent_experience,major_discipline,'enrollee_id' ) 
as row_num from train_1
) select * from duplicates_1 where row_num > 1;

select training_hours , count(*) from train_1 group by training_hours having count(*) >1;
#Standarize Data

select distinct enrolled_university from train_1 order by 1;

select * from train_1 where major_discipline like '%' ; #% is wildcard

select distinct city from train_1 order by 1;

update train_1 set company_size = replace(company_size,'Oct-49','0-40');

select * from train_1 order by 1;

select distinct experience , trim(leading '<' from experience) 
from train_1 order by 1;

update train_1 set experience = trim(leading '<' from experience) ;

#NUll values or blank values

select * from train_1 where education_level is null or education_level = '' ;

select * from train_1 where 
relevent_experience ='No relevent experience' and
education_level is null or education_level = '' and enrolled_university = 'Full time course' ;

select * from train_1 where 
relevent_experience ='No relevent experience' and
education_level = 'graduate' and enrolled_university = 'Full time course' ;

select count(*) from train_1 where 
relevent_experience ='No relevent experience' and
education_level = 'graduate' and enrolled_university = 'Full time course' ;

select count(*) from train_1 where 
relevent_experience ='No relevent experience' and
education_level is null or education_level = '' and enrolled_university = 'Full time course' ;

update train_1 set major_discipline = nullif(major_discipline,'') ;
update train_1 set training_hours = nullif(training_hours,'');

select * from train_1;
 update train_1 set major_discipline = ifnull(major_discipline , 'STEM');
 
 select major_discipline , count(*) as
 value_count from train_1 group by major_discipline order by 
 value_count desc; # value count of particular column
 
 select count(*) from train_1 where education_level is null 
 and experience is null 
 ;

alter table train_1 drop column
city;
select count(*) from train_1 where city_development_index is null; 

select education_level , count(*) as
 value_count from train_1 group by education_level order by 
 value_count;
 
 
 #Exploratory Data analysis
 update train_1 set education_level = ifnull(education_level,'Graduate');
 