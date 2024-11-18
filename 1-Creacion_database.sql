----------------------------------------------------------------------
-- CREACION BASE soporte_ticketera
----------------------------------------------------------------------

CREATE DATABASE soporte_ticketera;

USE soporte_ticketera;

----------------------------------------------------------------------
-- CREACION TABLAS Clientes, Tecnicos, Tickets
----------------------------------------------------------------------

CREATE TABLE dbo.Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,  
    Nombre VARCHAR(255) NOT NULL,                      
    Direccion VARCHAR(255) NOT NULL,                   
    Telefono VARCHAR(50) NOT NULL,                     
    Email VARCHAR(255) NOT NULL,                       
    FechaRegistro DATE NOT NULL                        
);

-- Crear tabla Tecnicos
CREATE TABLE dbo.Tecnicos (
    TecnicoID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,  
    Nombre VARCHAR(255) NOT NULL,                     
    Especialidad VARCHAR(100),                        
    Disponibilidad BIT NOT NULL                       
);

-- Crear tabla Tickets
CREATE TABLE dbo.Tickets (
    TicketID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,   
    FechaCreacion DATE NOT NULL,                      
    ClienteID INT NOT NULL,                           
    TecnicoID INT,                                    
    Descripcion VARCHAR(MAX),
    Estado VARCHAR(50) NOT NULL,                     
    FOREIGN KEY (ClienteID) REFERENCES dbo.Clientes(ClienteID),
    FOREIGN KEY (TecnicoID) REFERENCES dbo.Tecnicos(TecnicoID),
    CONSTRAINT CK_Tickets_Estado CHECK (Estado IN ('Abierto', 'Cerrado', 'En progreso'))
);
