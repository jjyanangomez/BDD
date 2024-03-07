--Productos
----Productos con stock igual a 10 y precio menor a 10
select * from productos where stock =10 AND precio <money(10);
----Seleccionar nombre y stock de los productos q tengan una m
select nombre,stock from productos where nombre like '%m%' OR descripcion like ' %';
-----Seleccionar nombre de los productos con descripcion nula o stock 0
select nombre from productos where descripcion is null OR stock = 0;

--Cuentas
----Seleccionar numero de cuenta y saldo mayor a 100 y menor a 1000
select numero_cuenta, saldo from cuentas where saldo BETWEEN money(100) AND money(1000);
----Seleccionar cuentas desde hoy hacia un año
select *from cuentas where fecha_creacion BETWEEN '06/03/2023' AND '06/03/2024';
----seleccionar cuentas con saldo 0 o su cedula termine en 2
select *from cuentas where saldo = money(0) OR cedula_propietario like '%2';

--Estudiantes
----Nombre y apellido de los estudiantes que su nombre comience con M o su apellido termine en Z
select nombre,apellido from estudiantes where nombre like 'M%' OR apellido like '%Z';
----Seleccionar los nombre de los estudiantes que tenga un numero 32 y empiece con 18 su cedula
select nombre from estudiantes where cedula like '%32%' AND cedula like '18%';
----nombres completos cuando su cedula termine en 06 y comience en 17
select nombre from estudiantes where cedula like '%06' OR cedula like '17%';

--Registros_entradas
----registros del mes de septiembre o que comience con 17
select * from registros_entradas where fecha BETWEEN '01/09/2024' AND '30/09/2024' OR cedula_empleado like '17%';
----registros del mes de agosto, realizados con la cuenta del pichincha y entre las 8:00 a 12:00
select * from registros_entradas where fecha BETWEEN '01/08/2023' AND '31/08/2023' AND cedula_empleado like '17%' AND hora BETWEEN '08:00' AND '12:00';
----
select * from registros_entradas 
where (fecha BETWEEN '01/08/2023' AND '31/08/2023' 
	   AND cedula_empleado like '17%' AND hora BETWEEN '08:00' AND '12:00')
OR(fecha BETWEEN '01/09/2024' AND '30/09/2024' 
   AND cedula_empleado like '08%'AND hora BETWEEN '09:00' AND '13:00');
   
--Videojuegos
----Lista de juegos con valoracion de 7 o tengan una C
select * from videojuegos where nombre like '%C%' or valoracion =7;
----seleccionar videojuegos entre 3 y 7 o valoracion de 7
select * from videojuegos where codigo BETWEEN 3 AND 7 OR valoracion =7;
----Seleccionar videojuegos de guerra, valoracion mayor a 7 y que su nombre empiece en C
select * from videojuegos 
where (descripcion = 'juego de guerra' AND valoracion >7 AND nombre like 'C%') OR 
nombre like 'C%' OR (valoracion >8 AND nombre like 'D%');

--Transacciones
----transaccciones de tipo C y numero entre 22001 y 22004
select * from transacciones 
where tipo = 'C' AND numero_cuenta BETWEEN '22001' AND '22004';
----transaccciones de tipo C y numero entre 22007 y 22010 en el 25 de mayo
select * from transacciones 
where tipo = 'C' AND fecha ='25/05/2023' AND numero_cuenta BETWEEN '22001' AND '22004';
----Todas las tranasacciones entre 1 y 5, numero entre 22002 o 22004 26 y 29 de mayo
select * from transacciones 
where codigo BETWEEN 1 AND 5 AND numero_cuenta = '22002' OR numero_cuenta = '22004' AND fecha = '25/05/2023' OR fecha ='29/05/2023';
