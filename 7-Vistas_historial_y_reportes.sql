----------------------------------------------------------------------
-- VISTA HISTORIAL
----------------------------------------------------------------------


CREATE OR ALTER VIEW Historial AS
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
LEFT JOIN 
    dbo.Tecnicos te ON t.TecnicoID = te.TecnicoID;

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
    t.TecnicoID AS TecnicoNombre,
    t.Descripcion AS ProblemaReportado,
    t.Estado
FROM 
    dbo.Tickets t
JOIN 
    dbo.Clientes c ON t.ClienteID = c.ClienteID
LEFT JOIN 
    dbo.Tecnicos tec ON t.TecnicoID = tec.TecnicoID;
