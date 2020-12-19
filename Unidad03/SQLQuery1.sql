
select * from dbo.DespachosPlanta;

select * from dbo.TablaCiudades;

select * from dbo.Ventas01;
select * from dbo.Ventas02;
select * from dbo.Ventas03;
go


select 
	o.OrderID, o.CustomerID, 
	s.SupplierID, s.CompanyName SupplierName,
	c.CategoryID, c.CategoryName,
	p.ProductID, p.ProductName, 
	o.ShipCountry, o.ShipCity, 
	od.Quantity, od.UnitPrice * (1-od.Discount) UnitPrice,
	od.Quantity * od.UnitPrice * (1-od.Discount) Subtotal
from Northwind.dbo.Orders o
join Northwind.dbo.[Order Details] od on o.OrderID = od.OrderID 
join Northwind.dbo.Products p on od.ProductID = p.ProductID 
join Northwind.dbo.Categories c on p.CategoryID = c.CategoryID
join Northwind.dbo.Suppliers s on p.SupplierID = s.SupplierID;

