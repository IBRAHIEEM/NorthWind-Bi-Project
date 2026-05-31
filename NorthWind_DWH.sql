


--- Create Data Base AS Data Warehouse 

Create DataBase NorthWind_DWH;
Go

Use NorthWind_DWH;
 

--- Creat Customer_Dimension 

  
Select
CustomerID , CompanyName,ContactName , ContactTitle , Address , City , Region , PostalCode , Country , Phone , Fax
 into DimCustomer
From NORTHWND.dbo.Customers;   



--- Create Product_Dimension 


Select 
p.ProductID ,
p.ProductName,
p.SupplierID,
p.QuantityPerUnit,
p.UnitPrice,
p.UnitsInStock,
p.UnitsOnOrder,
p.ReorderLevel,
p.Discontinued, 

c.CategoryID,
c.CategoryName,
c.Description 

InTO DimProduct

From  NORTHWND.dbo.Products p  join NORTHWND.dbo.Categories c 
on p.CategoryID = c.CategoryID


--- Create Fact Dimension 

Select 
OrderID,
ProductID,
UnitPrice,
Quantity,
Discount

into OrderDatails 
from 
NORTHWND.dbo.[Order Details]


Select
OrderID,
CustomerID,
EmployeeID,
OrderDate,
RequiredDate,
ShippedDate,
ShipVia,
Freight,
ShipName,
ShipAddress,
ShipCity,
ShipRegion,
ShipPostalCode,
ShipCountry

into Orders 

from 
NORTHWND.dbo.Orders




--- create Suppliers Dimension 
select 
SupplierID,
CompanyName,
ContactName,
ContactTitle,
Address,
City,
Region,
PostalCode,
Country,
Phone,
Fax,
HomePage

into DimSuppliers 

from NORTHWND.dbo.Suppliers



--- creat Shippers Dimension 
select 
ShipperID,
CompanyName,
Phone 

into DimShippers  

from NORTHWND.dbo.Shippers





--- Create Employee Dimension 
Select 
EmployeeID,
LastName,
FirstName,
Title,
TitleOfCourtesy,
BirthDate,
HireDate,
Address,
City,
Region,
PostalCode,
Country,
HomePhone,
Extension,
Photo,
Notes,
ReportsTo,
PhotoPath

into DimEmployee 
From NORTHWND.dbo.Employees 

---- الحمد لله رب العالمين ------

