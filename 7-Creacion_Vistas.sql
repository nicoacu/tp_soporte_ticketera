----------------------------------------------------------------------
-- VISTA HISTORIAL
----------------------------------------------------------------------


CREATE OR ALTER VIEW dbo.historial AS
SELECT 
    t.TicketID,
    t.FechaCreacion,
    t.TecnicoID AS Tecnico_asignado,
    c.ClienteID,
    c.Email AS ClienteEmail,
    t.Descripcion AS ProblemaReportado,
    t.Estado
FROM 
    dbo.Tickets t
JOIN 
    dbo.Clientes c ON t.ClienteID = c.ClienteID

----------------------------------------------------------------------
-- VISTA REPORTES
----------------------------------------------------------------------

CREATE OR ALTER VIEW dbo.reportes AS
SELECT 
    t.TicketID,
    t.FechaCreacion,
    c.ClienteID,
    c.Nombre AS ClienteNombre,
    c.Email AS ClienteEmail,
    c.Direccion AS ClienteDireccion,
    c.Telefono AS ClienteTelefono,
    t.Descripcion AS ProblemaReportado,
    tec.TecnicoID AS TecnicoNombre,
    tec.Disponibilidad AS Disponibilidad,
    t.Estado
FROM 
    dbo.Tickets t
JOIN 
    dbo.Clientes c ON t.ClienteID = c.ClienteID
LEFT JOIN 
    dbo.Tecnicos tec ON t.TecnicoID = tec.TecnicoID;

