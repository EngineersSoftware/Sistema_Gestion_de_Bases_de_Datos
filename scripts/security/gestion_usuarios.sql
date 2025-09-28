-- Crea el usuario 'usuario_evidencia' con contraseña (cámbiala por una segura). Host '%' permite acceso remoto.
CREATE USER 'usuario_evidencia'@'%' IDENTIFIED BY 'password_segura';

--  Otorga SELECT en todas las tablas de la base de datos 'proyectos_informaticos'. 
-- Esto permite solo lecturas, denegando implícitamente INSERT, UPDATE, DELETE al no otorgarlos.
GRANT SELECT ON proyectos_informaticos.* TO 'usuario_evidencia'@'%';

-- Revoca explícitamente INSERT, UPDATE y DELETE para mayor claridad y seguridad.
REVOKE INSERT, UPDATE, DELETE ON proyectos_informaticos.* FROM 'usuario_evidencia'@'%';
FLUSH PRIVILEGES; -- Aplica los cambios de permisos inmediatamente.

-- Crea el usuario 'usuario_prueba' con contraseña (cámbiala por una segura).
CREATE USER 'usuario_prueba'@'%' IDENTIFIED BY 'password_segura';

-- Otorga SELECT, INSERT, UPDATE en todas las tablas. Permite modificaciones pero no eliminaciones.
GRANT SELECT, INSERT, UPDATE ON proyectos_informaticos.* TO 'usuario_prueba'@'%';

-- Revoca explícitamente DELETE para cumplir con los requisitos.
REVOKE DELETE ON proyectos_informaticos.* FROM 'usuario_prueba'@'%';
FLUSH PRIVILEGES; -- Aplica los cambios de permisos inmediatamente.