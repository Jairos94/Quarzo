CREATE DATABASE BDCrudTest;
GO

USE BDCrudTest;
GO

CREATE TABLE coCategoria
(
	nIdCategori INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	cNombCateg VARCHAR (50) NOT NULL,
	cEsActiva INT not null
)
GO
--Corresponde a es activa
--0 ACTIVA
--1 Noa ctiva

INSERT INTO coCategoria(cNombCateg,cEsActiva) VALUES ('Muebles',0),('Temporada escolar',0)
GO

CREATE TABLE coProducto
(
	nIdProduct INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	cNombProdu VARCHAR(50) NOT NULL,
	nPrecioProd FLOAT NOT NULL,
	nIdCategori INT FOREIGN KEY(nIdCategori) REFERENCES coCategoria(nIdCategori)
)
GO
INSERT INTO coProducto(cNombProdu,nPrecioProd,nIdCategori) VALUES   ('Escritorio',100000,1),
																	('Silla gamer',80000,1),
																	('Ropero',180000,1),
																	('Lacicero',1000,2),
																	('Borrador',100,2),
																	('Goma',2000,2)

go

CREATE PROCEDURE  Usp_Sel_Co_Productos
 @idCategoria int 
	AS
    BEGIN
	  SELECT P.* FROM coProducto P
	  WHERE P.nIdCategori=@idCategoria
   END
GO