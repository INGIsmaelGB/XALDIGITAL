CREATE DATABASE XD 
USE XD

CREATE TABLE Aerolinea(
	ID_AEROLINEA INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	NOMBRE_AEROLINEA VARCHAR(50)
)

CREATE TABLE Aeropuerto(
	ID_AEROPUERTO INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	NOMBRE_AEROPUERTO VARCHAR(50)
)

CREATE TABLE Movimientos(
	ID_MOVIMIENTO INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	DESCRIPCION VARCHAR(50)
)

CREATE TABLE Vuelos(
	ID_AEROLINEA INT, FOREIGN KEY(ID_AEROLINEA) REFERENCES Aerolinea(ID_AEROLINEA),
	ID_AEROPUERTO INT, FOREIGN KEY(ID_AEROPUERTO) REFERENCES Aeropuerto(ID_AEROPUERTO),
	ID_MOVIMIENTO INT, FOREIGN KEY(ID_MOVIMIENTO) REFERENCES Movimientos(ID_MOVIMIENTO),
	DIA DATE
)

