-- 1- Create a stored procedure to fetch all employees.
Create Procedure spgetallemp
as
begin		
Select * from Employees;
end

Exec spgetallemp 

