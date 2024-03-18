-------------------------Consultas 1------------------------------
select * from usuario;
select * from cuentas;
/* 
Obtener el saldo promedio de todas las cuentas de un usuario específico
*/;
select AVG(cast(cu.saldo as numeric))
from cuentas cu, usuario us
Where us.cedula = cu.cedula_propietario AND us.cedula = '11052';

/*
Obtener el número total de cuentas de cada tipo de cuenta.
*/
select tipo_cuenta, Count(tipo_cuenta) from usuario us GROUP BY tipo_cuenta;

-------------------------Consultas 2------------------------------
select * from compras;
select * from clientes;
/*
Obtener el monto total de compras realizadas por cada
cliente.
*/
select sum(monto) as monto_total_compra, cedula
from  compras
group by (cedula);

/*
Obtener la cantidad total de compras realizadas en una
fecha específica.
*/
select count(fecha_compra) as total_compras, fecha_compra
from compras
where fecha_compra='2022-10-21'
group by (fecha_compra);

---------------------------------Consultas 3---------------------------------
select * from estudiantes;
select * from profesores;
/*
Obtener la cantidad total de estudiantes asignados a cada
profesor.
*/
SELECT codigo_profesor, COUNT(*)
FROM estudiantes
GROUP BY (codigo_profesor);

/*
Obtener la edad promedio de los estudiantes.
*/
select round (AVG(extract(year from current_date) - extract(year from fecha_nacimiento))) as edad_promedio
from estudiantes;

-----------------------------Consultas 4------------------------------
select * from prestamo;
select * from persona;
/*
Obtener la suma total de los montos de préstamos para
cada persona.
*/
select  cedula, sum(monto) 
from  prestamo group by (cedula);
/*
Obtener la cantidad total de personas que tienen más de
un hijo
*/
select count(*) as total_personas
from persona where numero_hijos>1;

-------------------------------Consultas 5-------------------------
select * from productos;
select * from ventas;
/*
Obtener el máximo precio de todos los productos.
*/
Select MAX(precio) AS precio_maximo from productos;

/*
Obtener la suma total de la cantidad de productos
vendidos.
*/
select sum(cantidad) as cantidad_total_vendida
from ventas

--------------------------------Consultas 6 -------------------------------------
select * from transacciones;
select * from banco;
/*
Obtener la cantidad total de transacciones de tipo 'C'
(crédito).
*/
select count(tipo) as total_transacciones_credito
from transacciones where tipo ='C';

/*
Obtener el promedio de montos de transacciones para
cada número de cuenta.
*/
select numero_cuenta ,
       ROUND(avg(cast(monto as DECIMAL(10, 2))), 2) as monto_promedio
from transacciones
group by numero_cuenta;

------------------------------Consultas 7----------------------------------
select * from videojuegos;
select * from plataformas;
/*
Obtener la cantidad total de plataformas disponibles para
cada videojuego.
*/
select codigo_videojuego, count (id_plataforma) as total_plataformas
from plataformas group by (codigo_videojuego)

/*
Obtener la valoración promedio de todos los
videojuegos.
*/
select round(avg(valoracion),2)as valoracion_promedio
from videojuegos;

--------------------------------Consultas 8----------------------------------
select * from registros_entradas;
select * from empleado;
/*
Obtener la cantidad total de registros de entrada
realizados por cada empleado.
*/
select cedula_empleado,count(cedula_empleado) as total_registro_entrada
from registros_entradas
group by(cedula_empleado);

/*
Obtener la fecha mínima y máxima de los registros de
entrada.
*/
select min(fecha) as fecha_minima, max(fecha) as fecha_maxima
from registros_entradas

