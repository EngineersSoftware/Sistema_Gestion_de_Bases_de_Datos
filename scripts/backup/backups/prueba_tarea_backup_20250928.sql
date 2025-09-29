-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: prueba_tarea
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `Documento` varchar(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Titulo` varchar(100) DEFAULT NULL,
  `AnosExperiencia` int DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `Documento` (`Documento`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (2,'DOC002','María Gómez','Avenida 2 #56-78, Medellín','Licenciada',8),(3,'DOC003','Carlos López','Carrera 3 #98-76, Cali','Magíster',12),(4,'DOC004','Ana Martínez','Calle 4 #43-21, Barranquilla','Doctorado',15),(5,'DOC005','Pedro Sánchez','Avenida 5 #67-89, Cartagena','Ingeniero',7),(6,'DOC006','Laura Díaz','Carrera 6 #23-45, Bucaramanga','Licenciada',9),(7,'DOC007','José Ramírez','Calle 7 #87-65, Pereira','Magíster',11),(8,'DOC008','Sofía Hernández','Avenida 8 #34-12, Cúcuta','Doctorado',13),(9,'DOC009','Miguel Torres','Carrera 9 #56-78, Manizales','Ingeniero',6),(10,'DOC010','Elena Ruiz','Calle 10 #90-12, Santa Marta','Licenciada',8);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fase`
--

DROP TABLE IF EXISTS `fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fase` (
  `NumeroFase` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `FechaComienzo` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Estado` enum('Planificada','En Progreso','Completada','Cancelada') NOT NULL,
  `ProyectoCodigo` int NOT NULL,
  PRIMARY KEY (`NumeroFase`),
  KEY `ProyectoCodigo` (`ProyectoCodigo`),
  CONSTRAINT `fase_ibfk_1` FOREIGN KEY (`ProyectoCodigo`) REFERENCES `proyecto` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fase`
--

LOCK TABLES `fase` WRITE;
/*!40000 ALTER TABLE `fase` DISABLE KEYS */;
INSERT INTO `fase` VALUES (1,'Fase 1','2025-09-01','2025-09-30','Planificada',1),(2,'Fase 2','2025-10-01','2025-10-31','En Progreso',2),(3,'Fase 3','2025-11-01','2025-11-30','Completada',3),(4,'Fase 4','2025-12-01','2025-12-31','Planificada',4),(5,'Fase 5','2025-09-15','2025-10-15','En Progreso',5),(6,'Fase 6','2025-10-15','2025-11-15','Completada',6),(7,'Fase 7','2025-11-15','2025-12-15','Planificada',7),(8,'Fase 8','2025-09-20','2025-10-20','En Progreso',8),(9,'Fase 9','2025-10-20','2025-11-20','Completada',9),(10,'Fase 10','2025-11-20','2025-12-20','Planificada',10);
/*!40000 ALTER TABLE `fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gasto`
--

DROP TABLE IF EXISTS `gasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gasto` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `Descripcion` text,
  `Fecha` date NOT NULL,
  `Importe` decimal(10,2) NOT NULL,
  `TipoGasto` varchar(100) DEFAULT NULL,
  `ProyectoCodigo` int NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `ProyectoCodigo` (`ProyectoCodigo`),
  CONSTRAINT `gasto_ibfk_1` FOREIGN KEY (`ProyectoCodigo`) REFERENCES `proyecto` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gasto`
--

LOCK TABLES `gasto` WRITE;
/*!40000 ALTER TABLE `gasto` DISABLE KEYS */;
INSERT INTO `gasto` VALUES (1,'Compra de equipo','2025-09-10',5000.00,'Hardware',1),(2,'Licencias software','2025-09-15',3000.00,'Software',2),(3,'Viajes','2025-09-20',2000.00,'Viaje',3),(4,'Mantenimiento','2025-09-25',1500.00,'Servicios',4),(5,'Materiales','2025-10-01',4000.00,'Material',5),(6,'Capacitación','2025-10-05',2500.00,'Capacitación',6),(7,'Alquiler','2025-10-10',3500.00,'Infraestructura',7),(8,'Suministros','2025-10-15',1800.00,'Suministros',8),(9,'Consultoría','2025-10-20',6000.00,'Servicios',9),(10,'Publicidad','2025-10-25',2200.00,'Marketing',10);
/*!40000 ALTER TABLE `gasto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informatico`
--

DROP TABLE IF EXISTS `informatico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informatico` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Tipo` enum('Frontend','Backend','Fullstack','DevOps','Tester') NOT NULL,
  `Coste` decimal(10,2) NOT NULL,
  `Lenguajes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informatico`
--

LOCK TABLES `informatico` WRITE;
/*!40000 ALTER TABLE `informatico` DISABLE KEYS */;
INSERT INTO `informatico` VALUES (2,'Ana Rodríguez','Backend',6000.00,'Python, Java'),(3,'Jorge Castillo','Fullstack',7000.00,'JavaScript, Node.js, SQL'),(4,'Clara Morales','DevOps',6500.00,'Docker, Kubernetes'),(5,'Diego Soto','Tester',4500.00,'Selenium, JUnit'),(6,'Paula Vargas','Frontend',5200.00,'React, Angular'),(7,'Ricardo Peña','Backend',5800.00,'PHP, MySQL'),(8,'Marta López','Fullstack',7200.00,'Ruby, Rails'),(9,'Javier Ortiz','DevOps',6300.00,'AWS, Terraform'),(10,'Lucía Gómez','Tester',4700.00,'Postman, TestNG'),(11,'Test Dev','Frontend',5000.00,'JS');
/*!40000 ALTER TABLE `informatico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text,
  `Finalizado` tinyint(1) DEFAULT '0',
  `FaseNumero` int NOT NULL,
  `Responsable` int DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `FaseNumero` (`FaseNumero`),
  KEY `Responsable` (`Responsable`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`FaseNumero`) REFERENCES `fase` (`NumeroFase`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`Responsable`) REFERENCES `informatico` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Diseño UI','Interfaz de usuario inicial',0,1,NULL),(2,'API Backend','Servicio de backend',1,2,2),(3,'Documento Plan','Plan del proyecto',1,3,3),(4,'Pruebas QA','Resultados de pruebas',0,4,4),(5,'Base Datos','Estructura de datos',1,5,5),(6,'Manual Usuario','Guía de uso',0,6,6),(7,'Código Fuente','Código del sistema',1,7,7),(8,'Informe Progreso','Reporte de avance',0,8,8),(9,'Prototipo','Prototipo funcional',1,9,9),(10,'Configuración','Configuración servidor',0,10,10);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Aliado` varchar(100) DEFAULT NULL,
  `Descripcion` text,
  `Presupuesto` decimal(10,2) DEFAULT NULL,
  `HorasEstimadas` int DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `DocenteJefe` int DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `DocenteJefe` (`DocenteJefe`),
  CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`DocenteJefe`) REFERENCES `docente` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (1,'Proyecto A','Aliado 1','Desarrollo de sistema web',50000.00,200,'2025-09-01','2025-12-01',NULL),(2,'Proyecto B','Aliado 2','Aplicación móvil',75000.00,300,'2025-09-15','2026-01-15',2),(3,'Proyecto C','Aliado 3','Infraestructura cloud',60000.00,250,'2025-10-01','2026-02-01',3),(4,'Proyecto D','Aliado 4','Automatización',45000.00,180,'2025-09-20','2025-12-20',4),(5,'Proyecto E','Aliado 5','Análisis de datos',80000.00,350,'2025-10-10','2026-03-10',5),(6,'Proyecto F','Aliado 6','Soporte técnico',55000.00,220,'2025-09-25','2025-12-25',6),(7,'Proyecto G','Aliado 7','Desarrollo API',70000.00,280,'2025-10-05','2026-01-05',7),(8,'Proyecto H','Aliado 8','Seguridad',65000.00,240,'2025-09-30','2025-12-30',8),(9,'Proyecto I','Aliado 9','Interfaz de usuario',48000.00,190,'2025-10-15','2026-02-15',9),(10,'Proyecto J','Aliado 10','Optimización',90000.00,400,'2025-10-01','2026-03-01',10);
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso`
--

DROP TABLE IF EXISTS `recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recurso` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text,
  `Tipo` enum('Humano','Material','Software','Hardware') NOT NULL,
  `PeriodoUtilizado` varchar(100) DEFAULT NULL,
  `FaseNumero` int NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `FaseNumero` (`FaseNumero`),
  CONSTRAINT `recurso_ibfk_1` FOREIGN KEY (`FaseNumero`) REFERENCES `fase` (`NumeroFase`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
INSERT INTO `recurso` VALUES (1,'Desarrollador','Recurso humano','Humano','2025-09',1),(2,'Servidor','Equipo de cómputo','Hardware','2025-10',2),(3,'Software X','Licencia de software','Software','2025-11',3),(4,'Material A','Suministros varios','Material','2025-12',4),(5,'Analista','Recurso humano','Humano','2025-09',5),(6,'Router','Equipo de red','Hardware','2025-10',6),(7,'Herramienta Y','Software de diseño','Software','2025-11',7),(8,'Papel','Suministros oficina','Material','2025-12',8),(9,'Técnico','Recurso humano','Humano','2025-09',9),(10,'Monitor','Equipo de visualización','Hardware','2025-10',10);
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29  1:16:41
