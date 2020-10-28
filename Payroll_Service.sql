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
