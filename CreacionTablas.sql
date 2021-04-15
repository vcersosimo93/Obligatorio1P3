create database Obligatorio1

use obligatorio1

--Eliminar tablas--
if OBJECT_ID('usuario') is not null
drop table usuario;
if OBJECT_ID('tipoVacuna') is not null
drop table tipoVacuna;
if OBJECT_ID('pais') is not null
drop table pais;
if OBJECT_ID('laboratorio') is not null
drop table laboratorio;
if OBJECT_ID('vacuna') is not null
drop table vacuna;
if OBJECT_ID('laboratorio_vacuna') is not null
drop table vacuna;
if OBJECT_ID('paises_vacuna') is not null
drop table vacuna;



create table usuario(
	documento int not null, 
	contrasena varchar(50) not null, 
	rol varchar (50) not null constraint rol_aut check (rol in ('AUTENTICADO', 'AUTORIZADO')),
	constraint usuario_pk primary key (documento)
)

alter table usuario add constraint usuario_ck Check(len(contrasena) >5)

INSERT INTO usuario
values	(45387259, 'vcersosimo93','AUTENTICADO'),
		(45387258, 'vcersosimo92','AUTORIZADO');





create table tipoVacuna( 
	nombre varchar(50) not null, 
	descripcion varchar (700) not null,
	constraint tipoVacuna_pk primary key (nombre)
)

		
insert into tipoVacuna
values	('VV', 'es un virus modificado que hace de vehículo para introducir material genético exógeno en el núcleo de una célula'),
		('mRNA', 'es el ácido ribonucleico que transfiere el código genético procedente del ADN del núcleo celular a un ribosoma en el citoplasma'),
		('IV', 'Las vacunas de este tipo se producen inactivando un patógeno, que destruyen la capacidad del patógeno para replicarse'),
		('PB','actúan como una infección natural, por lo que son especialmente buenas en enseñarle al sistema inmunitario cómo combatir los gérmenes');







create table pais( 
	id int IDENTITY not null, 
	nombre varchar (50) not null,
	constraint pais_pk primary key (id)
)


insert into pais
values	('uruguay');


insert into pais
values	('usa');

create table laboratorio(
	id int IDENTITY not null, 
	nombre varchar(50) not null,
	paisOrigen int not null,
	experiencia varchar(2) not null constraint experiencia_ck check (experiencia in ('si', 'no')),
	constraint laboratorio_pk primary key (id),
	constraint paisOrigen_pais_fk foreign key (paisOrigen) references pais(id)	
)

insert into laboratorio
values	('pfizer', 2, 'si');



create table vacuna(
	nombre varchar(50) not null,
	laboratorios int not null constraint laboratorios_fk foreign key (laboratorios) references laboratorio(id),
	tipoVacuna varchar(50) not null constraint tipoVacuna_fk foreign key (tipoVacuna) references tipoVacuna(nombre),
	cantDosis int not null, 
	lapsoDias int not null, 
	rangoEdad int not null, 
	efiCovid int not null, 
	efiHosp int not null,
	efiCTI int not null, 
	temperatura int not null,
	faseAprobacion int not null, 
	estatus int not null constraint estatus_fk foreign key (estatus) references pais(id),
	aprobEme varchar(2) not null constraint aprobEme_ck check (aprobEme in ('si', 'no')),
	efectosAdversos varchar (50),
	precio int not null,
	produccion int not null,
	covax varchar(2) not null constraint covax_ck check (covax in ('si', 'no')),
	fechaEdicion date not null,
	ciEdicion int not null,

	constraint vacuna_pk primary key (tipoVacuna),
)


create table laboratorio_vacuna(
	tipoVacuna varchar(50) not null constraint tipoVacuna_fk foreign key (tipoVacuna) references tipoVacuna(nombre),
	id int not null constraint id_fk foreign key (id) references laboratorio(id),
	constraint laboratorio_vacuna_pk primary key (tipoVacuna,id),
)


INSERT INTO laboratorio_vacuna
values	('VV',1);



create table paises_vacuna(
	tipoVacuna_Vacuna varchar(50) not null constraint tipoVacuna_Vacuna_fk foreign key (tipoVacuna_Vacuna) references tipoVacuna(nombre),
	id_pais int not null constraint id_pais_fk foreign key (id_pais) references pais(id),
	constraint paises_vacuna_pk primary key (tipoVacuna_Vacuna,id_pais),
)



