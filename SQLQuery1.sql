use employeedb
select * from Employee_tbl
--1
delete Customer_tbl 
where custid in  
(
select custid from Orders_tbl o
where orddate < (GETDATE())  
)
--2
delete from Employee_tbl
where empid in 
(
select EmpID from EmployeeSalary_tbl
where Salary is null 
)
and city in
(
select city from Employee_tbl
group by City
having count(city) = 1
)
--9
insert Employee_tbl values(1,'choen', 'haim', null, null, null, null, null, null)
--10
insert Employee_tbl (EmpID) values(2)
insert Employee_tbl (firstname) values('danny')
insert Employee_tbl (LastName) values('levy')
--11
insert Employee_tbl values(3,'lev', 'barouch', 30, null, null, null, null, null)
--12
insert Employee_tbl (EmpID) values(4)
insert Employee_tbl (firstname) values('avraham')
insert Employee_tbl (LastName) values('null')
--13
insert Employee_tbl values(5,'silver', 'daiv', 20, 8600, null, null, null, null)