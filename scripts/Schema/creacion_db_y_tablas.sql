-- Línea 1: Crea la base de datos si no existe. Esto previene errores si ya está creada. Usamos utf8mb4 para soporte Unicode.
CREATE DATABASE IF NOT EXISTS sistema_gestion_de_bases_de_datos DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Línea 2: Selecciona la base de datos para ejecutar los siguientes comandos en ella.
USE sistema_gestion_de_bases_de_datos;

-- Línea 3-10: Crea la tabla 'docente'. AUTO_INCREMENT para IDs automáticos, UNIQUE en Documento para evitar duplicados, PRIMARY KEY para indexación eficiente.
CREATE TABLE docente (
    Codigo INT(11) NOT NULL AUTO_INCREMENT,
    Documento VARCHAR(20) NOT NULL UNIQUE,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Titulo VARCHAR(100),
    AnosExperiencia INT(11),
    PRIMARY KEY (Codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Línea 11-18: Crea la tabla 'informatico'. ENUM para tipos restringidos, DECIMAL para costos precisos.
CREATE TABLE informatico (
    Codigo INT(11) NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Tipo ENUM('Frontend', 'Backend', 'Fullstack', 'DevOps', 'Tester') NOT NULL,
    Coste DECIMAL(10,2) NOT NULL,
    Lenguajes VARCHAR(255),
    PRIMARY KEY (Codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Línea 19-30: Crea la tabla 'proyecto'. FOREIGN KEY con ON DELETE SET NULL para mantener integridad si se elimina un docente.
CREATE TABLE proyecto (
    Codigo INT(11) NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Aliado VARCHAR(100),
    Descripcion TEXT,
    Presupuesto DECIMAL(10,2),
    HorasEstimadas INT(11),
    FechaInicio DATE,
    FechaFin DATE,
    DocenteJefe INT(11),
    PRIMARY KEY (Codigo),
    FOREIGN KEY (DocenteJefe) REFERENCES docente(Codigo) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Línea 31-40: Crea la tabla 'gasto'. FOREIGN KEY con ON DELETE CASCADE para eliminar gastos si se borra el proyecto.
CREATE TABLE gasto (
    Codigo INT(11) NOT NULL AUTO_INCREMENT,
    Descripcion TEXT,
    Fecha DATE NOT NULL,
    Importe DECIMAL(10,2) NOT NULL,
    TipoGasto VARCHAR(100),
    ProyectoCodigo INT(11) NOT NULL,
    PRIMARY KEY (Codigo),
    FOREIGN KEY (ProyectoCodigo) REFERENCES proyecto(Codigo) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Línea 41-50: Crea la tabla 'fase'. ENUM para estados controlados.
CREATE TABLE fase (
    NumeroFase INT(11) NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    FechaComienzo DATE,
    FechaFin DATE,
    Estado ENUM('Planificada', 'En Progreso', 'Completada', 'Cancelada') NOT NULL,
    ProyectoCodigo INT(11) NOT NULL,
    PRIMARY KEY (NumeroFase),
    FOREIGN KEY (ProyectoCodigo) REFERENCES proyecto(Codigo) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Línea 51-60: Crea la tabla 'recurso'. ENUM para tipos de recursos.
CREATE TABLE recurso (
    Codigo INT(11) NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Tipo ENUM('Humano', 'Material', 'Software', 'Hardware') NOT NULL,
    PeriodoUtilizado VARCHAR(100),
    FaseNumero INT(11) NOT NULL,
    PRIMARY KEY (Codigo),
    FOREIGN KEY (FaseNumero) REFERENCES fase(NumeroFase) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Línea 61-72: Crea la tabla 'producto'. TINYINT para booleano Finalizado, FOREIGN KEYs para integridad.
CREATE TABLE producto (
    Codigo INT(11) NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Finalizado TINYINT(1) DEFAULT 0,
    FaseNumero INT(11) NOT NULL,
    Responsable INT(11),
    PRIMARY KEY (Codigo),
    FOREIGN KEY (FaseNumero) REFERENCES fase(NumeroFase) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Responsable) REFERENCES informatico(Codigo) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;