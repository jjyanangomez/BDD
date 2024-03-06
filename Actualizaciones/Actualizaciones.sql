--Productos
----Actualizar cuando sea null el stock
update productos set stock = 0 where stock is null;

Select * from productos;

--Cuentas
----Actualizar saldo a 10 cuando la cedula empiece en 17
update cuentas set saldo = money(10) where cedula_propietario like '17%';

Select * from cuentas;

--Estudiantes
----Apellido a hernandecs cuando la cedula empiece en 17
update estudiantes set apellido = 'Hernández' where cedula like '17%';

Select * from estudiantes;

--REgistros entradas
----Actualizar ls cedulas para el mes de agosto
update registros_entradas set cedula_empleado = '082345679' where fecha = '01/08/2023';

Select * from registros_entradas;

--videojuegos
----Actualizar las descripciones con valoracion mayor a 9
update videojuegos set descripcion = 'Mejor Puntuación' where valoracion >9;

Select * from videojuegos;

--Transacciones
----Actulizar el tipo de los registros cuando las transacciones sean entre 100  a 500
update transacciones set tipo = 'T' where monto BETWEEN money(100) AND money(500) 
AND fecha BETWEEN '2024-09-01' AND '2024-09-30' 
AND hora BETWEEN ('14:00') AND ('20:00');

Select * from transacciones;