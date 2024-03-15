---Cuentas
select * from cuentas;

--Crear al Usuario
create table usuario(
	cedula char(5) not null,
	nombre varchar(25) not null,
	apellido varchar(25) not null,
	tipo_cuenta varchar(20),
	limite_credito decimal(10,5),
	constraint usuario_pk primary key(cedula)
)
select * from usuario;
---Borrar datos de la tabla cuentas
delete from cuentas;

---Crear Relacion
alter table cuentas 
add constraint cuentas_cedula_propietario_fk 
foreign key (cedula_propietario)
references usuario(cedula);

---Insertar los usuarios para las cuentas
insert into usuario (cedula,nombre,apellido,tipo_cuenta,limite_credito)
values('11051','Juan','Yanangomez','Credito',1000),
('11052','Nancy','Salinas','Normal',1000),
('11053','Jonathan','Herrera','Credito',1000),
('11054','Jefferson','Nuñez','Corriente',1000),
('11055','Johan','Pintado','Credito',1000);

---Insertar las cuentas
--Usuario 11051
insert into cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo)
values('22632','11051','2022-08-25',500),
('22633','11051','2022-09-01',100);

--Usuario 11052
insert into cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo)
values('22634','11052','2022-08-31',700),
('22635','11052','2022-09-10',500);

--Usuario 11053
insert into cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo)
values('22636','11053','2022-09-30',250),
('22637','11053','2022-09-11',900);

--Usuario 11054
insert into cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo)
values('22638','11054','2023-01-10',900),
('22639','11054','2023-03-16',500);

--Usuario 11055
insert into cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo)
values('22640','11055','2023-07-13',150),
('22641','11055','2023-09-15',800);