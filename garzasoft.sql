-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: garzasoft
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `idadministrador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `dni` varchar(45) NOT NULL,
  PRIMARY KEY (`idadministrador`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Admin','Admin','999888555','Admin@gmail.com','4545','73336260');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `ingreso` varchar(45) NOT NULL,
  `condicion` varchar(45) NOT NULL,
  `elimina` varchar(45) NOT NULL,
  `dni` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Andy','Mechan Llontop','951074152','andy@gmail.com','4545','2022/04/13','Nuevo','activo','73336258','hombre'),(2,'Edely','Mechan Ruiz','951074151','ed@gmail.com','4545','2010/03/05','Antiguo','activo','13336259','mujer'),(3,'Gloria Noelia','Loro Ayala','951014151','g@gmail.com','4545','2022/03/17','Nuevo','activo','33336259','mujer'),(4,'Karina','Mera Mel','923409508','ka@gmail.com','4545','2022/02/16','Nuevo','activo','73436257','mujer'),(5,'Maria','Mechan Mechan','951074155','marita@gmail.com','4545','2022/04/15','Nuevo','activo','75336258','mujer'),(6,'Jhonatan','Rodriguez Custodio','951074158','jcr@gmail.com','4545','2022/04/12','Nuevo','activo','73836258','hombre');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto` (
  `idproyecto` int NOT NULL AUTO_INCREMENT,
  `inicio` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `fin` varchar(45) NOT NULL,
  `elimina` varchar(45) NOT NULL,
  `idcliente` int NOT NULL,
  `idtrabajador` int NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `condicion` varchar(45) NOT NULL,
  `mantenimiento` varchar(45) NOT NULL,
  PRIMARY KEY (`idproyecto`),
  KEY `fk_proyecto_cliente_idx` (`idcliente`),
  KEY `fk_proyecto_Trabajador1_idx` (`idtrabajador`),
  CONSTRAINT `fk_proyecto_cliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_proyecto_Trabajador1` FOREIGN KEY (`idtrabajador`) REFERENCES `trabajador` (`idtrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (1,'2022/04/13','Terminado','2022/03/25','activo',1,2,'Soporte','Capacitacion a nuevo personal','si','no'),(2,'2022/04/13','Terminado','2022/05/04','activo',3,1,'Soporte','Corregir bug del software','si','no'),(3,'2022/04/13','Terminado','2022/08/26','activo',3,1,'Desarrollo','Software para control de caja chica','si','no'),(4,'2022/09/13','Terminado','2022/12/17','activo',3,1,'Desarrollo','Software para control de caja chica','si','si'),(5,'2022/04/14','En Proceso','2022/04/23','activo',1,3,'Soporte','Capacitacion a nuevo personal','si','no'),(6,'2022/04/14','Terminado','2022/06/09','activo',1,4,'Desarrollo','Sistema de Compras','si','no'),(7,'2023/01/11','En Proceso','2023/07/14','activo',3,6,'Desarrollo','Software para control de caja chica','si','si'),(8,'2022/04/16','Terminado','2022/04/28','activo',1,5,'Soporte','Revisar algun resultado informado por el software','si','no'),(9,'2022/03/16','Terminado','2022/08/10','activo',1,1,'Desarrollo','Sistema Escolar','si','no'),(10,'2023/06/18','Pendiente','2023/07/29','activo',5,1,'Desarrollo','Sistema Escolar','no','no'),(11,'2023/06/18','Pendiente','2023/07/29','activo',1,2,'Desarrollo','Sistema Escolar2','no','no');
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requerimientos`
--

DROP TABLE IF EXISTS `requerimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requerimientos` (
  `idrequerimientos` int NOT NULL AUTO_INCREMENT,
  `requerimientos` varchar(500) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `elimina` varchar(45) NOT NULL,
  `idproyecto` int NOT NULL,
  PRIMARY KEY (`idrequerimientos`),
  KEY `fk_requerimientos_proyecto1_idx` (`idproyecto`),
  CONSTRAINT `fk_requerimientos_proyecto1` FOREIGN KEY (`idproyecto`) REFERENCES `proyecto` (`idproyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requerimientos`
--

LOCK TABLES `requerimientos` WRITE;
/*!40000 ALTER TABLE `requerimientos` DISABLE KEYS */;
INSERT INTO `requerimientos` VALUES (1,'Apertura de caja diaria por turno','Terminado','activo',3),(2,'Registro de pago con tarjeta','Terminado','activo',3),(3,'Registro de pagos en efectivo','Terminado','activo',3),(4,'Registro de documento de venta con boleta','Terminado','activo',3),(5,'Registro de documento de venta con boleta','Terminado','activo',3),(6,'Cierre de Caja diaria por turno','Terminado','activo',4),(7,'Reporte de Ventas en Efectivo','En Proceso','activo',7),(8,'Registro de Productos','Terminado','activo',6),(9,'Registro de estudiante','Terminado','activo',9),(10,'Registro de notas','Terminado','activo',9),(11,'Registros de profesores','Terminado','activo',9);
/*!40000 ALTER TABLE `requerimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajador` (
  `idtrabajador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `ingreso` varchar(45) NOT NULL,
  `condicion` varchar(45) NOT NULL,
  `elimina` varchar(45) NOT NULL,
  `dni` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idtrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` VALUES (1,'Luis Fernando','Mechan Llontop','951074151','luis@hotmail.com','4545','2015/03/12','Antiguo','activo','73336257','hombre','ocupado'),(2,'Oscar','Lopez Sanchez','923409508','os@gmail.com','4545','2010/04/23','Antiguo','activo','13336257','hombre','ocupado'),(3,'Jean Carlos ','Mechan Llontop','923409507','jean@gmail.com','4545','2022/04/01','Nuevo','activo','23336259','hombre','ocupado'),(4,'Katty','Mechan Llontop','951074156','k@gmail.com','4545','2022/01/05','Nuevo','activo','72336255','mujer','libre'),(5,'Miguel','Llontop Lluen','997888556','Miguel@gmail.com','4545','2022/04/14','Nuevo','activo','43336257','hombre','libre'),(6,'Ramiro ','Custodio Zune','951174152','Ramiro@hotmail.com','4545','2017/02/23','Antiguo','activo','73346258','hombre','ocupado'),(7,'Cleiver','Fernandez Delgado','951074172','cleiver@gmail.com','4545','2014/07/24','Antiguo','activo','73836259','hombre','libre');
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-30  7:42:53
