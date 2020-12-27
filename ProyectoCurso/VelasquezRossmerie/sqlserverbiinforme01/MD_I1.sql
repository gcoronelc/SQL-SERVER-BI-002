use Pasaporte

create database PASAS01

---Crear dimension clientes
create table dimcliente(idcliente int identity primary key,RUC char(11),
NombreCompañia nvarchar(40) not null, Distrito nvarchar(15) not null,
Provincia nvarchar(15) not null, Departamento nvarchar(15) not null, País nvarchar(15)not null)
go
---Crear dimServicio
create table dimServicio (idservicio int identity primary key,
NombreServicio nvarchar(60) not null, Precio int not null)
go
---Crear dimEmpleado
create table dimempleado (idempleado int identity primary key,
Apellidos nvarchar(20) not null, Nombre nvarchar(10) not null, idareaempleado int not null,
Distrito nvarchar(15) not null,Provincia nvarchar(15) not null, Departamento nvarchar(15) not null, 
País nvarchar(15)not null)
go

---Crear dimTiempo
create table dimtiempo (idtiempo int primary key,
fecha date not null, año smallint not null, nmes varchar(10) not null,
dsemana varchar(10) not null, ndia tinyint not null, bimestre varchar(20) not null,
trimestre varchar(20) not null, semestre varchar(20) not null)
go
--Crear la tabla de hechos (Fact Table)
create table hventa (idcliente int not null, idservicio int not null,
idempleado int not null, idtiempo int not null, mventa decimal(18,2) not null, cantidad decimal(11,2) not null,
descuento decimal(18,2))
go
--Establecer la clave primaria a hventa
alter table hventa add constraint pkventa
primary key (idcliente, idservicio, idempleado, idtiempo)
-- Establecer las claves foraneas (FK)
alter table hventa add constraint fkclientes
foreign key (idcliente) references dimcliente (idcliente)
alter table hventa add constraint fkservicio
foreign key (idservicio) references dimservicio (idservicio)
alter table hventa add constraint fkempleado
foreign key (idempleado) references dimempleado (idempleado)
alter table hventa add constraint fktiempo
foreign key (idtiempo) references dimtiempo (idtiempo)

