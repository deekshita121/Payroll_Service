#Usecase 1
create database payroll_service;                                              #Creates database
use payroll_service;                                                          #To use payroll_service databse
select database();                                                            #To use current databse

#Usecase 2
create table employee_payroll                                                  #Create a table 
(
id INT unsigned Not Null Auto_Increment,                                       #Unique Id
name VARCHAR(150) Not Null,                                                    #Name
salary Double Not Null,                                                        #Salary
start Date Not Null,                                                           #Start date
Primary Key (id)                                                               #Setting Id As Primary Key
);
Drop Table employee_payroll;                                                   #Drop the table
Describe employee_payroll;                                                     #Descripe the table

#Usecase 3
Insert into employee_payroll(name, salary, start) values                        #Inserting Records
('Diya', 100000.00, '2018-01-03'),
('Ayesha', 150000.00, '2019-11-03'),
('Dev', 200000.00, '2020-04-06');

#Usecase 4
Select * from employee_payroll;                                                 #Retrieving records

#Usecase 5
Select salary from employee_payroll where name = 'Diya';                        #Retrieving salary of Diya
Select * from employee_payroll                                                  #Retrieving records within the dates
where start between cast('2018-01-01' as date) and date(now());

#Usecase 6
Alter table employee_payroll Add gender Char(1) After name;                    #Adding gender field
update employee_payroll set gender = 'M' WHERE  name = 'Dev';                  #updating gender with name
Update employee_payroll set gender = 'F' where  name = 'Ayesha' or name ='Diya';

#Usecase7
Select avg(salary) from employee_payroll where gender = 'M' group by gender;    #Avg sal by gender
Select avg(salary) from employee_payroll where gender = 'F' group by gender;
Select gender, sum(salary) from employee_payroll group by gender;               #Sum of salary by gender
Select gender, min(salary) from employee_payroll group by gender;               #Min of salary by gender
Select gender, max(salary) from employee_payroll group by gender;               #Max of salary by gender
Select gender, count(salary) from employee_payroll group by gender;             #Count of salary by gender

#Usecase8                                                                       #Add phone, address, department fields
Alter table employee_payroll Add phone int unsigned after name;
Alter table employee_payroll Add address varchar(150) after gender;
Alter table employee_payroll Add department varchar(150) after address;
Alter table employee_payroll Alter address set default "TBD";

#Usecase9                                                                       #Add basic pay, deductions, taxable pay, income tax, net pay
Alter table employee_payroll rename column salary to basicPay;
Alter table employee_payroll Add deductions double not null after basicPay;
Alter table employee_payroll Add taxablePay double not null after deductions;
Alter table employee_payroll Add incomeTax double not null after taxablePay;
Alter table employee_payroll add netPay double not null after incomeTax;
