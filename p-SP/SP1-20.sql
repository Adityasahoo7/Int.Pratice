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

--6 - Get all employees of a specific DeptId
create procedure spgetallempbydeptid
@deptid int
as 
begin
set nocount on
select * from Employees
where DeptId = @deptid;
end

exec spgetallempbydeptid
@deptid = 1


--7- Get employees who joined after a given date

create procedure spgetempbydate
@joindate Date
as
begin
Select * from Employees
where JoinDate >@joindate;
end

exec spgetempbydate
@joindate ='2020-10-10'

--8 - Get employees with salary greater than a given value.

create Procedure spgetempgreaterthansalary
@salary int
as
begin
select * from Employees
where Salary >@salary 
end

exec spgetempgreaterthansalary
@salary = 75000

--9 - Count total number of employees.
create procedure spcountemp
as
begin
Select count(EmpId) as TotalEmp
from Employees
end

exec spcountemp

--10 - Get maximum salary in the table also nth.
create Procedure spgethigstsalary
@rank int
as
begin
select * from(
Select * , DENSE_RANK() over
(order by Salary desc) as rrk
from Employees
)as temptable
where rrk = @rank
end

exec spgethigstsalary
@rank =2
--11-Get minimum salary in the table.
create procedure spgetminsalary
as
begin
select * from Employees
Where Salary = (Select MIN(Salary) from Employees)
end

exec spgetminsalary

--12 - Get average salary of employees.
create procedure spgetavgsalary
as
begin
Select avg(Salary) from Employees
end

exec spgetavgsalary

--13 -Get employees sorted by salary descending
create procedure spsortsalarydesc
as
begin
Select * from Employees
order by Salary desc
end

exec spsortsalarydesc
--14 - Get top 5 highest paid employees
create procedure spgettop5empbysalarydesc
as
begin
select top 5 * from Employees
order by Salary desc
end

exec spgettop5empbysalarydesc







