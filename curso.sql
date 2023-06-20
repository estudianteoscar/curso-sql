CREATE database Biblioteca;
show tables;

use Biblioteca;

describe Sede;

CREATE table if not exists Sede(
id_sede int auto_increment not null,
nombre_sede varchar(50) not null,
direccion varchar(50) not null,
ciudad varchar(50) not null,
departamento varchar(50) not null,
telefono int(10) not null,
primary key (id_sede)
);

#modificar parametros de una table
alter table Sede modify telefono varchar(10);


CREATE table if not exists Libro(
id_libro int auto_increment not null,
titulo varchar(50) not null,
auto varchar(50) default 'Desconocido' not null,
año_publicacion int not null,
editorial varchar(50) not null,
genero varchar(50) not null,
primary key (id_libro)
);

CREATE table if not exists Usuario(
id_usuario int auto_increment,
nombre varchar(50) not null,
apellido varchar(50) not null,
direccion varchar(50) not null,
ciudad varchar(50) not null,
departamento varchar(50) not null,
telefono int(10) not null,
correo_electronico varchar(100) not null,
primary key(id_usuario)
);

ALTER table Usuario modify telefono varchar(10);

CREATE table if not exists Prestamo(
id_prestamo int auto_increment not null,
id_sede int,
id_libro int,
id_usuario int,
fecha_prestamo date,
fecha_devolucion date,
primary key (id_prestamo),
foreign key (id_sede) references Sede(id_sede),
foreign key (id_usuario) references Usuario(id_usuario),
foreign key (id_libro) references Libro(id_libro)
);
SELECT * FROM Sede;
#borrar el item de la tabla especificado
DELETE FROM Sede WHERE nombre_sede='Sede Central';


#insertar datos en la tabla sede
INSERT INTO Sede values(null,'Sede Central','Carrera 10 #25-45','Bogotà','Cundinamarca',1234567890);
INSERT into Sede values(null,'Sede Norte','Calle 100 #15-30','Bogotà','Cundinamarca',2345678901);
INSERT into Sede values(null,'Sede occidente','Carrera 80 #35-20','Medellin','Antioquia',3456789012);
INSERT INTO Sede values(null,'Sede sur','Calle 50 #45-60','Cali','Valle del cauca',4567890123);
INSERT INTO Sede values(null,'Sede Caribe','Av del mar #10-25','Barranuilla','Atlantico',5678901234);
SELECT * FROM Sede;

#insertar datos en la tabla Libro
INSERT INTO Libro values(null,'Cien años de soledad','Gabriel Garcia Marquez',1967,'Editorial Sudamericana','Realismo magico');
INSERT into Libro values (null,'El amor en los tiempos de colera','Gabriel Garcia Marquez',1985,'Editorial Oveja negra','Realimso magico');
INSERT INTO Libro values(null,'Cronica de una muerte anunciada','Gabriel Garcia Marquez',1981,'Editorial La otra Orilla','Realismo magico');
INSERT INTO Libro values(null,'La sombra del viento','Carloz Ruiz Zafon',2001,'Editorial Planeta','MIsterio');
INSERT INTO Libro values(null,'Codigo Da Vinci','Dan Brown',2003,'Editorial Planeta','Suspenso');
SELECT * FROM Libro;

#insertar datos en la tabla usuario
INSERT INTO Usuario values(null,'Juan','Perez','Calle 123 #45-67','Bogota','Cundinamarca','1234567890','juan.perez@example.com');
INSERT INTO Usuario values(null,'María', 'Gómez', 'Carrera 45 #67-89', 'Medellín', 'Antioquia', '2345678901', 'maria.gomez@example.com');
INSERT INTO Usuario values(null,'Luis', 'Rodríguez', 'Avenida 10 #12-34', 'Cali', 'Valle del Cauca', '3456789012', 'luis.rodriguez@example.com');
INSERT INTO Usuario values(null,'Laura', 'Hernández', 'Calle 78 #90-12', 'Bogotá', 'Cundinamarca', '4567890123', 'laura.hernandez@example.com');
INSERT INTO Usuario values(null,'Carlos', 'Martínez', 'Carrera 23 #56-78', 'Medellín', 'Antioquia', '5678901234', 'carlos.martinez@example.com');
SELECT * FROM Usuario;

#insertar datos en la tabla prestamo
INSERT INTO Prestamo (id_sede, id_libro, id_usuario, fecha_prestamo, fecha_devolucion)
VALUES
  (1, 1, 1, '2023-05-01', '2023-05-15'),
  (2, 3, 2, '2023-05-02', '2023-05-16'),
  (1, 2, 3, '2023-05-03', '2023-05-17'),
  (3, 1, 4, '2023-05-04', '2023-05-18'),
  (2, 2, 5, '2023-05-05', '2023-05-19');
 SELECT * FROM Prestamo;

#consultas
SELECT * from Sede;
SELECT id_sede, nombre_sede, ciudad, Departamento from Sede WHERE ciudad="Bogota";
SELECT COUNT(*) from Sede WHERE ciudad='Bogota';
SELECT ciudad from Sede where ciudad LIKE  'M%';
SELECT LENGTH(telefono) AS caracteres_telefono FROM Sede;
SELECT id_sede, nombre_sede, ciudad, departamento from Sede order by ciudad;
SELECT nombre_sede, ciudad, direccion from Sede where nombre_sede='Sede Central';
SELECT nombre_sede, ciudad, direccion, telefono from Sede WHERE (nombre_sede='Sede Central') OR  (nombre_sede='Sede Caribe');
SELECT * FROM Sede where ciudad REGEXP '^B';
SELECT id_sede,nombre_sede,direccion from Sede where ciudad='Bogota';

select * from Libro;
UPDATE Libro SET genero='Realismo magico' WHERE id_libro=2;










