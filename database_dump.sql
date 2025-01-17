CREATE DATABASE  IF NOT EXISTS `antivirus_v2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `antivirus_v2`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: antivirus_v2
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `age` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `accounts_customuser_chk_1` CHECK ((`age` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
INSERT INTO `accounts_customuser` VALUES (1,'pbkdf2_sha256$720000$5d2PiyAfmQEth9DrTQPtZ8$O44yMIX5dn5AE3TRYmzQi3MGgA6TbHFDu4ZXkXDMaSc=','2024-02-03 23:20:43.156682',0,'c','','','c@gmail.com',0,1,'2024-02-03 23:20:33.748331',25),(2,'pbkdf2_sha256$720000$eWeEpllnfXUgxGetncOh8i$OdY2Wr+Qgc2twtuOIiGbL7nvlaQJWC0AqaU2U15SgCo=','2024-02-03 23:24:05.084582',1,'admin','','','admin@gmail.com',1,1,'2024-02-03 23:23:27.700191',NULL);
/*!40000 ALTER TABLE `accounts_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_groups`
--

DROP TABLE IF EXISTS `accounts_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_groups`
--

LOCK TABLES `accounts_customuser_groups` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_user_permissions`
--

DROP TABLE IF EXISTS `accounts_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_user_permissions`
--

LOCK TABLES `accounts_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add malware sample',8,'add_malwaresample'),(30,'Can change malware sample',8,'change_malwaresample'),(31,'Can delete malware sample',8,'delete_malwaresample'),(32,'Can view malware sample',8,'view_malwaresample'),(33,'Can add remediation action',9,'add_remediationaction'),(34,'Can change remediation action',9,'change_remediationaction'),(35,'Can delete remediation action',9,'delete_remediationaction'),(36,'Can view remediation action',9,'view_remediationaction'),(37,'Can add signature update',10,'add_signatureupdate'),(38,'Can change signature update',10,'change_signatureupdate'),(39,'Can delete signature update',10,'delete_signatureupdate'),(40,'Can view signature update',10,'view_signatureupdate'),(41,'Can add system update',11,'add_systemupdate'),(42,'Can change system update',11,'change_systemupdate'),(43,'Can delete system update',11,'delete_systemupdate'),(44,'Can view system update',11,'view_systemupdate'),(45,'Can add threat category',12,'add_threatcategory'),(46,'Can change threat category',12,'change_threatcategory'),(47,'Can delete threat category',12,'delete_threatcategory'),(48,'Can view threat category',12,'view_threatcategory'),(49,'Can add threat intelligence',13,'add_threatintelligence'),(50,'Can change threat intelligence',13,'change_threatintelligence'),(51,'Can delete threat intelligence',13,'delete_threatintelligence'),(52,'Can view threat intelligence',13,'view_threatintelligence'),(53,'Can add user',14,'add_user'),(54,'Can change user',14,'change_user'),(55,'Can delete user',14,'delete_user'),(56,'Can view user',14,'view_user'),(57,'Can add threat analysis',15,'add_threatanalysis'),(58,'Can change threat analysis',15,'change_threatanalysis'),(59,'Can delete threat analysis',15,'delete_threatanalysis'),(60,'Can view threat analysis',15,'view_threatanalysis'),(61,'Can add threat',16,'add_threat'),(62,'Can change threat',16,'change_threat'),(63,'Can delete threat',16,'delete_threat'),(64,'Can view threat',16,'view_threat'),(65,'Can add statistics',17,'add_statistics'),(66,'Can change statistics',17,'change_statistics'),(67,'Can delete statistics',17,'delete_statistics'),(68,'Can view statistics',17,'view_statistics'),(69,'Can add scan',18,'add_scan'),(70,'Can change scan',18,'change_scan'),(71,'Can delete scan',18,'delete_scan'),(72,'Can view scan',18,'view_scan'),(73,'Can add sandbox',19,'add_sandbox'),(74,'Can change sandbox',19,'change_sandbox'),(75,'Can delete sandbox',19,'delete_sandbox'),(76,'Can view sandbox',19,'view_sandbox'),(77,'Can add report',20,'add_report'),(78,'Can change report',20,'change_report'),(79,'Can delete report',20,'delete_report'),(80,'Can view report',20,'view_report'),(81,'Can add remediation history',21,'add_remediationhistory'),(82,'Can change remediation history',21,'change_remediationhistory'),(83,'Can delete remediation history',21,'delete_remediationhistory'),(84,'Can view remediation history',21,'view_remediationhistory'),(85,'Can add notification',22,'add_notification'),(86,'Can change notification',22,'change_notification'),(87,'Can delete notification',22,'delete_notification'),(88,'Can view notification',22,'view_notification'),(89,'Can add network activity',23,'add_networkactivity'),(90,'Can change network activity',23,'change_networkactivity'),(91,'Can delete network activity',23,'delete_networkactivity'),(92,'Can view network activity',23,'view_networkactivity'),(93,'Can add log',24,'add_log'),(94,'Can change log',24,'change_log'),(95,'Can delete log',24,'delete_log'),(96,'Can view log',24,'view_log'),(97,'Can add license',25,'add_license'),(98,'Can change license',25,'change_license'),(99,'Can delete license',25,'delete_license'),(100,'Can view license',25,'view_license'),(101,'Can add device information',26,'add_deviceinformation'),(102,'Can change device information',26,'change_deviceinformation'),(103,'Can delete device information',26,'delete_deviceinformation'),(104,'Can view device information',26,'view_deviceinformation'),(105,'Can add user report',27,'add_userreport'),(106,'Can change user report',27,'change_userreport'),(107,'Can delete user report',27,'delete_userreport'),(108,'Can view user report',27,'view_userreport'),(109,'Can add user setting',28,'add_usersetting'),(110,'Can change user setting',28,'change_usersetting'),(111,'Can delete user setting',28,'delete_usersetting'),(112,'Can view user setting',28,'view_usersetting');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_category`
--

DROP TABLE IF EXISTS `comodo_antivirus_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_category`
--

LOCK TABLES `comodo_antivirus_category` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_category` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_category` VALUES (1,'cat1','desc1'),(2,'cat2','desc2');
/*!40000 ALTER TABLE `comodo_antivirus_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_deviceinformation`
--

DROP TABLE IF EXISTS `comodo_antivirus_deviceinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_deviceinformation` (
  `device_id` int NOT NULL AUTO_INCREMENT,
  `device_name` varchar(255) NOT NULL,
  `device_type` varchar(255) NOT NULL,
  `operating_system` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`device_id`),
  KEY `comodo_antivirus_dev_user_id_5ecd2959_fk_comodo_an` (`user_id`),
  CONSTRAINT `comodo_antivirus_dev_user_id_5ecd2959_fk_comodo_an` FOREIGN KEY (`user_id`) REFERENCES `comodo_antivirus_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_deviceinformation`
--

LOCK TABLES `comodo_antivirus_deviceinformation` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_deviceinformation` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_deviceinformation` VALUES (1,'n1','t1','s1',1),(2,'d2','t2','s2',2),(3,'d1','t1','os1',3),(4,'2e','eq','eq',4),(5,'dd','dd','dd',5),(6,'d1','t1','os1',6),(7,'dev10','ty10','op10',8),(8,'d12','t12','op12',9),(9,'qwe','eqe','weee',10);
/*!40000 ALTER TABLE `comodo_antivirus_deviceinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_license`
--

DROP TABLE IF EXISTS `comodo_antivirus_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_license` (
  `license_key` varchar(255) NOT NULL,
  `expiration_date` date NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`license_key`),
  KEY `comodo_antivirus_lic_user_id_9dc96ff7_fk_comodo_an` (`user_id`),
  CONSTRAINT `comodo_antivirus_lic_user_id_9dc96ff7_fk_comodo_an` FOREIGN KEY (`user_id`) REFERENCES `comodo_antivirus_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_license`
--

LOCK TABLES `comodo_antivirus_license` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_license` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_license` VALUES ('1','2024-01-01',2),('2','2025-02-02',1),('3','2020-01-01',3);
/*!40000 ALTER TABLE `comodo_antivirus_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_log`
--

DROP TABLE IF EXISTS `comodo_antivirus_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `date_logged` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `comodo_antivirus_log_user_id_730d936d_fk_comodo_an` (`user_id`),
  CONSTRAINT `comodo_antivirus_log_user_id_730d936d_fk_comodo_an` FOREIGN KEY (`user_id`) REFERENCES `comodo_antivirus_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_log`
--

LOCK TABLES `comodo_antivirus_log` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_log` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_log` VALUES (1,'test','2001-01-02 00:00:00.000000',2),(2,'test2','2022-02-02 00:00:00.000000',1),(3,'test3','2022-01-01 00:00:00.000000',3);
/*!40000 ALTER TABLE `comodo_antivirus_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_malwaresample`
--

DROP TABLE IF EXISTS `comodo_antivirus_malwaresample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_malwaresample` (
  `sample_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `sha256` varchar(64) NOT NULL,
  `md5` varchar(32) NOT NULL,
  `file_size` bigint NOT NULL,
  `upload_date` datetime(6) NOT NULL,
  PRIMARY KEY (`sample_id`),
  UNIQUE KEY `sha256` (`sha256`),
  UNIQUE KEY `md5` (`md5`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_malwaresample`
--

LOCK TABLES `comodo_antivirus_malwaresample` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_malwaresample` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_malwaresample` VALUES (1,'name1','file1','weewqes','wwqewaddw',10,'2024-02-04 00:00:00.000000'),(3,'','','','',10,'2024-02-04 00:00:00.000000'),(4,'edd','qe','aadd','ddddd',10,'2024-02-04 00:00:00.000000'),(5,'qeeq','eqe','eqw','qqq',10,'2024-02-04 00:00:00.000000'),(6,'qeeq','ttt','eqew','eee',10,'2024-02-04 00:00:00.000000'),(7,'nnn1','fff1','aweeq','eqde',10,'2024-02-04 00:00:00.000000'),(8,'eeq','eeqe','qeeqqwe','qee',10,'2024-02-04 00:00:00.000000'),(10,'eeq','eeqe','qeeqqweddd','qeewww',10,'2024-02-04 00:00:00.000000'),(11,'ewwwq','eqe','qqqqqqqqqqq','adds',10,'2024-02-04 00:00:00.000000'),(12,'qeeqewe','rrrr','fghhg','fgcs',10,'2024-02-04 00:00:00.000000'),(13,'eee','reqee','eqee','qeewee',10,'2024-02-04 00:00:00.000000'),(14,'name2','test2','qeegersdffs','seddeqeqewew',10,'2024-02-04 00:00:00.000000'),(15,'name1','file2','frrwdee','weweeqeee',10,'2024-02-04 00:00:00.000000'),(16,'eqwwee','eqw','weeqewadda','dada',10,'2024-02-04 00:00:00.000000'),(17,'dddewe','dd','ddweweqe','qwee',10,'2024-02-04 00:00:00.000000'),(18,'name2','file3','eqeeqrcfdfc','fewdedeqq',10,'2024-02-04 00:00:00.000000'),(19,'name23','file34','eqeeqrcfdfceqe','fewdedeqqqwqweqw',10,'2024-02-04 00:00:00.000000'),(20,'n10','file10','eqeqeqeweeqeeq','adwddweewweqee',10,'2024-02-04 00:00:00.000000'),(21,'n11','file11','eqeqeqeweeqeeqeeq','adwddweewweqeewqeee',10,'2024-02-04 00:00:00.000000'),(22,'name12','file12','eqeeqsaddwwe','refweedqdwd',10,'2024-02-04 00:00:00.000000'),(23,'eqeeqe','qeeqeeqe','eqeqqqqqq','dde',10,'2024-02-04 00:00:00.000000'),(24,'eqeeqe','qeeqeeqe','eqeqqqqqqwe','ddeeweeq',10,'2024-02-04 00:00:00.000000');
/*!40000 ALTER TABLE `comodo_antivirus_malwaresample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_networkactivity`
--

DROP TABLE IF EXISTS `comodo_antivirus_networkactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_networkactivity` (
  `activity_id` int NOT NULL AUTO_INCREMENT,
  `source_ip` char(39) NOT NULL,
  `destination_ip` char(39) NOT NULL,
  `activity_type` varchar(255) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `comodo_antivirus_net_user_id_e3d82225_fk_comodo_an` (`user_id`),
  CONSTRAINT `comodo_antivirus_net_user_id_e3d82225_fk_comodo_an` FOREIGN KEY (`user_id`) REFERENCES `comodo_antivirus_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_networkactivity`
--

LOCK TABLES `comodo_antivirus_networkactivity` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_networkactivity` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_networkactivity` VALUES (1,'127.88.1.1','127.0.0.1','1','2000-01-01 00:00:00.000000',2),(2,'127.0.0.1','127.88.1.1','2','2000-01-01 00:00:00.000000',10),(3,'127.1.2.3','127.0.0.1','3','2001-01-01 00:00:00.000000',1);
/*!40000 ALTER TABLE `comodo_antivirus_networkactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_notification`
--

DROP TABLE IF EXISTS `comodo_antivirus_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_notification` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `date_sent` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `comodo_antivirus_not_user_id_4b993707_fk_comodo_an` (`user_id`),
  CONSTRAINT `comodo_antivirus_not_user_id_4b993707_fk_comodo_an` FOREIGN KEY (`user_id`) REFERENCES `comodo_antivirus_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_notification`
--

LOCK TABLES `comodo_antivirus_notification` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_notification` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_notification` VALUES (1,'hi','2000-01-01 00:00:00.000000',2),(2,'hello wordl','2002-02-02 00:00:00.000000',1),(3,'scan done','2022-01-01 00:00:00.000000',3);
/*!40000 ALTER TABLE `comodo_antivirus_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_remediationaction`
--

DROP TABLE IF EXISTS `comodo_antivirus_remediationaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_remediationaction` (
  `action_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_remediationaction`
--

LOCK TABLES `comodo_antivirus_remediationaction` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_remediationaction` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_remediationaction` VALUES (1,'do1','description1'),(2,'do2','desc2'),(3,'do3','desc3');
/*!40000 ALTER TABLE `comodo_antivirus_remediationaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_remediationhistory`
--

DROP TABLE IF EXISTS `comodo_antivirus_remediationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_remediationhistory` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `date_remediated` datetime(6) NOT NULL,
  `action_id` int NOT NULL,
  `sample_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `comodo_antivirus_rem_action_id_f9abd697_fk_comodo_an` (`action_id`),
  KEY `comodo_antivirus_rem_sample_id_60267190_fk_comodo_an` (`sample_id`),
  KEY `comodo_antivirus_rem_user_id_f4db6101_fk_comodo_an` (`user_id`),
  CONSTRAINT `comodo_antivirus_rem_action_id_f9abd697_fk_comodo_an` FOREIGN KEY (`action_id`) REFERENCES `comodo_antivirus_remediationaction` (`action_id`),
  CONSTRAINT `comodo_antivirus_rem_sample_id_60267190_fk_comodo_an` FOREIGN KEY (`sample_id`) REFERENCES `comodo_antivirus_malwaresample` (`sample_id`),
  CONSTRAINT `comodo_antivirus_rem_user_id_f4db6101_fk_comodo_an` FOREIGN KEY (`user_id`) REFERENCES `comodo_antivirus_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_remediationhistory`
--

LOCK TABLES `comodo_antivirus_remediationhistory` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_remediationhistory` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_remediationhistory` VALUES (1,'2022-01-01 00:00:00.000000',1,1,2),(2,'2023-01-01 00:00:00.000000',2,1,3);
/*!40000 ALTER TABLE `comodo_antivirus_remediationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_report`
--

DROP TABLE IF EXISTS `comodo_antivirus_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `report_file` varchar(100) NOT NULL,
  `date_generated` datetime(6) NOT NULL,
  `scan_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `comodo_antivirus_rep_scan_id_e7ef6463_fk_comodo_an` (`scan_id`),
  KEY `comodo_antivirus_rep_user_id_4b84a259_fk_comodo_an` (`user_id`),
  CONSTRAINT `comodo_antivirus_rep_scan_id_e7ef6463_fk_comodo_an` FOREIGN KEY (`scan_id`) REFERENCES `comodo_antivirus_scan` (`scan_id`),
  CONSTRAINT `comodo_antivirus_rep_user_id_4b84a259_fk_comodo_an` FOREIGN KEY (`user_id`) REFERENCES `comodo_antivirus_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_report`
--

LOCK TABLES `comodo_antivirus_report` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_report` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_report` VALUES (1,'f1','2023-02-02 00:00:00.000000',1,2),(2,'f2','2023-01-01 00:00:00.000000',2,3);
/*!40000 ALTER TABLE `comodo_antivirus_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_sandbox`
--

DROP TABLE IF EXISTS `comodo_antivirus_sandbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_sandbox` (
  `Sandbox_id` int NOT NULL AUTO_INCREMENT,
  `date_Sandboxed` datetime(6) NOT NULL,
  `sample_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`Sandbox_id`),
  KEY `comodo_antivirus_san_sample_id_9655ad3e_fk_comodo_an` (`sample_id`),
  KEY `comodo_antivirus_san_user_id_8d1506e6_fk_comodo_an` (`user_id`),
  CONSTRAINT `comodo_antivirus_san_sample_id_9655ad3e_fk_comodo_an` FOREIGN KEY (`sample_id`) REFERENCES `comodo_antivirus_malwaresample` (`sample_id`),
  CONSTRAINT `comodo_antivirus_san_user_id_8d1506e6_fk_comodo_an` FOREIGN KEY (`user_id`) REFERENCES `comodo_antivirus_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_sandbox`
--

LOCK TABLES `comodo_antivirus_sandbox` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_sandbox` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_sandbox` VALUES (1,'2023-02-02 00:00:00.000000',1,1);
/*!40000 ALTER TABLE `comodo_antivirus_sandbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_scan`
--

DROP TABLE IF EXISTS `comodo_antivirus_scan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_scan` (
  `scan_id` int NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`scan_id`),
  KEY `comodo_antivirus_sca_user_id_46fc07e2_fk_comodo_an` (`user_id`),
  CONSTRAINT `comodo_antivirus_sca_user_id_46fc07e2_fk_comodo_an` FOREIGN KEY (`user_id`) REFERENCES `comodo_antivirus_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_scan`
--

LOCK TABLES `comodo_antivirus_scan` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_scan` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_scan` VALUES (1,'2024-02-04 00:00:00.000000',2),(2,'2024-02-04 00:00:00.000000',2),(3,'2024-02-04 00:00:00.000000',2),(4,'2024-02-04 00:00:00.000000',2),(5,'2024-02-04 00:00:00.000000',2),(6,'2024-02-04 00:00:00.000000',2),(7,'2024-02-04 00:00:00.000000',2),(8,'2024-02-04 00:00:00.000000',2),(9,'2024-02-04 00:00:00.000000',2),(10,'2024-02-04 00:00:00.000000',2),(11,'2024-02-04 00:00:00.000000',2),(12,'2024-02-04 00:00:00.000000',2),(13,'2024-02-04 00:00:00.000000',2),(14,'2024-02-04 00:00:00.000000',2),(15,'2024-02-04 00:00:00.000000',3),(16,'2024-02-04 00:00:00.000000',4),(17,'2024-02-04 00:00:00.000000',5),(18,'2024-02-04 00:00:00.000000',6),(19,'2024-02-04 00:00:00.000000',2),(20,'2024-02-04 00:00:00.000000',8),(21,'2024-02-04 00:00:00.000000',2),(22,'2024-02-04 00:00:00.000000',9),(23,'2024-02-04 00:00:00.000000',2),(24,'2024-02-04 00:00:00.000000',10);
/*!40000 ALTER TABLE `comodo_antivirus_scan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_signatureupdate`
--

DROP TABLE IF EXISTS `comodo_antivirus_signatureupdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_signatureupdate` (
  `update_id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `date_applied` datetime(6) NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_signatureupdate`
--

LOCK TABLES `comodo_antivirus_signatureupdate` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_signatureupdate` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_signatureupdate` VALUES (1,'2.2.2','2024-01-01 00:00:00.000000'),(2,'2.3.2','2024-02-02 00:00:00.000000');
/*!40000 ALTER TABLE `comodo_antivirus_signatureupdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_statistics`
--

DROP TABLE IF EXISTS `comodo_antivirus_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_statistics` (
  `statistic_id` int NOT NULL AUTO_INCREMENT,
  `scan_count` int NOT NULL,
  `malware_detected` int NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`statistic_id`),
  KEY `comodo_antivirus_sta_user_id_c304828a_fk_comodo_an` (`user_id`),
  CONSTRAINT `comodo_antivirus_sta_user_id_c304828a_fk_comodo_an` FOREIGN KEY (`user_id`) REFERENCES `comodo_antivirus_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_statistics`
--

LOCK TABLES `comodo_antivirus_statistics` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_statistics` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_statistics` VALUES (1,3,2,'2022-01-01 00:00:00.000000',1),(2,4,3,'2021-01-01 00:00:00.000000',2);
/*!40000 ALTER TABLE `comodo_antivirus_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_systemupdate`
--

DROP TABLE IF EXISTS `comodo_antivirus_systemupdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_systemupdate` (
  `update_id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `date_applied` datetime(6) NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_systemupdate`
--

LOCK TABLES `comodo_antivirus_systemupdate` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_systemupdate` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_systemupdate` VALUES (1,'1','2022-01-01 00:00:00.000000'),(2,'2','2023-01-01 00:00:00.000000');
/*!40000 ALTER TABLE `comodo_antivirus_systemupdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_threat`
--

DROP TABLE IF EXISTS `comodo_antivirus_threat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_threat` (
  `threat_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `severity` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`threat_id`),
  KEY `comodo_antivirus_thr_category_id_be84742f_fk_comodo_an` (`category_id`),
  CONSTRAINT `comodo_antivirus_thr_category_id_be84742f_fk_comodo_an` FOREIGN KEY (`category_id`) REFERENCES `comodo_antivirus_threatcategory` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_threat`
--

LOCK TABLES `comodo_antivirus_threat` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_threat` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_threat` VALUES (1,'CVE-2023-2023','The Custom 404 Pro WordPress plugin before 3.7.3 does not escape some URLs before outputting them in attributes, leading to Reflected Cross-Site Scripting.','medium','2024-02-03 23:25:58.530753','2024-02-03 23:25:58.530903',2),(2,'wwdwadwd','dadd','high2','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',3),(3,'rrrr','dddd','fff','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',3),(4,'fs','efdede','dqd','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',12),(5,'qeeeqe','eqeeqe','eqee','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',13),(6,'namet2','desc2','hight','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',14),(7,'n1','d1','hight','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',15),(8,'asd','dadada','dsdd','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',16),(9,'eqweqw','fvcc','dddda','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',17),(10,'name22','desc2','noraml2','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',18),(11,'name223','descsample','hight','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',19),(12,'threat10','desc10','highy','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',20),(13,'threat10eq','desc10eq','highye','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',21),(14,'th12','descth12','high','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',22),(15,'daddad','daddd','addd','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',23),(16,'daddad','daddd','addd','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000',23);
/*!40000 ALTER TABLE `comodo_antivirus_threat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_threatanalysis`
--

DROP TABLE IF EXISTS `comodo_antivirus_threatanalysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_threatanalysis` (
  `analysis_id` int NOT NULL AUTO_INCREMENT,
  `analysis_result` longtext NOT NULL,
  `analysis_date` datetime(6) NOT NULL,
  `sample_id` int NOT NULL,
  PRIMARY KEY (`analysis_id`),
  KEY `comodo_antivirus_thr_sample_id_9a46a5cd_fk_comodo_an` (`sample_id`),
  CONSTRAINT `comodo_antivirus_thr_sample_id_9a46a5cd_fk_comodo_an` FOREIGN KEY (`sample_id`) REFERENCES `comodo_antivirus_malwaresample` (`sample_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_threatanalysis`
--

LOCK TABLES `comodo_antivirus_threatanalysis` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_threatanalysis` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_threatanalysis` VALUES (1,'2','2022-01-01 00:00:00.000000',1),(2,'3','2011-01-01 00:00:00.000000',1);
/*!40000 ALTER TABLE `comodo_antivirus_threatanalysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_threatcategory`
--

DROP TABLE IF EXISTS `comodo_antivirus_threatcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_threatcategory` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_threatcategory`
--

LOCK TABLES `comodo_antivirus_threatcategory` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_threatcategory` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_threatcategory` VALUES (1,'trojan','missleading malware. wolf in sheeps cloth'),(2,'misc','miscellaneous threats'),(3,'name1','desc'),(4,'',''),(5,'edd','dddd'),(6,'qeeq','eeqe'),(7,'qeeq','eqeqer'),(8,'nnn1','kjjk'),(9,'eeq','hh'),(10,'eeq','hh'),(11,'ewwwq','eqewes'),(12,'tt4','wrew'),(13,'new2','fadad'),(14,'cat1','fdaddw'),(15,'cat4','desc1'),(16,'ads','adsdas'),(17,'awe','weqeeqw'),(18,'cat7','descat2'),(19,'cat8','desccatnew'),(20,'cat10','desccat10'),(21,'cat11','desccat11'),(22,'cat12','catdesc12'),(23,'ddad','daddsd'),(24,'ddad','daddsd');
/*!40000 ALTER TABLE `comodo_antivirus_threatcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_threatintelligence`
--

DROP TABLE IF EXISTS `comodo_antivirus_threatintelligence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_threatintelligence` (
  `threat_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `severity` varchar(50) NOT NULL,
  PRIMARY KEY (`threat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_threatintelligence`
--

LOCK TABLES `comodo_antivirus_threatintelligence` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_threatintelligence` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_threatintelligence` VALUES (1,'name1','des1','high'),(2,'name2','desc2','low'),(3,'name3','desc3','low');
/*!40000 ALTER TABLE `comodo_antivirus_threatintelligence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_user`
--

DROP TABLE IF EXISTS `comodo_antivirus_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_user`
--

LOCK TABLES `comodo_antivirus_user` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_user` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_user` VALUES (1,'u1','e1','123','f1','l1','2000-01-01','2001-01-01 00:00:00.000000','2002-01-01 00:00:00.000000'),(2,'u2','email','123','name','last234','2023-02-01','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000'),(3,'user3','rad@gmail.com','123','rad','ta','2000-01-02','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000'),(4,'user4','eeq','123','eeq','eqed','2000-01-01','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000'),(5,'ttt','eqqe','123','qeeq','www','2000-01-01','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000'),(6,'user6','r@gmail.com','123','f1','l1','2000-01-01','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000'),(8,'user10','radmehr@gmail.com','123','fff10','lll10','2010-02-02','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000'),(9,'user12','fda@gmail.com','123','f12','l12','2012-12-12','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000'),(10,'uu','qeeqeqew','123','eqee','qe','2000-01-01','2024-02-04 00:00:00.000000','2024-02-04 00:00:00.000000');
/*!40000 ALTER TABLE `comodo_antivirus_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_userreport`
--

DROP TABLE IF EXISTS `comodo_antivirus_userreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_userreport` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `report_file` varchar(100) NOT NULL,
  `date_generated` datetime(6) NOT NULL,
  `scan_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `comodo_antivirus_use_scan_id_1f83900d_fk_comodo_an` (`scan_id`),
  KEY `comodo_antivirus_use_user_id_e4080c5a_fk_comodo_an` (`user_id`),
  CONSTRAINT `comodo_antivirus_use_scan_id_1f83900d_fk_comodo_an` FOREIGN KEY (`scan_id`) REFERENCES `comodo_antivirus_scan` (`scan_id`),
  CONSTRAINT `comodo_antivirus_use_user_id_e4080c5a_fk_comodo_an` FOREIGN KEY (`user_id`) REFERENCES `comodo_antivirus_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_userreport`
--

LOCK TABLES `comodo_antivirus_userreport` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_userreport` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_userreport` VALUES (1,'f1','2022-02-02 00:00:00.000000',1,2),(2,'f2','2023-02-02 00:00:00.000000',2,3);
/*!40000 ALTER TABLE `comodo_antivirus_userreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comodo_antivirus_usersetting`
--

DROP TABLE IF EXISTS `comodo_antivirus_usersetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comodo_antivirus_usersetting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `enable_notifications` tinyint(1) NOT NULL,
  `enable_scanning` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `comodo_antivirus_use_user_id_951a7b4a_fk_comodo_an` FOREIGN KEY (`user_id`) REFERENCES `comodo_antivirus_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comodo_antivirus_usersetting`
--

LOCK TABLES `comodo_antivirus_usersetting` WRITE;
/*!40000 ALTER TABLE `comodo_antivirus_usersetting` DISABLE KEYS */;
INSERT INTO `comodo_antivirus_usersetting` VALUES (1,1,1,1),(2,1,1,2),(3,1,1,3);
/*!40000 ALTER TABLE `comodo_antivirus_usersetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-02-03 23:24:49.620234','1','trojan',1,'[{\"added\": {}}]',12,2),(2,'2024-02-03 23:25:16.199653','2','misc',1,'[{\"added\": {}}]',12,2),(3,'2024-02-03 23:25:58.540647','1','CVE-2023-2023',1,'[{\"added\": {}}]',16,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','customuser'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(7,'comodo_antivirus','category'),(26,'comodo_antivirus','deviceinformation'),(25,'comodo_antivirus','license'),(24,'comodo_antivirus','log'),(8,'comodo_antivirus','malwaresample'),(23,'comodo_antivirus','networkactivity'),(22,'comodo_antivirus','notification'),(9,'comodo_antivirus','remediationaction'),(21,'comodo_antivirus','remediationhistory'),(20,'comodo_antivirus','report'),(19,'comodo_antivirus','sandbox'),(18,'comodo_antivirus','scan'),(10,'comodo_antivirus','signatureupdate'),(17,'comodo_antivirus','statistics'),(11,'comodo_antivirus','systemupdate'),(16,'comodo_antivirus','threat'),(15,'comodo_antivirus','threatanalysis'),(12,'comodo_antivirus','threatcategory'),(13,'comodo_antivirus','threatintelligence'),(14,'comodo_antivirus','user'),(27,'comodo_antivirus','userreport'),(28,'comodo_antivirus','usersetting'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-02-03 22:53:53.569411'),(2,'contenttypes','0002_remove_content_type_name','2024-02-03 22:53:53.693700'),(3,'auth','0001_initial','2024-02-03 22:53:54.306890'),(4,'auth','0002_alter_permission_name_max_length','2024-02-03 22:53:54.398752'),(5,'auth','0003_alter_user_email_max_length','2024-02-03 22:53:54.423374'),(6,'auth','0004_alter_user_username_opts','2024-02-03 22:53:54.459914'),(7,'auth','0005_alter_user_last_login_null','2024-02-03 22:53:54.498284'),(8,'auth','0006_require_contenttypes_0002','2024-02-03 22:53:54.513754'),(9,'auth','0007_alter_validators_add_error_messages','2024-02-03 22:53:54.546276'),(10,'auth','0008_alter_user_username_max_length','2024-02-03 22:53:54.585579'),(11,'auth','0009_alter_user_last_name_max_length','2024-02-03 22:53:54.613009'),(12,'auth','0010_alter_group_name_max_length','2024-02-03 22:53:54.673728'),(13,'auth','0011_update_proxy_permissions','2024-02-03 22:53:54.718686'),(14,'auth','0012_alter_user_first_name_max_length','2024-02-03 22:53:54.747445'),(15,'accounts','0001_initial','2024-02-03 22:53:55.269951'),(16,'admin','0001_initial','2024-02-03 22:53:55.521772'),(17,'admin','0002_logentry_remove_auto_add','2024-02-03 22:53:55.556158'),(18,'admin','0003_logentry_add_action_flag_choices','2024-02-03 22:53:55.603543'),(19,'comodo_antivirus','0001_initial','2024-02-03 22:53:58.411314'),(20,'sessions','0001_initial','2024-02-03 22:53:58.494267');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('mmip8078q44uu2zf88h8owfuvssqrs47','.eJxVjMsOgjAUBf-la9O0F0uLS_d8Q3NfWNRAQmFl_HclYaHbMzPnZTJua8lb1SWPYi4GzOl3I-SHTjuQO0632fI8rctIdlfsQavtZ9Hn9XD_DgrW8q2TiicYBJIicGwJhUG4wRC9DzIoxESNw8guNZ1qp46YSNifg2sBzfsDFjs5CQ:1rWPMj:7gNAPNV5vekQVH8td_hgWrLLDF1958TRSlVlDtua7mg','2024-02-17 23:24:05.119364');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-04 23:21:11
