create database empresa;
use empresa;
create table localidad (
id_localidad int auto_increment primary key,
localidad varchar(20) NOT NULL,
provincia varchar(20) NOT NULL
);
create table area (
id_area int auto_increment primary key,
area varchar(20) NOT NULL
);
create table gerente_sede ( 
id_asignacion int auto_increment primary key,
nombre varchar(50) NOT NULL,
id_sede int,
id_gerente int,
foreign key (id_sede) references sede(id_sede) on update cascade on delete cascade,
foreign key (id_gerente) references gerente(id_gerente) on update cascade on delete cascade
);
create table sede (
id_sede int auto_increment primary key,
nombre_sede varchar(50) NOT NULL,
direccion_sede varchar(50) NOT NULL,
telefono_sede int NOT NULL,
mail_sede varchar(50) NOT NULL,
id_localidad int,
foreign key (id_localidad) references localidad(id_localidad) on update cascade on delete cascade
);
create table jefe(
id_jefe int auto_increment primary key,
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
sexo varchar(50) NOT NULL,
mail varchar(50) NOT NULL,
telefono int NOT NULL,
id_area int,
id_sede int,
id_localidad int,
foreign key (id_area) references area(id_area) on update cascade on delete cascade,
foreign key (id_sede) references sede(id_sede) on update cascade on delete cascade,
foreign key (id_localidad) references localidad(id_localidad) on update cascade on delete cascade
);
create table jornada (
id_jornada int auto_increment primary key,
tipo_jornada varchar(50) NOT NULL
);
create table repositor(
id_repositor int auto_increment primary key,
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
sexo varchar(50) NOT NULL,
mail varchar(50) NOT NULL,
telefono int NOT NULL,
id_area int,
id_jornada int,
id_sede int,
id_localidad int,
foreign key (id_area) references area(id_area) on update cascade on delete cascade,
foreign key (id_jornada) references jornada(id_jornada) on update cascade on delete cascade,
foreign key (id_sede) references sede(id_sede) on update cascade on delete cascade,
foreign key (id_localidad) references localidad(id_localidad) on update cascade on delete cascade
);
create table cajero(
id_cajero int auto_increment primary key,
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
sexo varchar(50) NOT NULL,
mail varchar(50) NOT NULL,
telefono int NOT NULL,
id_area int,
id_jornada int,
id_sede int,
id_localidad int,
foreign key (id_area) references area(id_area) on update cascade on delete cascade,
foreign key (id_jornada) references jornada(id_jornada) on update cascade on delete cascade,
foreign key (id_sede) references sede(id_sede) on update cascade on delete cascade,
foreign key (id_localidad) references localidad(id_localidad) on update cascade on delete cascade
);
create table personal_empresa (
id_empleado int auto_increment primary key,
fecha_ingreso date NOT NULL,
años_trabajados int NOT NULL,
id_cajero int,
id_repositor int,
id_jefe int,
id_gerente int,
id_area int,
id_sede int,
foreign key (id_cajero) references cajero(id_cajero) on update cascade on delete cascade,
foreign key (id_repositor) references repositor(id_repositor) on update cascade on delete cascade,
foreign key (id_jefe) references jefe(id_jefe) on update cascade on delete cascade,
foreign key (id_gerente) references gerente_sede(id_gerente) on update cascade on delete cascade,
foreign key (id_area) references area(id_area) on update cascade on delete cascade,
foreign key (id_sede) references sede(id_sede) on update cascade on delete cascade
);
create table gerente(
id_gerente int auto_increment primary key,
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
sexo varchar(50) NOT NULL,
mail varchar(50) NOT NULL,
telefono int NOT NULL
);


insert into localidad values (null, 'San Justo', 'Buenos Aires'),
(null, 'Moreno', 'Buenos Aires'),
(null, 'Laferrere', 'Buenos Aires'),
(null, 'Posadas', 'Misiones'),
(null, 'Rio Cuarto', 'Cordoba'),
(null, 'Santa Rosa', 'La Pampa'),
(null, 'Paraná', 'Entre Rios'),
(null, 'Cosquín', 'Cordoba'),
(null, 'CABA', 'Buenos Aires'),
(null, 'Morón', 'Buenos Aires');

insert into area values (null, 'Salón'),
(null, 'Depósito'),
(null, 'Fiambrería'),
(null, 'Electro'),
(null, 'Cajas');

insert into gerente values (null, 'Juan', 'Perez', 'Masculino', 'juanperezz@gmail.com', 1551357983),
(null, 'José', 'Díaz', 'Masculino', 'jodiaz@gmail.com', 1557965432),
(null, 'Laura', 'Pertuzi', 'Femenino', 'laupertu@gmail.com', 1554487331),
(null, 'Marcela', 'Iraola', 'Femenino', 'marcela.iraola@gmail.com', 1568124397),
(null, 'Julia', 'Fernandez', 'Femenino', 'juliafernandez77@gmail.com', 1545237949),
(null, 'Lionel', 'Petrez', 'Masculino', 'liopetrez@gmail.com', 1566451137),
(null, 'Melina', 'Paz', 'Femenino', 'melpaez@gmail.com', 1544779785),
(null, 'Pablo', 'Maldonado', 'Masculino', 'pablomaldo@gmail.com', 1563678945),
(null, 'Ariel', 'Jerez', 'Masculino', 'ariel_jerez@gmail.com', 1564497832),
(null, 'Luna', 'Paez', 'Femenino', 'lunapaez@gmail.com', 1555544793);

insert into sede values (null, 'San Justo', 'D. Maradona 2001', 44373316, 'empresasj@gmail.com', 1),
(null, 'Moreno', 'Alejandro Graham Bell 2299', 23740522, 'empresamoreno@gmail.com', 2),
(null, 'Laferrere', 'Juan Manuel de Rosas 10832', 40156578, 'empresalf@gmail.com', 3),
(null, 'Posadas', 'Bolivar 1860', 376448035, 'empresapos@gmail.com', 4),
(null, 'Rio Cuarto', 'C. Caseros 1056', 358422539, 'empresarc@gmail.com', 5),
(null, 'Santa Rosa', 'Centeno 349', 295442308, 'empresasr@gmail.com', 6),
(null, 'Paraná', 'Almafuerte 872', 343424037, 'empresapar@gmail.com', 7),
(null, 'Cosquín', 'Av. San Martín 1279', 354145426, 'empresacosq@gmail.com', 8),
(null, 'CABA', 'Inclán 3856', 52634876, 'empresacaba@gmail.com', 9),
(null, 'Morón', 'San Martin 598', 35134712, 'empresamoron@gmail.com', 10);

insert into gerente_sede values (null, 'Juan Perez', 1, 1),
(null, 'José Díaz', 2, 2),
(null, 'Laura Pertuzi', 3, 3),
(null, 'Marcela Iraola', 4, 4),
(null, 'Julia Fernandez', 5, 5),
(null, 'Lionel Petrez', 6, 6),
(null, 'Melina Paz', 7, 7),
(null, 'Pablo Maldonado', 8, 8),
(null, 'Ariel Jerez', 9, 9),
(null, 'Luna Paez', 10, 10);

insert into jornada values (null, 'Completa'),
(null, 'Media');

insert into jefe values (null, 'Juan', 'Diaz', 'Masculino', 'juandiaz@gmail.com', 1564311279, 1, 1, 1),
(null, 'Juliana', 'Paez', 'Femenino', 'julipaez@gmail.com', 1579467382, 2, 1, 2),
(null, 'Fabian', 'Lopez', 'Masculino', 'fabianlo@gmail.com', 1555131346, 5, 2, 2),
(null, 'Pablo', 'Lunati', 'Masculino', 'plunati@gmail.com', 1579467382, 4, 3, 3),
(null, 'Laura', 'Rodriguez', 'Femenino', 'lrodriguez@gmail.com', 1550511432, 3, 2, 1),
(null, 'Julieta', 'Marsili', 'Femenino', 'julimars@gmail.com', 1557643511, 3, 1, 1),
(null, 'Carlos', 'Kojro', 'Masculino', 'carlosk@gmail.com', 1555134679, 4, 2, 2),
(null, 'Lorena', 'Seketa', 'Femenino', 'loreseketa@gmail.com', 1564673149, 1, 2, 3),
(null, 'Dario', 'Mendez', 'Masculino', 'dmendez@gmail.com', 1564372191, 5, 3, 2),
(null, 'Noelia', 'Pelallo', 'Femenino', 'npelallo@gmail.com', 1564379137, 5, 2, 1);

insert into cajero values (null, 'Diego', 'Diaz', 'Masculino', 'ddiaz@gmail.com', 1564347922, 5, 1, 1, 3),
(null, 'Julieta', 'Baez', 'Femenino', 'julibaez@gmail.com', 1579331165, 5, 2, 2, 2),
(null, 'Emanuel', 'Perez', 'Masculino', 'emap@gmail.com', 1555137987, 5, 1, 1, 2),
(null, 'Pablo', 'Luna', 'Masculino', 'pluna@gmail.com', 1524019561, 5, 1, 3, 3),
(null, 'Laura', 'Rodriguez', 'Femenino', 'lrodriguez@gmail.com', 1532518915, 5, 1, 1, 1),
(null, 'Ximena', 'Mars', 'Femenino', 'ximemars@gmail.com', 1564643189, 5, 2, 2, 1),
(null, 'Carlos', 'Serra', 'Masculino', 'carloserra@gmail.com', 1533134655, 5, 2, 2, 2),
(null, 'Lorena', 'Sanchez', 'Femenino', 'lores78@gmail.com', 1555673177, 5, 1, 1, 3),
(null, 'Ezequiel', 'Mendez', 'Masculino', 'ezemendez@gmail.com', 1536372122, 5, 1, 1, 2),
(null, 'Maira', 'Pelallo', 'Femenino', 'maipelallo@gmail.com', 1555379179, 5, 1, 1, 1);

insert into repositor values (null, 'Dario', 'Diaz', 'Masculino', 'dardiaz@gmail.com', 1533445566, 1, 1, 3, 3),
(null, 'Julia', 'Baez', 'Femenino', 'juliabaez@gmail.com', 1589741236, 2, 2, 2, 2),
(null, 'Andrés', 'Perez', 'Masculino', 'andip@gmail.com', 1555137978, 1, 1, 2, 2),
(null, 'Joaquin', 'Luna', 'Masculino', 'jluna@gmail.com', 1524017928, 1, 2, 3, 3),
(null, 'Carla', 'Rodriguez', 'Femenino', 'carlarodriguez@gmail.com', 1532518944, 1, 1, 1, 1),
(null, 'Maria', 'Mars', 'Femenino', 'mariamars@gmail.com', 1533645689, 2, 2, 2, 1),
(null, 'Hiram', 'Serrano', 'Masculino', 'hserrano@gmail.com', 1523134656, 2, 1, 2, 2),
(null, 'Lorena', 'Díaz', 'Femenino', 'ldiaz@gmail.com', 1565673173, 1, 2, 1, 3),
(null, 'Lautaro', 'Mendez', 'Masculino', 'lmendez@gmail.com', 1536677122, 1, 1, 1, 2),
(null, 'Maira', 'Servant', 'Femenino', 'mservant@gmail.com', 1545376178, 1, 2, 2, 1);

insert into personal_empresa values (null, '2000-04-08', 23, null, null, null, 1, 1, 1),
(null, '2021-04-04', 2, 1, null, null, null, 5, 1),
(null, '2015-12-14', 7, null, 2, null, null, 2, 2),
(null, '2005-08-14', 18, null, null, 1, null, 1, 1),
(null, '2020-09-20', 2, null, 5, null, null, 1, 1),
(null, '2019-03-12', 4, 6, null, null, null, 5, 2),
(null, '2011-03-03', 12, null, null, 3, null, 2, 2),
(null, '2010-02-15', 13, null, 8, null, null, 1, 3),
(null, '2018-02-22', 5, null, null, 8, null, 2, 3),
(null, '2022-07-20', 1, 9, null, null, null, 5, 1);


#Esta tabla nos trae todos los datos de la tabla localidad#
create view vista_localidad as (select * from localidad);

#Esta tabla nos trae los apellidos de los gerentes, el nombre de c/sede y el correspondiente num de tel#
create view gerente_sede_completa as (select gerente_sede.nombre, sede.direccion_sede, sede.telefono_sede from gerente_sede, sede where gerente_sede.id_sede = sede.id_sede);

#Esta tabla nos muestra solo el nombre completo y el mail de los jefes que viven en la localidad 2#
create view jefe_localidad2 as (select concat(nombre, ' ', apellido) as nombre_completo , mail from jefe where id_localidad=2);

#Esta tabla nos muestra la localidad de cada sede a través de inner join#
create view sede_localidad as(select id_sede, nombre_sede, direccion_sede, localidad from sede inner join
localidad on localidad.id_localidad=sede.id_localidad);

#Esta tabla nos muestra el tipo de jornada de cada cajero a través de inner join#
create view cajeros_jornada as(select id_cajero, nombre, apellido, tipo_jornada from cajero inner join jornada on
cajero.id_jornada=jornada.id_jornada);

#Llamar a todos los datos de cada tabla#
select * from area;
select * from cajero;
select * from gerente;
select * from gerente_sede;
select * from jefe;
select * from jornada;
select * from localidad;
select * from personal_empresa;
select * from repositor;
select * from sede;


#Función para contar cantidad de cajeros por sede#
DELIMITER $$
USE `empresa`$$
CREATE FUNCTION `cajeros_sede` (param_sede int)
RETURNS INTEGER
DETERMINISTIC
BEGIN
declare sede_asignada int;
select count(id_cajero) into sede_asignada
from cajero
where id_sede = param_sede;
RETURN sede_asignada;
END$$
DELIMITER ;

select cajeros_sede(1);

#Función para contar cantidad de repositores por área#
DELIMITER $$
USE `empresa`$$
CREATE FUNCTION `area_repositor`(param_repo int) 
RETURNS INTEGER
DETERMINISTIC
BEGIN
declare area_asignada int;
select count(id_repositor) into area_asignada
from repositor
where id_area = param_repo;
RETURN area_asignada;
END$$
DELIMITER ;

select area_repositor(1);


#SP para eliminar un registro de la tabla#
USE `empresa`;
DROP procedure IF EXISTS `jefe_baja`;

DELIMITER $$
USE `empresa`$$
CREATE PROCEDURE `jefe_baja` ()
BEGIN
DELETE FROM jefe WHERE id_jefe = 7;
END$$

DELIMITER ;

call jefe_baja;

#SP para insertar un registro de la tabla#
USE `empresa`;
DROP procedure IF EXISTS `gerente_alta`;

DELIMITER $$
USE `empresa`$$
CREATE PROCEDURE `gerente_alta` ()
BEGIN
INSERT INTO gerente VALUES (NULL,'Ramiro','Felice', 'Masculino', 'ramirof@gmail.com', 1154513265);
END$$

DELIMITER ;

call gerente_alta;

#SP para ordenar jefes según id_localidad#
DELIMITER $$
USE `empresa`$$
CREATE PROCEDURE `orden_jefe_localidad` (IN campo varchar(50), IN orden boolean)
BEGIN
IF campo <> '' AND orden = 1 THEN
SET @ordenar = concat('ORDER BY ', campo);
ELSEIF campo <> '' AND orden = 0 THEN
SET @ordenar = concat('ORDER BY ', campo, ' DESC');
ELSEIF campo <> '' AND orden NOT IN (0,1) THEN
SET @ordenar = 'No válido';
SELECT 'Orden ingresado no válido' AS Mensaje;
ELSE
SET @ordenar = '';
END IF;
IF @ordenar <> 'No válido' THEN
SET @clausula = concat('SELECT * FROM jefe ', @ordenar);
PREPARE ejecutar FROM @clausula;
EXECUTE ejecutar;
DEALLOCATE PREPARE ejecutar;
END IF;
END$$

DELIMITER ;

#Los ordena de forma ascendente#
call orden_jefe_localidad ('id_localidad', 1);

#Los ordena de forma descendente#
call orden_jefe_localidad ('id_localidad', 0);


#Tomando la tabla sede creo un log de agregar y modificar#
CREATE TABLE log_agregar_sede (
id_log INT PRIMARY KEY auto_increment,
id_sede INT NOT NULL,
nombre_sede VARCHAR(50),
telefono_sede INT NOT NULL,
mail_sede VARCHAR(50),
id_localidad int,
usuario VARCHAR(50),
fecha DATE,
hora TIME,
foreign key (id_localidad) references localidad(id_localidad) on update cascade on delete cascade
);

CREATE TABLE log_modificar_sede (
id_log INT PRIMARY KEY auto_increment,
id_sede INT NOT NULL,
nombre_sede VARCHAR(50),
telefono_sede INT NOT NULL,
mail_sede VARCHAR(50),
id_localidad int,
usuario VARCHAR(50),
fecha DATE,
hora TIME,
foreign key (id_localidad) references localidad(id_localidad) on update cascade on delete cascade
);

#Log de agregar nueva sede#
drop trigger if exists agregar_sede;
CREATE TRIGGER agregar_sede
AFTER INSERT ON sede
FOR EACH ROW
INSERT INTO log_agregar_sede (id_log, id_sede, nombre_sede, telefono_sede, mail_sede, id_localidad, usuario, fecha, hora)
VALUES (null, new.id_sede, new.nombre_sede, new.telefono_sede, new.mail_sede, new.id_localidad, session_user(), now(),
now());

#Log de modificar tabla sede#
drop trigger if exists modificar_sede;
CREATE TRIGGER modificar_sede
BEFORE UPDATE ON sede
FOR EACH ROW
INSERT INTO log_modificar_sede (id_log, id_sede, nombre_sede, telefono_sede, mail_sede, id_localidad, usuario, fecha, hora)
VALUES (null, new.id_sede, new.nombre_sede, new.telefono_sede, new.mail_sede, new.id_localidad, session_user(), now(),
now());

insert into sede values (NULL, 'San Justo', 'Thames 3305', 44410110, 'empresasj2@gmail.com', 1);

#Tomando la tabla localidad creo un log de agregar y modificar#
CREATE TABLE log_agregar_localidad (
id_log INT PRIMARY KEY auto_increment,
id_localidad INT NOT NULL,
localidad varchar(20) NOT NULL,
provincia varchar(20) NOT NULL,
usuario VARCHAR(50),
fecha DATE,
hora TIME
);

CREATE TABLE log_modificar_localidad (
id_log INT PRIMARY KEY auto_increment,
id_localidad INT NOT NULL,
localidad varchar(20) NOT NULL,
provincia varchar(20) NOT NULL,
usuario VARCHAR(50),
fecha DATE,
hora TIME
);

#Log de agregar nueva localidad#
drop trigger if exists agregar_localidad;
CREATE TRIGGER agregar_localidad
AFTER INSERT ON localidad
FOR EACH ROW
INSERT INTO log_agregar_localidad (id_log, id_localidad, localidad, provincia, usuario, fecha, hora)
VALUES (null, new.id_localidad, new.localidad, new.provincia, session_user(), now(),
now());

#Log de modificar nueva localidad#
drop trigger if exists modificar_localidad;
CREATE TRIGGER modificar_localidad
BEFORE INSERT ON localidad
FOR EACH ROW
INSERT INTO log_modificar_localidad (id_log, id_localidad, localidad, provincia, usuario, fecha, hora)
VALUES (null, new.id_localidad, new.localidad, new.provincia, session_user(), now(),
now());

insert into localidad values (NULL, 'Quilmes', 'Buenos Aires');

use mysql;
show tables;
select * from mysql.user;
select * from user;

#Creación de usuarios#
create user 'pablo'@'localhost' identified by 'Alma0408';

create user 'ceo'@'localhost' identified by '741852';

create user 'tata'@'localhost' identified by '321654';

create user 'sistemas'@'localhost' identified by 'qsxplm';

#Otorgar permisos#
#Otorgar permiso de solo lectura#
grant select on *.* to 'tata'@'localhost';

#Otorgar permisos de lectura, inserción y modificación de datos#
grant select, insert, alter on *.* to 'ceo'@'localhost';

#Otorgar permiso de lectura sobre las tablas cajero, repositor, sede y localidad#
grant select on empresa.cajero to 'pablo'@'localhost';
grant select on empresa.localidad to 'pablo'@'localhost';
grant select on empresa.repositor to 'pablo'@'localhost';
grant select on empresa.sede to 'pablo'@'localhost';

#Otorgar permisos especiales sobre routines (funciones y SP), triggers, sobre todas las tablas. Y delete y alter sobre las tablas gerente, sede, localidad y jefe#
grant create routine on *.* to 'sistemas'@'localhost';
grant trigger on *.* to 'sistemas'@'localhost';
grant delete, alter on empresa.gerente to 'sistemas'@'localhost';
grant delete, alter on empresa.sede to 'sistemas'@'localhost';
grant delete, alter on empresa.localidad to 'sistemas'@'localhost';
grant delete, alter on empresa.jefe to 'sistemas'@'localhost';

#Autocommit transaction#
SELECT @@AUTOCOMMIT;
SET AUTOCOMMIT=0;
-- SET AUTOCOMMIT=1;

#Eliminar algunos registros de la tabla cajero, controlado por una transacción#
START TRANSACTION;
DELETE FROM cajero WHERE id_sede = 2;
#rollback;#
commit;

#Insertar nuevos registros controlado por una transacción y usando savepoints#
START TRANSACTION;
insert into localidad (id_localidad, localidad, provincia) values (null, 'Isidro Casanova', 'Buenos Aires'),
(null, 'Merlo', 'Buenos Aires'),
(null, 'La Paz', 'Misiones'),
(null, 'Clorinda', 'Formosa');
savepoint primera_tanda;
insert into localidad (id_localidad, localidad, provincia) values (null, 'Oberá', 'Misiones'),
(null, 'Mina Clavero', 'Cordoba'),
(null, 'General Pico', 'La Pampa'),
(null, 'Gualeguay', 'Misiones');
savepoint segunda_tanda;
commit;
#release savepoint primera_tanda;#
