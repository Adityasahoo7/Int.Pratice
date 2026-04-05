-- 1- Create a stored procedure to fetch all employees.
Create Procedure spgetallemp
@Name VARCHAR(50)
as
begin
SET NOCOUNT ON -- It use to hide like this type of messages (5 rows affected) 
Declare @SQL NVARCHAR(Max)
set @SQL = 'Select * from '+ QUOTENAME(@Name);
Exec sp_executesql @SQL;
end

Exec spgetallemp 'Employees';

-- 2- Get employee details by EmpId

Create Procedure spgetempbyid
@empid int
as
begin
Select * from Employees
Where EmpId = @empid
end;

exec spgetempbyid
@empid =3;


--3 - Insert a new employee record
Create Procedure spinsertemp
@empid int,
@name varchar(50),
@salary decimal,
@deptid int,
@joindate date
as
begin
set nocount on
insert into Employees values(@empid,@name,@salary,@deptid,@joindate);
end

exec spinsertemp
@empid=56,
@name = 'Aditya',
@salary = 98569,
@deptid =1,
@joindate= '2016-09-09';

-- 4 - Update employee salary by EmpId

create procedure spupdatesalarybyid
@salary decimal,
@empid int
as
begin
set nocount on
update Employees
Set Salary = @salary
Where EmpId = @empid
end;

exec spupdatesalarybyid
@empid=1,
@salary = 55000;

--5 - Delete an employee by EmpId.
create procedure spdeleteemp
@empid int
as
begin
set nocount on
delete from Employees
where EmpId = @empid;
end

exec spdeleteemp
@empid =56;