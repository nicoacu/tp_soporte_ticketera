----------------------------------------------------------------------
-- 1- CONSULTA VISTA HISTORIAL
----------------------------------------------------------------------

USE soporte_ticketera;
SELECT * FROM dbo.historial;

----------------------------------------------------------------------
-- 2- EJECUCION STORED PROCEDURE PARA CREAR NUEVO TICKET. Aparece con TicketID = 101
----------------------------------------------------------------------

EXEC sp_crear_ticket 
    @ClienteID = 1, 
    @TecnicoID = 2, 
    @Descripcion = 'El cliente reporta un problema con el sistema.', 
    @Estado = 'Abierto';

----------------------------------------------------------------------
-- 3- CONSULTA VISTA HISTORIAL FILTRADA POR TicketID = 101
----------------------------------------------------------------------

use soporte_ticketera

SELECT * FROM dbo.historial
WHERE TicketID = 101;

----------------------------------------------------------------------
-- 4- EJECUCION STORED PROCEDURE PARA CERRAR TicketID = 101
----------------------------------------------------------------------

use soporte_ticketera;

EXEC dbo.sp_actualizar_estado_ticket 
    @TicketID = 101, 
    @Estado = 'Cerrado';


----------------------------------------------------------------------
-- 5- CONSULTA VISTA HISTORIAL FILTRADA POR TicketID = 101
----------------------------------------------------------------------

use soporte_ticketera

SELECT * FROM dbo.historial
WHERE TicketID = 101;


----------------------------------------------------------------------


----------------------------------------------------------------------
-- OTRAS CONSULTAS  (vista reportes, vista reportes filtrada)
----------------------------------------------------------------------

USE soporte_ticketera;
SELECT * FROM dbo.reportes;

---

use soporte_ticketera;

SELECT * FROM dbo.reportes
WHERE TicketID = 10;

----------------------------------------------------------------------
-- OTRAS EJECUCIONES DE STORED PROCEDURE  (actualizar tickets, crear usuario, crear técnico )
----------------------------------------------------------------------

use soporte_ticketera;

EXEC sp_CreateEndUser 
    @Nombre = 'John Doe',
    @Direccion = '123 Main St',
    @Telefono = '555-1234',
    @Email = 'john.doe@example.com';

---

use soporte_ticketera;

EXEC sp_CreateTechnician 
    @Nombre = 'Jane Smith',
    @Especialidad = 'Networking',
    @Disponibilidad = 1; -- 1 = Disponnible, 0 = No Disponible

