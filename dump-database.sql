-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: Barcos
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barco`
--

DROP TABLE IF EXISTS `barco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barco` (
  `id_barco` int(11) NOT NULL AUTO_INCREMENT,
  `fk_empresa` int(11) NOT NULL,
  `consumo_promedio` float NOT NULL,
  `eslora` float NOT NULL,
  `peso` float NOT NULL,
  `autonomia` float NOT NULL,
  `cant_personal` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_barco`),
  KEY `barco_empresaFK` (`fk_empresa`),
  CONSTRAINT `barco_empresaFK` FOREIGN KEY (`fk_empresa`) REFERENCES `empresa` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barco`
--

LOCK TABLES `barco` WRITE;
/*!40000 ALTER TABLE `barco` DISABLE KEYS */;
/*!40000 ALTER TABLE `barco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_sensor`
--

DROP TABLE IF EXISTS `datos_sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_sensor` (
  `id_datos_sensor` int(11) NOT NULL AUTO_INCREMENT,
  `fk_derrotero` int(11) NOT NULL,
  `datos` json NOT NULL,
  PRIMARY KEY (`id_datos_sensor`),
  KEY `datos_sensor_derroteroFK` (`fk_derrotero`),
  CONSTRAINT `datos_sensor_derroteroFK` FOREIGN KEY (`fk_derrotero`) REFERENCES `derrotero` (`id_derrotero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_sensor`
--

LOCK TABLES `datos_sensor` WRITE;
/*!40000 ALTER TABLE `datos_sensor` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `derrotero`
--

DROP TABLE IF EXISTS `derrotero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `derrotero` (
  `id_derrotero` int(11) NOT NULL AUTO_INCREMENT,
  `fk_barco` int(11) NOT NULL,
  `puerto_salida` int(11) NOT NULL,
  `fecha_salida` date NOT NULL,
  `puerto_arribo` int(11) NOT NULL,
  `fecha_arribo_estim` date NOT NULL,
  `fecha_arribo` date DEFAULT NULL,
  `puntos_viaje` json NOT NULL,
  PRIMARY KEY (`id_derrotero`),
  KEY `barco_derrotero_FK` (`fk_barco`),
  KEY `salida_FK_1` (`puerto_salida`),
  KEY `arribo_FK_2` (`puerto_arribo`),
  CONSTRAINT `arribo_FK_2` FOREIGN KEY (`puerto_arribo`) REFERENCES `puerto` (`id_puerto`),
  CONSTRAINT `barco_derrotero_FK` FOREIGN KEY (`fk_barco`) REFERENCES `barco` (`id_barco`),
  CONSTRAINT `salida_FK_1` FOREIGN KEY (`puerto_salida`) REFERENCES `puerto` (`id_puerto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `derrotero`
--

LOCK TABLES `derrotero` WRITE;
/*!40000 ALTER TABLE `derrotero` DISABLE KEYS */;
/*!40000 ALTER TABLE `derrotero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pescado`
--

DROP TABLE IF EXISTS `pescado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pescado` (
  `fk_derrotero` int(11) NOT NULL,
  `fk_tipo` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  PRIMARY KEY (`fk_derrotero`,`fk_tipo`),
  KEY `pescado_tipoFK` (`fk_tipo`),
  CONSTRAINT `pescado_derroteroFK` FOREIGN KEY (`fk_derrotero`) REFERENCES `derrotero` (`id_derrotero`),
  CONSTRAINT `pescado_tipoFK` FOREIGN KEY (`fk_tipo`) REFERENCES `tipo_pescado` (`id_tipo_pescado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pescado`
--

LOCK TABLES `pescado` WRITE;
/*!40000 ALTER TABLE `pescado` DISABLE KEYS */;
/*!40000 ALTER TABLE `pescado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puerto`
--

DROP TABLE IF EXISTS `puerto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puerto` (
  `id_puerto` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poligono` json NOT NULL,
  PRIMARY KEY (`id_puerto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puerto`
--

LOCK TABLES `puerto` WRITE;
/*!40000 ALTER TABLE `puerto` DISABLE KEYS */;
/*!40000 ALTER TABLE `puerto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pescado`
--

DROP TABLE IF EXISTS `tipo_pescado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_pescado` (
  `id_tipo_pescado` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_pescado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pescado`
--

LOCK TABLES `tipo_pescado` WRITE;
/*!40000 ALTER TABLE `tipo_pescado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_pescado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Barcos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-02 19:35:43
