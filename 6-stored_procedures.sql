---------------------------------------------------------------------------
-- STORED PROCEDURE PARA ACTUALIZACION DE TICKET
---------------------------------------------------------------------------

CREATE PROCEDURE sp_actualizar_estado_ticket
    @TicketID INT,
    @Estado VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validar estado
        IF @Estado NOT IN ('Abierto', 'Cerrado', 'En progreso')
        BEGIN
            THROW 50001, 'El estado proporcionado no es válido. Los valores permitidos son: Abierto, Cerrado, En progreso.', 1;
        END;

        -- Validar Ticket
        IF NOT EXISTS (SELECT 1 FROM dbo.Tickets WHERE TicketID = @TicketID)
        BEGIN
            THROW 50002, 'El TicketID proporcionado no existe.', 1;
        END;

        -- Actualizar ticket
        UPDATE dbo.Tickets
        SET Estado = @Estado
        WHERE TicketID = @TicketID;

        -- Ver info del ticket
        SELECT TicketID, Estado
        FROM dbo.Tickets
        WHERE TicketID = @TicketID;
    END TRY
    BEGIN CATCH
        -- Errores
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

---------------------------------------------------------------------------
-- STORED PROCEDURE PARA CREACION DE TICKET
---------------------------------------------------------------------------


ALTER PROCEDURE sp_crear_ticket
    @ClienteID INT,
    @TecnicoID INT = NULL,
    @Descripcion VARCHAR(MAX),
    @Estado VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validar ClienteID 
        IF NOT EXISTS (SELECT 1 FROM dbo.Clientes WHERE ClienteID = @ClienteID)
        BEGIN
            THROW 51000, 'El ClienteID proporcionado no existe en la base de datos.', 1;
        END;

        -- Validar TecnicoID
        IF @TecnicoID IS NOT NULL AND NOT EXISTS (SELECT 1 FROM dbo.Tecnicos WHERE TecnicoID = @TecnicoID AND Disponibilidad = 1)
        BEGIN
            THROW 51001, 'El TecnicoID proporcionado no existe o no está disponible.', 1;
        END;

        -- Validar estado
        IF @Estado NOT IN ('Abierto', 'Cerrado', 'En progreso')
        BEGIN
            THROW 51002, 'El estado proporcionado no es válido. Los valores permitidos son: Abierto, Cerrado, En progreso.', 1;
        END;

        -- Validar descripción
        IF @Descripcion IS NULL OR LTRIM(RTRIM(@Descripcion)) = ''
        BEGIN
            THROW 51003, 'La descripción del ticket no puede estar vacía.', 1;
        END;

        -- Insertar ticket
        INSERT INTO dbo.Tickets (FechaCreacion, ClienteID, TecnicoID, Descripcion, Estado)
        VALUES (GETDATE(), @ClienteID, @TecnicoID, @Descripcion, @Estado);

        -- Retornar ID
        SELECT SCOPE_IDENTITY() AS NuevoTicketID;
    END TRY
    BEGIN CATCH
        -- Manejo básico de errores
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

--- Cliente

CREATE PROCEDURE sp_CreateEndUser
    @Nombre VARCHAR(255),
    @Direccion VARCHAR(255),
    @Telefono VARCHAR(50),
    @Email VARCHAR(255)
AS
BEGIN
    -- Validate mandatory fields
    IF (@Nombre IS NULL OR @Direccion IS NULL OR @Telefono IS NULL OR @Email IS NULL)
    BEGIN
        RAISERROR ('All fields are required to create an end-user.', 16, 1);
        RETURN;
    END

    INSERT INTO dbo.Clientes (Nombre, Direccion, Telefono, Email, FechaRegistro)
    VALUES (@Nombre, @Direccion, @Telefono, @Email, GETDATE());

    PRINT 'End-user created successfully.';
END;

--- Tecnico

CREATE PROCEDURE sp_CreateTechnician
    @Nombre VARCHAR(255),
    @Especialidad VARCHAR(100),
    @Disponibilidad BIT
AS
BEGIN
    -- Validate mandatory fields
    IF (@Nombre IS NULL OR @Disponibilidad IS NULL)
    BEGIN
        RAISERROR ('Name and availability are required to create a technician.', 16, 1);
        RETURN;
    END

    INSERT INTO dbo.Tecnicos (Nombre, Especialidad, Disponibilidad)
    VALUES (@Nombre, @Especialidad, @Disponibilidad);

    PRINT 'Technician created successfully.';
END;