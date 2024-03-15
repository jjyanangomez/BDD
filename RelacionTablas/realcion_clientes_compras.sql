---Clientes con compras
Select *from clientes;

--Crear Clientes
insert into clientes(cedula, nombre, apellido)
values('1150834079','Juan','Yanangomez'),
('1234567890','Monica','Pérez'),
('3456789012','José','Martínez'),
('4567890123','Ana','García'),
('5678901234','Monica','Rodríguez'),
('1170834079','Jefferson','Nuñez'),
('1186732486','Jonathan','Herrera'),
('7777777777','José','Pullaguari'),
('1102664370','Nancy','Salinas'),
('1567890131','Johan','Pintado');

---Crear la Tabla compras
create table compras(
	id_compra int not null,
	cedula char(10) not null,
	fecha_compra date not null,
	monto decimal(10,2),
	constraint compras_pk primary key(id_compra)
)

---Crear relacion de un cliente tiene varias compras
alter table compras 
add constraint compras_cedula_fk 
foreign key (cedula)
references clientes(cedula);

