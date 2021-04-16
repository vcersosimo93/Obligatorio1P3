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
values	('VV', 'es un virus modificado que hace de veh�culo para introducir material gen�tico ex�geno en el n�cleo de una c�lula'),
		('mRNA', 'es el �cido ribonucleico que transfiere el c�digo gen�tico procedente del ADN del n�cleo celular a un ribosoma en el citoplasma'),
		('IV', 'Las vacunas de este tipo se producen inactivando un pat�geno, que destruyen la capacidad del pat�geno para replicarse'),
		('PB','act�an como una infecci�n natural, por lo que son especialmente buenas en ense�arle al sistema inmunitario c�mo combatir los g�rmenes');


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
values	('Afganist�n'),
('Akrotiri'),
('Albania'),
('Alemania'),
('Andorra'),
('Angola'),
('Anguila'),
('Ant�rtida'),
('Antigua y Barbuda'),
('Arabia Saud�'),
('Arctic Ocean'),
('Argelia'),
('Argentina'),
('Armenia'),
('Aruba'),
('Ashmore and Cartier Islands'),
('Atlantic Ocean'),
('Australia'),
('Austria'),
('Azerbaiy�n'),
('Bahamas'),
('Bahr�in'),
('Bangladesh'),
('Barbados'),
('B�lgica'),
('Belice'),
('Ben�n'),
('Bermudas'),
('Bielorrusia'),
('Birmania, Myanmar'),
('Bolivia'),
('Bosnia y Hercegovina'),
('Botsuana'),
('Brasil'),
('Brun�i'),
('Bulgaria'),
('Burkina Faso'),
('Burundi'),
('But�n'),
('Cabo Verde'),
('Camboya'),
('Camer�n'),
('Canad�'),
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
('Emiratos �rabes Unidos'),
('Eritrea'),
('Eslovaquia'),
('Eslovenia'),
('Espa�a'),
('Estonia'),
('Etiop�a'),
('Filipinas'),
('Finlandia'),
('Fiyi'),
('Francia'),
('Gab�n'),
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
('Hait�'),
('Honduras'),
('Hong Kong'),
('Hungr�a'),
('India'),
('Indian Ocean'),
('Indonesia'),
('Ir�n'),
('Iraq'),
('Irlanda'),
('Isla Bouvet'),
('Isla Christmas'),
('Isla Norfolk'),
('Islandia'),
('Islas Caim�n'),
('Islas Cocos'),
('Islas Cook'),
('Islas Feroe'),
('Islas Georgia del Sur y Sandwich del Sur'),
('Islas Heard y McDonald'),
('Islas Malvinas'),
('Islas Marianas del Norte'),
('Islas Marshall'),
('Islas Pitcairn'),
('Islas Salom�n'),
('Islas Turcas y Caicos'),
('Islas V�rgenes Americanas'),
('Islas V�rgenes Brit�nicas'),
('Israel'),
('Italia'),
('Jamaica'),
('Jan Mayen'),
('Jap�n'),
('Jersey'),
('Jordania'),
('Kazajist�n'),
('Kenia'),
('Kirguizist�n'),
('Kiribati'),
('Kosovo'),
('Kuwait'),
('Laos'),
('Lesoto'),
('Letonia'),
('L�bano'),
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
('Mal�'),
('Malta'),
('Man, Isle of'),
('Marruecos'),
('Mauricio'),
('Mauritania'),
('M�xico'),
('Micronesia'),
('Moldavia'),
('M�naco'),
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
('N�ger'),
('Nigeria'),
('Niue'),
('Noruega'),
('Nueva Caledonia'),
('Nueva Zelanda'),
('Om�n'),
('Pacific Ocean'),
('Pa�ses Bajos'),
('Pakist�n'),
('Palaos'),
('Panam�'),
('Pap�a-Nueva Guinea'),
('Paracel Islands'),
('Paraguay'),
('Per�'),
('Polinesia Francesa'),
('Polonia'),
('Portugal'),
('Puerto Rico'),
('Qatar'),
('Reino Unido'),
('Rep�blica Centroafricana'),
('Rep�blica Democr�tica del Congo'),
('Rep�blica Dominicana'),
('Ruanda'),
('Rumania'),
('Rusia'),
('S�hara Occidental'),
('Samoa'),
('Samoa Americana'),
('San Bartolom�'),
('San Crist�bal y Nieves'),
('San Marino'),
('San Mart�n'),
('San Pedro y Miquel�n'),
('San Vicente y las Granadinas'),
('Santa Helena'),
('Santa Luc�a'),
('Santo Tom� y Pr�ncipe'),
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
('Sud�frica'),
('Sud�n'),
('Sud�n del Sur'),
('Suecia'),
('Suiza'),
('Surinam'),
('Svalbard y Jan Mayen'),
('Tailandia'),
('Taiw�n'),
('Tanzania'),
('Tayikist�n'),
('Territorio Brit�nico del Oc�ano Indico'),
('Territorios Australes Franceses'),
('Timor Oriental'),
('Togo'),
('Tokelau'),
('Tonga'),
('Trinidad y Tobago'),
('T�nez'),
('Turkmenist�n'),
('Turqu�a'),
('Tuvalu');
