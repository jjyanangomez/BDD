-------Creacion de tablas ----------------------
---Usuarios y Grupo
create table usuarios(
	id_Usuario int not null,
	nombre varchar(25) not null,
	apellido varchar(25) not null,
	fecha_nacimiento Date,
	constraint usuarios_pk primary key(id_Usuario)
);

create table grupo(
	id_grupo int not null,
	nombre varchar(25) not null,
	descripcion varchar(75),
	fecha_creacion Date,
	constraint grupo_pk primary key(id_grupo)
);
create table usuario_grupo(
	ug_id_usuario int not null,
	ug_id_grupo int not null,
	constraint producto_fk foreign key(ug_id_usuario) references usuarios(id_Usuario),
	constraint proveedor_fk foreign key(ug_id_grupo)references grupo(id_grupo),
	constraint usuario_grupo_pk primary key(ug_id_usuario,ug_id_grupo)
);
---Habitaciones y huespedes
create table habitaciones(
	habitacion_numero int not null,
	precio_por_noche decimal not null, 
	piso int not null,
	max_personas int ,
	constraint habitacion_pk primary key(habitacion_numero)
);
create table huespedes(
	id_huesped int not null,
	nombre varchar(45) not null,
	apellido varchar(45) not null,
	telefono char(10),
	correo varchar(45),
	direccion varchar(45),
	ciudad varchar(45),
	pais varchar(45),
	constraint huesped_pk primary key(id_huesped)
);
create table reservas(
	inicio_fecha date,
	fin_fecha date,
	re_habitacion int not null,
	re_huesped int not null,
	constraint habitacion_fk foreign key(re_habitacion) references habitaciones(habitacion_numero),
	constraint huesped_fk foreign key(re_huesped)references huespedes(id_huesped),
	constraint reservas_pk primary key(re_habitacion,re_huesped)
);

---MUNICIPIO Y PROYECTOS
create table ciudad(
	id_ciudad int not null,
	nombre varchar(45) not null,
	constraint ciudad_pk primary key(id_ciudad)
);
create table municipio(
	id_municipio int not null,
	nombre varchar(45) not null,
	id_ciudad int not null,
	constraint municipio_pk primary key(id_municipio),
	constraint ciudad_fk foreign key(id_ciudad)references ciudad(id_ciudad)
);

create table proyecto(
	id_proyecto int not null,
	proyecto varchar(50) not null,
	monto money not null,
	fecha_inicio date,
	fecha_entrega date,
	constraint proyecto_pk primary key(id_proyecto)
);
create table proyecto_municipio(
	proyecto_id int not null,
	municipio_id int not null,
	constraint municipios_fk foreign key(municipio_id) references municipio(id_municipio),
	constraint proyectos_fk foreign key(proyecto_id)references proyecto(id_proyecto),
	constraint proyecto_municipio_pk primary key(municipio_id,proyecto_id)
);


-----------------------------------------Consultas------------------------------
/*
Usuarios , grupos y usuarios_grupo
*/
--Consulta
select u.nombre, gr.nombre As nombre_grupo
from usuarios u, grupo gr, usuario_grupo ug
where u.id_usuario= ug.ug_id_usuario 
and gr.id_grupo= ug.ug_id_grupo;
--SubConsulta
select nombre 
from usuarios
where id_usuario in
	(select ug_id_usuario
	from usuario_grupo
	where ug_id_grupo=1
);
--Agregacion
select count(ug.ug_id_usuario), gr.nombre
from grupo gr, usuario_grupo ug
where gr.id_grupo= ug.ug_id_grupo 
group by(gr.nombre);


--Consulta 2
Select us.nombre, gr.nombre
from usuarios us,grupo gr,usuario_grupo ug
where (us.id_usuario= ug.ug_id_usuario
and gr.id_grupo= ug.ug_id_grupo)
and gr.nombre like '%intensivo%';
--Subconsulta 2
select *
from usuarios us
where us.id_usuario in
(select ug.ug_id_usuario
from usuario_grupo ug
 where ug.ug_id_grupo=2
);
--Agregacion 2
select max(ug.ug_id_grupo),gr.nombre
from grupo gr, usuario_grupo ug
where gr.id_grupo = ug.ug_id_grupo
GROUP BY(gr.nombre);


--Consultas 3
select us.nombre, gr.fecha_creacion
from usuarios us,grupo gr,usuario_grupo ug
where (us.id_usuario= ug.ug_id_usuario
and gr.id_grupo= ug.ug_id_grupo)
and gr.fecha_creacion 
between '2020-03-08' and '2022-03-08';

--Subconsulta 3
select nombre
from usuarios us
where us.id_usuario in
(select ug.ug_id_usuario
from usuario_grupo ug
 where ug.ug_id_grupo=3);
--agregacion 3
select MAX(ug.ug_id_usuario),gr.descripcion
from grupo gr, usuario_grupo ug
where gr.id_grupo = ug.ug_id_grupo
and gr.descripcion like '%matutino%'
GROUP BY (gr.descripcion);


/*
Habitaciones, huespedes y habitaciones_huespedes
*/
--Consulta
select ha.habitacion_numero,hu.nombre ,hu.apellido 
from habitaciones ha, huespedes hu, reservas re
where ha.habitacion_numero= re.re_habitacion
and hu.id_huesped = re.re_huesped;

--SubConsulta
select nombre, apellido
from huespedes hu, reservas re
where hu.id_huesped in (
select re_huesped 
from reservas
where  re_habitacion=2	
)
--Agregacion
select count (re.re_habitacion) AS Numero_Habitaciones
from reservas re , habitaciones ha
where ha.habitacion_numero = re.re_habitacion
GROUP BY(ha.habitacion_numero);


--Consulta 2
select ha.habitacion_numero,ha.piso,hu.nombre, hu.apellido
from habitaciones ha, huespedes hu, reservas re
where ha.piso=4
and (hu.id_huesped = re.re_huesped
	and ha.habitacion_numero= re.re_habitacion);
--Subconsulta 2
select nombre, apellido
from huespedes hu
where hu.id_huesped in (
select re_huesped 
from reservas
where  re_habitacion=3);
--Agregacion 2
select AVG (re.re_habitacion)AS promedio
from reservas re , habitaciones ha
where ha.habitacion_numero = re.re_habitacion
group by (ha.habitacion_numero);


--Consulta 3
select ha.habitacion_numero,hu.nombre, hu.apellido
from habitaciones ha, huespedes hu, reservas re
where hu.id_huesped = re.re_huesped 
	and ha.habitacion_numero= re.re_habitacion;
--Subconsulta 3
select nombre, apellido
from huespedes hu, reservas re
where hu.id_huesped in (
select re_huesped from reservas
where  re_habitacion = 4);
--agregacion 3
select SUM (ha.precio_por_noche) AS Precio
from reservas re , habitaciones ha
where ha.habitacion_numero = re.re_habitacion
group by (ha.habitacion_numero);


/*
Municipio, Proyectos y Proyectos_Municipio
*/
--Consulta
select mu.nombre,pr.proyecto
from municipio mu, proyecto pr, proyecto_municipio pm
where mu.id_municipio = pm.municipio_id 
and pr.id_proyecto = pm.proyecto_id;
--Subconsulta
select pr.proyecto
from proyecto pr
where pr.id_proyecto 
in( select pm.proyecto_id
   from proyecto_municipio pm
   where pm.municipio_id=1);
--Agregacion
select count(pm.proyecto_id), mu.nombre
from municipio mu, proyecto_municipio pm
where mu.id_municipio = pm.municipio_id
group by (mu.nombre)

--Consulta 2
select mu.nombre,pr.proyecto
from municipio mu, proyecto pr, proyecto_municipio pm
where (mu.id_municipio = pm.municipio_id 
and pr.id_proyecto = pm.proyecto_id) 
and mu.nombre like('%GAD%');
--no hay SubConsulta
--Agregacion 2
select min(pm.proyecto_id), mu.nombre
from municipio mu, proyecto_municipio pm
where mu.id_municipio = pm.municipio_id
group by (mu.nombre);

--Consulta 3 
select mu.nombre, ci.nombre
from municipio mu, ciudad ci
where ci.id_ciudad= mu.id_ciudad;
--Subconsulta 3
select pr.proyecto
from proyecto pr
where pr.id_proyecto 
in( select pm.proyecto_id
   from proyecto_municipio pm
   where pm.municipio_id=3);
--Agregacion 3
select max(pm.proyecto_id), mu.nombre
from municipio mu, proyecto_municipio pm
where mu.id_municipio = pm.municipio_id
group by (mu.nombre);