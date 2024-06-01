--1. Crear una base de datos llamada librería.

CREATE DATABASE LIBRERIA
GO

USE LIBRERIA
GO
-- 2. Dentro de la base de datos librería, crear dos esquemas llamados Catalogo y
Ventas.
CREATE SCHEMA CATALOGO
GO 

CREATE SCHEMA VENTAS
GO 

----- 2.1
CREATE TABLE CATALOGO.AUTORES
(
AutorID INT PRIMARY KEY identity(1,1),
Nombre Varchar(60),
Apellido Varchar(60)
)
--4.2
EXEC sp_rename 'CATALOGO.AUTORES.Nombre', 'Nombre_Autor', 'COLUMN';

Select * from CATALOGO.AUTORES

CREATE TABLE CATALOGO.CATEGORIAS
(
CategoriaID INT PRIMARY KEY identity(100,1),
Nombre Varchar(60) Unique
)
--4.2
EXEC sp_rename 'CATALOGO.CATEGORIAS.Nombre', 'Nombre_Categoria', 'COLUMN';

Select * from CATALOGO.CATEGORIAS

CREATE TABLE CATALOGO.LIBROS
(
LibroID INT PRIMARY KEY identity(200,1),
Titulo NVarchar(100),
Precio Money,
AutorID INT,
CONSTRAINT FK_AUTOR_ID_LIBROS_AUTOR_ID_AUTORES FOREIGN KEY (AutorID)
References CATALOGO.AUTORES(AutorID)
)

--4.2

EXEC sp_rename 'CATALOGO.LIBROS.Precio', 'Precio_Libro', 'COLUMN';

Select * from CATALOGO.LIBROS
-- 4.3
ALTER TABLE CATALOGO.LIBROS
ADD CategoriaID INT,
SELECT * FROM CATALOGO.LIBROS

--4.1
ALTER TABLE CATALOGO.LIBROS
ADD CONSTRAINT FK_CategoriaID_LIBROS_CategoriaID_CATEGORIAS FOREIGN KEY (CategoriaID)
References CATALOGO.CATEGORIAS(CategoriaID)



CREATE TABLE VENTAS.CLIENTES
(
ClienteID INT PRIMARY KEY identity(300,1),
Nombre Varchar(60),
Apellido Varchar(60),
Correo NVarchar(100) Unique
)
--4.3
ALTER TABLE VENTAS.CLIENTES
ADD Celular INT,
SELECT * FROM VENTAS.CLIENTES

CREATE TABLE VENTAS.VENTAS
(
VentaID INT PRIMARY KEY identity(400,1),
FechaVenta Date,
ClienteID INT,
CONSTRAINT FK_ClienteID_VENTAS_ClienteID_CLIENTES FOREIGN KEY (ClienteID)
References VENTAS.CLIENTES(ClienteID)
)

CREATE TABLE VENTAS.DETALLEVENTAS
(
DetalleID INT PRIMARY KEY identity(500,1),
VentaID INT,
LibroID INT,
Cantidad INT,
PrecioVenta Money
)
--4.1
ALTER TABLE VENTAS.DETALLEVENTAS
ADD CONSTRAINT FK_VentaID_DETALLEVENTAS_VentaID_Ventas FOREIGN KEY (VentaID)
References VENTAS.VENTAS(VentaID)

ALTER TABLE VENTAS.DETALLEVENTAS
ADD CONSTRAINT FK_LibroID_DETALLEVENTAS_LibroID_LIBROS FOREIGN KEY (LibroID)
References CATALOGO.LIBROS(LibroID)


--5 registros -- catalogo

INSERT INTO CATALOGO.AUTORES (Nombre_Autor,Apellido)
VALUES 
('Charles','Dickens'),
('Ken','Follet'),
('Federico','García'),
('Marcel','Proust'),
('William','Shakespeare'),
('Edgar','Allan'),
('Jane','Austen'),
('Miguel','Cervantes'),
('Agatha','Chistie'),
('Paulo','Coelho')

INSERT INTO CATALOGO.CATEGORIAS (Nombre_Categoria)
VALUES 
('Accion'),
('Novelas'),
('Comedia'),
('Romance'),
('Aventura'),
('Historico'),
('Biografico'),
('Academico'),
('Infantil'),
('Cocina')

INSERT INTO CATALOGO.LIBROS (Titulo,Precio_Libro,AutorID,CategoriaID)
VALUES 
('Don Quijote de la Mancha',95000,5,100),
('Harry Potter',84750,2,101),
('Historia de dos ciudades',45600,2,101),
('El Señor de los Anillos',21845,1,105),
('El principito',62000,5,106),
('Las aventuras de Alicia en el país de las maravillas',54000,6,107),
('Las Crónicas de Narnia',95000,3,102),
('Diez negritos',84000,5,100),
('El código Da Vinci',40000,4,103),
('El Alquimista',85000,7,102)



-- 5 registros - ventas

INSERT INTO VENTAS.CLIENTES (Nombre,Apellido,Correo)
VALUES
('Juan','Cuestas','juan@correo.com'),
('Alejandro', 'Corrales','alejo@correo.com'),
('Mateo','Lozano','mateo@correo.com'),
('Julieth','Preciado','juli@correo.com'),
('Daniel','Herrera','dani@correo.com'),
('Victor','Martinez','victor@correo.com'),
('Carolina','Olaya','caro@correo.com'),
('Laura','Prado','lau@correo.com'),
('Betty','Ariza','betty@correo.com'),
('Juliana','Moreno','juliana@correo.com')

INSERT INTO VENTAS.VENTAS (ClienteID,FechaVenta)
VALUES
(310,'2024-01-02'),
(314,'2024-02-04'),
(319,'2024-02-25'),
(316,'2023-11-23'),
(317,'2023-12-31'),
(318,'2024-04-23'),
(319,'2024-01-14'),
(310,'2023-10-18'),
(311,'2023-06-29'),
(312,'2024-01-29')

select * from VENTAS.DETALLEVENTAS

INSERT INTO VENTAS.DETALLEVENTAS (VentaID,LibroID,Cantidad,PrecioVenta)
VALUES
(400,209,2,80000),
(401,208,1,84000),
(402,207,2,190000),
(403,206,3,162000),
(404,205,2,124000),
(405,204,1,21845),
(406,203,1,45600),
(407,202,1,84750),
(408,203,2,91200),
(409,202,1,84750)

