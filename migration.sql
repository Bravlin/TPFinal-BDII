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
  PRIMARY KEY (`id_banco_pesca`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco_pesca`
--

LOCK TABLES `banco_pesca` WRITE;
/*!40000 ALTER TABLE `banco_pesca` DISABLE KEYS */;
INSERT INTO `banco_pesca` VALUES (10,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\��B:M��e\�?>C��?��wM�]n0\�aCC�\"\�{�M��1\0\�HC��\�e�\�M�ę_\�BC�\��B:M��e\�?>C�'),(11,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0Lp\�\�\�H�}iƲ>���X���H�EF$a�>�;���;�H��\��D?��#���\�H�\�O�}:B?�Lp\�\�\�H�}iƲ>�');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barco`
--

LOCK TABLES `barco` WRITE;
/*!40000 ALTER TABLE `barco` DISABLE KEYS */;
INSERT INTO `barco` VALUES (1,1,20,30,100,1000,35),(2,2,15,25,85,850,25);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `derrotero`
--

LOCK TABLES `derrotero` WRITE;
/*!40000 ALTER TABLE `derrotero` DISABLE KEYS */;
INSERT INTO `derrotero` VALUES (1,1,1,'2019-12-12 12:12:00',1,'2019-12-19 19:00:00',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'\'Pescados del Sur\''),(2,'\'Campagnola Salados\'');
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
  CONSTRAINT `datos_sensor_derroteroFK` FOREIGN KEY (`fk_derrotero`) REFERENCES `derrotero` (`id_derrotero`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicion`
--

LOCK TABLES `medicion` WRITE;
/*!40000 ALTER TABLE `medicion` DISABLE KEYS */;
INSERT INTO `medicion` VALUES (3,1,_binary '\0\0\0\0\0\0\0\�ECƣ\�L���\�\�C�','{\"consumo\": 0}','2019-12-12 12:12:00'),(4,1,_binary '\0\0\0\0\0\0\0���z\�L���\�\�C�','{\"consumo\": 20}','2019-12-12 12:35:00'),(5,1,_binary '\0\0\0\0\0\0\0\�\��7CK�]���2	B�','{\"consumo\": 50}','2019-12-13 18:00:00'),(6,1,_binary '\0\0\0\0\0\0\0\�|y�\�H�\�\�$�4?�','{\"consumo\": 5}','2019-12-15 21:00:00'),(7,1,_binary '\0\0\0\0\0\0\0	\��K��\�\n}� B�','{\"consumo\": 40}','2019-12-17 21:50:00'),(8,1,_binary '\0\0\0\0\0\0\08��+\�\�L�zZ��C�','{\"consumo\": 0}','2019-12-19 23:00:00');
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
  CONSTRAINT `pescado_derroteroFK` FOREIGN KEY (`fk_derrotero`) REFERENCES `derrotero` (`id_derrotero`)
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
  `region` polygon NOT NULL,
  PRIMARY KEY (`id_puerto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puerto`
--

LOCK TABLES `puerto` WRITE;
/*!40000 ALTER TABLE `puerto` DISABLE KEYS */;
INSERT INTO `puerto` VALUES (1,'Mar del Plata',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0؂\�C\�L��\�<C��H\�\0\�L�7߈\�YC�#M�<\�L�,F]k\�C�`\��\�\�L��Pk�wC�l� [\�L��\\\Z��C�؂\�C\�L��\�<C�'),(2,'Necochea',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\�%�[M��L!IC�\�JU[M�)w�\�IC��\�I`sZM�C\0p\�IC�\0\�4ZM�\�l\�%�IC�\�%qVDYM�g�E(�JC�\�9x&4YM�����\�IC��[\�JZM�\�\�+\�IC�c(\'\�UZM�)w�\�IC���?8[M��U]IC�\�n�\�\\[M�bf�\�(IC��\�\�%�[M��L!IC�'),(3,'Punta Alta',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\r4�s�\rO�\�|��\�qC��\���\rO�\�\�uS\�qC�]R�\�\rO�y:W�rC�\n�\�O��<֌rC��\�v��O�m:�YrC��\���\rO�&\�\�s|rC�\r4�s�\rO�\�|��\�qC�');
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
  CONSTRAINT `punto_derrotero_FK` FOREIGN KEY (`fk_derrotero`) REFERENCES `derrotero` (`id_derrotero`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punto_derrotero`
--

LOCK TABLES `punto_derrotero` WRITE;
/*!40000 ALTER TABLE `punto_derrotero` DISABLE KEYS */;
INSERT INTO `punto_derrotero` VALUES (3,1,_binary '\0\0\0\0\0\0\0\�ECƣ\�L���\�\�C�','2019-12-12 12:12:00'),(4,1,_binary '\0\0\0\0\0\0\0n��\�V\�L�5�;�C�','2019-12-12 12:30:00'),(5,1,_binary '\0\0\0\0\0\0\0!\���cK�\��R�1�A�','2019-12-13 12:30:00'),(6,1,_binary '\0\0\0\0\0\0\0u�w\�H�\���K��>�','2019-12-15 17:30:00'),(8,1,_binary '\0\0\0\0\0\0\0`[?�gK�F?\ZN�!B�','2019-12-17 19:30:00'),(9,1,_binary '\0\0\0\0\0\0\0f���\�\�L��9>Z�C�','2019-12-19 22:30:00');
/*!40000 ALTER TABLE `punto_derrotero` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!50001 VIEW `barcos_consumo_excesivo` AS select `b`.`id_barco` AS `id_barco` from (`barco` `b` join `derrotero` `d` on((`d`.`fk_barco` = `b`.`id_barco`))) where ((`d`.`id_derrotero` = (select `d2`.`id_derrotero` from `derrotero` `d2` where (`d2`.`fk_barco` = `b`.`id_barco`) order by `d2`.`fecha_salida` limit 1)) and ((select avg(json_unquote(json_extract(`m`.`datos_sensores`,'$.consumo'))) from `medicion` `m` where (`m`.`fk_derrotero` = `d`.`id_derrotero`)) > (`b`.`consumo_promedio` * 1.1))) */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-13 16:45:40
