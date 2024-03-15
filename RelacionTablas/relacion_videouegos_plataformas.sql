---Videojuegos Plataformas
select * from videojuegos;

--Crear la tabla plataformas
create table plataformas(
	id_plataforma int not null,
	nombre_plataforma varchar(50) not null,
	codigo_videojuego int not null,
	constraint plataformas_pk primary key(id_plataforma),
	constraint plataformas_codigo_videojuego_fk 
		foreign key (codigo_videojuego)
		references videojuegos(codigo)
)

---Insertar videojuegos
insert into videojuegos(codigo, nombre, descripcion, valoracion)
values(117,'HALO','Guerra',10),
(118,'THE LAST OF US PARTE II','supervivencia',7),
(119,'GTA V','Mundo abierto',7),
(120,'CYBERPUNK 2077','Disparos',10),
(121,'RESIDENT EVIL 2','Juego de disparos y terror',10),
(122,'DETROY','Guerra',8),
(123,'GOD OF WAR','Pelea',10),
(124,'DAYS GONE','Carreras',6),
(125,'HORIZON','Supervicencia',8),
(126,'CALL OF DUTY','Guerra',10);