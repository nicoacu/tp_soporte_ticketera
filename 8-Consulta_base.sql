Consultar vistas:

USE soporte_ticketera;
SELECT * FROM dbo.historial;

USE soporte_ticketera;
SELECT * FROM dbo.reportes;

Consultar vista "Historial" con parametros:

use soporte_ticketera

SELECT * FROM dbo.historial
WHERE ClienteID = 10;

Consultar vista "Reportes" con parametros:
use soporte_ticketera

SELECT * FROM dbo.reportes
WHERE TicketID = 10;

Carga de ticket con stored procedure sp_crear_ticket:

use soporte_ticketera

EXEC sp_crear_ticket 
    @ClienteID = 1, 
    @TecnicoID = 2, 
    @Descripcion = 'El cliente reporta un problema con el sistema.', 
    @Estado = 'Abierto';

Modificacion de ticket con stored procedure sp_crear_ticket:

use soporte_ticketera

EXEC dbo.sp_actualizar_estado_ticket 
    @TicketID = 101, 
    @Estado = 'Cerrado';


Carga de usuario:

EXEC sp_CreateEndUser 
    @Nombre = 'John Doe',
    @Direccion = '123 Main St',
    @Telefono = '555-1234',
    @Email = 'john.doe@example.com';

Carga de tecnico:

EXEC sp_CreateTechnician 
    @Nombre = 'Jane Smith',
    @Especialidad = 'Networking',
    @Disponibilidad = 1; -- 1 = Available, 0 = Not Available

