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

#Usecase10                                                                      #Add 2 departments for Teresa 
Insert into employee_payroll(name, phone, gender, address, department, basicpay, deductions, taxablePay, incomeTax, netPay, start) values
('Diya', 918288451, 'F', 'Banglore', 'Sales', 400000.00, 100000.00, 300000.00, 100000.00, 200000.00, '2018-01-03' );
update employee_payroll set department = "Marketing" where id = 1;

#Usecase11                                                                      #Implementing er diagram
create table company (
    company_id int unsigned not null primary key,
    company_name varchar(50) not null
);

create table employee (
    employee_id int unsigned not null,
    name varchar(50) not null,
    company_id int unsigned,
    phone_number varchar(50) not null,
    address varchar(250) not null,
    gender char(1),
    start_date date not null,
    foreign key (company_id) references company (company_id)
);

create table department (
    department_id int  not  null primary key,
    department_name varchar(50) not null
);

create table payroll (
    employee_id int unsigned not null,
    basic_pay double not null,
    deductions double not null,
    taxable_pay double not null,
    income_tax double not null,
    net_pay double not null,
    foreign key (employee_id) references employee (employee_id)
);

create table employee_department (
    employee_id int unsigned not null,
    department_id int not null,
    foreign key (employee_id) references employee (employee_id),
    foreign key (department_id) references department (department_id)
);

#inserting
Insert into company values (1, 'CapG');

Insert into employee values (101, 'Bill', 1 , 9876543210, 'Maharashtra', 'M', '2018-01-03');
Insert into employee values (102, 'Terisa', 1 , 8765432109, 'Delhi', 'F', '2018-02-04');
Insert into employee values (103, 'Charlie', 1 , 7654321098, 'Karnataka', 'M', '2018-03-05');
Insert into employee values (104, 'Mark', 1 , 7689543210, 'Telangana', 'M', '2018-02-06');

Insert into department values (50, 'Sales');
Insert into department values (51, 'Marketing');
Insert into department values (52, 'HR');

Insert into payroll values (101,1000000.00, 100000.00, 900000.00, 100000.00, 800000.00);
Insert into payroll values (102,2000000.00, 100000.00, 1900000.00, 100000.00, 1800000.00);
Insert into payroll values (103,3000000.00, 100000.00, 2900000.00, 100000.00, 2800000.00);
Insert into payroll values (104,4000000.00, 100000.00, 3900000.00, 100000.00, 3800000.00);

Insert into employee_department values (101,50);
Insert into employee_department values (101,51);
Insert into employee_department values (102,51);
Insert into employee_department values (103,50);
Insert into employee_department values (102,50);

#Usecase12                                                                            #Retireving data

select * from employee;
select * from payroll;
select * from employee_department;
select * from department;

select employee.name, payroll.net_pay from payroll
join employee on payroll.employee_id = employee.employee_id
where employee.name = 'Bill';

select gender, sum(payroll.basic_pay) from employee
join payroll on payroll.employee_id = employee.employee_id
group by employee.gender;

select gender, min(payroll.basic_pay) from employee
join payroll on payroll.employee_id = employee.employee_id
group by employee.gender;

select gender, max(payroll.basic_pay) from employee
join payroll on payroll.employee_id = employee.employee_id
group by employee.gender;

select gender, count(payroll.basic_pay) from employee
join payroll on payroll.employee_id = employee.employee_id
group by employee.gender;
