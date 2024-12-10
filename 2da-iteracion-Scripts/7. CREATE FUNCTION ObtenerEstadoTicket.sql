CREATE FUNCTION dbo.ObtenerEstadoTicket (
    @TicketID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        t.TicketID,
        t.SLAID,
        s.Descripcion AS DescripcionSLA,
        DATEDIFF(HOUR, t.FechaCreacion, ISNULL(t.FechaCierre, GETDATE())) AS HorasTranscurridas,
        CASE
            WHEN t.FechaCierre IS NULL THEN 'Ticket en progreso'
            WHEN DATEDIFF(HOUR, t.FechaCreacion, t.FechaCierre) <= s.TiempoResolucionHoras THEN 'Plazo requerido'
            ELSE 'Vencido'
        END AS Estado
    FROM dbo.Tickets t
    JOIN dbo.SLA s ON t.SLAID = s.SLAID
    WHERE t.TicketID = @TicketID
);
