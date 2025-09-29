# Sistema de Gestión de Bases de Datos

##  Descripción del Proyecto
Sistema integral de gestión de proyectos académicos desarrollado para la Universidad IUDigital. Esta plataforma permite la administración eficiente de proyectos, docentes, recursos informáticos, fases de desarrollo y productos generados, optimizando los procesos de planificación y ejecución de proyectos académicos.

##  Estructura del Proyecto

```
Sistema_Gestion_de_Bases_de_Datos/
├── docs/                    # Documentación del proyecto
│   └── README.md            # Documentación general
├── scripts/                 # Scripts SQL
│   ├── Schema/              # Esquema de la base de datos
│   │   └── creacion_db_y_tablas.sql
│   ├── backup/              # Copias de seguridad
│   ├── data/                # Datos iniciales
│   └── security/            # Gestión de usuarios y permisos
└── README.md                # Este archivo
```


##  Tablas Principales

### 1. Docente
- **Propósito**: Gestiona la información de los docentes involucrados en los proyectos.
- **Campos clave**: Código, Documento, Nombre, Título, Años de experiencia.
- **Relaciones**: Jefe de proyecto (uno a muchos con Proyecto).

### 2. Informático
- **Propósito**: Registra a los profesionales de TI que participan en los proyectos.
- **Campos clave**: Código, Nombre, Tipo (Frontend, Backend, etc.), Coste, Lenguajes.
- **Relaciones**: Responsable de productos (uno a muchos con Producto).

### 3. Proyecto
- **Propósito**: Almacena la información central de cada proyecto académico.
- **Campos clave**: Código, Nombre, Aliado, Presupuesto, Horas estimadas, Fechas.
- **Relaciones**: Docente jefe (muchos a uno con Docente).

### 4. Fase
- **Propósito**: Organiza el proyecto en etapas temporales.
- **Campos clave**: Número de fase, Nombre, Fechas, Estado (Planificada, En Progreso, etc.).
- **Relaciones**: Pertenece a un Proyecto (muchos a uno).

### 5. Recurso
- **Propósito**: Gestiona los recursos asignados a cada fase.
- **Campos clave**: Código, Nombre, Tipo (Humano, Material, etc.), Período de uso.
- **Relaciones**: Pertenece a una Fase (muchos a uno).

### 6. Producto
- **Propósito**: Registra los entregables generados en cada fase.
- **Campos clave**: Código, Nombre, Descripción, Estado de finalización.
- **Relaciones**: Pertenece a una Fase (muchos a uno), tiene un Informático responsable (muchos a uno).

### 7. Gasto
- **Propósito**: Controla los gastos asociados a los proyectos.
- **Campos clave**: Código, Descripción, Fecha, Importe, Tipo de gasto.
- **Relaciones**: Pertenece a un Proyecto (muchos a uno).

##  Características Principales

### Gestión Integral de Proyectos
- Planificación detallada de proyectos con presupuesto y cronograma.
- Seguimiento de fases y entregables.
- Control de gastos y recursos.

### Administración de Recursos
- Registro de docentes y personal informático.
- Asignación de roles y responsabilidades.
- Gestión de costos por recurso.

### Seguridad y Control
- Integridad referencial asegurada mediante claves foráneas.
- Tipos de datos específicos para cada campo.
- Restricciones de eliminación en cascada donde aplica.

##  Requisitos Técnicos

### Base de Datos
- **Motor**: MySQL o MariaDB
- **Versión**: 5.7 o superior
- **Juego de caracteres**: UTF-8 (utf8mb4)
- **Motor de almacenamiento**: InnoDB

### Scripts de Base de Datos
- `Schema/creacion_db_y_tablas.sql`: Script principal de creación de la base de datos y tablas.
- `data/inserts_iniciales.sql`: Datos iniciales para pruebas.
- `backup/`: Directorio para copias de seguridad.
- `security/`: Scripts de gestión de usuarios y permisos.


##  Convenciones de Nomenclatura

### Base de Datos
- **Tablas**: Nombres en minúscula y singular (ej: `docente`, `proyecto`)
- **Columnas**: `camelCase` (ej: `fechaInicio`, `codigoProyecto`)
- **Claves primarias**: `Codigo` (para tablas principales), `NumeroFase` (para la tabla fase)
- **Claves foráneas**: `TablaReferenciada_Campo` (ej: `DocenteJefe`)

### Scripts SQL
- Nombres descriptivos en minúsculas con guiones bajos
- Comentarios explicativos para cada sección
- Sentencias en mayúsculas (CREATE, SELECT, etc.)

##  Notas de Implementación

### Consideraciones de Rendimiento
- Índices en claves foráneas para optimizar consultas
- Tipos de datos apropiados para cada campo
- Restricciones de integridad referencial

### Buenas Prácticas Implementadas
- Uso de transacciones para operaciones críticas
- Nombres descriptivos para tablas y columnas
- Documentación en línea del esquema
- Manejo adecuado de valores nables

##  Licencia
Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.



