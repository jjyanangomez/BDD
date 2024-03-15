---Productos ventas
select *from productos;

---Crer la tabla ventas  y Crear la relacion entre productos con ventas
create table ventas(
	id_ventas int not null,
	codigo_producto int not null,
	fecha_venta date not null,
	cantidad int,
	constraint ventas_pk primary key(id_ventas),
	constraint ventas_codigo_producto_fk 
		foreign key (codigo_producto)
		references productos(codigo)
)

---Insert para la tabla productos
insert into productos(codigo, nombre, descripcion, precio, stock)
values(001,'Te frutos Rojos','caja de frutos rojos',1.44,60),
(002,'Arandanos','Funda de arandanos',4.66,60),
(003,'Salsa Pizza','Tarro de salsa para pizza',2.63,60),
(004,'Insignia Reserva','Bebida alcoholica',11.55,60),
(005,'Mix Fiesta 200 G','caja de frutos secos',6.44,60);
--productos con descripcion null
insert into productos(codigo, nombre, precio, stock)
values(006,'Vino Lomas del Vaquero',12.75,60),
(007,'Joia Labial líquido',2.95,60),
(008,'Joia rubor Coral',2.70,50),
(009,'Aceite Girasol',16.98,60),
(010,'Mermelada de Mora',3.00,40);

--- insertar Ventas
select * from ventas;
insert into ventas(id_ventas,codigo_producto, fecha_venta,cantidad)
values(1,001,'2023-01-01',5),
(2,001,'2023-01-01',2),
(3,002,'2023-03-15',5),
(4,003,'2023-03-21',10),
(5,004,'2023-08-01',1),
(6,005,'2023-09-20',6),
(7,005,'2023-10-05',6),
(8,006,'2023-10-16',1),
(9,007,'2023-11-30',5),
(10,008,'2023-12-25',15);





