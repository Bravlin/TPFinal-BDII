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
-- Table structure for table `banco_pesca`
--

DROP TABLE IF EXISTS `banco_pesca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banco_pesca` (
  `id_banco_pesca` int(11) NOT NULL AUTO_INCREMENT,
  `region` polygon NOT NULL,
  PRIMARY KEY (`id_banco_pesca`),
  SPATIAL KEY `region` (`region`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco_pesca`
--

LOCK TABLES `banco_pesca` WRITE;
/*!40000 ALTER TABLE `banco_pesca` DISABLE KEYS */;
INSERT INTO `banco_pesca` VALUES (14,0x000000000103000000010000000500000018EDF1423A0E4DC0A165DD3F163E43C0F23FF9BB77144DC05D6E30D4614343C022E17B7F830C4DC0BE310400C74843C0FDDB65BFEE064DC0C4995FCD014243C018EDF1423A0E4DC0A165DD3F163E43C0),(15,0x00000000010300000001000000050000004C70EA03C9E148C0187D0569C6B23EC093AB58FCA6B848C04546072461B33EC03B8F8AFF3BBA48C09702D2FE07443FC0A323B9FC87E648C0CA4FAA7D3A423FC04C70EA03C9E148C0187D0569C6B23EC0);
/*!40000 ALTER TABLE `banco_pesca` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barco`
--

LOCK TABLES `barco` WRITE;
/*!40000 ALTER TABLE `barco` DISABLE KEYS */;
INSERT INTO `barco` VALUES (1,1,20,30,100,1000,35),(2,2,15,25,85,850,25),(3,2,30,40,150,2000,47);
/*!40000 ALTER TABLE `barco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `barcos_consumo_excesivo`
--

DROP TABLE IF EXISTS `barcos_consumo_excesivo`;
/*!50001 DROP VIEW IF EXISTS `barcos_consumo_excesivo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `barcos_consumo_excesivo` AS SELECT 
 1 AS `id_barco`*/;
SET character_set_client = @saved_cs_client;

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
  `fecha_salida` datetime NOT NULL,
  `puerto_arribo` int(11) NOT NULL,
  `fecha_arribo_estim` datetime NOT NULL,
  `fecha_arribo` datetime DEFAULT NULL,
  PRIMARY KEY (`id_derrotero`),
  KEY `barco_derrotero_FK` (`fk_barco`),
  KEY `salida_FK_1` (`puerto_salida`),
  KEY `arribo_FK_2` (`puerto_arribo`),
  CONSTRAINT `arribo_FK_2` FOREIGN KEY (`puerto_arribo`) REFERENCES `puerto` (`id_puerto`),
  CONSTRAINT `barco_derrotero_FK` FOREIGN KEY (`fk_barco`) REFERENCES `barco` (`id_barco`),
  CONSTRAINT `salida_FK_1` FOREIGN KEY (`puerto_salida`) REFERENCES `puerto` (`id_puerto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `derrotero`
--

LOCK TABLES `derrotero` WRITE;
/*!40000 ALTER TABLE `derrotero` DISABLE KEYS */;
INSERT INTO `derrotero` VALUES (1,1,1,'2019-12-12 12:12:00',1,'2019-12-19 22:30:00','2019-12-20 18:00:00'),(2,2,2,'2019-12-17 08:00:00',3,'2019-12-22 15:00:00',NULL),(3,3,2,'2019-12-15 10:00:00',1,'2019-12-17 18:00:00','2019-12-18 16:00:00');
/*!40000 ALTER TABLE `derrotero` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER alerta_punto_salteado
AFTER UPDATE ON derrotero
FOR EACH ROW
BEGIN
	IF OLD.fecha_arribo IS NULL AND NEW.fecha_arribo IS NOT NULL THEN
		CALL insertar_salteados(NEW.id_derrotero);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Pescados del Sur'),(2,'Campagnola Salados');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `informe_bancos_pesca`
--

DROP TABLE IF EXISTS `informe_bancos_pesca`;
/*!50001 DROP VIEW IF EXISTS `informe_bancos_pesca`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `informe_bancos_pesca` AS SELECT 
 1 AS `id_banco_pesca`,
 1 AS `fecha`,
 1 AS `id_barco`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `medicion`
--

DROP TABLE IF EXISTS `medicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicion` (
  `id_medicion` int(11) NOT NULL AUTO_INCREMENT,
  `fk_derrotero` int(11) NOT NULL,
  `posicion` point NOT NULL,
  `datos_sensores` json DEFAULT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_medicion`),
  KEY `datos_sensor_derroteroFK` (`fk_derrotero`),
  SPATIAL KEY `posicion` (`posicion`),
  CONSTRAINT `datos_sensor_derroteroFK` FOREIGN KEY (`fk_derrotero`) REFERENCES `derrotero` (`id_derrotero`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicion`
--

LOCK TABLES `medicion` WRITE;
/*!40000 ALTER TABLE `medicion` DISABLE KEYS */;
INSERT INTO `medicion` VALUES (3,1,0x000000000101000000D04543C6A3C44CC09813B4C9E10543C0,'{\"consumo\": 0}','2019-12-12 12:12:00'),(4,1,0x000000000101000000BC96900F7AC24CC08AB0E1E9950443C0,'{\"consumo\": 20}','2019-12-12 12:35:00'),(5,1,0x00000000010100000007D0EFFB37434BC05DFA97A4320942C0,'{\"consumo\": 50}','2019-12-13 18:00:00'),(6,1,0x000000000101000000C47C7901F6E148C0E199D024B1343FC0,'{\"consumo\": 5}','2019-12-15 21:00:00'),(7,1,0x0000000001010000000F09DFFB1B144BC09AED0A7DB02042C0,'{\"consumo\": 40}','2019-12-17 21:50:00'),(8,1,0x00000000010100000038A0A52BD8C44CC07A185A9D9C0543C0,'{\"consumo\": 0}','2019-12-20 18:00:00'),(9,2,0x00000000010100000013F1D6F9B7594DC0DB368C82E04943C0,'{\"consumo\": 0}','2019-12-17 13:00:00'),(10,2,0x000000000101000000143FC6DCB5104DC005A3923A014343C0,'{\"consumo\": 45}','2019-12-17 18:15:00'),(11,2,0x000000000101000000A9DDAF027CB14DC0D05E7D3CF46743C0,'{\"consumo\": 40}','2019-12-18 14:15:00'),(12,2,0x00000000010100000030849CF7FF3B4EC0302C7FBE2D9443C0,'{\"consumo\": 55}','2019-12-19 19:45:00'),(13,3,0x0000000001010000005B5CE333D9594DC05DC47762D64943C0,'{\"consumo\": 0}','2019-12-15 12:00:00'),(14,3,0x0000000001010000006729594E42094DC047753A90F54243C0,'{\"consumo\": 35}','2019-12-16 04:00:00'),(15,3,0x000000000101000000164D672783D74CC0C4279D48303543C0,'{\"consumo\": 37}','2019-12-16 15:00:00'),(16,3,0x0000000001010000004AD1CABDC0B84CC07BD7A02FBD1943C0,'{\"consumo\": 40}','2019-12-17 14:22:00'),(17,3,0x000000000101000000677E350708C44CC01FF64201DB0543C0,'{\"consumo\": 0}','2019-12-18 16:00:00');
/*!40000 ALTER TABLE `medicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pescado`
--

DROP TABLE IF EXISTS `pescado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pescado` (
  `fk_derrotero` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `tipo` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`fk_derrotero`),
  KEY `pescado_tipo_IDX` (`tipo`) USING BTREE,
  CONSTRAINT `pescado_derroteroFK` FOREIGN KEY (`fk_derrotero`) REFERENCES `derrotero` (`id_derrotero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pescado`
--

LOCK TABLES `pescado` WRITE;
/*!40000 ALTER TABLE `pescado` DISABLE KEYS */;
INSERT INTO `pescado` VALUES (1,12000,'merluza'),(3,15000,'merluza');
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
  `region` polygon NOT NULL,
  PRIMARY KEY (`id_puerto`),
  SPATIAL KEY `region` (`region`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puerto`
--

LOCK TABLES `puerto` WRITE;
/*!40000 ALTER TABLE `puerto` DISABLE KEYS */;
INSERT INTO `puerto` VALUES (1,'Mar del Plata',0x0000000001030000000100000006000000D882DE1B43C44CC0C1E61C3C130443C0B24813EF00C54CC037DF88EE590543C0234DBC033CC54CC02C465D6BEF0543C060E811A3E7C44CC0B1506B9A770643C06C06B8205BC24CC0A35C1ABFF00443C0D882DE1B43C44CC0C1E61C3C130443C0),(2,'Necochea',0x000000000103000000010000000B0000009DD7D825AA5B4DC01FBE4C14214943C0C34A0515555B4DC029779FE3A34943C0B3EC4960735A4DC01C430070EC4943C01500E319345A4DC0D76CE525FF4943C0DD25715644594DC067994528B64A43C0CE39782634594DC0B9FC87F4DB4943C09F5BE84A045A4DC0EEEC2B0FD24943C0632827DA555A4DC029779FE3A34943C08AAE0B3F385B4DC0B95510035D4943C0D66EBBD05C5B4DC062669FC7284943C09DD7D825AA5B4DC01FBE4C14214943C0),(3,'Punta Alta',0x00000000010300000001000000070000000D349F73B70D4FC0E57CB1F7E27143C082CAF8F7190D4FC0DAC87553CA7143C05D52B5DD040D4FC0793A5794127243C00AF2B391EB0C4FC0B83CD68C0C7243C0ADDD76A1B90C4FC06D3A02B8597243C0ABE7A4F78D0D4FC026E5EE737C7243C00D349F73B70D4FC0E57CB1F7E27143C0);
/*!40000 ALTER TABLE `puerto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `punto_derrotero`
--

DROP TABLE IF EXISTS `punto_derrotero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `punto_derrotero` (
  `id_punto_derrotero` int(11) NOT NULL AUTO_INCREMENT,
  `fk_derrotero` int(11) NOT NULL,
  `coordenadas` point NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_punto_derrotero`),
  KEY `punto_derrotero_FK` (`fk_derrotero`),
  SPATIAL KEY `coordenadas` (`coordenadas`),
  CONSTRAINT `punto_derrotero_FK` FOREIGN KEY (`fk_derrotero`) REFERENCES `derrotero` (`id_derrotero`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punto_derrotero`
--

LOCK TABLES `punto_derrotero` WRITE;
/*!40000 ALTER TABLE `punto_derrotero` DISABLE KEYS */;
INSERT INTO `punto_derrotero` VALUES (3,1,0x000000000101000000D04543C6A3C44CC09813B4C9E10543C0,'2019-12-12 12:12:00'),(4,1,0x0000000001010000006EA296E656C24CC0350BB43BA40443C0,'2019-12-12 12:30:00'),(5,1,0x00000000010100000021E4BCFF8F634BC0C3F352B131FB41C0,'2019-12-13 12:30:00'),(6,1,0x000000000101000000751E15FF77D848C0D6FCF84B8BFA3EC0,'2019-12-15 17:30:00'),(8,1,0x000000000101000000605B3FFD67134BC0463F1A4E992142C0,'2019-12-17 19:30:00'),(9,1,0x00000000010100000066BCADF4DAC44CC0F7393E5A9C0543C0,'2019-12-19 22:30:00'),(10,2,0x00000000010100000013F1D6F9B7594DC0DB368C82E04943C0,'2019-12-17 08:05:00'),(11,2,0x00000000010100000025CCB4FD2B114DC0A19DD32CD04243C0,'2019-12-17 19:15:00'),(12,2,0x0000000001010000007A6F0C01C0A94DC0912C6002B78243C0,'2019-12-18 12:15:00'),(13,2,0x00000000010100000000000000003C4EC0BFB854A52D9443C0,'2019-12-19 16:45:00'),(14,2,0x000000000101000000598B4F0130C04EC02C11A8FE41FC43C0,'2019-12-20 14:30:00'),(15,2,0x000000000101000000E6EB32FCA7CF4EC0D2C3D0EAE49843C0,'2019-12-21 22:37:00'),(16,2,0x0000000001010000009C69C2F6930D4FC051BD35B0557243C0,'2019-12-22 15:00:00'),(17,3,0x0000000001010000005B5CE333D9594DC05DC47762D64943C0,'2019-12-15 12:00:00'),(18,3,0x0000000001010000007E5182FE42094DC06CB3B112F34243C0,'2019-12-15 22:00:00'),(19,3,0x0000000001010000003FE0810184D74CC0FF59F3E32F3543C0,'2019-12-16 06:00:00'),(20,3,0x000000000101000000CDAFE600C1B84CC0AB5B3D27BD1943C0,'2019-12-16 23:22:00'),(21,3,0x000000000101000000677E350708C44CC01FF64201DB0543C0,'2019-12-17 18:00:00');
/*!40000 ALTER TABLE `punto_derrotero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `punto_salteado`
--

DROP TABLE IF EXISTS `punto_salteado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `punto_salteado` (
  `id_punto` int(11) NOT NULL,
  `id_barco` int(11) NOT NULL,
  `id_derrotero` int(11) NOT NULL,
  PRIMARY KEY (`id_punto`),
  KEY `salteado_barcoFK` (`id_barco`),
  KEY `salteado_derroteroFK` (`id_derrotero`),
  CONSTRAINT `salteado_barcoFK` FOREIGN KEY (`id_barco`) REFERENCES `barco` (`id_barco`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salteado_derroteroFK` FOREIGN KEY (`id_derrotero`) REFERENCES `derrotero` (`id_derrotero`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salteado_puntoFK` FOREIGN KEY (`id_punto`) REFERENCES `punto_derrotero` (`id_punto_derrotero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punto_salteado`
--

LOCK TABLES `punto_salteado` WRITE;
/*!40000 ALTER TABLE `punto_salteado` DISABLE KEYS */;
INSERT INTO `punto_salteado` VALUES (5,1,1),(6,1,1);
/*!40000 ALTER TABLE `punto_salteado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `trayecto_derrotero`
--

DROP TABLE IF EXISTS `trayecto_derrotero`;
/*!50001 DROP VIEW IF EXISTS `trayecto_derrotero`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `trayecto_derrotero` AS SELECT 
 1 AS `id_derrotero`,
 1 AS `linea`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `trayecto_real`
--

DROP TABLE IF EXISTS `trayecto_real`;
/*!50001 DROP VIEW IF EXISTS `trayecto_real`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `trayecto_real` AS SELECT 
 1 AS `id_derrotero`,
 1 AS `linea`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'Barcos'
--
/*!50003 DROP FUNCTION IF EXISTS `barcos_fuera_puerto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  FUNCTION `barcos_fuera_puerto`() RETURNS int(11)
BEGIN
	DECLARE cantidad INT;

	SELECT COUNT(id_barco)
	FROM barco b
	WHERE EXISTS (
		SELECT *
		FROM derrotero d
		INNER JOIN medicion m ON m.fk_derrotero = d.id_derrotero
		WHERE d.fk_barco = b.id_barco
			AND d.fecha_salida = (
				SELECT MAX(d2.fecha_salida)
				FROM derrotero d2
				WHERE d2.fk_barco = b.id_barco)
			AND m.fecha = (
				SELECT MAX(m2.fecha)
				FROM medicion m2
				WHERE m2.fk_derrotero = d.id_derrotero)
			AND NOT EXISTS (
				SELECT *
				FROM puerto p
				WHERE ST_WITHIN(m.posicion, p.region)))
	INTO cantidad;

	RETURN cantidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `barcos_latitud_33` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  FUNCTION `barcos_latitud_33`() RETURNS int(11)
BEGIN
	DECLARE cantidad INT;

	SELECT COUNT(id_barco)
	FROM barco b
	WHERE (
			SELECT MAX(ST_Y(m.posicion))
			FROM derrotero d
			INNER JOIN medicion m ON m.fk_derrotero = d.id_derrotero
			WHERE d.fk_barco = b.id_barco) > -33
		AND (
			SELECT MIN(ST_Y(m.posicion))
			FROM derrotero d
			INNER JOIN medicion m ON m.fk_derrotero = d.id_derrotero
			WHERE d.fk_barco = b.id_barco) < -33
	INTO cantidad;

	RETURN cantidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cantidad_barcos_tiempo_desviado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  FUNCTION `cantidad_barcos_tiempo_desviado`() RETURNS int(11)
BEGIN
	DECLARE cantidad INT;

	SELECT COUNT(b.id_barco)
	FROM barco b
	WHERE EXISTS (
		SELECT *
		FROM derrotero d
		WHERE d.fk_barco = b.id_barco
			AND ABS(TIMESTAMPDIFF(SECOND, d.fecha_salida, d.fecha_arribo_estim) - TIMESTAMPDIFF(SECOND, d.fecha_salida, d.fecha_arribo)) 
				/ TIMESTAMPDIFF(SECOND, d.fecha_salida, d.fecha_arribo_estim) > 0.1)
	INTO cantidad;

	RETURN cantidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `empresa_mas_merluza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  FUNCTION `empresa_mas_merluza`() RETURNS int(11)
BEGIN
	DECLARE empresa INT;

	SELECT id_empresa
	FROM (
		SELECT e.id_empresa, SUM(p.cantidad) AS cantidad
		FROM empresa e
			INNER JOIN barco b ON b.fk_empresa = e.id_empresa
			INNER JOIN derrotero d ON d.fk_barco = b.id_barco
			INNER JOIN pescado p ON p.fk_derrotero = d.id_derrotero
		WHERE d.fecha_arribo > (NOW() - INTERVAL 7 DAY) AND p.tipo='merluza' 
		GROUP BY e.id_empresa
		ORDER BY cantidad DESC
		LIMIT 1) t
	INTO empresa;

	RETURN empresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `llegaron_mdq` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  FUNCTION `llegaron_mdq`() RETURNS int(11)
BEGIN
	DECLARE puerto_mdq POLYGON;
	DECLARE cantidad INT;

	SELECT region
	FROM puerto
	WHERE ciudad = 'Mar del Plata'
	INTO puerto_mdq;

	SELECT COUNT(b.id_barco)
	FROM barco b
	WHERE EXISTS (
		SELECT *
		FROM derrotero d
		INNER JOIN medicion m ON m.fk_derrotero = d.id_derrotero
		WHERE d.fk_barco = b.id_barco AND ST_WITHIN(m.posicion, puerto_mdq))
	INTO cantidad;

	RETURN cantidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_salteados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `insertar_salteados`(
	id_der INT
)
BEGIN
	DECLARE id_barco INT;

	SELECT fk_barco
	FROM derrotero
	WHERE id_derrotero = id_der
	INTO id_barco;

	INSERT INTO punto_salteado
	SELECT pd.id_punto_derrotero, id_barco, id_der
	FROM punto_derrotero pd
	WHERE pd.fk_derrotero = id_der
		AND NOT EXISTS (
			SELECT *
			FROM medicion m
			WHERE m.fk_derrotero = id_der
				AND ST_DISTANCE_SPHERE(pd.coordenadas, m.posicion) <= 1852);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `barcos_consumo_excesivo`
--

/*!50001 DROP VIEW IF EXISTS `barcos_consumo_excesivo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `barcos_consumo_excesivo` AS select `b`.`id_barco` AS `id_barco` from (`barco` `b` join `derrotero` `d` on((`d`.`fk_barco` = `b`.`id_barco`))) where ((`d`.`id_derrotero` = (select `d2`.`id_derrotero` from `derrotero` `d2` where (`d2`.`fk_barco` = `b`.`id_barco`) order by `d2`.`fecha_salida` desc limit 1)) and ((select avg(json_unquote(json_extract(`m`.`datos_sensores`,'$.consumo'))) from `medicion` `m` where (`m`.`fk_derrotero` = `d`.`id_derrotero`)) > (`b`.`consumo_promedio` * 1.1))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `informe_bancos_pesca`
--

/*!50001 DROP VIEW IF EXISTS `informe_bancos_pesca`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `informe_bancos_pesca` AS select `bp`.`id_banco_pesca` AS `id_banco_pesca`,`m`.`fecha` AS `fecha`,`d`.`fk_barco` AS `id_barco` from ((`banco_pesca` `bp` join `medicion` `m` on(st_within(`m`.`posicion`,`bp`.`region`))) join `derrotero` `d` on((`d`.`id_derrotero` = `m`.`fk_derrotero`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trayecto_derrotero`
--

/*!50001 DROP VIEW IF EXISTS `trayecto_derrotero`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `trayecto_derrotero` AS select `punto_derrotero`.`fk_derrotero` AS `id_derrotero`,st_geometryfromtext(concat('LINESTRING (',group_concat(concat(st_x(`punto_derrotero`.`coordenadas`),' ',st_y(`punto_derrotero`.`coordenadas`)) separator ', '),')')) AS `linea` from `punto_derrotero` group by `punto_derrotero`.`fk_derrotero` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trayecto_real`
--

/*!50001 DROP VIEW IF EXISTS `trayecto_real`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `trayecto_real` AS select `medicion`.`fk_derrotero` AS `id_derrotero`,st_geometryfromtext(concat('LINESTRING (',group_concat(concat(st_x(`medicion`.`posicion`),' ',st_y(`medicion`.`posicion`)) separator ', '),')')) AS `linea` from `medicion` group by `medicion`.`fk_derrotero` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-17 17:44:21
