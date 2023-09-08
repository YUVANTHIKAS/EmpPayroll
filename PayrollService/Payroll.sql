

Create database payroll_service;

 

use payroll_service;

 

Create table employee_payroll(

id int primary key identity(1,1),

name varchar(30),

salary varchar(30),

start_date date

);

 

Insert into employee_payroll(name,salary,start_date)values('a','8000','2018-01-01');

Insert into employee_payroll(name,salary,start_date)values('b','2000','2018-01-01');

Insert into employee_payroll(name,salary,start_date)values('c','3000','2018-01-01');

Insert into employee_payroll(name,salary,start_date)values('d','4000','2018-01-01');

 

 --uc4

Select*from employee_payroll;

 
 --uc5
Select*from employee_payroll where name='b';

Select*from employee_payroll where start_date between cast('2018-01-01'as Date) and GetDate();

 
 --uc6
Alter table employee_payroll Add Gender Char(1);

 

Update employee_payroll set gender='F' where id=1;

Update employee_payroll set gender='F' where id=2;

Update employee_payroll set gender='F' where id=3;

Update employee_payroll set gender='F' where id=4;

 --uc7

Select Sum(cast(salary as bigint)) from employee_payroll;

Select AVG(cast(salary as bigint)) from employee_payroll;

Select MIN(cast(salary as bigint)) from employee_payroll;

Select Max(cast(salary as bigint)) from employee_payroll;

 

Select gender,count(*) from employee_payroll group by(gender);

 --uc8

Alter table employee_payroll Add phone VARCHAR(10);

Alter table employee_payroll Add Address VARCHAR(30);

Alter table employee_payroll Add Department VARCHAR(20);

 --uc9

Alter table employee_payroll Add basic_pay bigint,deductions bigint,taxable_pay bigint,income_tax bigint,net_pay bigint;
--uc10
Insert into employee_payroll(name, salary, start_date, gender, phone, address, department, basic_pay, deductions, taxable_pay, income_tax, net_pay) values

('Terissa', '10000', '2018-01-01', 'F', '1234567899', 'Chennai', 'Sales', '2000', '500', '250', '100', '1000'); 


Insert into employee_payroll(name, salary, start_date, gender, phone, address, department, basic_pay, deductions, taxable_pay, income_tax, net_pay) values

('Terissa', '10000', '2018-01-01', 'F', '1234567899', 'Chennai', 'Marketing', '2000', '500', '250', '100', '1000');

 --uc11

Create table salary(salId int primary key identity(1,1), salary bigint, basic_pay bigint, deductions bigint,taxable_pay bigint, income_tax bigint,net_pay bigint);

 

Create table department(depId int primary key identity(1,1),Dept_nam varchar(20));

 

Create table employee(id int primary key identity(1,1), name varchar(20), start_date date, phone varchar(10), address varchar(30),salId int Foreign Key References salary(salId));

Create  table emp_department_mapping(
id int primary key identity(1,1),
empId int Foreign Key References employee(id),
depId int Foreign key references Department(depId)
);
Insert into salary(salary,basic_pay,deductions,taxable_pay,income_tax,net_pay)values('10000','9800','490','50','78','3000');
Insert into salary(salary,basic_pay,deductions,taxable_pay,income_tax,net_pay)values('30000','8000','400','50','78','3000');
Insert into salary(salary,basic_pay,deductions,taxable_pay,income_tax,net_pay)values('40000','6000','400','50','78','3000');

 
Select * from salary;
Insert into department(Dept_nam)values('Sales');
Select * from department;
Insert into employee(name,start_date,phone,address,salId)values('yuvan','2023-09-07','111288888','TamilNadu',1);
Select * from employee;
Insert into emp_department_mapping(empId,depId)values('1','1');
Select * from emp_department_mapping;

 --storedprocedure

Alter procedure AddEmployee_payroll
(
@name varchar(20),
@salary varchar(20),
@start_date date,
@gender Char(1),
@phone varchar(10), 
@address varchar(30), 
@department varchar(20),
@basic_pay bigint,
@deductions bigint,
@taxable_pay bigint,
@income_tax bigint,
@net_pay bigint
)
As
Begin
Insert into employee_payroll(name,salary,start_date,gender,phone,address,department,basic_pay,deductions,taxable_pay,income_tax,net_pay) 
values(@name,@salary,@start_date,@gender,@phone,@address,@department,@basic_pay,@deductions,@taxable_pay,@income_tax,@net_pay)
End

Create procedure GetAllEmployee_payroll
As
Begin
Select * from employee_payroll
End

Create procedure DeleteEmployee_payroll
(
	@Id int
)
As
Begin
Delete from employee_payroll where Id=@Id;
End

Alter procedure UpdateEmployee_payroll
(
	@Id int,
	@name varchar(20),
    @salary varchar(20),
    @start_date date,
	@gender Char(1),
	@phone varchar(10), 
	@address varchar(30), 
	@department varchar(20),
	@basic_pay bigint,
	@deductions bigint,
	@taxable_pay bigint,
	@income_tax bigint,
	@net_pay bigint
)
As 
Begin
Update employee_payroll set name=@name, salary=@salary, start_date=@start_date, gender = @gender, phone = @phone, address = @address,
department = @department, basic_pay = @basic_pay, deductions = @deductions, taxable_pay = @taxable_pay, income_tax = @income_tax, net_pay = @net_pay
where Id=@Id
End

Create Procedure Range(
@start_date date
)
As
Begin
Select * from employee_payroll where start_date between CAST(@start_date as Date) and GETDATE();
End

Create Procedure Calculations
As
Begin
Select 
Sum(cast(salary as bigint))as Sum , 
Avg(cast(salary as bigint))as Avg,
Min(cast(salary as bigint))as Min,
Max(cast(salary as bigint))as Max from employee_payroll; 
End

EXEC GetAllEmployee_payroll;

Select e.*,d.* from employee e,department d where e.Id = d.deptId and e.Id = 1;

UPDATE employee_payroll
<<<<<<< HEAD
SET gender = 'F', phone = 109288865, address = 'TamilNadu', department ='IT', basic_pay = 8000, 
deductions = 2000, taxable_pay = 500, income_tax = 200, net_pay = 3000
WHERE name = 'yuvan';
=======
SET gender = 'F', phone = 109283749995, address = 'KN Road', department ='IT', basic_pay = 8000, 
deductions = 2000, taxable_pay = 500, income_tax = 200, net_pay = 3000
WHERE name = 'yuvanthika';
>>>>>>> 50036d8fefadf692cd5878b9d4a3de9cfa4cc614
