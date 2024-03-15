---transacciones banco
select * from transacciones;

---Crear la tabla banco
create table banco(
	codigo_banco int not null,
	codigo_transaccion int not null,
	detalle varchar(50) not null,
	constraint banco_pk primary key(codigo_banco)
);

---Crear relacion 
alter table banco 
add constraint banco_codigo_transaccion_fk 
foreign key (codigo_transaccion)
references transacciones(codigo);

---Crear los 10 transacciones
insert into transacciones(codigo, numero_cuenta, monto, tipo,fecha,hora)
values(1,'22631',50,'D','05/02/2024','08:00:00'),
(102,'22001',50,'C','05/02/2024','08:30:00'),
(103,'22633',100,'D','05/02/2024','09:00:00'),
(104,'22002',20,'C','05/02/2024','09:30:00'),
(105,'22001',280,'C','05/02/2024','10:00:00'),
(106,'22636',60,'D','05/02/2024','10:30:00'),
(107,'22004',50,'C','05/02/2024','11:00:00'),
(108,'22003',25,'D','05/02/2024','11:30:00'),
(109,'22639',600,'D','05/02/2024','12:00:00'),
(110,'22004',90,'C','05/02/2024','12:30:00');

---insercion de Banco
insert into banco(codigo_banco,codigo_transaccion,detalle)
values(1, 1, 'Transferencia'),
    (2, 102, 'Depósito'),
    (3, 103, 'Retiro'),
    (4, 104, 'Pago de servicios'),
    (5, 105, 'Cheque'),
    (6, 106, 'Cambio de moneda'),
    (7, 107, 'Préstamo'),
    (8, 108, 'Inversión'),
    (9, 109, 'Tarjeta de crédito'),
    (10, 110, 'Seguro');