#mostrar base-datos
show databases;

#crear base-datos
CREATE database prueba;
CREATE database curso_sql;

#entrar en la base-datos
use curso_sql;

#crear tabla dentro de la base-datos
CREATE table nombre_random(
nombre varchar(50),
edad int(14)
);

CREATE table cualquier_cosa(
id varchar(10),
nombre varchar(15)
);

show tables;
#mostrar los campos que tiene la tabla
describe nombre_random ;
describe alumnos;

#borrar tabla
DROP table nombre_random ;

DROP table alumnos;

CREATE table alumnos(
nombre varchar(50),
apellido varchar(50),
telefono varchar(50),
direccion varchar(100),
edad int(11)
);

#ver todos el contenido de la base-datos
SELECT * FROM alumnos;

#ingresar valores a la tabla
INSERT INTO  alumnos(nombre,apellido,telefono,direccion,edad) values('Oscar','Bachiller','8259393','Altos guali',25);
INSERT INTO alumnos values('Alejandro','Infante','-','altos guali',1);
INSERT INTO alumnos values ('Jenncy','Prada','456556','Sanatana',19);
INSERT INTO alumnos values ('Jenncy','Fonseca','4565789','Pradera',19);

#hacer consultas faciles
SELECT nombre, apellido, edad from alumnos;
#operadores racionales
#<> distinto
#=
#< y demas
#> y demas

#hacer consultas con condicional where y operadores racionales
SELECT nombre, apellido, edad from alumnos WHERE edad>=18;

#hacer consultas con condicional where y operadores relacionales
SELECT * FROM alumnos WHERE edad>=18 and nombre='Jenncy';

SELECT nombre, apellido, edad from alumnos WHERE nombre <> 'oscar' AND direccion <> 'altos guali';

#borrar todo el contenido de la tabala
DELETE FROM alumnos;

#borrar solo el item especificado
DELETE FROM alumnos WHERE apellido = 'Fonseca';

#actualizar solo el item especificado
UPDATE alumnos SET edad =20 WHERE nombre='oscar';
UPDATE alumnos SET telefono='' WHERE apellido='Infante';
UPDATE alumnos set telefono='8259393', edad ='20'  WHERE nombre='oscar';
UPDATE alumnos set direccion='santana' WHERE nombre='jenncy';

#borrar la bd si existe
DROP database if exists curso_sql;

#crear la base de datos si no existe-si existe muestra un error
CREATE database if not exists curso_sql;

use curso_sql;

CREATE table if not exists usuario(
nombre varchar(50),
apellido varchar(50),
correo varchar(100),
primary key(nombre)
);

describe usuario;

INSERT into usuario values('Juan','Perez','juanp@outlook.es');
INSERT INTO usuario values ('Oscar','Bachiller','od94847@outlook.es');

SELECT * FROM usuario;

CREATE table if not exists producto(
ID int(11) auto_increment,
producto varchar(50),
descripcion text,
precio float(11,2),
primary key(ID)
);
SELECT * from producto;

INSERT  into producto values(null,'laptop','la mejor pc del mercado','286.4');
INSERT  into producto values(null,'mouse','gaming','54.2');
INSERT  into producto values(null,'laptop','ryzen 3','280.4');

DELETE FROM producto;
#limpiar toda la tabla y comenzar desde cero
TRUNCATE table producto;

#unsigned numeros positivos
CREATE table persona(
id integer unsigned not null,
edad integer unsigned,
primary key(id)
);

#tipos de datos enteros
#tinyint -127 128
#smallint
#int
#bigint

#decimales
#float
#double
#decimal

#cadenas
#char
#varchar
#binary y varbinary
#text
#blob
#enum
#set

#fecha
#date
#datetime
#time
#timetamp
#on update current-timestamp
#year

create table if not exists libros(
ID int unsigned auto_increment,
titulo varchar(40) not null,
editorial varchar(15),
autor varchar(30) default 'Desconocido',
precio decimal (5,2) unsigned default 8.25,
cantidad mediumint unsigned not null,
primary key(ID)
);

INSERT into libros values(null,'La esfinge','norma','Robin Cook',15.2,20);
INSERT INTO libros (titulo,editorial,precio,cantidad) values ('Parque gorky','FOST',12.19,10);

SELECT * from libros;
SELECT * from producto;

show tables;
describe producto;

drop table if exists producto;

CREATE table if not exists producto(
ID integer unsigned not null auto_increment,
nombre varchar(50) not null,
proveedor varchar(50) not null,
descripcion text default 'Generico',
precio decimal(5,2) unsigned,
cantidad smallint unsigned,
primary key (ID)
);
INSERT INTO producto values(null,'PC','Acer','Ryzen 5 2500u',156.10,100);
INSERT INTO producto  values(null,'Ipad','Apple','15 pulgadas',240.40,50);
INSERT INTO producto values (null,'Impresora','Canon','Impresora MP250 PIXMA',140.20,10);
INSERT INTO producto values(null,'MOUSE GAMING','Taurent','MSI GAMING',56.2,1200);
INSERT INTO producto values(null,'Xbox 360','Microsoft','VideoConsola',103.00,10);
INSERT INTO producto values(null,'Monitor','Hp','Pantalla ips',165.69,50);
INSERT INTO producto values(null,'Monitor','Hp','Pantalla ips',175.69,50);


#columnas calculadas
SELECT nombre,precio,cantidad,precio*cantidad from producto;

SELECT nombre,precio,precio*0.1,precio-(precio*0.1) from producto;

#manejo de cadenas

#concatenar
SELECT CONCAT('','','');
SELECT CONCAT_WS('-','','');
#caracteres que hay en una fila o dato
SELECT LENGTH ('hola');
#cuenta de derecha a izq
SELECT LEFT ('Buenas',5);
#quitar espacios de derecha
SELECT LTRIM('  udemy  ');
#quitar espacios de ambos lados
SELECT TRIM('     udemy     ');
#remmplazar
SELECT REPLACE ('xxx.udemy','x','w');
#repetir x valores
SELECT REPEAT ('sql',5);
SELECT REVERSE('hola');
#convertir todo a min
SELECT LOWER('hola, ComO eStaN');
#convertir todo a mayus
SELECT UPPER('hola, ComO eStaN');

#funciones matematicas
#redondea
select CEILING  (precio) from producto;
select FLOOR (precio) from producto;
#residuo
SELECT MOD (10,3)
#potencia 8²
select POWER(2,3);
#aproxima
SELECT ROUND(20.60);

#order by
SELECT nombre, descripcion, precio,cantidad from producto order by nombre;

SELECT nombre, precio, cantidad from producto order by nombre desc;

select nombre, precio, cantidad, precio*cantidad from producto WHERE cantidad>=100 order by nombre desc;

#operadores logicos
#and
#or
#xor
#not

SELECT * FROM producto;

SELECT * from producto WHERE (proveedor='ACer') and (cantidad>=50);
SELECT * from producto where (proveedor='ACer') OR  (cantidad>=50);
SELECT * from producto where (proveedor='ACer') XOR  (cantidad>=50);
SELECT * from producto where not (proveedor='Apple') order by nombre asc;

#operadores relacionales between - in

SELECT *from producto WHERE cantidad >=10 and cantidad <=100;
SELECT *FROM producto WHERE precio BETWEEN 10 and 130;
SELECT *FROM producto WHERE proveedor IN ('Hp','pantalla ips');


#Busqueda de patrones like-not like

SELECT * from producto WHERE descripcion like '%pantalla%';
SELECT * from producto WHERE descripcion NOT  like '%pantalla%';

#patron busqueda Regexp - not Regexp
select * from producto where proveedor REGEXP 'mi';
select * from producto where proveedor REGEXP '[e]';
select * from producto where proveedor REGEXP '^h';
select * from producto where proveedor REGEXP 'a..e';
select * from producto where nombre REGEXP 'm."r';

#funcion count
SELECT COUNT(*) from producto;
SELECT COUNT(*) from producto where proveedor='hp';
SELECT COUNT(*) from producto WHERE descripcion LIKE '%pantalla ips';

#funcionaes de agrupamientos

SELECT SUM(cantidad) from producto;
SELECT SUM(precio) from producto;
SELECT SUM(cantidad) from producto where proveedor ='hp';
SELECT MIN(precio) from producto;
SELECT MIN(precio) from producto WHERE nombre LIKE '%monitor';
SELECT AVG(precio)  from producto WHERE nombre LIKE '%monitor';

CREATE table visitantes(
nombre varchar(30),
edad int,
sexo char(1),
domicilio varchar(30),
ciudad varchar(30),
telefono varchar(11),
montocompra decimal(6,2) unsigned
);
DROP table visitantes;
ALTER table visitantes modify telefono varchar(11) default 'no-tiene';


SELECT * from visitantes;
DELETE FROM visitantes WHERE nombre='Susana molina';

INSERT into visitantes (nombre,edad,sexo,domicilio,ciudad,montocompra) values ('Susana molina',25,'f','cordoba 123','Jalisco',45.50);
INSERT into visitantes values('Marcela mercado',36,'f','Avellaneda 345','Jalisco','5465156',0);
INSERT into visitantes values('Oscar david',25,'m','Altos guali','Funza','4511146',12.90);
INSERT into visitantes values('Alberto garcia',35,'m','Gral. paz 123','Mosquera','5465362',25);
INSERT into visitantes values('Teresa garcia',44,'f','Gral. paz 123','Mosquera','8411323',0);

SELECT ciudad, COUNT(*) from visitantes group by ciudad;
SELECT sexo, SUM(montocompra) from visitantes group by sexo;
SELECT sexo, MAX(montocompra), MIN(montocompra)from visitantes;
SELECT ciudad,sexo, COUNT(*) from visitantes group by ciudad, sexo;
SELECT COUNT(*) from visitantes where ciudad ='Mosquera';
SELECT nombre, ciudad from visitantes where ciudad ='Mosquera';

#registros duplicados distinct

SELECT DISTINCT proveedor from producto;
SELECT DISTINCT proveedor from producto group by proveedor ASC;

SELECT proveedor, COUNT(*) from producto group by proveedor;


#indice

#primary
#index
#unique

CREATE table if not exists libro(
id int unsigned auto_increment not null primary key,
titulo varchar(100),
autor varchar(50),
descripcion text,
editorial varchar(15)
);

describe libro

#tipo index comun
CREATE table if not exists book(
id int unsigned auto_increment not null primary key,
titulo varchar(100),
autor varchar(50) not null,
descripcion text,
editorial varchar(15) not null,
index i_autor (autor),
unique uq_titulo (titulo)
);

DROP table book;

show index from book;

SELECT * FROM book;

INSERT INTO book (titulo,autor,editorial) values ('Java en 10 minutos','Alejandro','La maravilla');
INSERT INTO book (titulo,autor,editorial) values ('Java','Alejandro','La maravilla');







