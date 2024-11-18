----------------------------------------------------------------------
-- CREACION USUARIOS EN BASE soporte_ticketera; Los usuarios estan vinculados a los Logins de la query 0-Creacion_Login.sql
----------------------------------------------------------------------

USE soporte_ticketera;

CREATE USER mate_user FOR LOGIN mate;
CREATE USER fede_user FOR LOGIN fede;
CREATE USER flor_user FOR LOGIN flor;
CREATE USER nico_user FOR LOGIN nico;

ALTER ROLE db_owner ADD MEMBER mate_user;
ALTER ROLE db_owner ADD MEMBER fede_user;
ALTER ROLE db_owner ADD MEMBER flor_user;
ALTER ROLE db_owner ADD MEMBER nico_user;