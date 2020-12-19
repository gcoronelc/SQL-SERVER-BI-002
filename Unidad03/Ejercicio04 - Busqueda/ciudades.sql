use northwind
go

create table dbo.ciudades(
idCiudad varchar(5),
descripcion varchar(50)
)
go

insert into ciudades(idciudad,descripcion)
values('AN','ANCASH')
insert into ciudades(idciudad,descripcion)
values('AQ','AREQUIPA')
insert into ciudades(idciudad,descripcion)
values('CJ','CAJAMARCA')
insert into ciudades(idciudad,descripcion)
values('CZ','CUZCO')
insert into ciudades(idciudad,descripcion)
values('HU','HUANUCO')
insert into ciudades(idciudad,descripcion)
values('LI','LIMA')
