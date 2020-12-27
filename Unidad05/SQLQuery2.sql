
select * from [Order Details];
go


select sum(quantity) total
from [Order Details];
go


select sum(quantity * UnitPrice*(1-discount)) total
from [Order Details];
go


select * from Orders;
go


select * from [Order Details];
go


select * from edutec..CursoProgramado
where activo=0;
go



select sum(monto) from Northwind_DM..VENTAS_FACT;





