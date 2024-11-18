USE master;

CREATE LOGIN mate WITH PASSWORD = 'Ticketera123!';
CREATE LOGIN fede WITH PASSWORD = 'Ticketera123!';
CREATE LOGIN flor WITH PASSWORD = 'Ticketera123!';
CREATE LOGIN nico WITH PASSWORD = 'Ticketera123!';

-- Switch to the database where the user needs access
USE soporte_ticketera;

-- Create a user in the database linked to the login
CREATE USER mate_user FOR LOGIN mate;
CREATE USER fede_user FOR LOGIN fede;
CREATE USER flor_user FOR LOGIN flor;
CREATE USER nico_user FOR LOGIN nico;

-- ALTER ROLE db_owner ADD MEMBER grupo_admin;

ALTER ROLE db_owner ADD MEMBER mate_user;
ALTER ROLE db_owner ADD MEMBER fede_user;
ALTER ROLE db_owner ADD MEMBER flor_user;
ALTER ROLE db_owner ADD MEMBER nico_user;