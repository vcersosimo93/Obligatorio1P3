create database ObligatorioP3

use ObligatorioP3

--Eliminar tablas--
if OBJECT_ID('usuario') is not null
drop table usuario;
if OBJECT_ID('vacuna') is not null
drop table vacuna;
if OBJECT_ID('laboratorio') is not null
drop table laboratorio;
if OBJECT_ID('pais') is not null
drop table pais;
if OBJECT_ID('tipoVacuna') is not null
drop table tipoVacuna;
if OBJECT_ID('laboratorio_vacuna') is not null
drop table laboratorio_vacuna;
if OBJECT_ID('paises_vacuna') is not null
drop table paises_vacuna;






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
	tipoVacuna varchar(50) not null constraint tipoVacuna_lab_fk foreign key (tipoVacuna) references tipoVacuna(nombre),
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



insert into pais
values	('Afganistán'),
('Akrotiri'),
('Albania'),
('Alemania'),
('Andorra'),
('Angola'),
('Anguila'),
('Antártida'),
('Antigua y Barbuda'),
('Arabia Saudí'),
('Arctic Ocean'),
('Argelia'),
('Argentina'),
('Armenia'),
('Aruba'),
('Ashmore and Cartier Islands'),
('Atlantic Ocean'),
('Australia'),
('Austria'),
('Azerbaiyán'),
('Bahamas'),
('Bahráin'),
('Bangladesh'),
('Barbados'),
('Bélgica'),
('Belice'),
('Benín'),
('Bermudas'),
('Bielorrusia'),
('Birmania, Myanmar'),
('Bolivia'),
('Bosnia y Hercegovina'),
('Botsuana'),
('Brasil'),
('Brunéi'),
('Bulgaria'),
('Burkina Faso'),
('Burundi'),
('Bután'),
('Cabo Verde'),
('Camboya'),
('Camerún'),
('Canadá'),
('Chad'),
('Chile'),
('China'),
('Chipre'),
('Clipperton Island'),
('Colombia'),
('Comoras'),
('Congo'),
('Coral Sea Islands'),
('Corea del Norte'),
('Corea del Sur'),
('Costa de Marfil'),
('Costa Rica'),
('Croacia'),
('Cuba'),
('Curacao'),
('Dhekelia'),
('Dinamarca'),
('Dominica'),
('Ecuador'),
('Egipto'),
('El Salvador'),
('El Vaticano'),
('Emiratos Árabes Unidos'),
('Eritrea'),
('Eslovaquia'),
('Eslovenia'),
('España'),
('Estonia'),
('Etiopía'),
('Filipinas'),
('Finlandia'),
('Fiyi'),
('Francia'),
('Gabón'),
('Gambia'),
('Gaza Strip'),
('Georgia'),
('Ghana'),
('Gibraltar'),
('Granada'),
('Grecia'),
('Groenlandia'),
('Guam'),
('Guatemala'),
('Guernsey'),
('Guinea'),
('Guinea Ecuatorial'),
('Guinea-Bissau'),
('Guyana'),
('Haití'),
('Honduras'),
('Hong Kong'),
('Hungría'),
('India'),
('Indian Ocean'),
('Indonesia'),
('Irán'),
('Iraq'),
('Irlanda'),
('Isla Bouvet'),
('Isla Christmas'),
('Isla Norfolk'),
('Islandia'),
('Islas Caimán'),
('Islas Cocos'),
('Islas Cook'),
('Islas Feroe'),
('Islas Georgia del Sur y Sandwich del Sur'),
('Islas Heard y McDonald'),
('Islas Malvinas'),
('Islas Marianas del Norte'),
('Islas Marshall'),
('Islas Pitcairn'),
('Islas Salomón'),
('Islas Turcas y Caicos'),
('Islas Vírgenes Americanas'),
('Islas Vírgenes Británicas'),
('Israel'),
('Italia'),
('Jamaica'),
('Jan Mayen'),
('Japón'),
('Jersey'),
('Jordania'),
('Kazajistán'),
('Kenia'),
('Kirguizistán'),
('Kiribati'),
('Kosovo'),
('Kuwait'),
('Laos'),
('Lesoto'),
('Letonia'),
('Líbano'),
('Liberia'),
('Libia'),
('Liechtenstein'),
('Lituania'),
('Luxemburgo'),
('Macao'),
('Macedonia'),
('Madagascar'),
('Malasia'),
('Malaui'),
('Maldivas'),
('Malí'),
('Malta'),
('Man, Isle of'),
('Marruecos'),
('Mauricio'),
('Mauritania'),
('México'),
('Micronesia'),
('Moldavia'),
('Mónaco'),
('Mongolia'),
('Montenegro'),
('Montserrat'),
('Mozambique'),
('Mundo'),
('Namibia'),
('Nauru'),
('Navassa Island'),
('Nepal'),
('Nicaragua'),
('Níger'),
('Nigeria'),
('Niue'),
('Noruega'),
('Nueva Caledonia'),
('Nueva Zelanda'),
('Omán'),
('Pacific Ocean'),
('Países Bajos'),
('Pakistán'),
('Palaos'),
('Panamá'),
('Papúa-Nueva Guinea'),
('Paracel Islands'),
('Paraguay'),
('Perú'),
('Polinesia Francesa'),
('Polonia'),
('Portugal'),
('Puerto Rico'),
('Qatar'),
('Reino Unido'),
('República Centroafricana'),
('República Democrática del Congo'),
('República Dominicana'),
('Ruanda'),
('Rumania'),
('Rusia'),
('Sáhara Occidental'),
('Samoa'),
('Samoa Americana'),
('San Bartolomé'),
('San Cristóbal y Nieves'),
('San Marino'),
('San Martín'),
('San Pedro y Miquelón'),
('San Vicente y las Granadinas'),
('Santa Helena'),
('Santa Lucía'),
('Santo Tomé y Príncipe'),
('Senegal'),
('Serbia'),
('Seychelles'),
('Sierra Leona'),
('Singapur'),
('Sint Maarten'),
('Siria'),
('Somalia'), 
('Southern Ocean'),
('Spratly Islands'),
('Sri Lanka'),
('Suazilandia'),
('Sudáfrica'),
('Sudán'),
('Sudán del Sur'),
('Suecia'),
('Suiza'),
('Surinam'),
('Svalbard y Jan Mayen'),
('Tailandia'),
('Taiwán'),
('Tanzania'),
('Tayikistán'),
('Territorio Británico del Océano Indico'),
('Territorios Australes Franceses'),
('Timor Oriental'),
('Togo'),
('Tokelau'),
('Tonga'),
('Trinidad y Tobago'),
('Túnez'),
('Turkmenistán'),
('Turquía'),
('Tuvalu');
