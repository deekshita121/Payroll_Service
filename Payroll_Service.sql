#Usecase 1
create database payroll_service;                #Creates database
use payroll_service;                            #To use payroll_service databse
select database();                              #To use current databse

#Usecase 2
create table employee_payroll                   #Create a table 
(
id INT unsigned Not Null Auto_Increment,        #Unique Id
name VARCHAR(150) Not Null,                     #Name
salary Double Not Null,                         #Salary
start Date Not Null,                            #Start date
Primary Key (id)                                #Setting Id As Primary Key
);
Drop Table employee_payroll;                    #Drop the table
Describe employee_payroll;                      #Descripe the table

#Usecase 3
Insert into employee_payroll(name, salary, start) values      #Inserting Records
('Diya', 100000.00, '2018-01-03'),
('Ayesha', 150000.00, '2019-11-03'),
('Dev', 200000.00, '2020-04-06');

#Usecase 4
Select * from employee_payroll;                                  #Retrieving records

#Usecase 5
Select salary from employee_payroll where name = 'Diya';         #Retrieving salary of Diya
Select * from employee_payroll                                   #Retrieving records within the dates
where start between cast('2018-01-01' as date) and date(now());
