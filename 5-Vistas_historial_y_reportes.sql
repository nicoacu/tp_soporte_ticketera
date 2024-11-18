USE soporte_ticketera;
SELECT * FROM dbo.historial;

EXEC sp_crear_ticket 
    @ClienteID = 1, 
    @TecnicoID = 2, 
    @Descripcion = 'VICTOR, EL PANA.', 
    @Estado = 'Abierto';
