Select * from Employees

--21 -Increase salary by percentage for a specific department
create procedure spincrementsalarybydept
@percent int ,
@deptid int
as
begin
set nocount on
Update Employees
set Salary= Salary + (Salary * @percent/100)
Where DeptId =@deptid
end

