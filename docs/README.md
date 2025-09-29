# Documentación del Sistema de Gestión de Bases de Datos

## 1. Estructura de la Base de Datos
- **Tablas principales**:
  - `docente`: Información de docentes
  - `proyecto`: Detalles de proyectos
  - `informatico`: Personal técnico
  - `fase`: Fases de los proyectos
  - `recurso`: Recursos por fase
  - `producto`: Entregables
  - `gasto`: Control de gastos

## 2. Guía Rápida

### Configuración Inicial
1. Ejecutar [scripts/Schema/creacion_db_y_tablas.sql](cci:7://file:///c:/Programacion/IUDigital/Data-Base/project_database/Sistema_Gestion_de_Bases_de_Datos/scripts/Schema/creacion_db_y_tablas.sql:0:0-0:0)
2. Cargar datos iniciales con `scripts/data/inserts_iniciales.sql`

### Consultas Comunes
- Ver proyectos activos
- Consultar docentes
- Revisar gastos por proyecto

## 3. Mantenimiento
- Realizar respaldos periódicos
- Revisar logs de errores
- Actualizar datos según sea necesario

## 4. Soporte
- Contacto: [engineersdevelopersf@gmail.com]
- Horario de atención: Lunes a Viernes, 8am - 5pm