CREATE DATABASE  IF NOT EXISTS `appoint`  DEFAULT CHARACTER SET utf8 ;
USE `appoint`;
-- MySQL dump 10.13  Distrib 5.5.24, for osx10.5 (i386)
--
-- Host: 127.0.0.1    Database: appoint
-- ------------------------------------------------------
-- Server version	5.5.25

 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT ;
 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS ;
 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION ;
 SET NAMES utf8 ;
 SET @OLD_TIME_ZONE=@@TIME_ZONE ;
 SET TIME_ZONE='+00:00' ;
 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 ;
 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 ;
 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' ;
 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 ;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
 SET @saved_cs_client     = @@character_set_client ;
 SET character_set_client = utf8 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
 SET character_set_client = @saved_cs_client ;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
 ALTER TABLE `appointment` DISABLE KEYS ;
INSERT INTO `appointment` VALUES (7,1517375131,1517375131,'Marian','Borca','mborca@gmail.com','2012-09-24 13:00:00','2012-09-24 14:00:00'),(8,1517375131,9001,'Maxime','Gagne','email12@test.com','2012-09-24 11:00:00','2012-09-24 12:00:00'),(9,1517375131,9002,'Ugo','Tessier','email13@test.com','2012-09-25 13:00:00','2012-09-25 14:00:00'),(10,1517375131,9003,'Doruk','Vardaryildiz','email14@test.com','2012-09-26 16:00:00','2012-09-27 17:00:00'),(13,1517375131,1517375131,'test','test2','email@email.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,1517375131,0,'test','test2','email@email.com','2012-09-26 10:00:00','2012-09-26 11:00:00'),(17,1517375131,1517375131,'test','test2','email@email.com','2012-09-26 11:00:00','2012-09-26 12:00:00'),(18,1517375131,100004218783916,'test','test2','email@email.com','2012-09-26 12:00:00','2012-09-26 13:00:00');
 ALTER TABLE `appointment` ENABLE KEYS ;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
 SET @saved_cs_client     = @@character_set_client ;
 SET character_set_client = utf8 ;
CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_provider_facebook_id` bigint(20) NOT NULL,
  `facebook_id` bigint(20) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_service_provider_idx` (`service_provider_facebook_id`),
  CONSTRAINT `fk_review_service_provider` FOREIGN KEY (`service_provider_facebook_id`) REFERENCES `service_provider` (`facebook_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
 SET character_set_client = @saved_cs_client ;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
 ALTER TABLE `rating` DISABLE KEYS ;
INSERT INTO `rating` VALUES (1,1517375131,1517375131,2),(2,1517375131,1,3),(3,1517375131,2,5);
 ALTER TABLE `rating` ENABLE KEYS ;
UNLOCK TABLES;

--
-- Table structure for table `service_provider`
--

DROP TABLE IF EXISTS `service_provider`;
 SET @saved_cs_client     = @@character_set_client ;
 SET character_set_client = utf8 ;
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
 SET character_set_client = @saved_cs_client ;

--
-- Dumping data for table `service_provider`
--

LOCK TABLES `service_provider` WRITE;
 ALTER TABLE `service_provider` DISABLE KEYS ;
INSERT INTO `service_provider` VALUES (1000,'Barber','H D Mandrak Barber Shop\nH D Mandrak Barber Shop',NULL,'Canada','Quebec','Montreal','1967, rue Jean-Talon E, Montr‚àö¬©al, QC H2E 1T9','514-722-3111','email1@test.com',NULL,NULL,NULL),(1001,'Barber','Barbier Manuel Baeza\n',NULL,'Canada','Quebec','Montreal','716, rue Gilford, Montr‚àö¬©al, QC H2J 1N6','514-524-0068','email2@test.com',NULL,NULL,NULL),(1002,'Barber','Shoppers City East Barber Shop\nShoppers City East Barber Shop\n',NULL,'Canada','Ontario','Ottawa','2018 Ogilvie Rd, Gloucester, ON K1J 7N9','613-746-8968','email3@test.com',NULL,NULL,NULL),(1003,'Dentist','Adams Orthodontics',NULL,'Canada','Ontario','Ottawa','2150 Montreal Rd, Gloucester, ON K1J 6M7','613-800-1136','email4@test.com',NULL,NULL,NULL),(1004,'Dentist','Al-Mulla Mahdy Dr\n',NULL,'Canada','Ontario','Ottawa','2446 Bank St, Ottawa, ON','613-321-2610','email5@test.com',NULL,NULL,NULL),(1005,'Dentist','Associated Dental Care',NULL,'Canada','Ontario','Ottawa','2269 Riverside Dr, Ottawa, ON K1H 8K2','613-737-4944','email6@test.com',NULL,NULL,NULL),(1006,'Dentist','A La Clinique Dentaire St-Denis',NULL,'Canada','Quebec','Montreal','6915, rue Saint-Denis, Montr‚àö¬©al, QC H2S 2S3','514-273-3368','email7@test.com',NULL,NULL,NULL),(1007,'Barber','Bcn Cuts. Barber Shop',NULL,'Spain',NULL,'Barcelona','Gran de Gracia 223, 08012 Barcelona','+34 93 611 1813','email8@test.com',NULL,NULL,NULL),(1008,'Financial','BCG',NULL,'Spain',NULL,'Barcelona','Avda. Diagonal, 640 - 4¬¨‚àûA \nBarcelona 8017 Spain','+34 93 363 47 00','email9@test.com',NULL,NULL,NULL),(1009,'Financial','Egon Zehnder International',NULL,'Spain',NULL,'Madrid','123 Madrid','915 314 115','email10@test.com',NULL,NULL,NULL),(1517375131,'Dentist','Marian CO',NULL,'Canada','Quebec','Montreal','2100 rue Drummond Qc H4X 1X1','15148037957','email11@test.com',NULL,NULL,3.33333);
 ALTER TABLE `service_provider` ENABLE KEYS ;
UNLOCK TABLES;

--
-- Dumping events for database 'appoint'
--

--
-- Dumping routines for database 'appoint'
--
 DROP FUNCTION IF EXISTS `distance` ;
 SET @saved_cs_client      = @@character_set_client  ;
 SET @saved_cs_results     = @@character_set_results  ;
 SET @saved_col_connection = @@collation_connection  ;
 SET character_set_client  = utf8  ;
 SET character_set_results = utf8  ;
 SET collation_connection  = utf8_general_ci  ;
 SET @saved_sql_mode       = @@sql_mode  ;
 SET sql_mode              = ''  ;
DELIMITER ;;
 CREATE  DEFINER=`root`@`localhost`  FUNCTION `distance`(p_lat1 FLOAT , p_long1 FLOAT , p_lat2 FLOAT , p_long2 FLOAT) RETURNS float
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

END ;;
DELIMITER ;
 SET sql_mode              = @saved_sql_mode  ;
 SET character_set_client  = @saved_cs_client  ;
 SET character_set_results = @saved_cs_results  ;
 SET collation_connection  = @saved_col_connection  ;
 DROP PROCEDURE IF EXISTS `appointment_check` ;
 SET @saved_cs_client      = @@character_set_client  ;
 SET @saved_cs_results     = @@character_set_results  ;
 SET @saved_col_connection = @@collation_connection  ;
 SET character_set_client  = utf8  ;
 SET character_set_results = utf8  ;
 SET collation_connection  = utf8_general_ci  ;
 SET @saved_sql_mode       = @@sql_mode  ;
 SET sql_mode              = ''  ;
DELIMITER ;;
 CREATE  DEFINER=`root`@`localhost`  PROCEDURE `appointment_check`(
    p_service_provider_facebook_id bigint,
    p_start_date datetime,
    p_end_date datetime
)
BEGIN
    DECLARE _id BIGINT DEFAULT 0;
    SELECT user_facebook_id INTO _id FROM appointment
        WHERE service_provider_facebook_id = p_service_provider_facebook_id
        AND start_date >= p_start_date
        AND end_date <= p_end_date;
    SELECT _id;
END ;;
DELIMITER ;
 SET sql_mode              = @saved_sql_mode  ;
 SET character_set_client  = @saved_cs_client  ;
 SET character_set_results = @saved_cs_results  ;
 SET collation_connection  = @saved_col_connection  ;
 DROP PROCEDURE IF EXISTS `appointment_delete` ;
 SET @saved_cs_client      = @@character_set_client  ;
 SET @saved_cs_results     = @@character_set_results  ;
 SET @saved_col_connection = @@collation_connection  ;
 SET character_set_client  = utf8  ;
 SET character_set_results = utf8  ;
 SET collation_connection  = utf8_general_ci  ;
 SET @saved_sql_mode       = @@sql_mode  ;
 SET sql_mode              = ''  ;
DELIMITER ;;
 CREATE  DEFINER=`root`@`localhost`  PROCEDURE `appointment_delete`(p_user_facebook_id BIGINT,p_start_date DATETIME)
BEGIN
	DELETE FROM appointment
	WHERE user_facebook_id = p_user_facebook_id AND start_date=p_start_date;
END ;;
DELIMITER ;
 SET sql_mode              = @saved_sql_mode  ;
 SET character_set_client  = @saved_cs_client  ;
 SET character_set_results = @saved_cs_results  ;
 SET collation_connection  = @saved_col_connection  ;
 DROP PROCEDURE IF EXISTS `appointment_get_all` ;
 SET @saved_cs_client      = @@character_set_client  ;
 SET @saved_cs_results     = @@character_set_results  ;
 SET @saved_col_connection = @@collation_connection  ;
 SET character_set_client  = utf8  ;
 SET character_set_results = utf8  ;
 SET collation_connection  = utf8_general_ci  ;
 SET @saved_sql_mode       = @@sql_mode  ;
 SET sql_mode              = ''  ;
DELIMITER ;;
 CREATE  DEFINER=`root`@`localhost`  PROCEDURE `appointment_get_all`(p_facebook_id BIGINT)
BEGIN
	SELECT *
	FROM appointment
	WHERE service_provider_facebook_id = p_facebook_id ;
END ;;
DELIMITER ;
 SET sql_mode              = @saved_sql_mode  ;
 SET character_set_client  = @saved_cs_client  ;
 SET character_set_results = @saved_cs_results  ;
 SET collation_connection  = @saved_col_connection  ;
 DROP PROCEDURE IF EXISTS `appointment_get_by_date` ;
 SET @saved_cs_client      = @@character_set_client  ;
 SET @saved_cs_results     = @@character_set_results  ;
 SET @saved_col_connection = @@collation_connection  ;
 SET character_set_client  = utf8  ;
 SET character_set_results = utf8  ;
 SET collation_connection  = utf8_general_ci  ;
 SET @saved_sql_mode       = @@sql_mode  ;
 SET sql_mode              = ''  ;
DELIMITER ;;
 CREATE  DEFINER=`root`@`localhost`  PROCEDURE `appointment_get_by_date`(
		p_facebook_id BIGINT,
		p_start_date DATETIME, 
		p_end_date DATETIME)
BEGIN
	SELECT *
	FROM appointment
	WHERE service_provider_facebook_id = p_facebook_id 
			AND start_date >= p_start_date AND end_date <=p_end_date;
END ;;
DELIMITER ;
 SET sql_mode              = @saved_sql_mode  ;
 SET character_set_client  = @saved_cs_client  ;
 SET character_set_results = @saved_cs_results  ;
 SET collation_connection  = @saved_col_connection  ;
 DROP PROCEDURE IF EXISTS `appointment_insert` ;
 SET @saved_cs_client      = @@character_set_client  ;
 SET @saved_cs_results     = @@character_set_results  ;
 SET @saved_col_connection = @@collation_connection  ;
 SET character_set_client  = utf8  ;
 SET character_set_results = utf8  ;
 SET collation_connection  = utf8_general_ci  ;
 SET @saved_sql_mode       = @@sql_mode  ;
 SET sql_mode              = ''  ;
DELIMITER ;;
 CREATE  DEFINER=`root`@`localhost`  PROCEDURE `appointment_insert`(
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

END ;;
DELIMITER ;
 SET sql_mode              = @saved_sql_mode  ;
 SET character_set_client  = @saved_cs_client  ;
 SET character_set_results = @saved_cs_results  ;
 SET collation_connection  = @saved_col_connection  ;
 DROP PROCEDURE IF EXISTS `appointment_search` ;
 SET @saved_cs_client      = @@character_set_client  ;
 SET @saved_cs_results     = @@character_set_results  ;
 SET @saved_col_connection = @@collation_connection  ;
 SET character_set_client  = utf8  ;
 SET character_set_results = utf8  ;
 SET collation_connection  = utf8_general_ci  ;
 SET @saved_sql_mode       = @@sql_mode  ;
 SET sql_mode              = ''  ;
DELIMITER ;;
 CREATE  DEFINER=`root`@`localhost`  PROCEDURE `appointment_search`(
	p_category VARCHAR(512),
	p_country VARCHAR(512),
	p_city VARCHAR(512)

)
BEGIN


	SELECT *
	FROM `service_provider`
	WHERE 
			(p_category IS NULL OR p_category = '' OR  `category` = p_category)
			AND
			(p_country IS NULL OR  p_country = '' OR `country`= p_country)
			AND
			(p_city IS NULL OR p_city= '' OR `city` = p_city)
	ORDER BY `average_rating` DESC;
END ;;
DELIMITER ;
 SET sql_mode              = @saved_sql_mode  ;
 SET character_set_client  = @saved_cs_client  ;
 SET character_set_results = @saved_cs_results  ;
 SET collation_connection  = @saved_col_connection  ;
 DROP PROCEDURE IF EXISTS `rating_register` ;
 SET @saved_cs_client      = @@character_set_client  ;
 SET @saved_cs_results     = @@character_set_results  ;
 SET @saved_col_connection = @@collation_connection  ;
 SET character_set_client  = utf8  ;
 SET character_set_results = utf8  ;
 SET collation_connection  = utf8_general_ci  ;
 SET @saved_sql_mode       = @@sql_mode  ;
 SET sql_mode              = ''  ;
DELIMITER ;;
 CREATE  DEFINER=`root`@`localhost`  PROCEDURE `rating_register`(
		p_rating INT , 
		p_facebook_id BIGINT, 
		p_service_provider_facebook_id BIGINT)
BEGIN
	DECLARE _total_rating INT;
	DECLARE _count_rating INT;
	DECLARE _average_rating DECIMAL(6,5);
IF( EXISTS(SELECT * FROM  rating WHERE facebook_id=p_facebook_id AND service_provider_facebook_id = p_service_provider_facebook_id))
THEN

	UPDATE `rating`
	SET `rating`.`rating` = p_rating
	WHERE facebook_id = p_facebook_id AND service_provider_facebook_id =p_service_provider_facebook_id;


ELSE
	INSERT INTO `rating`(`rating`,`facebook_id`,`service_provider_facebook_id`)
	VALUES (p_rating,p_facebook_id,p_service_provider_facebook_id);
	


END IF;

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

END ;;
DELIMITER ;
 SET sql_mode              = @saved_sql_mode  ;
 SET character_set_client  = @saved_cs_client  ;
 SET character_set_results = @saved_cs_results  ;
 SET collation_connection  = @saved_col_connection  ;
 DROP PROCEDURE IF EXISTS `service_provider_delete` ;
 SET @saved_cs_client      = @@character_set_client  ;
 SET @saved_cs_results     = @@character_set_results  ;
 SET @saved_col_connection = @@collation_connection  ;
 SET character_set_client  = utf8  ;
 SET character_set_results = utf8  ;
 SET collation_connection  = utf8_general_ci  ;
 SET @saved_sql_mode       = @@sql_mode  ;
 SET sql_mode              = ''  ;
DELIMITER ;;
 CREATE  DEFINER=`root`@`localhost`  PROCEDURE `service_provider_delete`(p_facebook_id BIGINT)
BEGIN

	DELETE FROM service_provider
	WHERE facebook_id = p_facebook_id;

END ;;
DELIMITER ;
 SET sql_mode              = @saved_sql_mode  ;
 SET character_set_client  = @saved_cs_client  ;
 SET character_set_results = @saved_cs_results  ;
 SET collation_connection  = @saved_col_connection  ;
 DROP PROCEDURE IF EXISTS `service_provider_get` ;
 SET @saved_cs_client      = @@character_set_client  ;
 SET @saved_cs_results     = @@character_set_results  ;
 SET @saved_col_connection = @@collation_connection  ;
 SET character_set_client  = utf8  ;
 SET character_set_results = utf8  ;
 SET collation_connection  = utf8_general_ci  ;
 SET @saved_sql_mode       = @@sql_mode  ;
 SET sql_mode              = ''  ;
DELIMITER ;;
 CREATE  DEFINER=`root`@`localhost`  PROCEDURE `service_provider_get`(p_facebook_id BIGINT)
BEGIN
SELECT *
FROM `service_provider`
WHERE facebook_id = p_facebook_id;
END ;;
DELIMITER ;
 SET sql_mode              = @saved_sql_mode  ;
 SET character_set_client  = @saved_cs_client  ;
 SET character_set_results = @saved_cs_results  ;
 SET collation_connection  = @saved_col_connection  ;
 DROP PROCEDURE IF EXISTS `service_provider_register` ;
 SET @saved_cs_client      = @@character_set_client  ;
 SET @saved_cs_results     = @@character_set_results  ;
 SET @saved_col_connection = @@collation_connection  ;
 SET character_set_client  = utf8  ;
 SET character_set_results = utf8  ;
 SET collation_connection  = utf8_general_ci  ;
 SET @saved_sql_mode       = @@sql_mode  ;
 SET sql_mode              = ''  ;
DELIMITER ;;
 CREATE  DEFINER=`root`@`localhost`  PROCEDURE `service_provider_register`(
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




END ;;
DELIMITER ;
 SET sql_mode              = @saved_sql_mode  ;
 SET character_set_client  = @saved_cs_client  ;
 SET character_set_results = @saved_cs_results  ;
 SET collation_connection  = @saved_col_connection  ;
 DROP PROCEDURE IF EXISTS `service_provider_update_rating` ;
 SET @saved_cs_client      = @@character_set_client  ;
 SET @saved_cs_results     = @@character_set_results  ;
 SET @saved_col_connection = @@collation_connection  ;
 SET character_set_client  = utf8  ;
 SET character_set_results = utf8  ;
 SET collation_connection  = utf8_general_ci  ;
 SET @saved_sql_mode       = @@sql_mode  ;
 SET sql_mode              = ''  ;
DELIMITER ;;
 CREATE  DEFINER=`root`@`localhost`  PROCEDURE `service_provider_update_rating`(
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
END ;;
DELIMITER ;
 SET sql_mode              = @saved_sql_mode  ;
 SET character_set_client  = @saved_cs_client  ;
 SET character_set_results = @saved_cs_results  ;
 SET collation_connection  = @saved_col_connection  ;
 SET TIME_ZONE=@OLD_TIME_ZONE ;

 SET SQL_MODE=@OLD_SQL_MODE ;
 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS ;
 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS ;
 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT ;
 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS ;
 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION ;
 SET SQL_NOTES=@OLD_SQL_NOTES ;

-- Dump completed on 2012-10-04 18:20:04
