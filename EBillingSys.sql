create table BillDetails(Id int primary key identity,
CustomerName varchar(255) , MobileNumber varchar(255),
Address varchar(255),TotalAmount int);


create table BillItems(Id int primary key identity,
ProductName varchar(255),Price int,Quantity int,
BillId int foreign key references BillDetails(Id));

select *from BillDetails go
select *from BillItems

--saving all bill details
create proc spt_saveEBillDetails
@CustomerName varchar(255) , 
@MobileNumber varchar(255),
@Address varchar(255),
@TotalAmount int,
@Id int output 
as 
begin 
insert into BillDetails(CustomerName,MobileNumber,Address,TotalAmount)
values (@CustomerName,@MobileNumber,@Address,@TotalAmount);
select @Id = SCOPE_IDENTITY();
end


--for getting all records
create proc spt_getAllEBillDetails
as 
begin 
select*from BillDetails;
end

--for getting one record
create proc spt_getEBillDetails
@Id int 
as 
begin 
select 
d.Id as 'BillId', d.CustomerName, d.MobileNumber, d.Address, d.TotalAmount,
i.Id as 'ItemId',i.ProductName,i.Price,i.Quantity
from BillDetails d inner join BillItems i 
on d.Id = i.BillId
where d.Id =@Id;
end
