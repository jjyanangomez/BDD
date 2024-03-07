--Productos
----Eliminar cuando la descripcion sea null
DELETE from productos where descripcion is null;

select * from productos;

--Cuentas
----Eliminar cuando la cedula comience con 10
DELETE from cuentas where cedula_propietario like '10%';

select * from cuentas;

--Estudiantes
----Eliminar cuando la cedula comience con 10
DELETE from estudiantes where cedula like '%05';

select * from estudiantes;

--Registros Entrada
----Eliminar todo los registros del mes de julio
DELETE from registros_entradas where fecha BETWEEN '2024-06-01' AND '2024-06-30';

select * from registros_entradas;

--Videojuegos
----Eliminar todo los registros con menos de 7 de valoracion
DELETE from videojuegos where valoracion <7;

select * from videojuegos;

--Transacciones
----Eliminar todo los registros del mes de julio
DELETE from transacciones where hora BETWEEN ('14:00') AND ('18:00') AND fecha BETWEEN '2024-08-01' AND '2024-08-30';

select * from transacciones;