--Productos
----Productos que empiecen con Q
select * from productos where nombre like 'Q%';
----Productos con descripcion de null
select * from productos where descripcion is null;
----Productos con el precio de 2 y 3
select * from productos where precio BETWEEN money(2) AND money(3);

--Cuentas
----Traer todas las cuentas mostrar las tablas numero_cuenta y saldo
select numero_cuenta,saldo from cuentas;
----Traer los registros de hoy hacia 2 meses atras
select * from cuentas where fecha_creacion BETWEEN date('06/01/2024') AND date('06/03/2024');
----Traer todas las cuentas mostrar las tablas numero_cuenta y saldo de los registros de hoy hacia 2 meses atras
select numero_cuenta,saldo from cuentas where fecha_creacion BETWEEN date('06/01/2024') AND date('06/03/2024');

--Estudiantes
----Traer el nombre y cedula de los estudiantes
select nombre,cedula from estudiantes;
----Traer el nombre y cedula de los estudiantes cuando su cedula comience con 17
select nombre,apellido from estudiantes where cedula like '17%';

--Registros_entradas
----Todas las cedulas, fechas y hora de la tabla
select cedula_empleado,fecha, hora from registros_entradas;
----Registros entre 7:00 a 14:00
select * from registros_entradas where hora BETWEEN ('07:00') AND ('14:00');
----Registros superiores a 8:00
select * from registros_entradas where hora > '8:00';

--Videojuegos
----Videojuegos que comiencen con "C"
select * from videojuegos where nombre like 'C%';
----Videojuegos con valoracion entre 9 y 10
select * from videojuegos where valoracion BETWEEN ('0') AND ('4');
----videojuegos con descripcion de null
select * from videojuegos where descripcion is null;

--Transacciones
----Todas las transacciones de tipo D
select * from transacciones where tipo ='D';
----Todas las transacciones con monto de 200 a 2000
select * from transacciones where monto BETWEEN money(200) AND money(2000);
----Algunas tablas cuando la fecha sea diferente de null
select codigo,monto,tipo, fecha from transacciones where fecha is not null;