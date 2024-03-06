--registros_entradas
create table registros_entradas(
	codigo_registro int not null,
	cedula_empleado char(10) not null,
	fecha date not null,
	hora time not null,
	CONSTRAINT registros_E_pk Primary key(codigo_registro)
)