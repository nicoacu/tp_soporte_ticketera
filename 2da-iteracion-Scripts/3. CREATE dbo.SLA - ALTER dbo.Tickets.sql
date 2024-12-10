USE soporte_ticketera;

CREATE TABLE dbo.SLA (
    SLAID INT PRIMARY KEY NOT NULL,  
    Descripcion VARCHAR(50) NOT NULL UNIQUE,
    TiempoResolucionHoras INT NOT NULL, 
    CONSTRAINT CK_SLA_Descripcion CHECK (Descripcion IN ('Urgente', 'Alta', 'Media', 'Baja', 'Programado')), 
    CONSTRAINT CK_SLA_Tiempo CHECK (
        (SLAID = 1 AND Descripcion = 'Urgente' AND TiempoResolucionHoras = 3) OR
        (SLAID = 2 AND Descripcion = 'Alta' AND TiempoResolucionHoras = 12) OR
        (SLAID = 3 AND Descripcion = 'Media' AND TiempoResolucionHoras = 24) OR
        (SLAID = 4 AND Descripcion = 'Baja' AND TiempoResolucionHoras = 48) OR
        (SLAID = 5 AND Descripcion = 'Programado' AND TiempoResolucionHoras > 48)
    )
);

ALTER TABLE dbo.Tickets
ADD SLAID INT NOT NULL;

ALTER TABLE dbo.Tickets
ADD CONSTRAINT FK_Tickets_SLA FOREIGN KEY (SLAID) REFERENCES dbo.SLA(SLAID);
