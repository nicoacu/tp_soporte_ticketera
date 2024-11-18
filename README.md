# Trabajo Práctico/Exposicion: Administración de Bases de Datos
#### 75883-2024-2C-Infraestructuras 22-División A-Día martes

**Alumnos:**
- Mateo Parra
- Florencia Ponce de León 
- Federico Tesone
- Nicolás Acuña

# Draft Diagrama Entidad Relacion (Primera Presentacion) 
![alt text](https://i.imgur.com/ROF0WEs.png)
<i>[link a presentación](https://www.canva.com/design/DAGW156nKBs/-WWN8APy9T1_6QDJaYPv2Q/edit?utm_content=DAGW156nKBs&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)</i>

# Diagrama Entidad Relacion (Actual)

![(imagen)](https://i.imgur.com/w5ZME0G.png)
<i>[link imagen](https://i.imgur.com/w5ZME0G.png)</i>

# Vistas

## Vista Historial

![(imagen)](https://i.imgur.com/Vh1oED5.png)
<i>[link imagen](https://i.imgur.com/Vh1oED5.png)</i>

## Vista Reportes

![(imagen)](https://i.imgur.com/sLxkgiz.png)
<i>[link imagen](https://i.imgur.com/sLxkgiz.png)</i>


# Guía de Referencia del Repositorio:

### Introducción:
Este repositorio utilizado para el trabajo práctico cuenta con 9 archivos de consulta `.sql`. Se le ha asignado a cada uno un número en el nombre para señalizar el orden de ejecución de los mismos:

Antes de la ejecución de cada script, es necesario constatar la conexión a la base de datos. En nuestro caso, la misma se encuentra desplegada como servicio en Azure bajo el dominio `ticketera.database.windows.net`:

![(imagen)](https://i.imgur.com/iL7YZZZ.png)
<i>[link imagen](https://i.imgur.com/iL7YZZZ.png)</i>

---

### Orden de Scripts:

`0-Creacion_Login.sql` : Se generan Logins para cada uno de los usuarios (integrantes del grupo). Los logins se generan con una cuenta de administrador sobre la base `master`.

> Nota: Las contraseñas son a fines demostrativos.

`1-Creacion_Database.sql` : Se genera la base del negocio: `soporte_ticketera` junto con sus tablas: `dbo.clientes`, `dbo.tickets` y `dbo.tecnicos`

`2-Creacion_Usuarios.sql` : Se crean los USERS (por cada uno de los integrantes del grupo) que se van a poder conectar a la base `soporte_ticketera`. Se le asigna a cada uno el rol de `db_owner` a modo de demo.

> Nota: Si bien no es una buena práctica generalizar los permisos/roles de esa manera, a fines de demostración y dado que esto no es un entorno productivo se lo realiza asi destacando simplemente la importancia de gestionar usuarios.

`3-Insertar_Clientes.sql` : En esta query se autocompletan cammpos de la tabla `dbo.clientes` como mockup y para fines demostrativos. 

`4-Insertar_Tecnicos.sql` : En esta query se autocompletan cammpos de la tabla `dbo.tecnicos` como mockup y para fines demostrativos. 

`5-Insertar_Tickets.sql` : En esta query se autocompletan cammpos de la tabla `dbo.tickets` como mockup y para fines demostrativos. 

`6-Creacion_Stored_Procedures.sql` : Queries para que programaticamente se ejecuten acciones prediseñadas sobre la base utilizando el codigo del negocio. En este caso, se contemplaron la generación de Stored Procedures para las siguientes funcionalidades:

- 1- Creacion Ticket.
- 2- Actualizacion Ticket.
- 3- Creacion Cliente.
- 4- Creacion Técnico.

`7-Creacion_Vistas.sql` : Vistas para ejecutar consultas prediseñadas y optimizar el uso de recursos. Esto no se ejecuta a traves de un store procedure porque al hacer consultas no queremos exponenciar el tamaño de la base y consumir recursos.

`8-Consultas_y_Execs.sql` : Queries demostrativos para realizar consultas a las vistas creadas, ejecuciones de stored procedures y resultados posteriores. 