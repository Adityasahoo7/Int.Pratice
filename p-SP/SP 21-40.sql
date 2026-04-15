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

exec spincrementsalarybydept
@percent =10,
@deptid =3

--22-Get second highest salary

create procedure spget2ndhighestsalary
@rrk int
as
begin
Select * from(
Select * ,DENSE_RANK() over
(order by Salary desc) as rrk
from Employees
) as trmptable
Where rrk =@rrk
end

exec spget2ndhighestsalary
@rrk=2

--23 -Get nth highest salary
create procedure spgetnthhighest