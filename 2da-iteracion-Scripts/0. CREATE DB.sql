CREATE DATABASE soporte_ticketera;

USE soporte_ticketera;

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

CREATE TABLE dbo.Tickets (
    TicketID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,   
    FechaCreacion DATE NOT NULL, 
    ClienteID INT NOT NULL,
    TecnicoID INT, 
    Descripcion VARCHAR(MAX),
    Estado VARCHAR(50) NOT NULL, 
    FechaCierre DATE NULL, 
    FOREIGN KEY (ClienteID) REFERENCES dbo.Clientes(ClienteID),
    FOREIGN KEY (TecnicoID) REFERENCES dbo.Tecnicos(TecnicoID),
    CONSTRAINT CK_Tickets_Estado CHECK (Estado IN ('Abierto', 'Cerrado', 'En progreso')), 
    CONSTRAINT CK_Tickets_FechaCierre CHECK (         -- Validación para FechaCierre
        (Estado = 'Cerrado' AND FechaCierre IS NOT NULL) OR
        (Estado IN ('Abierto', 'En progreso') AND FechaCierre IS NULL)
    )
);