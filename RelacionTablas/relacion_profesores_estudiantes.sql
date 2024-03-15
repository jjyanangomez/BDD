---Profesores y estudiantes
select * from estudiantes;
---Creacion de la tabla profesores
create table profesores(
	codigo int not null,
	nombre varchar(50) not null,
	constraint profesores_pk primary key(codigo)
);

---Insercion de profesores
insert into profesores(codigo,nombre)
values(556,'Juan Fernando'),
(557,'Maria Belen'),
(558,'Humberto Emanuel'),
(559,'Francisco');

---Borrar datos
delete from estudiantes;
---Crear la columna codigo_profesor
alter table estudiantes add column codigo_profesor int not null;

---Crear la relacion 
alter table estudiantes 
add constraint estudiantes_codigo_profesor_fk 
foreign key (codigo_profesor)
references profesores(codigo);
--lista de profesores
select * from profesores;
---Incersion de estudiantes
insert into estudiantes(cedula, nombre, apellido, email,fecha_nacimiento,codigo_profesor)
values('1134567890', 'Juan', 'Yanangomez', 'juan@krakedev.com', '1995/05/10',559),
  ('1145678901', 'María', 'González', 'maria@krakedev.com', '1996/07/15',556),
  ('1156789012', 'Carlos', 'Rodríguez', 'carlos@krakedev.com', '1997/09/20',559),
  ('1167890123', 'Laura', 'López', 'laura@krakedev.com', '1998/11/25',556),
  ('1178901234', 'Victor', 'Martínez', 'pedro@krakedev.com', '1999/01/30',557),
  ('1189012345', 'Ana', 'Sánchez', 'ana@krakedev.com', '2000/03/05',559),
  ('1190123456', 'Luis', 'Hernández', 'luis@krakedev.com', '2001/05/10',558),
  ('1101234567', 'Elena', 'Díaz', 'elena@krakedev.com', '2002/07/15',558),
  ('1101956462', 'Elena', 'Nuñez', 'elena2@krakedev.com', '2002/02/02',558),
  ('1108642763', 'Miguel', 'Rodriguez', 'miguel@krakedev.com', '1998/01/01',557);
