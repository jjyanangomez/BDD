--Insercion de estudiantes
insert into estudiantes(cedula, nombre, apellido, email,fecha_nacimiento)
values('1134567890', 'Juan', 'Yanangomez', 'juan@krakedev.com', '1995/05/10'),
  ('1145678901', 'María', 'González', 'maria@krakedev.com', '1996/07/15'),
  ('1156789012', 'Carlos', 'Rodríguez', 'carlos@krakedev.com', '1997/09/20'),
  ('1167890123', 'Laura', 'López', 'laura@krakedev.com', '1998/11/25'),
  ('1178901234', 'Victor', 'Martínez', 'pedro@krakedev.com', '1999/01/30'),
  ('1189012345', 'Ana', 'Sánchez', 'ana@krakedev.com', '2000/03/05'),
  ('1190123456', 'Luis', 'Hernández', 'luis@krakedev.com', '2001/05/10'),
  ('1101234567', 'Elena', 'Díaz', 'elena@krakedev.com', '2002/07/15');
  
 select * from estudiantes;