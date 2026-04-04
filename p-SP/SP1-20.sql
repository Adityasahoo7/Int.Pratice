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

