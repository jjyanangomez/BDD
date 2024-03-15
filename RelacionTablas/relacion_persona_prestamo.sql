---Personas prestamos

---Crear la tabla persona
create table persona(
	cedula char(10) not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	estatura decimal,
	fecha_nacimiento date,
	hora_nacimiento time,
	cantidad_ahorrada money,
	numero_hijos int,
	constraint persona_pk PRIMARY key(cedula)
)

---Crear la tabla prestamo
create table prestamo(
	cedula char(10) not null,
	monto money,
	fecha_prestamo date,
	hora_nacimiento time,
	garante varchar(40),
	constraint prestamo_pk PRIMARY key(cedula)
)
---Crear la relacion 
alter table prestamo 
add constraint prestamo_cedula_fk 
foreign key (cedula)
references persona(cedula);

--Ingresar personas
INSERT INTO persona (cedula, nombre, apellido, estatura, fecha_nacimiento, hora_nacimiento, cantidad_ahorrada, numero_hijos)
VALUES
  ('1234567890', 'Juan', 'Pérez', 1.75, '1990-05-15', '08:30:00', 500.00, 2),
  ('2345678901', 'María', 'López', 1.65, '1985-10-20', '10:15:00', 1000.00, 1),
  ('3456789012', 'Jean', 'Martínez', 1.80, '1995-02-28', '12:00:00', 800.50, 0),
  ('4567890123', 'Ana', 'García', 1.70, '1988-08-10', '09:45:00', 1200.75, 3),
  ('5678901234', 'Sean', 'Rodríguez', 1.78, '1992-04-03', '11:20:00', 1500.00, 2),
  ('1165347893', 'Miguel', 'Rodríguez', 1.78, '1992-04-03', '11:20:00', 1500.00, 2),
  ('1153246879', 'Fernanda', 'Rodríguez', 1.78, '1992-04-03', '11:20:00', 1500.00, 2),
  ('5668342327', 'Paola', 'Sarango', 1.65, '1994-04-03', '11:20:00', 1500.00, 2),
  ('1635976248', 'Marlon', 'Carrion', 1.78, '1986-04-03', '12:20:00', 1500.00, 2),
  ('1105834678', 'Jennifer', 'Samaniego', 1.60, '1966-04-03', '13:20:00', 1500.00, 2);
  
--Ingresar prestamos
INSERT INTO prestamo (cedula, monto, fecha_prestamo, hora_nacimiento, garante)
VALUES
  ('1234567890', 1000.00, '2023-01-05', '09:00:00', 'Garante A'),
  ('2345678901', 500.00, '2023-02-10', '10:30:00', 'Garante B'),
  ('3456789012', 1000.00, '2023-03-15', '11:45:00', 'Garante C'),
  ('4567890123', 700.00, '2023-04-20', '13:00:00', 'Garante D'),
  ('5678901234', 600.00, '2023-05-25', '14:15:00', 'Garante E'),
  ('1165347893', 800.00, '2023-06-30', '15:30:00', 'Garante F'),
  ('1153246879', 400.00, '2023-07-05', '16:45:00', 'Garante G'),
  ('5668342327', 900.00, '2023-08-10', '17:00:00', 'Garante H'),
  ('1635976248', 950.00, '2023-09-15', '18:15:00', 'Garante I'),
  ('1105834678', 500.00, '2023-10-20', '19:30:00', 'Garante J');