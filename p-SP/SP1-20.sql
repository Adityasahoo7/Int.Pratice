-- 1- Create a stored procedure to fetch all employees.
Create Procedure spgetallemp
as
begin
SET NOCOUNT ON -- It use to hide like this type of messages (5 rows affected) 
Select * from Employees;
end

Exec spgetallemp 

