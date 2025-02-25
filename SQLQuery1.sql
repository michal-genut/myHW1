use EmployeeDB
select *from Customer_tbl
select *from Orders_tbl
--view
--1
create view v_1
as
select c.CustID,c.CustName,c.CustAddress,c.CustCity,c.CustPhone,c.CustFax,c.EmpID,c.ManagerID,
o.Ordnum,o.ProdID,o.Qty,o.OrdDate
from Customer_tbl c full join Orders_tbl o
on c.CustID=o.CustID
select *from v_1
--4
select *from Employee_tbl
select *from Customer_tbl
select *from Orders_tbl
create view v_2
as
select *from Employee_tbl e
where EmpId not in
(select e.EmpID from Customer_tbl c join Employee_tbl e
on c.EmpID=e.EmpID)
and e.City not in
(select c.CustCity from Customer_tbl c join Orders_tbl o
on c.CustID=o.CustID)
select *from v_2
--group by
--7
select count(*)from Orders_tbl
group by CustID

--12
select *from EmployeeSalary_tbl
select sum(Salary+Bonus)/count(*),EmpID from EmployeeSalary_tbl 
group by  empid


--trigger

create trigger t_1
on Customer_tbl
for insert
as
begin
print 'חיה נאגר'
end
insert into Customer_tbl values('chaya','evenshafroot','beny brak','0548551225','0775008764',null,null)

--
--
create trigger t_2
on customer_tbl
for insert
as
begin
if exists(select *from inserted where CustName is null) 
print 'hello chaya'
else 
rollback
end 
insert into Customer_tbl values('sara','eshel avraam','beny brak','0533182414',null,null,null)
 --
 create trigger cheksalary
 on EmployeeSalary_tbl
 for update
 as
 begin
 if exists (select 8from inserted where Salary>10000)
 begin
 print 'error'
 rollback
 end
 if exists(select *from inserted where salary<0)
 begin
 print 'number negative'
 rollback
 end
 end
 select *from Employee_tbl
 --cursor 
declare employee_cursor cursor for 
select FirstName from Employee_tbl
begin
declare @name varchar(50)=''
open employee_cursor
fetch next from employee_cursor into @name
while @@FETCH_STATUS=0
begin
print @name
fetch next from employee_cursor into @name
end
close employee_cursor
deallocate employee_cursor
end

--
declare cursor_gpt cursor for
select CustName from Customer_tbl 
begin
declare @name1 varchar(100)
declare @max_id int=(select top 1 custid from Orders_tbl 
group by CustID
order by count(*))
open cursor_gpt
fetch next from cursor_gpt into @name1
while @@FETCH_STATUS=0
	begin
		set @name1=(select CustName from Customer_tbl where CustID= @max_id)
			print @name1 
		fetch next from cursor_gpt into @name1
	end
close cursor_gpt
deallocate cursor_gpt
end
select empid from Employee_tbl
group by empid

