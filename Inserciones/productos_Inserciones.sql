--Productos con todos los campos
insert into productos(codigo, nombre, descripcion, precio, stock)
values(001,'Te frutos Rojos','caja de frutos rojos',1.44,60);
insert into productos(codigo, nombre, descripcion, precio, stock)
values(002,'Arandanos','Funda de arandanos',4.66,60);
insert into productos(codigo, nombre, descripcion, precio, stock)
values(003,'Salsa Pizza','Tarro de salsa para pizza',2.63,60);
insert into productos(codigo, nombre, descripcion, precio, stock)
values(004,'Insignia Reserva','Bebida alcoholica',11.55,60);
insert into productos(codigo, nombre, descripcion, precio, stock)
values(005,'Mix Fiesta 200 G','caja de frutos secos',6.44,60);

--Productos sin descripcion
insert into productos(codigo, nombre, precio, stock)
values(006,'Vino Lomas del Vaquero',12.75,60);
insert into productos(codigo, nombre, precio, stock)
values(007,'Joia Labial líquido',2.95,60);
insert into productos(codigo, nombre, precio, stock)
values(008,'Joia rubor Coral',2.70,60);

select * from productos