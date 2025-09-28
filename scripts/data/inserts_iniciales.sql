-- Línea 1: Selecciona la DB para los inserts.
USE proyectos_informaticos;

--  Inserta 10 registros en 'docente'. NULL en Codigo para AUTO_INCREMENT. Valores únicos en Documento.
INSERT INTO docente (Codigo, Documento, Nombre, Direccion, Titulo, AnosExperiencia) VALUES
(NULL, 'DOC001', 'Juan Pérez', 'Calle 1 #12-34, Bogotá', 'Ingeniero', 10),
(NULL, 'DOC002', 'María Gómez', 'Avenida 2 #56-78, Medellín', 'Licenciada', 8),
(NULL, 'DOC003', 'Carlos López', 'Carrera 3 #98-76, Cali', 'Magíster', 12),
(NULL, 'DOC004', 'Ana Martínez', 'Calle 4 #43-21, Barranquilla', 'Doctorado', 15),
(NULL, 'DOC005', 'Pedro Sánchez', 'Avenida 5 #67-89, Cartagena', 'Ingeniero', 7),
(NULL, 'DOC006', 'Laura Díaz', 'Carrera 6 #23-45, Bucaramanga', 'Licenciada', 9),
(NULL, 'DOC007', 'José Ramírez', 'Calle 7 #87-65, Pereira', 'Magíster', 11),
(NULL, 'DOC008', 'Sofía Hernández', 'Avenida 8 #34-12, Cúcuta', 'Doctorado', 13),
(NULL, 'DOC009', 'Miguel Torres', 'Carrera 9 #56-78, Manizales', 'Ingeniero', 6),
(NULL, 'DOC010', 'Elena Ruiz', 'Calle 10 #90-12, Santa Marta', 'Licenciada', 8);

--  Inserta 10 registros en 'informatico'. ENUM válido en Tipo.
INSERT INTO informatico (Codigo, Nombre, Tipo, Coste, Lenguajes) VALUES
(NULL, 'Luis Fernández', 'Frontend', 5000.00, 'JavaScript, HTML, CSS'),
(NULL, 'Ana Rodríguez', 'Backend', 6000.00, 'Python, Java'),
(NULL, 'Jorge Castillo', 'Fullstack', 7000.00, 'JavaScript, Node.js, SQL'),
(NULL, 'Clara Morales', 'DevOps', 6500.00, 'Docker, Kubernetes'),
(NULL, 'Diego Soto', 'Tester', 4500.00, 'Selenium, JUnit'),
(NULL, 'Paula Vargas', 'Frontend', 5200.00, 'React, Angular'),
(NULL, 'Ricardo Peña', 'Backend', 5800.00, 'PHP, MySQL'),
(NULL, 'Marta López', 'Fullstack', 7200.00, 'Ruby, Rails'),
(NULL, 'Javier Ortiz', 'DevOps', 6300.00, 'AWS, Terraform'),
(NULL, 'Lucía Gómez', 'Tester', 4700.00, 'Postman, TestNG');

-- Inserta 10 registros en 'proyecto'. Referencia a DocenteJefe (IDs 1-10 asumiendo AUTO_INCREMENT inicia en 1).
INSERT INTO proyecto (Codigo, Nombre, Aliado, Descripcion, Presupuesto, HorasEstimadas, FechaInicio, FechaFin, DocenteJefe) VALUES
(NULL, 'Proyecto A', 'Aliado 1', 'Desarrollo de sistema web', 50000.00, 200, '2025-09-01', '2025-12-01', 1),
(NULL, 'Proyecto B', 'Aliado 2', 'Aplicación móvil', 75000.00, 300, '2025-09-15', '2026-01-15', 2),
(NULL, 'Proyecto C', 'Aliado 3', 'Infraestructura cloud', 60000.00, 250, '2025-10-01', '2026-02-01', 3),
(NULL, 'Proyecto D', 'Aliado 4', 'Automatización', 45000.00, 180, '2025-09-20', '2025-12-20', 4),
(NULL, 'Proyecto E', 'Aliado 5', 'Análisis de datos', 80000.00, 350, '2025-10-10', '2026-03-10', 5),
(NULL, 'Proyecto F', 'Aliado 6', 'Soporte técnico', 55000.00, 220, '2025-09-25', '2025-12-25', 6),
(NULL, 'Proyecto G', 'Aliado 7', 'Desarrollo API', 70000.00, 280, '2025-10-05', '2026-01-05', 7),
(NULL, 'Proyecto H', 'Aliado 8', 'Seguridad', 65000.00, 240, '2025-09-30', '2025-12-30', 8),
(NULL, 'Proyecto I', 'Aliado 9', 'Interfaz de usuario', 48000.00, 190, '2025-10-15', '2026-02-15', 9),
(NULL, 'Proyecto J', 'Aliado 10', 'Optimización', 90000.00, 400, '2025-10-01', '2026-03-01', 10);

-- Inserta 10 registros en 'gasto'. Referencia a ProyectoCodigo (1-10).
INSERT INTO gasto (Codigo, Descripcion, Fecha, Importe, TipoGasto, ProyectoCodigo) VALUES
(NULL, 'Compra de equipo', '2025-09-10', 5000.00, 'Hardware', 1),
(NULL, 'Licencias software', '2025-09-15', 3000.00, 'Software', 2),
(NULL, 'Viajes', '2025-09-20', 2000.00, 'Viaje', 3),
(NULL, 'Mantenimiento', '2025-09-25', 1500.00, 'Servicios', 4),
(NULL, 'Materiales', '2025-10-01', 4000.00, 'Material', 5),
(NULL, 'Capacitación', '2025-10-05', 2500.00, 'Capacitación', 6),
(NULL, 'Alquiler', '2025-10-10', 3500.00, 'Infraestructura', 7),
(NULL, 'Suministros', '2025-10-15', 1800.00, 'Suministros', 8),
(NULL, 'Consultoría', '2025-10-20', 6000.00, 'Servicios', 9),
(NULL, 'Publicidad', '2025-10-25', 2200.00, 'Marketing', 10);

-- Inserta 10 registros en 'fase'. Referencia a ProyectoCodigo (1-10).
INSERT INTO fase (NumeroFase, Nombre, FechaComienzo, FechaFin, Estado, ProyectoCodigo) VALUES
(NULL, 'Fase 1', '2025-09-01', '2025-09-30', 'Planificada', 1),
(NULL, 'Fase 2', '2025-10-01', '2025-10-31', 'En Progreso', 2),
(NULL, 'Fase 3', '2025-11-01', '2025-11-30', 'Completada', 3),
(NULL, 'Fase 4', '2025-12-01', '2025-12-31', 'Planificada', 4),
(NULL, 'Fase 5', '2025-09-15', '2025-10-15', 'En Progreso', 5),
(NULL, 'Fase 6', '2025-10-15', '2025-11-15', 'Completada', 6),
(NULL, 'Fase 7', '2025-11-15', '2025-12-15', 'Planificada', 7),
(NULL, 'Fase 8', '2025-09-20', '2025-10-20', 'En Progreso', 8),
(NULL, 'Fase 9', '2025-10-20', '2025-11-20', 'Completada', 9),
(NULL, 'Fase 10', '2025-11-20', '2025-12-20', 'Planificada', 10);

--  Inserta 10 registros en 'recurso'. Referencia a FaseNumero (1-10).
INSERT INTO recurso (Codigo, Nombre, Descripcion, Tipo, PeriodoUtilizado, FaseNumero) VALUES
(NULL, 'Desarrollador', 'Recurso humano', 'Humano', '2025-09', 1),
(NULL, 'Servidor', 'Equipo de cómputo', 'Hardware', '2025-10', 2),
(NULL, 'Software X', 'Licencia de software', 'Software', '2025-11', 3),
(NULL, 'Material A', 'Suministros varios', 'Material', '2025-12', 4),
(NULL, 'Analista', 'Recurso humano', 'Humano', '2025-09', 5),
(NULL, 'Router', 'Equipo de red', 'Hardware', '2025-10', 6),
(NULL, 'Herramienta Y', 'Software de diseño', 'Software', '2025-11', 7),
(NULL, 'Papel', 'Suministros oficina', 'Material', '2025-12', 8),
(NULL, 'Técnico', 'Recurso humano', 'Humano', '2025-09', 9),
(NULL, 'Monitor', 'Equipo de visualización', 'Hardware', '2025-10', 10);

-- Inserta 10 registros en 'producto'. Referencia a FaseNumero (1-10) y Responsable (1-10).
INSERT INTO producto (Codigo, Nombre, Descripcion, Finalizado, FaseNumero, Responsable) VALUES
(NULL, 'Diseño UI', 'Interfaz de usuario inicial', 0, 1, 1),
(NULL, 'API Backend', 'Servicio de backend', 1, 2, 2),
(NULL, 'Documento Plan', 'Plan del proyecto', 1, 3, 3),
(NULL, 'Pruebas QA', 'Resultados de pruebas', 0, 4, 4),
(NULL, 'Base Datos', 'Estructura de datos', 1, 5, 5),
(NULL, 'Manual Usuario', 'Guía de uso', 0, 6, 6),
(NULL, 'Código Fuente', 'Código del sistema', 1, 7, 7),
(NULL, 'Informe Progreso', 'Reporte de avance', 0, 8, 8),
(NULL, 'Prototipo', 'Prototipo funcional', 1, 9, 9),
(NULL, 'Configuración', 'Configuración servidor', 0, 10, 10);