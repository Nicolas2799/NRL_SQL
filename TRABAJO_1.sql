CREATE DATABASE TIENDA_BICICLETAS
GO

USE TIENDA_BICICLETAS
GO
-- Esquema numero 1: personal
CREATE SCHEMA Personal 
GO

CREATE TABLE Personal.Empleados
(
	ID_Empleado INT PRIMARY KEY, 
	Nombre_Empleado VARCHAR(50) NOT NULL, 
	Fecha_Nacimiento_Empleado DATE NOT NULL,
	Fecha_Contratacion_Empleado DATE DEFAULT ('2000-01-01')
)
GO

-- Ingresar datos a Tambla empleados

INSERT INTO Personal.Empleados (ID_Empleado, Nombre_Empleado, Fecha_Nacimiento_Empleado)
VALUES
(10185,'JORGE','2024-05-20'),
(14569,'MICHAEL','1993-11-01'),
(14564,'EMILY','1985-01-27'),
(32553,'MARIAN','1993-02-22'),
(11347,'JENCY','1989-08-07')

GO

select * from Personal.Empleados
GO

	-- Esquema numero 2: personal
CREATE SCHEMA Facturacion 
GO

CREATE TABLE Facturacion.Ventas
(
	ID_Cliente INT PRIMARY KEY, 
	Fecha_Compra DATE NOT NULL,
	Numero_Serie INT, 
	ID_Vendedor INT,
	CONSTRAINT FK_ID_Vendedor_ID_Empleados FOREIGN KEY (ID_Vendedor)
	REFERENCES Personal.Empleados (ID_Empleado)
)
GO

-- Ingresar datos a Tabla ventas

INSERT INTO Facturacion.Ventas(ID_Cliente, Fecha_Compra,Numero_Serie, ID_Vendedor)
VALUES
(108888,'2023-04-20',000001,32553),
(14968,'2022-05-20',000002,32553),
(1685966,'2024-05-28',000002,10185),
(8949845,'2022-09-20',000004,10185),
(475419,'2021-05-29',000003,32553)

GO

select * from Facturacion.Ventas
GO

-- Esquema numero 3: Inventario
CREATE SCHEMA Inventario 
GO

CREATE TABLE Inventario.Productos
(
	Producto Varchar(50) NOT NULL, 
	Numero_Serie INT Unique, 
	Marca Varchar(50) Not null,
)
GO

INSERT INTO Inventario.Productos(Producto,Numero_Serie,Marca)
VALUES
('Marco',000001,'GW'),
('Grupo',000002,'SHIMANO'),
('Grupo',000003,'ALTUS'),
('Bicicleta',000004,'POSEIDON'),
('Frenos',000005,'GIANT')

GO

select * from Inventario.Productos
GO

CREATE TABLE Inventario.Categorias
(
	Numero_Serie INT Unique, 
	Tipo_Producto Varchar(50) Not null,
)
GO

INSERT INTO Inventario.Categorias(Numero_Serie,Tipo_Producto)
VALUES
(000001,'Estructuras y marcos'),
(000002,'Transmision y velocidades'),
(000003,'Transmision y velocidades'),
(000004,'Estructuras y marcos'),
(000005,'Partes varias')

GO
select * from Inventario.Categorias
GO

CREATE TABLE Inventario.Clientes
(
	ID_Cliente INT,
	CONSTRAINT FK_ID_Cliente_ID_Cliente_Facturacion FOREIGN KEY (ID_Cliente)
	REFERENCES Facturacion.Ventas(Id_Cliente),
	Nombre_Cliente VARCHAR(50) NOT NULL, 
	Celular_Cliente Bigint CHECK (Celular_Cliente>1),
	Direccion_Cliente VARCHAR (50) default 'Carrera 1-1'

)
GO



INSERT INTO Inventario.Clientes(ID_Cliente,Nombre_Cliente,Celular_Cliente)
VALUES
(475419,'Gio',3133002244),
(8949845,'Jose',321101144),
(1685966,'Jei',3225252636),
(14968,'Mateo',321252626),
(108888,'Andres',3211411444)

GO

Select * from Inventario.Clientes

CREATE TABLE Inventario.Proveedores
(
	ID_Proveedor INT Unique Not null,
	Nombre_proveedor VARCHAR(50) Unique NOT NULL, 
	Celular_Proveedor Bigint Unique,
)
GO

INSERT INTO Inventario.Proveedores(ID_Proveedor,Nombre_proveedor,Celular_Proveedor)
VALUES
(1001,'BMX Colombia',3138502244),
(1002,'Bici partes Bogota',321401144),
(1003,'Ciclo SERVICIOS',324411146),
(1004,'IMPORTADORA DEPORTIVA SA',32414115626),
(1005,'BICI BICI',3244177744)

GO

Select * from Inventario.Proveedores