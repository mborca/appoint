CREATE DATABASE  IF NOT EXISTS `appoint` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `appoint`;
-- MySQL dump 10.13  Distrib 5.5.9, for osx10.6 (i386)
--
-- Host: localhost    Database: appoint
-- ------------------------------------------------------
-- Server version	5.5.9

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
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_provider_facebook_id` bigint(20) NOT NULL,
  `facebook_id` bigint(20) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_service_provider_idx` (`service_provider_facebook_id`),
  CONSTRAINT `fk_review_service_provider` FOREIGN KEY (`service_provider_facebook_id`) REFERENCES `service_provider` (`facebook_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (4,1111999,1111999,5),(5,1111999,1112,1);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider`
--

DROP TABLE IF EXISTS `service_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_provider` (
  `facebook_id` bigint(20) NOT NULL,
  `category` varchar(512) NOT NULL,
  `name` varchar(512) NOT NULL,
  `description` text,
  `country` varchar(512) NOT NULL,
  `region` varchar(512) DEFAULT NULL,
  `city` varchar(512) NOT NULL,
  `address` varchar(512) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(512) NOT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `average_rating` decimal(6,5) DEFAULT NULL,
  PRIMARY KEY (`facebook_id`),
  KEY `idx_service_provider_category` (`category`(255)),
  KEY `idx_service_provider_latitude` (`latitude`),
  KEY `idx_service_provider_longitude` (`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider`
--

LOCK TABLES `service_provider` WRITE;
/*!40000 ALTER TABLE `service_provider` DISABLE KEYS */;
INSERT INTO `service_provider` VALUES (11101,'Barber','My Barber Shop','Ohh yeah! Best hair cut','Canada','Qc','Montreal','2222 rue St-Cathrine H3G 1X1','1-514-999-9999','mybarbershop@barber.ca',-73.576851,45.499817,NULL),(11102,'Accounting','My Accounting Shop','Accounting Description','Canada','Qc','Montreal','123 rue Bishop H3G 2X2','1-514-888-8888','myaccounting@accounting.ca',-73.577011,45.498888,NULL),(11103,'Barber','XYZ','hehehe','Canada','On','Ottawa','789 nothing street ','9-999-999-9999','test@tets.ca',-73.012346,45.001235,NULL),(1111999,'category test','name test',NULL,'country test',NULL,'city test','adresse test','514-999-9999','test@test.ca',NULL,NULL,3.00000);
/*!40000 ALTER TABLE `service_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_provider_facebook_id` bigint(20) NOT NULL,
  `user_facebook_id` bigint(20) NOT NULL,
  `user_first_name` varchar(512) DEFAULT NULL,
  `user_last_name` varchar(512) DEFAULT NULL,
  `user_email` varchar(512) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_serviceprovider_appointment_idx` (`service_provider_facebook_id`),
  KEY `idx_appointment_appointment_date` (`start_date`),
  CONSTRAINT `fk_serviceprovider_appointment` FOREIGN KEY (`service_provider_facebook_id`) REFERENCES `service_provider` (`facebook_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (2,11101,222222,'Doruk','Vardaryildiz','doruk.vardaryildiz@gmail.com','2012-09-13 00:00:00','0000-00-00 00:00:00'),(4,11101,222222,'Doruk','Vardaryildiz','doruk.vardaryildiz@gmail.com','2012-09-13 01:00:00','0000-00-00 00:00:00'),(5,11101,123456,'Doruk','Vardaryildiz','doruk.vardaryildiz@cossette.com','2012-09-18 00:00:00','2012-09-18 01:00:00'),(6,11101,123456,'Doruk','Vardaryildiz','doruk.vardaryildiz@cossette.com','2012-09-18 02:00:00','2012-09-18 03:00:00');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'appoint'
--
/*!50003 DROP FUNCTION IF EXISTS `distance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `distance`(p_lat1 FLOAT , p_long1 FLOAT , p_lat2 FLOAT , p_long2 FLOAT) RETURNS float
BEGIN
--
-- This routine calculates the distance between two points (given the
-- latitude/longitude of those points). It is being used to calculate
-- the distance between two locations using GeoDataSource (TM) prodducts
--
-- Calculate distance between two points lat1, long1 and lat2, long2
-- Uses radius of earth in kilometers or miles as an argurments
--
-- Typical radius:  3963.0 (miles) (Default if no value specified)
--                  6387.7 (km)
--
--
-- For enquiries, please contact sales@geodatasource.com
-- Official Web site: http://www.geodatasource.com
--
-- Thanks to Janes Swarowski for contributing the source code.
--
-- GeoDataSource.com (C) All Rights Reserved 2012
--

DECLARE p_deg_to_rad FLOAT;
DECLARE p_ans  FLOAT;
DECLARE p_miles FLOAT;
DECLARE p_unit FLOAT;

SET p_unit = 6387.7; -- 3963.0 for miles

SET p_deg_to_rad = 57.29577951;
SET p_ans = 0;
SET p_miles = 0;

IF (p_lat1 IS NULL OR p_lat1 = 0 OR p_long1 IS NULL OR p_long1 = 0 OR p_lat2 IS NULL OR p_lat2 = 0 OR p_long2 IS NULL OR p_long2 = 0)
THEN
RETURN ( p_miles );

END IF;

SET p_ans = SIN(p_lat1 / p_deg_to_rad) * SIN(p_lat2 / p_deg_to_rad) + COS(p_lat1 / p_deg_to_rad ) * COS( p_lat2 / p_deg_to_rad ) * COS(ABS(p_long2 - p_long1 )/p_deg_to_rad);

SET p_miles = p_unit * ATAN(SQRT(1 - SQUARE(p_ans)) / p_ans);

SET p_miles = CEILING(p_miles);

RETURN ( p_miles );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `appointment_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `appointment_delete`(p_id INT)
BEGIN
	DELETE FROM appointment
	WHERE id = p_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `appointment_get_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `appointment_get_all`(p_facebook_id BIGINT)
BEGIN
	SELECT *
	FROM appointment
	WHERE service_provider_facebook_id = p_facebook_id ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `appointment_get_by_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `appointment_get_by_date`(
		p_facebook_id BIGINT,
		p_start_date DATETIME, 
		p_end_date DATETIME)
BEGIN
	SELECT *
	FROM appointment
	WHERE service_provider_facebook_id = p_facebook_id 
			AND start_date >= p_start_date AND end_date <=p_end_date;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `appointment_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `appointment_insert`(
		p_start_date DATETIME,
		p_end_date DATETIME,
		p_service_provider_facebook_id BIGINT,
		p_user_email VARCHAR(512),
		p_user_facebook_id BIGINT,
		p_user_firstname VARCHAR(512),
		p_user_lastname VARCHAR(512))
BEGIN

	IF (EXISTS(SELECT * FROM appointment WHERE service_provider_facebook_id=p_service_provider_facebook_id AND `start_date` = p_start_date ))
	THEN 
		SELECT 0;
	ELSE

		INSERT INTO appointment(start_date,end_date,service_provider_facebook_id,user_email,user_facebook_id,user_first_name,user_last_name)
		VALUE(p_start_date, p_end_date, p_service_provider_facebook_id,p_user_email,p_user_facebook_id,p_user_firstname,p_user_lastname);

		SELECT LAST_INSERT_ID();
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `appointment_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `appointment_search`(
	p_category VARCHAR(512),
	p_country VARCHAR(512),
	p_city VARCHAR(512)

)
BEGIN


	SELECT *
	FROM `service_provider`
	WHERE 
			(p_category IS NULL OR  `category` = p_category)
			AND
			(p_country IS NULL OR `country`= p_country)
			AND
			(p_city IS NULL OR `city` = p_city)
	ORDER BY `average_rating` DESC;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rating_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `rating_register`(
		p_rating INT , 
		p_facebook_id BIGINT, 
		p_service_provider_facebook_id BIGINT)
BEGIN
IF( EXISTS(SELECT * FROM  rating WHERE facebook_id=p_facebook_id))
THEN

	UPDATE `rating`
	SET `rating`.`rating` = p_rating
	WHERE facebook_id = p_facebook_id;

ELSE
	INSERT INTO `rating`(`rating`,`facebook_id`,`service_provider_facebook_id`)
	VALUES (p_rating,p_facebook_id,p_service_provider_facebook_id);
	


END IF;

	CALL service_provider_update_rating(p_service_provider_facebook_id);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `service_provider_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `service_provider_get`(p_facebook_id BIGINT)
BEGIN
SELECT *
FROM `service_provider`
WHERE facebook_id = p_facebook_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `service_provider_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `service_provider_register`(
			p_address VARCHAR(512),
			p_category VARCHAR(512),
			p_city VARCHAR(512),
			p_country VARCHAR(512),
			p_description TEXT,
			p_email VARCHAR(512),
			p_facebook_id BIGINT,
			p_latitude DECIMAL(9,6),
			p_longitude DECIMAL(9,6),
			p_name VARCHAR(512),
			p_phone VARCHAR(512), 
			p_region VARCHAR(512))
BEGIN

IF( EXISTS(SELECT * FROM  service_provider WHERE facebook_id=p_facebook_id))
THEN
	UPDATE `service_provider`
	SET
	`address` = p_address,
	`category` = p_category,
	`city` = p_city,
	`country` = p_country,
	`description` = p_description,
	`email` = p_email,
	`latitude` = p_latitude,
	`longitude` = p_longitude,
	`name` = p_name,
	`phone` = p_phone,
	`region` = p_region
	WHERE `facebook_id` = p_facebook_id; 

	SELECT p_facebook_id;

ELSE
	INSERT INTO `service_provider`
	(`address`,`category`,`city`,`country`,`description`,`email`,`facebook_id`,`latitude`,`longitude`,`name`,`phone`,`region`)
	VALUES
	(p_address,p_category,p_city,p_country,p_description,p_email,p_facebook_id,p_latitude,p_longitude,p_name,p_phone,p_region);
	SELECT p_facebook_id;
END IF;




END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `service_provider_update_rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `service_provider_update_rating`(
		p_service_provider_facebook_id BIGINT)
BEGIN
DECLARE _total_rating INT;
DECLARE _count_rating INT;
DECLARE _average_rating DECIMAL(6,5);


SET _total_rating = 0;

SET _total_rating = (	SELECT SUM(rating)
						FROM `rating`
						WHERE `service_provider_facebook_id` = p_service_provider_facebook_id
						);

SET _count_rating = (SELECT count(*) FROM `rating` WHERE `service_provider_facebook_id` = p_service_provider_facebook_id);

SET  _average_rating = (SELECT CAST(_total_rating / _count_rating AS DECIMAL(6,5)));

UPDATE `service_provider`
SET average_rating = _average_rating
WHERE facebook_id = p_service_provider_facebook_id;

SELECT _average_rating;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-18 15:48:06
