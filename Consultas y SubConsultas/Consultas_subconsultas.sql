------------------------Consulta Usuarios y Cuentas
select * from usuario;
--Obtener los números de cuenta y nombres de usuarios cuyos saldos están entre $100 y $1000.
select cu.numero_cuenta, u.nombre 
from usuario u, cuentas cu 
where cu.cedula_propietario = u.cedula 
AND saldo>money(100) AND saldo<money(1000);
--Subconsulta
-- Obtener todos los datos de cuentas y usuarios donde la fecha de creación de la
-- cuenta esté entre '2022-09-21' y '2023-09-21'.
SELECT c.numero_cuenta, c.fecha_creacion, c.saldo, c.cedula_propietario
FROM cuentas c
WHERE c.cedula_propietario IN (
    SELECT u.cedula
    FROM usuario u
    WHERE c.fecha_creacion BETWEEN '2022-09-21' AND '2023-09-21'
);

----------------------------Consulta Clientes y Compras
select *from compras;
select *from clientes;
Insert into compras(id_compra,cedula,fecha_compra,monto)
values(111,'1150834079','2022-09-21',5.6),
(112,'3456789012','2022-10-21',1.6),
(113,'1170834079','2022-11-16',9.6),
(114,'1567890131','2022-12-25',28.6),
(115,'1198673247','2023-01-01',8.6);
--Obtener el nombre y apellido de los clientes cédula contenga el número 7 en su número de cédula.
Select cl.nombre, cl.apellido from clientes cl, compras cp 
Where cp.cedula = cl.cedula AND cl.cedula like '%7%';
--SubConsulta
--Obtener todos los clientes cuya cédula sea igual a la cédula de nombre "Mónica".
SELECT *
FROM clientes
WHERE cedula IN (
    SELECT cedula
    FROM clientes
    WHERE nombre = 'Monica'
) 
AND cedula LIKE '%7%';

----------------------------Consultas profesor estudiantes
Select *from profesores;
Select *from estudiantes;
-- Obtener el código de profesor con todos los nombres y apellidos de los estudiantes
--cuyo apellido contiene la letra 'n'.
Select es.codigo_profesor, es.nombre, es.apellido 
from profesores p, estudiantes es 
where p.codigo = es.codigo_profesor AND
es.apellido LIKE '%n%';  

--SubConsulta
--Obtener todos los estudiantes cuyo código de profesor corresponde al nombre de "Francisco".
SELECT es.* FROM estudiantes es  
WHERE es.codigo_profesor =
( SELECT codigo FROM profesores WHERE nombre = 'Francisco' );

---Consulta Personas y Prestamo
select * from persona;
select * from prestamo;
--Obtener la cantidad ahorrada, el monto del préstamo y el garante de las
--personas cuyo préstamo está entre $100 y $1000.
select pe.cantidad_ahorrada, p.monto, p.garante 
from prestamo p, persona pe 
Where pe.cedula = p.cedula AND monto BETWEEN Money(100) AND money(1000);

--Subconsulta
--Obtener todos los datos de la persona cuya cédula sea igual a la cédula de nombre “Sean”
select pe.*
from persona pe 
Where pe.cedula =(SELECT cedula FROM persona WHERE nombre = 'Sean' );

------------------------Consultas de productos y ventas
select * from productos;
select * from ventas;
--Obtener el nombre, stock y cantidad de productos y ventas cuyo nombre
--contiene la letra 'm' o la descripción sea igual a 0.
select p.nombre, p.stock, v.cantidad 
from productos p, ventas v 
where p.codigo = v.codigo_producto AND p.nombre LIKE '%m%' OR p.descripcion is null;

--SubConsulta
--Obtener el nombre y stock de los productos donde el código de producto de las
--ventas corresponde a una cantidad de 5
select p.nombre, p.stock
from productos p  
Where p.codigo in(
	SELECT codigo_producto FROM ventas WHERE cantidad = 5 
);


-----------------------------Consultas transacciones y Banco
select * from transacciones;
select * from Banco;
--Obtener todas las transacciones de tipo 'C' cuyo número de cuenta esté entre
--'22001' y '22004'
SELECT * FROM transacciones t, banco b
WHERE b.codigo_transaccion = t.codigo AND t.tipo = 'C'
AND t.numero_cuenta BETWEEN '22000' AND '22004';

--SubConsulta
--Obtener todos los datos de transacciones cuyo código corresponde al código de
--transacción del banco con código 1.
select * FROM transacciones  
Where codigo in(
	SELECT codigo_transaccion FROM banco WHERE codigo_banco = 1 
);

----------------------------Consulta videojuegos y plataformas
select * from videojuegos;
select * from plataformas;
--Obtener el nombre,descripción,valoración y nombre de plataforma de videojuegos
--y plataformas cuya descripción contiene 'Guerra' y tienen una valoración mayor a 7 o cuyo
--nombre comienza con'C' y tienen una valoración mayor a 8 y comienza con 'D'.
Insert into plataformas(id_plataforma,nombre_plataforma,codigo_videojuego)
values(111,'PC',119),
(112,'X-BOX',117),
(113,'PlayStation',118),
(114,'PC',120),
(115,'PC',121),
(116,'PlayStation',7563),
(117,'PC',54682),
(118,'X-BOX',70215);
---
select vj.nombre, vj.descripcion, vj.valoracion, pl.nombre_plataforma from videojuegos vj, plataformas pl 
WHere  vj.descripcion ='Guerra' AND vj.valoracion > 7
	OR vj.nombre LIKE 'C%'AND vj.valoracion > 8 AND vj.nombre LIKE 'D%';


--SubConsulta
--Obtener todos los datos de plataformas donde el código del videojuego
--corresponde al código de "God of war"
select * FROM plataformas  
Where codigo_videojuego =(
	SELECT codigo FROM videojuegos WHERE nombre = 'God of Ward' 
);

------------------------Consultas Registros de Entrada y Empleado
select * from registros_entradas;
select * from empleado;
--Obtener la cédula del empleado, fecha y el nombre de los empleados cuyos
--registrosde entrada tienen fecha entre '2023-08-01' y '2023-08-31' o cuya cédula del
--empleado contiene '17%' y la hora de entrada está entre '08:00' y '12:00' o cuya fecha está
--entre '2023-10-06' y '2023-10-20', la cédula del empleado contiene '08%' y la hora de entrada
--está entre '09:00' y '13:00'.
SELECT re.cedula_empleado, re.fecha, em.nombre
FROM empleado em, registros_entradas re
WHERE (re.fecha BETWEEN '2023-08-01' AND '2023-08-31' AND re.hora BETWEEN '08:00' AND '12:00' AND re.cedula_empleado LIKE '17%')
   OR (re.fecha BETWEEN '2023-10-06' AND '2023-10-20' AND re.hora BETWEEN '09:00' AND '13:00' AND re.cedula_empleado LIKE '08%');

--Subconsulta
--Obtener todos los datos de empleado donde el código de registro del empleado
--corresponde al código de registro de entrada de cédula '2201'.
select re.codigo_registro, em.nombre  FROM registros_entradas re, empleado em
Where re.codigo_empleado = em.codigo_empleado AND
re.codigo_empleado in(
	SELECT codigo_empleado FROM empleado WHERE codigo_empleado = '2201' 
);
