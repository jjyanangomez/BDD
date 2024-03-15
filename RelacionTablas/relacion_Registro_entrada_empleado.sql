--Registros entrada Empleado
select *from registros_entradas;
---Creacion de la tabla empleado
create table empleado(
	codigo_empleado int not null,
	nombre varchar(50) not null,
	fecha date not null,
	hora time not null,
	constraint empleado_pk primary key(codigo_empleado)
);

---Insertar empleados
insert into empleado (codigo_empleado,nombre,fecha,hora)
values(2201,'Francisco','02/08/2023','08:00:00'),
(2202,'Fernando','02/08/2023','08:30:00'),
(2203,'Paulo','13/09/2023','09:00:00'),
(2204,'Fabricio','13/09/2023','09:30:00'),
(2205,'Homero','13/09/2023','10:00:00'),
(2206,'Fabricio','13/09/2023','10:30:00'),
(2207,'Maria','13/09/2023','11:00:00'),
(2208,'Lourdes','13/09/2023','11:30:00'),
(2209,'Jessica','13/09/2023','12:00:00'),
(2210,'Nancy','13/09/2023','12:30:00');

---Borrar datos de Registros_entrada
delete from registros_entradas;

---Crear la columna codigo_empleado en registros_entrada
alter table registros_entradas add column codigo_empleado int not null;

---Crear la relacion 
alter table registros_entradas 
add constraint registros_entradas_codigo_empleado_fk 
foreign key (codigo_empleado)
references empleado(codigo_empleado);
---Lista de empleados
select *from empleado;

---Insertar datos en registros_entradas
insert into registros_entradas(codigo_registro, cedula_empleado, fecha, hora, codigo_empleado)
values(101, '1134567890', '02/08/2023', '08:00',2201),
  (102, '1145678901', '02/08/2023', '08:30',2202),
  (103, '1156789012', '13/09/2023', '09:00',2203),
  (104, '1167890123', '14/10/2023', '09:30',2204),
  (105, '1178901234', '15/11/2023', '10:00',2205),
  (106, '1189012345', '20/11/2023', '10:30',2206),
  (107, '1190123456', '02/12/2023', '11:00',2207),
  (108, '1101234567', '05/12/2023', '11:30',2208),
  (109, '1112345678', '29/12/2022', '12:00',2209),
  (110, '1123456789', '31/12/2023', '12:30',2210);