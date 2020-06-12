-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: logcollector
-- ------------------------------------------------------
-- Server version	10.3.22-MariaDB-1:10.3.22+maria~bionic-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_reorder_config`
--

DROP TABLE IF EXISTS `admin_reorder_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_reorder_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(250) COLLATE utf8_bin NOT NULL,
  `label` varchar(250) COLLATE utf8_bin NOT NULL,
  `model` longtext COLLATE utf8_bin DEFAULT NULL,
  `ordinal` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_reorder_config`
--

LOCK TABLES `admin_reorder_config` WRITE;
/*!40000 ALTER TABLE `admin_reorder_config` DISABLE KEYS */;
INSERT INTO `admin_reorder_config` VALUES (1,'authtoken','Auth Token',NULL,NULL,1),(2,'auth','Authentication and Authorization',NULL,NULL,1),(3,'uihlogmodels','Config','uihlogmodels.ModuleConfig,uihlogmodels.ModulePublicViewConfig,uihlogmodels.SystemConfig,uihlogmodels.SchedulerTaskConfig,uihlogmodels.AliveConfig,uihlogmodels.ConfigIntrusionDetection,uihlogmodels.EmailConfig,uihlogmodels.SearchConfig,uihlogmodels.IntrusionDetectionHistory,uihlogmodels.DeviceType,uihlogmodels.AdminReorderConfig,uihlogmodels.MailMessage',NULL,1),(4,'uihlogmodels','Company','uihlogmodels.AuthKey,uihlogmodels.CompanyProfile,uihlogmodels.CompanyLogLicence,uihlogmodels.CompanyLogPackage,uihlogmodels.MapCompanyAuthGroup,uihlogmodels.PrivateKeySSH,uihlogmodels.CompanyMessage,uihlogmodels.EventLog,uihlogmodels.Branch',NULL,1),(5,'uihlogmodels','Collector','uihlogmodels.LogCollector,uihlogmodels.LogCollectorStatus,uihlogmodels.LogCollectorAlert,uihlogmodels.LogCollectorAlive,uihlogmodels.LogCollectorResource',NULL,1),(6,'uihlogmodels','Source','uihlogmodels.Source,uihlogmodels.SourceUsage,uihlogmodels.SourceStatus,uihlogmodels.SourceAlert,uihlogmodels.SourceAlive,uihlogmodels.SourceUsageHistory',NULL,1),(7,'uihlogmodels','User','uihlogmodels.AuthUserProfile,uihlogmodels.AuthUserLoginHistory,uihlogmodels.AuthUserSession',NULL,1),(8,'django_apscheduler','Job','django_apscheduler.DjangoJobExecution,django_apscheduler.DjangoJob',NULL,1),(9,'otp_totp','2FA OTP','',NULL,1),(10,'uihlogcollectoranalytic','Data analytic','',NULL,1),(11,'uihlogmodels','Email & Message','uihlogmodels.EmailConfig,uihlogmodels.MailTemplate,uihlogmodels.MailMessage',NULL,1),(12,'uihlogcollectorireport','Gen IReport','',NULL,1);
/*!40000 ALTER TABLE `admin_reorder_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alive_config`
--

DROP TABLE IF EXISTS `alive_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alive_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` int(11) DEFAULT NULL,
  `stop` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_alert` tinyint(1) DEFAULT NULL,
  `color` varchar(18) DEFAULT NULL,
  `is_alert_line` tinyint(1) DEFAULT NULL,
  `is_alert_mail` tinyint(1) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `reset_alert_line` tinyint(1) DEFAULT NULL,
  `reset_alert_mail` tinyint(1) DEFAULT NULL,
  `is_alive` tinyint(1) DEFAULT NULL,
  `spare_time` int(11) DEFAULT NULL,
  `formula` varchar(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alive_config`
--

LOCK TABLES `alive_config` WRITE;
/*!40000 ALTER TABLE `alive_config` DISABLE KEYS */;
INSERT INTO `alive_config` VALUES (1,0,300000,'alive',1,'2019-04-19 17:26:06.863986',0,'#2FFF05',0,0,1,1,1,1,60000,'x * 1.5'),(2,300001,600000,'warning',1,'2019-04-19 17:26:06.864565',0,'#FFFF12',0,0,2,0,0,1,300000,'x * 2'),(3,600001,86400000,'alert',1,'2019-04-19 17:26:06.864863',1,'#F26609',0,0,3,0,0,0,86400000,'86400000'),(4,86400001,NULL,'dead',1,'2019-04-19 17:26:06.953703',0,'#FF0000',0,0,4,0,0,0,0,'x');
/*!40000 ALTER TABLE `alive_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_event_log`
--

DROP TABLE IF EXISTS `app_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8_bin DEFAULT NULL,
  `message_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_event_log_user_id_e13d188a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `app_event_log_user_id_e13d188a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_event_log`
--

LOCK TABLES `app_event_log` WRITE;
/*!40000 ALTER TABLE `app_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Company'),(2,'Staff'),(3,'System');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(21,1,7),(20,1,8),(3,1,14),(4,1,15),(32,1,101),(26,1,103),(5,2,1),(6,2,2),(7,2,3),(8,2,4),(9,2,5),(10,2,6),(13,2,9),(14,2,10),(15,2,11),(16,2,12),(17,2,13),(41,2,100),(39,2,107),(34,2,191),(35,2,192),(36,2,193),(38,2,194),(40,2,195),(37,2,196),(22,3,105),(23,3,106);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can view dashboard company [user]',1,'view_dashboard'),(2,'Can view monitor all company [adminlog]',1,'view_monitor'),(3,'Can view report company [user, adminlog]',1,'view_report'),(4,'Can view monitor all companys [adminlog]',1,'view_monitor_company'),(5,'Can view monitor all collectors [adminlog]',1,'view_monitor_collector'),(6,'Can view monitor all source [adminlog]',1,'view_monitor_source'),(7,'Can view monitor source file by company [adminlog]',1,'view_monitor_file'),(8,'Can view monitor list source file by company [adminlog]',1,'view_monitor_listfile'),(9,'Can view monitor alert collectors [adminlog]',1,'view_alert_collector'),(10,'Can view monitor alert collectors log [adminlog]',1,'view_alert_collector_log'),(11,'Can view monitor alert sources [adminlog]',1,'view_alert_source'),(12,'Can view monitor alert sources log [adminlog]',1,'view_alert_source_log'),(13,'Can view monitor search company before view log [adminlog]',1,'view_search_company_by_log'),(14,'Can view search company log [user, adminlog]',1,'view_search_log'),(15,'Can view monitor user company [user]',1,'view_monitor_user_company'),(16,'Can add log entry',2,'add_logentry'),(17,'Can change log entry',2,'change_logentry'),(18,'Can delete log entry',2,'delete_logentry'),(19,'Can view log entry',2,'view_logentry'),(20,'Can add permission',3,'add_permission'),(21,'Can change permission',3,'change_permission'),(22,'Can delete permission',3,'delete_permission'),(23,'Can view permission',3,'view_permission'),(24,'Can add group',4,'add_group'),(25,'Can change group',4,'change_group'),(26,'Can delete group',4,'delete_group'),(27,'Can view group',4,'view_group'),(28,'Can add user',5,'add_user'),(29,'Can change user',5,'change_user'),(30,'Can delete user',5,'delete_user'),(31,'Can view user',5,'view_user'),(32,'Can add content type',6,'add_contenttype'),(33,'Can change content type',6,'change_contenttype'),(34,'Can delete content type',6,'delete_contenttype'),(35,'Can view content type',6,'view_contenttype'),(36,'Can add session',7,'add_session'),(37,'Can change session',7,'change_session'),(38,'Can delete session',7,'delete_session'),(39,'Can view session',7,'view_session'),(40,'Can add Token',8,'add_token'),(41,'Can change Token',8,'change_token'),(42,'Can delete Token',8,'delete_token'),(43,'Can view Token',8,'view_token'),(44,'Can add auth key',9,'add_authkey'),(45,'Can change auth key',9,'change_authkey'),(46,'Can delete auth key',9,'delete_authkey'),(47,'Can view auth key',9,'view_authkey'),(48,'Can add log collector',10,'add_logcollector'),(49,'Can change log collector',10,'change_logcollector'),(50,'Can delete log collector',10,'delete_logcollector'),(51,'Can view log collector',10,'view_logcollector'),(52,'Can add log collector status',11,'add_logcollectorstatus'),(53,'Can change log collector status',11,'change_logcollectorstatus'),(54,'Can delete log collector status',11,'delete_logcollectorstatus'),(55,'Can view log collector status',11,'view_logcollectorstatus'),(56,'Can add module config',12,'add_moduleconfig'),(57,'Can change module config',12,'change_moduleconfig'),(58,'Can delete module config',12,'delete_moduleconfig'),(59,'Can view module config',12,'view_moduleconfig'),(60,'Can add module public view config',13,'add_modulepublicviewconfig'),(61,'Can change module public view config',13,'change_modulepublicviewconfig'),(62,'Can delete module public view config',13,'delete_modulepublicviewconfig'),(63,'Can view module public view config',13,'view_modulepublicviewconfig'),(64,'Can add source',14,'add_source'),(65,'Can change source',14,'change_source'),(66,'Can delete source',14,'delete_source'),(67,'Can view source',14,'view_source'),(68,'Can add source status',15,'add_sourcestatus'),(69,'Can change source status',15,'change_sourcestatus'),(70,'Can delete source status',15,'delete_sourcestatus'),(71,'Can view source status',15,'view_sourcestatus'),(72,'Can add source usage',16,'add_sourceusage'),(73,'Can change source usage',16,'change_sourceusage'),(74,'Can delete source usage',16,'delete_sourceusage'),(75,'Can view source usage',16,'view_sourceusage'),(76,'Can add company log package',17,'add_companylogpackage'),(77,'Can change company log package',17,'change_companylogpackage'),(78,'Can delete company log package',17,'delete_companylogpackage'),(79,'Can view company log package',17,'view_companylogpackage'),(80,'Can add company profile',18,'add_companyprofile'),(81,'Can change company profile',18,'change_companyprofile'),(82,'Can delete company profile',18,'delete_companyprofile'),(83,'Can view company profile',18,'view_companyprofile'),(84,'Can add map company auth group',19,'add_mapcompanyauthgroup'),(85,'Can change map company auth group',19,'change_mapcompanyauthgroup'),(86,'Can delete map company auth group',19,'delete_mapcompanyauthgroup'),(87,'Can view map company auth group',19,'view_mapcompanyauthgroup'),(88,'Can add private key ssh',20,'add_privatekeyssh'),(89,'Can change private key ssh',20,'change_privatekeyssh'),(90,'Can delete private key ssh',20,'delete_privatekeyssh'),(91,'Can view private key ssh',20,'view_privatekeyssh'),(92,'Can add system config',21,'add_systemconfig'),(93,'Can change system config',21,'change_systemconfig'),(94,'Can delete system config',21,'delete_systemconfig'),(95,'Can view system config',21,'view_systemconfig'),(96,'Can add expiring token',22,'add_expiringtoken'),(97,'Can change expiring token',22,'change_expiringtoken'),(98,'Can delete expiring token',22,'delete_expiringtoken'),(99,'Can view expiring token',22,'view_expiringtoken'),(100,'Config Line Notify [admin]',23,'config_line_notify'),(101,'Can download file [adminlog,user]',1,'view_monitor_downloadfile'),(102,'Can view monitor status collectors and detail [adminlog]',1,'view_monitor_collector_status_detail'),(103,'Can view company profile [user]',1,'view_companyprofile'),(104,'Can view data analyze [user]',1,'view_dataanalyze'),(105,'Can calculator and recalculator source usage history [System]',1,'system_calculatesourceusagehistory'),(106,'Can receive all status [System]',1,'system_receiveallstatus'),(107,'Config company alert [adminlog]',24,'config_company_alert'),(108,'Can add alive config',25,'add_aliveconfig'),(109,'Can change alive config',25,'change_aliveconfig'),(110,'Can delete alive config',25,'delete_aliveconfig'),(111,'Can view alive config',25,'view_aliveconfig'),(112,'Can add log collector alive',26,'add_logcollectoralive'),(113,'Can change log collector alive',26,'change_logcollectoralive'),(114,'Can delete log collector alive',26,'delete_logcollectoralive'),(115,'Can view log collector alive',26,'view_logcollectoralive'),(116,'Can add source alive',27,'add_sourcealive'),(117,'Can change source alive',27,'change_sourcealive'),(118,'Can delete source alive',27,'delete_sourcealive'),(119,'Can view source alive',27,'view_sourcealive'),(120,'Can add log collector alert',28,'add_logcollectoralert'),(121,'Can change log collector alert',28,'change_logcollectoralert'),(122,'Can delete log collector alert',28,'delete_logcollectoralert'),(123,'Can view log collector alert',28,'view_logcollectoralert'),(124,'Can add source alert',29,'add_sourcealert'),(125,'Can change source alert',29,'change_sourcealert'),(126,'Can delete source alert',29,'delete_sourcealert'),(127,'Can view source alert',29,'view_sourcealert'),(128,'Can add company message',30,'add_companymessage'),(129,'Can change company message',30,'change_companymessage'),(130,'Can delete company message',30,'delete_companymessage'),(131,'Can view company message',30,'view_companymessage'),(132,'Can add scheduler task config',31,'add_schedulertaskconfig'),(133,'Can change scheduler task config',31,'change_schedulertaskconfig'),(134,'Can delete scheduler task config',31,'delete_schedulertaskconfig'),(135,'Can view scheduler task config',31,'view_schedulertaskconfig'),(136,'Can add source usage history',32,'add_sourceusagehistory'),(137,'Can change source usage history',32,'change_sourceusagehistory'),(138,'Can delete source usage history',32,'delete_sourceusagehistory'),(139,'Can view source usage history',32,'view_sourceusagehistory'),(140,'Can add auth user login history',33,'add_authuserloginhistory'),(141,'Can change auth user login history',33,'change_authuserloginhistory'),(142,'Can delete auth user login history',33,'delete_authuserloginhistory'),(143,'Can view auth user login history',33,'view_authuserloginhistory'),(144,'Can add config intrusion detection',34,'add_configintrusiondetection'),(145,'Can change config intrusion detection',34,'change_configintrusiondetection'),(146,'Can delete config intrusion detection',34,'delete_configintrusiondetection'),(147,'Can view config intrusion detection',34,'view_configintrusiondetection'),(148,'Can add device type',35,'add_devicetype'),(149,'Can change device type',35,'change_devicetype'),(150,'Can delete device type',35,'delete_devicetype'),(151,'Can view device type',35,'view_devicetype'),(152,'Can add intrusion detection history',36,'add_intrusiondetectionhistory'),(153,'Can change intrusion detection history',36,'change_intrusiondetectionhistory'),(154,'Can delete intrusion detection history',36,'delete_intrusiondetectionhistory'),(155,'Can view intrusion detection history',36,'view_intrusiondetectionhistory'),(156,'Can add search config',37,'add_searchconfig'),(157,'Can change search config',37,'change_searchconfig'),(158,'Can delete search config',37,'delete_searchconfig'),(159,'Can view search config',37,'view_searchconfig'),(160,'Can add auth user profile',38,'add_authuserprofile'),(161,'Can change auth user profile',38,'change_authuserprofile'),(162,'Can delete auth user profile',38,'delete_authuserprofile'),(163,'Can view auth user profile',38,'view_authuserprofile'),(164,'Can add email config',39,'add_emailconfig'),(165,'Can change email config',39,'change_emailconfig'),(166,'Can delete email config',39,'delete_emailconfig'),(167,'Can view email config',39,'view_emailconfig'),(168,'Can add auth user session',40,'add_authusersession'),(169,'Can change auth user session',40,'change_authusersession'),(170,'Can delete auth user session',40,'delete_authusersession'),(171,'Can view auth user session',40,'view_authusersession'),(172,'Can add line notify config',41,'add_linenotifyconfig'),(173,'Can change line notify config',41,'change_linenotifyconfig'),(174,'Can delete line notify config',41,'delete_linenotifyconfig'),(175,'Can view line notify config',41,'view_linenotifyconfig'),(176,'Can add map company line alert',42,'add_mapcompanylinealert'),(177,'Can change map company line alert',42,'change_mapcompanylinealert'),(178,'Can delete map company line alert',42,'delete_mapcompanylinealert'),(179,'Can view map company line alert',42,'view_mapcompanylinealert'),(180,'Can add message alert config',43,'add_messagealertconfig'),(181,'Can change message alert config',43,'change_messagealertconfig'),(182,'Can delete message alert config',43,'delete_messagealertconfig'),(183,'Can view message alert config',43,'view_messagealertconfig'),(184,'Can add event log',44,'add_eventlog'),(185,'Can change event log',44,'change_eventlog'),(186,'Can delete event log',44,'delete_eventlog'),(187,'Can view event log',44,'view_eventlog'),(188,'Config djangojob [adminlog]',45,'action_djangojob'),(189,'Can view monitor intrustion [user, adminlog]',1,'view_monitor_intrustion'),(190,'Can config intrustion detection [adminlog]',1,'config_intrusion_detection'),(191,'Can view home config [adminlog]',1,'config_home'),(192,'Can config/view all user [adminlog]',1,'config_user'),(193,'Can config/change user [adminlog]',1,'config_user_change'),(194,'Can config/change two factor user [adminlog]',1,'config_user_change_twofactor'),(195,'Can config/change logcollector [adminlog]',1,'config_logcollector'),(196,'Can config/change company [adminlog]',1,'config_company'),(197,'Can add admin reorder config',46,'add_adminreorderconfig'),(198,'Can change admin reorder config',46,'change_adminreorderconfig'),(199,'Can delete admin reorder config',46,'delete_adminreorderconfig'),(200,'Can view admin reorder config',46,'view_adminreorderconfig'),(201,'Can add log collector resource',47,'add_logcollectorresource'),(202,'Can change log collector resource',47,'change_logcollectorresource'),(203,'Can delete log collector resource',47,'delete_logcollectorresource'),(204,'Can view log collector resource',47,'view_logcollectorresource'),(205,'Can add mail message',48,'add_mailmessage'),(206,'Can change mail message',48,'change_mailmessage'),(207,'Can delete mail message',48,'delete_mailmessage'),(208,'Can view mail message',48,'view_mailmessage'),(209,'Can add mail template',49,'add_mailtemplate'),(210,'Can change mail template',49,'change_mailtemplate'),(211,'Can delete mail template',49,'delete_mailtemplate'),(212,'Can view mail template',49,'view_mailtemplate'),(213,'Can add company log licence',50,'add_companyloglicence'),(214,'Can change company log licence',50,'change_companyloglicence'),(215,'Can delete company log licence',50,'delete_companyloglicence'),(216,'Can view company log licence',50,'view_companyloglicence'),(217,'Can add app event log',51,'add_appeventlog'),(218,'Can change app event log',51,'change_appeventlog'),(219,'Can delete app event log',51,'delete_appeventlog'),(220,'Can view app event log',51,'view_appeventlog'),(221,'Can add auth user password',52,'add_authuserpassword'),(222,'Can change auth user password',52,'change_authuserpassword'),(223,'Can delete auth user password',52,'delete_authuserpassword'),(224,'Can view auth user password',52,'view_authuserpassword'),(225,'Can add django job',45,'add_djangojob'),(226,'Can change django job',45,'change_djangojob'),(227,'Can delete django job',45,'delete_djangojob'),(228,'Can view django job',45,'view_djangojob'),(229,'Can add django job execution',53,'add_djangojobexecution'),(230,'Can change django job execution',53,'change_djangojobexecution'),(231,'Can delete django job execution',53,'delete_djangojobexecution'),(232,'Can view django job execution',53,'view_djangojobexecution'),(233,'Can add static device',54,'add_staticdevice'),(234,'Can change static device',54,'change_staticdevice'),(235,'Can delete static device',54,'delete_staticdevice'),(236,'Can view static device',54,'view_staticdevice'),(237,'Can add static token',55,'add_statictoken'),(238,'Can change static token',55,'change_statictoken'),(239,'Can delete static token',55,'delete_statictoken'),(240,'Can view static token',55,'view_statictoken'),(241,'Can add TOTP device',56,'add_totpdevice'),(242,'Can change TOTP device',56,'change_totpdevice'),(243,'Can delete TOTP device',56,'delete_totpdevice'),(244,'Can view TOTP device',56,'view_totpdevice'),(245,'Can add phone device',57,'add_phonedevice'),(246,'Can change phone device',57,'change_phonedevice'),(247,'Can delete phone device',57,'delete_phonedevice'),(248,'Can view phone device',57,'view_phonedevice'),(249,'Can add report graph template',58,'add_reportgraphtemplate'),(250,'Can change report graph template',58,'change_reportgraphtemplate'),(251,'Can delete report graph template',58,'delete_reportgraphtemplate'),(252,'Can view report graph template',58,'view_reportgraphtemplate'),(253,'Can add report graph config',59,'add_reportgraphconfig'),(254,'Can change report graph config',59,'change_reportgraphconfig'),(255,'Can delete report graph config',59,'delete_reportgraphconfig'),(256,'Can view report graph config',59,'view_reportgraphconfig'),(257,'Can add company graph report',60,'add_companygraphreport'),(258,'Can change company graph report',60,'change_companygraphreport'),(259,'Can delete company graph report',60,'delete_companygraphreport'),(260,'Can view company graph report',60,'view_companygraphreport'),(261,'Can add source status history',61,'add_sourcestatushistory'),(262,'Can change source status history',61,'change_sourcestatushistory'),(263,'Can delete source status history',61,'delete_sourcestatushistory'),(264,'Can view source status history',61,'view_sourcestatushistory'),(265,'Can add log collector status history',62,'add_logcollectorstatushistory'),(266,'Can change log collector status history',62,'change_logcollectorstatushistory'),(267,'Can delete log collector status history',62,'delete_logcollectorstatushistory'),(268,'Can view log collector status history',62,'view_logcollectorstatushistory'),(269,'Can add source time period rules',63,'add_sourcetimeperiodrules'),(270,'Can change source time period rules',63,'change_sourcetimeperiodrules'),(271,'Can delete source time period rules',63,'delete_sourcetimeperiodrules'),(272,'Can view source time period rules',63,'view_sourcetimeperiodrules'),(273,'Can add gpvpn success',64,'add_gpvpnsuccess'),(274,'Can change gpvpn success',64,'change_gpvpnsuccess'),(275,'Can delete gpvpn success',64,'delete_gpvpnsuccess'),(276,'Can view gpvpn success',64,'view_gpvpnsuccess'),(277,'Can add gpvpn fail',65,'add_gpvpnfail'),(278,'Can change gpvpn fail',65,'change_gpvpnfail'),(279,'Can delete gpvpn fail',65,'delete_gpvpnfail'),(280,'Can view gpvpn fail',65,'view_gpvpnfail'),(281,'Can add branch',66,'add_branch'),(282,'Can change branch',66,'change_branch'),(283,'Can delete branch',66,'delete_branch'),(284,'Can view branch',66,'view_branch'),(285,'Can add map company mail template',67,'add_mapcompanymailtemplate'),(286,'Can change map company mail template',67,'change_mapcompanymailtemplate'),(287,'Can delete map company mail template',67,'delete_mapcompanymailtemplate'),(288,'Can view map company mail template',67,'view_mapcompanymailtemplate'),(289,'Can add report jasper template',68,'add_reportjaspertemplate'),(290,'Can change report jasper template',68,'change_reportjaspertemplate'),(291,'Can delete report jasper template',68,'delete_reportjaspertemplate'),(292,'Can view report jasper template',68,'view_reportjaspertemplate'),(293,'Can add report jasper pdf history',69,'add_reportjasperpdfhistory'),(294,'Can change report jasper pdf history',69,'change_reportjasperpdfhistory'),(295,'Can delete report jasper pdf history',69,'delete_reportjasperpdfhistory'),(296,'Can view report jasper pdf history',69,'view_reportjasperpdfhistory'),(297,'Can add report jasper template by company',70,'add_reportjaspertemplatebycompany'),(298,'Can change report jasper template by company',70,'change_reportjaspertemplatebycompany'),(299,'Can delete report jasper template by company',70,'delete_reportjaspertemplatebycompany'),(300,'Can view report jasper template by company',70,'view_reportjaspertemplatebycompany');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$PsM8VFPyrIOK$p5o/qsLaDqt2IVRBIfosxMwWxfBCZMAmbxZ3hbiONcQ=','2020-02-06 17:41:00.118787',1,'admin','','','adminlog@loguih.uih.co.th',1,1,'2019-01-29 15:41:17.000000'),(2,'pbkdf2_sha256$150000$blEAhs7rVIp4$8lxHPKDHCZt93ZztAxiaXkEMrSainzj0clqqpJWBxzo=',NULL,0,'log','user system','do not remove','',0,1,'2019-01-29 15:57:27.000000'),(3,'pbkdf2_sha256$150000$w6Ywbszl6JUg$RvbH7fSvnE8++fuPA9MIxWuZvtUyj6L2amaQgwh3i2I=','2019-12-18 17:34:29.698019',0,'cust','uih','logyou','logyousystem@uih.co.th',0,1,'2019-01-29 16:04:48.000000'),(4,'pbkdf2_sha256$150000$fvukbOFVH7Ob$3L5IM/bvXSsCWvVe80LhPTFnNrm0gos6nWaRiU4AbII=','2019-11-28 14:54:26.413323',0,'adminlog','adminlog','admin@123','',1,1,'2019-01-29 16:06:05.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`) USING BTREE,
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (3,2,3),(1,3,1),(2,4,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_login_history`
--

DROP TABLE IF EXISTS `auth_user_login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_login_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_public` varchar(255) DEFAULT NULL,
  `ip_private` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_login_history`
--

LOCK TABLES `auth_user_login_history` WRITE;
/*!40000 ALTER TABLE `auth_user_login_history` DISABLE KEYS */;
INSERT INTO `auth_user_login_history` VALUES (1,'','b268cd7d-fb61-4221-a476-a462257a6da6.local','admin','user_logged_in','2020-02-06 17:41:00.121403',NULL);
/*!40000 ALTER TABLE `auth_user_login_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_password`
--

DROP TABLE IF EXISTS `auth_user_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_password` (
  `changed_at` datetime(6) DEFAULT NULL,
  `changed_token` longtext COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `auth_user_password_user_id_fad676dd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_password`
--

LOCK TABLES `auth_user_password` WRITE;
/*!40000 ALTER TABLE `auth_user_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_profile`
--

DROP TABLE IF EXISTS `auth_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_profile` (
  `avatar` longblob DEFAULT NULL,
  `avatar_image_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `concurrent_login` int(11) DEFAULT NULL,
  `maximum_login` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `auth_user_profile_user_id_f9aded29_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_profile`
--

LOCK TABLES `auth_user_profile` WRITE;
/*!40000 ALTER TABLE `auth_user_profile` DISABLE KEYS */;
INSERT INTO `auth_user_profile` VALUES ('�PNG\r\n\Z\n\0\0\0\rIHDR\0\0K\0\0�\0\0\0 �GD\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0�\0\0��o�d\0\0\0tIME�\Z	\Z/Esz\0\0\0tEXtComment\0Created with GIMPW�\0\0 \0IDATx��y�]�u�����{�TU@a��R��A�-yPԒ�N��e;�;v[-d%�x��$��m���du�@I�d����NB���nى#O�d˚H�#�\"��$�j|��s��?ι��W�\0�d�b<�����\r��a�����o�{�;�*\"��N�?�]QBH?Q�w��nn��3���x7�~*7I�8U�*�o�r\'�*b�`@0F\Z��ķ��6yu�/D�s#Ǒ�K8� tr��~�]3}f���4�R��R�j�AĀ*7��{��E0¥�7\r(�����_;N�����P�k�bD\n���(�?~�(�W�{���֥�hZ�A0FQ��\0A$�UTZ������Y��o=�޴��n�Af1q[(�	|��\Z������JT�~@ (���1X<�P4]��F>�\00@@�������[$���g!�F�W��oC��:��TC��@O:SĤ�i��ԛh@���6}z��u��ސu��X��HChS�\r������N�|�w�L�}�\Z{��(D(Pz�91��Y���b鶭V�\Z2c�P$-BQ�2��ƘW��$N\\7+�ֱ�-+�݂]3=v�,����@xUf:�]����G/,��R*�B��f�j3f�n������_��/�nߎ�b%G�x����\'����\\���C���ۨ b�\"xk�S!\Z*�A�\'biY��ć\0y\'�F��o�7�����2HT!�7�.�o���ٌ3+k���#9�Re�)�\n���*�9�x\"�ǐ��\r��w�%�P��8DN��cɔ&[�X2U0&�U�����BJ8��L�3\0�J�P�y��e���r�qlk�z�y�	���*������3��>`4h����G)�<\"0ۑ�A��Ze93�d�9�6�GO��0��0_���x~ұ���19�E�5����{�O~|P�Nf�\"�g���E�!K�F�|�r��1��!v�P��[��d���ʊ\n�n��5&QA�g�F?lqm�����/<��0����e��>����b���7��Ug����Vh�DŨ����Z���s�;!�55���Z�pv��k\'W���?ǨҖ�3dT�u-s��+���sf�R�PZ�%�L?���:᫱�:�4d��)�	���@�*\\�����qE\'�.\"*��F��	b�_)�=[IアnĂ�0�0j���7Ƴ�/��Y{l!��J�|��@Ѐ����ؽe�����o�\r�X��.�X��������˺z�t߹0t��9��}cL�]���P�F�BX\r:�C1�\\ Fr�K��\\Q��3u27}k��	H�<��%��������UG_��]�P�6k5\ZC�ڝ�|�{���p�U��FO����/�zzn��x�%��[��x�۹~�e����S��FK�	�2��s�W����̶׹\"�@p|�[ws��%�0&F8�bDYr˞��+|��5���s��.��{޲��~���aT	2�Z\'��:Жu�7\rf;\r�ˎgN����\ZǗ<���/Yu�f���`�N|�F������׿{/k%1���t��e���/|�i��\"+i��T����,�c!4x�*�9��w~�ݳ�*�T1h�\0Q��4��ĎFR4��B��DT���s����g�]+e��h&���24-�WkT$�2&��o6����)��\">#�b����6�@N����]oD�7����5_c�pjѱk��6D�<HDkc�[;�r�ED����{|��z�e~�?>��W��#wle&�Xu�\n�5�#��BX\\.���ش�Yj�_��ٌ��;.��z��?~v��<v��}r�w_��?���V|�\Z�%��峥��0�@�S�6��ܣg����(�U��m�{:�-�����-��x��f��dF���E���I���T�)l7S��d\'80d����ޙ>E�2%��6�@��F��dܜ>T�E�r��9���*��YNC����/��%b�@F+B0�jȭ�&���������RɹQ�39VQ]�*��[�D��a�f$5�!fP�l�J�E4}��zO?�֟�:?ԯ�=�iɮ\r�R���%\Z�MI�����K\n�EM��jTm���c�h\\������9�y�,\'΍�\'_:š�2?��+y˶��*��<�&����pf4��]3�@��/�Đ�����c��1�w-�{`�?���_�����{��w͒�%�օ�(X2*@d�no�=����\"W�~��-�c��왫�S�瘋^�3�%X�Q�C\r\"!��*5J����^ �s1Ws^���C��J�=!x��QGl�wٻeV	�8�Iٳ���Fз���(!�̪����8p���E��n�a\rx���/&f!3���B��_σ����2^��B��pT�$���@����@i�;.���&�Ee�y�w�V�Ԓ�5M$jo�\\��˺��5��\Z���pƹ��16�:NfĹa�ݚH��5�*Co�*Ჹ>�����n��OOp��*�#`R4�>?DG�RG�(�.�x�5�0��]��FbV?E_.(�Jy��Y�����~�wO��&΀��xMNJ���������ͧ��s���/��k��v�cJ��.�|����\nA	!��M�ĦQ�m*M��Z=��=)M��~���@u�{������Ý���*=�ܲo~�J�C�ĉsAɬa��~���G^]���>�<��?~�S�z�Ձ@��	i �>����3�=�R��[rkДX����i�!��QZc��4�k�ǹ��!��Yn�&��_{��#�d#�����mœ]MF�ߧ���f�*�NFQ�\Z�fU/�L�|T`,.�� ��[�����}���s�a�x�\Z�z� �rfT�1��Zn����ZQ�UFA�1����������7���W����קu\Z*��ӱ|��\'����K7з�0�D��&.K��N�<�֙H�a�q�:\rA������c�伽^�r}��~���\Z3v�y�ʁw\\6?�\"7�&�H��y�Q�����O=xQ���������J9�X�s��~<Y=�^&����\Z|U6�\Z�����z�o\n�l���x~j�[��5�>�C�\n����*G�<�s����\\Ė5��Z��x)	T�c�1��CѼvN�4�ߘcr�1X[P؜��n��us]��׏3�\'Q%�&�nnX+ͨ�c������`$#7�������<}z�׾��l^G��v)��eб���Nsz��}�������r:bk���]�D�k�o�m���	��6YJp��n��~������\'���]uQ��OyM�s�����g^\"�9i���1ʾ�s�E˒�4z��~�Px3����a\r�*T��Q��08$860�5l�fl�fl�d��Z�B�D�s4��k�s4t�X����1TPC\Z�\'���sZ��>oo��t8^��.gVW��Y�,��S5	��q$��~&y�����҉�S�#�,�A�Uf3��5?��)��y�	�%��*҄�F�\0��_�s7����\Z,ӄ��XV�J~���̻��IL�X�`��E6w��T�@��}�m�I;>E��&�\\�V%h`��A��KJ0D@8�R*��CS�����-��jIdWWyn���>����r�\'nG�XA$ģr`g?Wd�,�5!�$�S���̓��N$kB�<��ƨ8�P��a��t��w��\ncR��8D�ʠ�<�X.���U#*R�L�I�Cyd�x����~b.$�g[`\\�qȱ�,���8�}Íe\Z2���ݜ�\0kU����<x��P\r��߽�NZS#E��sՎ>o�j���\n�s�6��o��b2�,G_�!��j�ӫ<��$z����(!X������xjɳw`��o�\Z����o?��;�co�k*$�\\�ن�w+��J0�-ރ��\\��\Z=\Z�WT�)�c��3��%�}�C��40?�����m1���!x�@f\r�݆��o��n���|�oe���9V&��A #��_�R�R�ɨ|4�L��|�ÿ�4��ZkpZ���}�Qǎ~����vr3ބ�Q\Z�5���c���;gr�U�Yz9S�r2��b\"�3��y\r�$���cQ��*ν���O�]+X���X��bP�t~�σ����r21�<7��ռ(z����iEH8���#��|��iK%|�<{�f��T�!���F��ś���༴�5�ַ����-O�^�-���|HV	&���\'���ݨfx���9�}�o������U���!V�x���|ЙF��fb�S�L�O<�὏:H�����aM��!h�kʱC��<\n��Ic�m�}���t��x �t1�j\0��~�c�J��U��!o�����6�Zg�^#&��[:��۶j?�xD�ZC�\Z��6EjZ����:ư�/�w��Ñ�:���3�=M��J��6�E-V�-�b���+#�,YqJYy�FN]7��°}��|��\n8_aL�?s����I�����8vf������bLCی�o㠢�U[�|��B�j&��0��b93rzٳgN�d5n�ג�1�1|{�:����Ͷ�+OAtl��9�T1,��/��Ծn8ω�q�I�U�L��R\\�T�q	lfU���,�a�����!��\'3�ܠ��sk�%�F{}���qY�����V�t�~x������e-~�8SĐ	���:W�Jƌ��\'�.�s>ry{�U��W�s��cPpŎ-��3BJ��w=RSH\Z#)M4+Ү��Q������n�Xԗ�V�D�#�`�e\ZI#.kyi��g8��\"\'�F���Rؘ�_)O/��Z��S˜�X���1���M���e`��q��Y�r|�)�V#*�^���,��v�:xV�Pk� �\Z�m����.�8��^��ڒ=Ӓ[�rƉ�Pz3��\Z��T<{ֱ����/x5S��IS\"є�N���Ӻg6��Tg/��Q\r�x�����gZ<�@����2zE>��֞����\r�ac=wF��D1c��O�1IX p�c�^�����<\nvhHDِ���J�0g:����q��\"�Ē�%�ɣ��J��\"�%��f�l���H�3i�+���C���C�y�O��$�tH>BT�L��=��z�#���jv�	�1�1�f���J|a��CO73\\��ǝ{��}��w��m�f8�w�5�9]/�V<z�\'��l�� ���ֲ�OY	9�����+�*�8��	JѦX(�p�@UO)?ӑ��!+�r��>_��B���$�n�84��qHn��h��\"�{BPLV���Ul�P� �t��a��eVQB��9���gVKN���V��!�,�i�������,[��5�T5ց�;]����?�	EW����^=�UDS	jb��y��M6��`��S|��wO\Z�{y��m��b	d6KXPĞ,�]�L�b���$�4�!�y����DG ���\nT�b��Yvm�&��ԮG2�e(Q5t0dF!�L�7�v@c��I�|��n�h%�G��䨖�d����B�8�k,ϟ]�3Cʕs=��֣ț�JJ�0�;�������Ϭ���ɗW���x�)������X�1�ʁ�]�~��s�����ԑy���}���,3pr9������\ZIٕT>\Z�;����p�S�+�����]6�/��N�*���\n��X�!\ZK>O��r��A�_������Ћ���מ�Ċ�ͱ���}2�k\\6?�	��0u�6-�^�A\'���MSF�ǌx���:�qVNC�W6ܬ�\'KྩkYS�V��<.m�I\n{J������U�ܹǼ���<v�6J��I*&q�2Qv�2E�,�)rА����d��l��[��a�C�sP9��~���\ru��I�ƛW!79b��5n��ѩ�y�Go��YPC��LzUu����QFr�\Z�e9��X����S�0�YF�gά����p�������ehA\Z��ȁ�~�s�ޜ�\'�xz��3��d[�w��,Ƽ���4&������������y��[1& �N�R�e���Ty�!�{j����U��h��	�S��+f2��w�Շ���wu�d`ʪ�?�^�Z\Z�Mb0���ї���-�8�c�c<^�Ց�c�55�Z��Z��4F���^���|�u[���X,��%�M���T%>�c�aZW:�V�5��EJ��b�\r�2�$�^�~~/L�B5�Z\Zg�j���<˺<�i4%_�۪BEa�}�)��t2���8�!�!3���� ����HH�~mط��O[�f��㜧��tm`��mZ��D8<�k���#\\�>n����~�m�z���p����s\Zʈ�6W������:&��H	�\r���!cR%���eV�����1��/�����p��%�|i\r��V8�V��ɳ���\"_di�q��YvwVJ��s+�V��K���zCf(��n��H�w�^�0J&��5�b�EjǠ�<�(�kΌGN.p�V^�`(D*���7��?<~�o.�kS-��j���ma�uU\\b�dF��+�e���]����.0r�|���X{%혱H1��>�{�䮷����^��N��n�|\'gG�`k��k=���Z�!mIȍ�\'^�x��J���4ֽ!�j�L�NV����%�ׄa�no�ueH��V�S{��Z\n�-�%�#p��N�0�\'3W�hh$�T\r��΁��*�\'5e\r�8^hU��If�\'���E�8�Q�سu�+�NU(	��p�}��s>��J�=>q!Β�8�5�w:��[�\"&�����1c��a��g���VG<�0�U�H-�.9�4D���K,��X^\Z�xy��\\��C��5�bȬ4�t�!��sa�A\r���w^�᯾ȉ办��~��kd,\\��u��B*�sTU\"���O�s�Ǖ;�h����`%c��[r�y�����H�S��.u$�V��+\\Kc�ګ�*�y����s|�5��^�%�IZ������x�\Z���d����q|I��˻���YU\"xu��̛�*�$K�,�c�1�5j�Ek�\'��i�_�{R����0Y�%�H�I51�������7�pþ��]LQ����������\r����>ԙ=i�(�Q��t5Gq!q	�\r	�M�/轴!���@���9|Y�/r����5�T[*��n|��Q�`>@n�RsU��S�x���~���P�ڔ�\r���Nq�ϭx|���^\'gq�����+�r�+g��#X��<���%k��t�� c��Q:8�C���!�\n�����RkVp۾Y�{`�C�;ƚ�Ր5wh��N��ں֦R�PyO�[~��s���������UiO�Q$x����M[9�����)\nk��\\�N�D�N�7Z�@4B,�l�?���h��_?��ȧ�����:���CzY��\\�G���V�\Z�̠�jMvz�(UʪS�2P�*ʑ2��Q�Fk�+�EH�#ºuyqk�u$x�5�Z�Z�,CSv�`�Dm�=�h6��/�P�=��6:����)/6[��U�$BE����9�m�xd]H~��FU�&���j?&��J).Xl�m��b�&�����K��i=��<.8B(�3������S�\"MA(�|fz�ӱC[�\0%A7���F���9v�fF>oU����,l���^�>�Y���:�{K0V���a��cQ��\\�M�7ף�|0l�3ݜk�3zY�޹&��w)3df�//��U� =T�X�l�p���$�|ٕ��-{�������|��]�\\װV�$�0���M�R�eoJ�HPz�._{���Os�;�fw?cy��4�LZl�`C�P2�����|�)>�?��נx�Wl��z=�q2ֆ�S��i�[X~����G���}�BL���\\�{���l�h���h�/���L�b�	���Q���t��?~������΀:�0y6��Xz��w\\���=�`�������%x4e���-�t#�F�Q���7���~呯�C�ֈ�K.ިL�2����X2��C�r�:�q���;t�G/�9\0�ƺ�+����_Xuo!���I]�F�a�Im��&�/��,�a�L����1�煈�<ţ<v�v P�H+1d@ ��*��N�ÆZ��ⱟ�y�#1c7S�O�V�)U��\Zo�d-y��$&&�<�J*����l�l�;GU�(�}���	jq\n��\rR%�\r��x��\\��#�o��T�y��f�v}\0\0 \0IDAT�95������_���?�Ͻ�r�vY����2b&�2�%̈́$Id�B&����?��|�s��9VWK�b뾱�`;\"�����y����/<Ϗ��c����g�LP\\��!U�L�\Z\'($�}�B������|��e����bGaXq �2o�ړ�kbQ��F@�B��ښ�0�\"�m]u&X�,��7=�?�[��٤o7�t�Bf���w���)~��W�����\ZMI��qƲ&|J��?.1�M��͛L�X��m(ǁ�y��{i����\ZZ�QA2��#�r�/�7�����neX��b�/b���,�rz�@,A�OH���(l��n5�qJ4b��{�\nl��QdY�u�*x�ae�\ZJ�Ų��+MrT��+���6n��T#�Z�_��L+B\'��Uc�Ĩ��25uG��A��9���,U��$u;UTb����-����Ĥ�:��Vm��Ez����K�Q�*��w^�o=�O��3�s�,?zp��v&��T����	۴�;�§�z�Ό���]ε;z,\r�8o�{��D�>����Zf��������7^�/�����o��7�b�l16���GKS�lL-�+|�E�ɗ_d�*��g0�5,�j�nfb2�h��@0	OU������r!;��41��v���8������m0�m�ɦq4>x�e�����k�=`�Rr���{㌥����q\"\r��sYWP�G�N�hￆЩ���Icb�*t\r|��o}����Փ!�<���\\�f�z�d4�{�������b�I�9���M̾��7,�V^�Q�L���SD\nn��dB�߄����I!�r�W>x�S���1��O�ء�ǼSmw�X�W��d�b�{���a,̚!7�j��*ʪ3���SRX�[{��#,n�q���w�B�S$r�O�0�\\�ȃ��R�]VW=��ݼc����g���u�=��~�,��,�r�ˠ%��Ĳ�=K�|��~��!G_:������*&�0�2��h�=c_n���iE�2>���<p�6>��i~��\'�a�����=�\\6���c�TM�1F�+�?xn�?|�\'�*�����������X���F%h\\}�ȵ����z��.��C%�Y1?7⏟>ǧ��5�0�Ҍ�b������\nÏ�ů�������S\rV�E�7��4���\r��`�ص�ҏ����+�S�Cb��V��j�ۆ�	MDm�jT��p�^+��/��3;:�!�c\"�0Hܜ��˴R\'KΣ&oRd\Zbfx�܄0|�%����a���^G�T+I��DJ&oE��&� Z�\ZkZw6k`6�\\=\r��ўHk�^D��ò&۴E�j7���%��J/�8�V�4l�\n�n��p���}v:8W%uX�Zˉ��<�\\1�,�*A,�e��P�_L�ĒZ�Q�R�e�Pб���d�}�>^^Z�+�\r9rj�z�,��d6��3�UpX����20��p������]�GC�!��X�[\'C[���4�ҡ���p�|�����ܹ�_�s�,󫏼�h`K>�f	?\r�աg�v�Xn{�6>�[:��K�j�ՖL�V+ҴG.��|ڊ���\r�~/��?λ.�q���s���y�~c�^9�����N��<�u�a��F�O�X�:�V�����Iԁ��J�����ƨ��e��7�=F�C�6i~�#����OL�q����z�7a\r��-�G$�v������V�2r#Y�=�L�i��F�7���p!�Ż�m�f��a��й������T�#��R���D��f�\'��פ�(@&2o%�����]%�\n��L�b��W�������U8�V����l/Ù5��a4�[�LK���rE&1�\r�b�[O�d��6AQ��\nKˁ�)�������\n熁��K+%K	v������l�(�䬌��Of�IF�9���?�L�4�ܗR`�R:����޴��NX\\-9SV�B@B�6��f����Hj_U�[�Ȭ`��\ry�	+ �����u*���In���<��\"�꿻&��Z�Ui�D�\r��@Vt�ko�ç��,��wm�y��l�4��(�k/J]�(z������tMI�Fl$��-i���F��-�z$&*��nj&e�!3��)E��F?r=��z�D�\Z�M����`�!������a�߹M=͕���7phm��b��#�|U��Sk��(rPgt�q��ܪ�\\cnCA<�����lYrzy�`�bK�m���k�o�<�c/��ͅ��O�����X.�{9{gr� _\\cI\r�yƶn!1�����;�e,>���9�V�ⱹ�pj5p�lɹ��f����ܼ{��;ܴ{��FX���G,x�d(��yq����4hj�!<g��sU���2��6ঝ�ܸ{���\Z�o&FPK#���l����o���laP����G���ط�G�z��F�t����y���=�w��Y��?��L\'%k��:��i,��jeb�O����e�D&q��}M-.Y��2�\Z��\r�����d9J�o�5>����|=��֍����fd�k��&�kB����H�ּ[�};fc���e�m��ͦ]�;8�SLj�QWj��1���E�A�s�\\�Gy~aș�g��\\�s�ήa�\n<���C/-���*#��3�횣��\\*9�XbQ�m퐙@��`�e��̳ld4�+��i�����呰�\'���(֜o�#�c��[Z�X�ϻ�+c��`=��ޠʚ��SmBk3����{n��n`*+{a��_Z��o�!�u,e�ld���R^b�����s���J�1\rW\ZOv����Y����NZ�f#^}�e��8�U>�ԧ�ɉ-j��֍����ѱ�!fy4$�PL�ܹ�[��T�S+�O+�{���8I5����v.LTB5�j�ɳ����~L���#��h�gV���&NC�WM��!6�kT�kc_W���Y��R<����vYvp��%^ZYc[�p˾-ܲ�Ǖ[��q`k�[���i�[����!�.��<\\6�{�C�@f�V�o���d(����K[2x*��7,�9�K�m>d��H���˺�[�my(�w�\r���g��Z��ٓ��f{��Ɓ����[��|��x�Vv�\nʦ��8B�)�����ڻ��+\\1�㷏-���2RM��&��7�X6��1)3خ�����xffj<�`yஃS\rf��^��O�(�]sbK.T�V�<���]jRk�1P�#dЄu.�@a��a��?���������\\2\0w~z�5�$#�M���1��i?7�ڄ��KU#���\n2	k2���Ke��SC��^f�;�f�q����~׀]�.+Cǃ��9��\nU���.�Տ�e*	s�b���E�m�y׳E(C`yX�ZE�G��]Bx�5����H0���^Z���\n?r�^�d�*��Voߘ�I��1|������N�2��U�O�o��0����aB�������ݭ��u���\r��?:Mx�]SE�SsR�s����3j��f���8�P˦	���	*o\ZA��v��Ř��5V�Lm��1�Z�p^�5\n�ò�����|7C�\n����E�Z0u�#r��(7���e��!�\'�*�x~�#\'^���<��G^Z�g���ϝ[!�pٶoݽ��*��D�����2��YZ\n\'z�x��B�-�k��J)�\\�Lޘ�,A���@�9�y�?|�v準Rc[^i�D�{�\'�mX˪�{g�qg��=��lצ�4%�2�=_����o��Љ�T�=�L,���7֑�-yS���#G����L�<5�^a��l����؈�[�`�^Y^]��GhR�L6��]���\reb�*�L�=[#,W:u4���F)_jj*�g������	��)8hH���7a�\n�~�7�쳻^������\ZO�Y�م����[��8�}��*J$x;qp��ۯ#\Zi���I=�$/q�s.�T�(5`�ľ8�np�Vj�7E{�7�>m%X�6��W�k����8�c����c��܏}Z�v �q��w�GϜ��\'&o2��t��u\ni�υ�7�Gپ�\Z�i����!393Eg�˾��G	ƣ>zp�PH�;ư���H�\"��1�	�\\��Ӵ#MƩ�ԇ(j����x�u�L+��ڇ&��>uc�J�Dn��P��3�^c)��Q���}p�P2u%��E�ߚf���~j�l��!����O��7��ԡQ� 8��u��9�ؿ��v��f�+�s����ֽ3�y�,wγ��I����^d2���7Z*��O���4���W�Ka��>V�0�7l	�Mf�/�inX=*=#�^��n�� �Sgg�/��&�u7?����������52�����t*���I��M��{ #�!�����w?D^(A%r��3�\\�̲�S|��%����i���T�A���A��a��f��K+�����U3\0�Sh��K�Fڅj�SC��W%�9�j�љ��?9]�����s����V�l��I���hGB`�1Y��F+��d0C���^���B��t{�t�j�ˁ����e�L�l����}L�&j��b��=��\'���vkO0P�)H�n/��e�(S\r�M�v��$F�R�}Q��6\\˕r�U[�S�l%xO���usI	D}�>�m\rU#�i�cw�d�l��k`���z��Û�������*�u�#��5�\r�X�4~ѭ���֎A�kF������6�����V�&�����rY���9A&ug$��}hJ�������2�QX�Ȕ���)2r�9p�~nZW>�h>�Rd��j]W��.��������XO/�m����8I%RC\rb���C��H��KC�F�������q�M\n<OҬ\"�Qzee�X)=�\Z���.c?RZ4��^�z_�G_�K�V���ݱ�L}��XwC\rj�\'&Z��{c���q�Ï޶\r�\"���?�0�\"����YN�RĤIn������{���Rm��DF��+��	.$TTC���DH~�*���\\D��`obUE0�/��e1Qx�0vG8p�����L�g��o�����l��(��IJ6��e~o���>eƵ�.����ۦR�:�����������\'�Ƴ��k�tm\n�H��Tް<r,��(��\0V�sTk��r)��Zݰ1���=�����Tn<�ņG-I*Q1����|AZr�:���\'�/�u;���K\Z\0f3��y�Y]�`��̐!����FfiXb�Vk�z6�BˎAG+�6[H��25�Po��.��5Hf�,���k�x�X�Ҧ*KT���`a��|��c���#�;v� |�����(]��P%�������|���Ф�kܲ�����!K��`�����*y�!�V�E�6�\Z)C`��X��\nu��`ht9i��/y���[HP/���^*��0ʚ�C���K�v|1L��\'ZФ|���4t��,Ω4�/���TC��!x]��k�����\'��j�����\nk��eߡ��@0\r������X��1L�.�1kɲ,�ce�\'O�b��)�B�\Zu�� t�c7��q����:�s\r�7t!�c�n�K?v����O?��k�3��$�6έԺ��Lg�|#�ޣ^OՑ��A�XU\n�/�S�1�\rx��)@A\\��\\C\n���ĺz�v��.�:me�����J�	�\ZLT�y��z���^�~�q�<�Fn����Yj��M+���e�%c��Y�qij������O�����lͯ���q�5�/m��x���FM}������M`,I�ڤ\rk�`�Ŋ�\ZKn,�kC���H[\"#�VO0��}�V;t�~������r��m�����\n�D(7� �ұ�����Oܾ�����?��O?���Ҵn�o��l�e�ͣ,�z��Nb��Č�C��škLK�Уt\\9-�\0�U�\\9l(@6���w�7�B\\�*_��\":ы�������ia�k��s����_毼}?��O�T�Ժ�����Nf^j1�FAj�-�45-��e05�(*u<|��)��Gx��TU�̷6������H�,U\Z� c�E/O�Ìڳ�����Y/�3�l����Kg���rݾ]����[���U@2CP!a&�9v��F��z|�w\Z1�<[ڼ�`{G?v��Fh\'����H��N�(x�������nq�d(�5ߑ���Qd:.o�j:HhB��S�XcQ/T^Y�X�I���&�$�zn�p.�6��\0Q�ޡw��d�rvm����q���W���N�������y#WQ�!\Z#=�5�����Q�.y�4�1��I{�nL�\\�^2�㮓c1��^����Y\'4j�e݇�|t���1�1��Zl���E����O�����\"5�M�.b1ƐZ�G�`����f�D�5�$�X4�7b6��B���6b�o��|lL�����I�Adv~�\n�Gc��u$��%��ƚ��׶���U�󔜑�*Ϣ�>i�֢�p��&H����,�j�������S\\������yf��o�s/_|v��x��L�4�$�@�����.�����t�A2���n4\n����w5C�������\r.͉�=V$�)\Z�ӓ=uxj���u�`�!�s�@�cr�X�>{�G�yBT,��m)Z)YdD�f|O�hө�&yO��M,�@&�����HQ��GȍǄ�\Z*�������+���f������yP��jK�M����&K��Q`��4>fѹ>+m��_�\0}�0̺x$�����d¿~�E�����eq�!�Y��}���久@\'�ݥ�p5�s�Xn�c)*�d9L���}�q�~�ƒz$�ԝ��� ��s��=�f��^D��,\'\r鸜�~�\Z��3�,�dy�c��`���O�ȽG��s�k�q%u����c���������6D%8��Kb�uH+���3��it�ɲ,yu��IT���!.4���]��T�^jA�\n���n�JX��4Q�g���t��K�[�a&u}���D!(��,��+���w�\'��׀������ƻ޲�����\"�~�ȫSn�d,_3Tb٠EQ;�ãS\r�2�	5�hEPۃn�\ZX�J�Z-�/��gܳf,+�y��0���3��R9�����n��U������3����\Zb�b�$h �խ�FB���5Ԙ��\\^[�cO�#�<+5�Y?\'R�2�,���u��1�w&�ţ*l)�K���?��~uu��;hh�\0EY��!�+�o):�=b\Zn$ɅK����X6�X.�B�M���?˟�q7n�Y�2�T#U���o��Eg��?>An-nb�K�r�&H&T����B�:��}���䩉�H�YQv\n͓B�X^.�źN�B�)\Z�l�S�Eɳ����ڌ^�K�s�:�2_y�	9��r��mk�\n�D������cWL�\'_>#=����#O��<~���蓲V:�Ѵ���(c����ژi7\Z��420k��d����,��3\Z��6�#m�)j�|DADp!gy-p�y���`����7r�/�&��:���W���O��<^\n~��m�)c��z�\Z�8p%�]W�/9�מ[����eL?���R6��;��$ʦ`L��?z3�}ꡉ��zO!9&8�9�Bs��a{/�����V����f^&Q�����u�:$����,��F�;r�n�s6ǩ���s�|��B\'�d�סWt�����K����JF�����\0��5�/--�O�ۮ�Zg:Y�Z���:���.?�\0�ݑ�=b����Z>p��Y�i�R����.LH�M[\"b�{�<e��g�x$���ɦ��m3\nQS6h�����\"�q����kXRŸ����\\_����Z����������[��m���P���Y���P)J�a���������>�0ւӸ�Q�Ť��u�����7�ը����=$@��u}�V$��ɱY�]Z�NF�[�����!����n5��J��Y�����gx���y�,�WXq���tff�t�]�!�[tXYr߱�d�M{Uc����by8������k����=��m��hw�kpR5�U��\n����\n�j��L.f�B4ae�&�%C�fu\\O�Ϭ~�������r��}��c����֋1/��kfٿc+?���GMK\"�M�����f�5�,�V���;-�q��#��c$��x=l�:(���ga��y�����ZoLS�jRiDy��E�!�dyA�ۥSt���.�~�����.�A��A��~��~�A�G�S��E�SY��9Y��-\n�V�x䉧D]n�V\0\0 \0IDATו�1��u|�Óp��}��X>\nS3���s����ޛ��u�iz����Ϲ�e��d�.k��ɮ*��A���I#H�@�I���l�;?�2��G~p���l��r9A&D�F��\0$qPU�.w�Z6EQ�jږ%j�(w8gﵾ�XkO���R��^�꒼g�g���o|�qSM�\\�L��%�L��P�b %�4t��TIپI�%iN�E�:��\\���J`����زG(��?��r��{���vsj�F�k�U:)\rm;�%gׄ�������_z��sĞ�*{O��2Y^��CZḰ��\n�׼8�~y���1�F��]�������t���PPb�٤�m�\'צ��9:\nW�1e9fT��\nF�1���x��/`9^��)�#F�1�ј�(m9\Z1\Z�(Gc�QI9\Z�F��јwO������)#4[6M4�mN��ܤ����F���J����.\Z�t�}��0-�X�\0�����yW���M^��������>��:�/�?��G?���J\\*Т�jgl{�� 5�)��{�����{o�ק��\Z|��35k��3Y^���\'�Ը۩�S�X��9��`8��0�4��`X,�=��u����=��M��,gg3�Wߓ��q��P��q��ů�x4�\Z�JF�{9*)F�xD9J_�帠(J\\Y�\\�+�8�Y����7����n}���k�76�=�̋���s��-�m�LՒ�o7�\Z��D�S+X�z�M<�!āv�#@�<�z�,�\Z�Q�FU8��*���w��_��t��Ù#���-��񍁇X��|�#��K����OΕ20��:#�L�W�<S=Sq�c��|��Gp� $?�n��!fl[���1.�����p>S4����\"\ZՉ\\Ѥ�eYP�e$Тl�ً2�֮�?s�Hi�R8�SG�Eg9����e�V�}�M�\n����\"a4��B0�&�K��Qu^X9���z͉��N�[�O�k�\'&�?t���3i��?6����W\'応ҁ]����6��Т�?�0_�7�\'E�\n<����?}��{�n�}d�j��px�s��P��Y��B��+ƿ��G`��/��&ꔺ����^{��9�2Y^�Oz��-\Z�~q����G�9Ǒ�j�g�����,����P;�����g���ړ�Wm�ǂ\nT\nT�ɂB\\�pelO��/�H�6k��QYRE�t4*9u�\'�?%�\\�ϞH��8��p��ޯF�k�8ۑ!���x	�z�E�ƀ�2�951�,�KIڕ�x\"w{7�_��d珫�����Wr��]v/��S��?��@��L��|���D���<�U`���P���x�VN�;F�=��;���� �BX_�K�~\'��O��?~�Q�\',\r�� �����dy%�e2p�4*Sxq�|��O¥l\Z���R�օ��·4��kC�4�����N��(l�N��i����b�\\4}��,Z��i�<ޯH齶3�e��(��F?~���������,樿G�Ȯ&�.@�e�E��:jH��<�O��Fp�z\'t�đ����,t{�ϕ�\'���7�l w)�V.���..�#Ҿp�${\rU���x���uԩR��m�U��2r���E���i�������m���Z���]���X\rk��W�Us�R,��/}����^��$�<�YR̦�t����w��@*�Qq�����|���&���6���릥�wW�X�\Zf|ȣ��FA�F\r(��:z��#6�~� \n��=�f��cHA��M�����C��@QήV���r���ͼ��e��)��߽��_�o_y�y��W��oZ\\��\n[��V��\Z�\'F�N�R���pr��C[�����t��i�5��U9�q;Ȥ{�a[�}���w�����D��3ڈP_��7{��!dM�|�Z�߽�{�/��1�5�܇H�X����O��cgi�k�\n��$]ܻ�Ϝ8N����f~pb�������}p/���t�7\"�啞3\"QɤIyͱ0\'^��k�s��#��	�e<�I \03v�[�j9WՌ��+�[�hJ��쵾Hl��0��$��iP\Zh5\"�ǻ����G�L1g��\"Įp��N�s��n���V�C�U��Z=�տ�������x�Ri�װ�+���S�������r�E�mQ�sԓ�O�{��-�o_jL	�A����J����YD��چ��/�\'s��~�h�k1	M�_�k��=��;����|��+�.{�L�S��{?��w,�2�(qm�.;CB�����P�������<z3������4���^m|�2Y^y��`w�\0�W�:�}3���<}�c_z�*�hj�[Ǻ�-K#[�`E��N�Ql��wC#3�f�|�>�3~��&K7���?v�8�W���b��F�_��ϭ�������K�,�i�\n͋N$�7�[�b���� �\\�UC���n�r�ӄ1v��`� ���!B���\'�~��>\'��򮤐9��j8�?�4��\"����nȠ6<,���5�u��=tZ����4�m�u�M��zB����\'���f�׶I�/|�S���娛|B2Y^q��A�K��	Vq����!a�^[c��ԃi��I`Q��ۖ�[���]�\n�.b��9\"v��ڒ�V�t>�Lw�<���Y����C��[�N\'D��xNC�*q�4��|͚���۟��ɻ�mP�1�H����ܭ��Z��s�Lt�;V�&�wצ�\\A��3w�n�`�S�Z�~D����Og�wã�~\"Qs/�9XiI����WI[KMFb��I�w�ƍ�Y�����;�a��m�\'h.���bXwHң�~]��߿�F�F��+�s�k-��\nDηd�.�F!�AG����G���^S�&��)^@��+!8xo�����\n��8����f��\n͞v��Ů�&����~���������[�r����	)�Ң5_رP<��bVJ,ɲ1�z��G��V�d�����.��e:MB�~\'͎vH�h�z�����/~�e�|��{TQ�F�w�\\zn�2�鴘ZҌ�9ѓ�B+��1����7���k�֡��CW��=\\��%�^�Ҩ�G�%���貵ӵ�B�HЩ�ik��������M��D]��lH˃t�O�-�i�J��7L\\e�t��`\\�m}6%*C9L4��[��MKt�0b�fJ@M����e~�dcD�Y����5�Z�˨U�o~OK����\ZU\rO��]=q�����/3Iv�����zb;�o������m������W Npf��ɚՕW��g]q]�r�\Z �P��:��j�����x��C�5ѺZ��;�!��\r���X(ہ\Z�7��a��7�6{S�@�te&����&��m����=�͙�DX|s�F�F�\rn���\0߱�����f��/��9�m6�A�Ef�-�vYCH���%kj�q��׾�Q��cFmq���,*�ע�VQ�O�����x�F�y&r�جmc����eIu���wV&���q\'w����~I�������gmR���\n��[�����Ft��L�W!��i��R�\Z�������~�a��7mF(����.��H��^��I��H�1���M�u��v����:C4Q_{�#����]��Jcs�U�$�\0x6:K���0SI��G��t��<J�͒ew��vM-Nt��]�\'E����i�ߕA)<�ؐ\"�kas=F���[n��i���b���8#�^{�xX[��\Zk�PEժ$�Ʀ�6L/��b^l�K6-GlD�0%���#n��q۶q�l�?1r�].%׀��KKܺ}���3Yny6iKeP����~����a��Z �\"jJ7��(\\C*��L��|��I�:��>Eڑ��en�&]Q��]�{��ke��}\'v|�����v�Ż�k�ߺ����4�%1�̤�]CgX(h�^66OZY҆=ۻJ/��\r��d� óVzZF\"sz�2l0���fxnE�ܮ��n#�Zs6���ƴ%�%�s�8�V&�m#joL�qvR˩I�J\rUU��µcG���A]�rǟ.�T-�<�!�	��6à���M�.kH���c&�!��[��r+Ȳ�㌣�0?�}��<���)P:�\r?H�UO�-�6���^�7���m(�;ߺkO�)�� ���K�C����ڠ�a��׾}침s��|^S3�~\0G�����JG46�І����eÓ����o���י ���I�E�1�ve���5\'�����q���7���\'�͖Pz�^/�k�f��bfi^���}�ri�NX^.�#�\n��sz�䝵��iMm���\"��B�l���@�zn�@1	8�M̦ץ�i���6����4���ޗ���av�Lo��d��p���3i�l��R\n�W�\n-��~���lH�6��mE��ڠ���nuu?ZV�e����5������i6��a�ܹ9����Ѻ�޺@+@}��bg���ș�ߤ+���kB5F^}�mߋ��E���zږ\nF�\n�,�ݲP�R�\\���Պu_\\jb�L4>sY��H3fP�TpR+�#��\ZLZG��W��4��b9\r��\Zf\'TKR=�y^x�A�ڋ3\r�\\����݇����u����^�G�< ��=٤&\0c�C�.*�qY���Gs����\\.\"՝�@�W>�ǖH�u�~S��0.8%��1������LǺ�]S�l��tb�\"�)j�P����v�\na��E�e9pj���V���դW��\r���fG�}[�~�^uwC��\r.��\Z�A��\0��`&˭e����,�r����?��?:��z{�����?��t�\\0·�����_*�gmj%�Ri�4�9�n$g���L�Ǡ-��!�&�p�H�2\'_o�6{,�~&�rP�0��YR��[kM�ӓ	lD��r�,o�͋�k��{��RHn�i6yH��n(6;��	�0��>�U�.c��=�����sJ������o΍�_�����<���[�~����WJ\'�����}۔�\Z��\r|ryl{��~f����`��\Z	�U������sG��p��P�وگ�X�A�JZ\"�T�쌫3Y^���-�%�2�W�z����R~�2�{�ʷ_�ʼ��)>���@\\,�s�-K�Z`{a�ݻ{lo�y�LO������}����f�Tvʃ0�7K+j!�х����8�2��|�q��S�\"/�4�Zg�����>�n�^!���@�6a���!<��>��*�1�����͟����+����i�ƨ|��.��5u�4�<{�9�6r�����3U�t�� �@��Rj����xT���k{w�[����Z�Q��/����_�_�����;n�6��ԕ3Y^ˬ���K5�������~���O�ؕ\0O��h�9������Y]��P}~T��(�	��jp��3��F.�r߉���fhjz_[��a���_�e_�s~܄�>��g���\ryA���p��?���\r|M��ă�Q��@łgǈ�>u���yg]�\"F��vS%l�v��I eQ��X���	ܺ܎kYoG�Ғ�7a���퇀��@�H�����dym��ZI�V�7�2+gz��^�.���7��[@L�D��,��Y,P%������m��0�\'z�*cό���H����s��t�_q�S��[w��ν�E�B;E���\Z&�c�����=�����؇��|d�b0�\\1�6ڸ㿱����4l����\Z�f=�)�yx��o��t\\88v�a\\�L�d��U%�Xj��Z��J^?3!�lD\Z�������7eT�����7?�;�$=ţ�i8j�N�\"�8\\�Yk7_s\Z���0��k07��w����Ëgl�qӱ�5\Z��@��c*k�nH�\\��rt�~���PQ�{<��@��vMF֎�4?��7���|�\0}���T�6�1kF}���k�4�Ua�!�~3}�g`�ֽfkg��h70�(��VJƪD\"md}�	���~�����sA��F��\n\Z�	wlwV����L��l7�{��XQ3�(S��.��ߊ��\ZQ�*H*��C�vY(�4�.m��B&ˌk{�g4լ.�ݼf;l���qC��Fb ����҆N�l2��.t5��g77h��ܘ8������yd{��63}���s�W\'�N�bwI�D�qv����}�O��e~�!**j_0FuKE� �K�\"r��uj-pi\'�f��7�U;i��*����/x��k���;ob5�F#Y����-۾��\nl�Vs6#�ڤ��x���̟j9�\\��Yn\0���}���8�l\\g�o�-��e��y������8�9�}����1�2z�<C��O�<;x դ7�2��>X)��XA���CEѤp˂�O޴t[����X�] �)�\0c�_��ٟ��z����&����i�j�,3�qdy����y�\\��\n����ȅ/&�E\"�i��Cű/\0Q�~�І��ʷ_�J�e>\Z�������z�7/ʉ���L#P�����yoyL�=���k�S����S������S�i5�T�`�*3�PzHbv�#ˌ��˹�hP5n%n�b��7G��>��/=�I-��jo�F�����{��vǎ���X�R-�s�<o���8NO_��;������_�/zU�9P���q��P3�5S_G����QpN�r�2##㲲�vb��~YR/Jrl�����G�F�w?}�c�}�Y�$Q�b�|��呅*�OW�\Z*�dvw~���F����*��_���燧�����ػs̿�o�O��ɭ���X()���Չ{�\r���9���Y���J&ˌ���H�{�\0����t\"�J��Ǿt�`p�Wo �#O`$������IT2�cǢ����̴fT�-E�O晠_ڹ�������]���O��6��u���0.)��Ɍ����8�ZS��O�Z��z��L��Y2SO����!���@�:�N�у�p�L���k�y��#�u�\r���g�W��R�i�t�����wkg.���O�鈿q����{g�)o��Y�9WUTi�j�	��%��]\Z���9\r��ȸ�)z̄���aj���垙��{�>ı��T�#TA,�`�Yv��v,��3�\\�i줲��6X8���A0`u�\Z�q��ݹ���-<����Z0�B\r�e[FFF��I��L�Y�Y ��iUs��C�w�ӇY,]O��џ�Ύ{��v��:\0��}�	�L��zfi��A��7�C`����Ԝ�xNO<�5k������K����ȸڑe��%m�\\PJ��Z8zp��<B�zѢ�����;lI��HZɍ~N�7i���k�M�/�}��xی����aΎ,UQF�)T5=���<�J`�Z�Za�	�,��n�}������� �eFF��pe#�֌�v.�R�u^>x`c*O������4{�{�ƶT@��T,�M6�F{�d���qݡ�$�vͲY�)�S�4���{?߿߽_=�s��e�O.�q�b��a�ө�-��d����5�e/��e�H�`�D_�[����K�m��>�F[�]����*�5����L�7y&-I\'�H��R�R�qsιN_���T\n�,��3�7\'�M�nJ��2##�ڤ��9.ZO����̋.UR#\'�m����S�y�Ng4G�?����;ER������D��\0I¸Te��A�ی���%�L�מ8S�FҌ�Ӓ`p���3���N��BM�1v��gUzf!&3�\Z9\r��ȸ�S�1Z\Z�<ڸ�-���CD3r���o.;��U������,322n�Ȳ7�٨��D��Y�Z����IZM�c��Q�� ݡ�@&ˌ���-{�=)�T�藆���G/�\\���0���\\(��F�8�H�Yfdd��gkW1wX�-)Z#��,���X�FOt���C\'7x222~F�x}���N�Mp)jlj�`���o��*;��\\�����C�$$�AY*���O�eD4E��Zꦛ�\\*��Ӵ�$B�d���qCG��ْ||���j�`I�-��P���Ҥ�c��2##�g,7@MS�\'̹��*�V\"��X��B����xI\' |�2�eFFƇ��K��0�G�0��]!�d�&�&$�1%�R�RɑeFF��^lٍA¨(�x�k�d�hd��I��MJ硖�2##�g�*E0E���3�階�$7Ia��I$��\\R�~9\\�W]����2##��O�SDhb��s\n���O3p.���CC샇$�8�^N�k=g�ƅ\'�eFF�uYƨPZ;���BK�ɖ8�b-3�^��y9dit#H�c2�WfdЌa�\0\0 \0IDATdd\\W��y�؁�,;�e�B0�Qy�\n\'-[]mZ�#ˌ���+%��u���Q젷�\Z�@k��ɲc���Z��Yfdd\\o��*M��Jh�a�� ��\ZN\\~t�ϧ�3��L��[hi�06�٭�cꀛ\\~d�l��V�L*�������+�O�f��M�K����Pz�`�i]c�Y(2Yfdd\\oi�yu(��!�4K7�Ԉ��	$��f��\n�X��,322nHJ����/��6�lf+}\0�Q��y(=###�^�\Z��ǹH��>�9ˌ���a�\\bs��@)0\r���<?�D�\r6)�k�\n�X]X�,322~�!C�TQ������Cᔥ�c��PzFFFN�����zUS(��<.R�\'�4<###�eC�f�I(0�FNS���eFFFNÓ\r����\0N�R\r�:�d�OFFF�+�$��-��8\'X�3o����r�ma�BV�f��Z;�d�Hddd\\�di�d2��Nd�LZ?�&K�N��S+Nb���y�Y��hʦ�4322�2:��\r����ֹ��G�u�{U\"KD�Ft^k�����yFFFƐ�R���,����\"�V���%]i���).D���dO	d�\nb�?	���\Z���Cz&Ό��-�,E��Z�L����c��7MT��[4S+.�zw^�k��N.I��,�7�h�ϖ	3##c�XӒ��4��$�Q&�6�HK!jWN}��M����%E��3_���o4=��OH&鹂���q5��`��o�-�t\\�k�=�l��T��am�v�����<�n����1xO姸Rص���(޷�mW�(ՔB#���8H^h�3��^BΆSz	��,)f�	�Ő$��Beh���\r�*϶�䮛��s���GE슛am!�iqؗyFF��g�]�(D�=�Ζ��<�^U�~�f�RD�9��c)%��pm^Ĺ��p�I��oU�:�!�^�E�4�\nS�b�+���]Ol[,�Q:�`�@�y�4v��2##�!�:����mAvm_X��-��k9�2�\\e8W���\"�h���f�@�\r��#M��`T��b��ޛ��{y�T���F���V��Q�\0�>�FF�E\'�bX�&S4�M�	�V�-�#N����kX���#��:+r�}�]�n�̎	5�d��\'����ׄj��cǾ=7�-ۖ�MQEEi�:�H*3B���~FF��\"RH\rV��D\\�LAX\0>�s��۹��EW�J�zi��&��I�d����Ƃ��<x�Y���P���_�s��1w��n����.����0x䌱3F���L\r \Z2226\',U\n!8� ��r��\ZȢ��8;���v-�텲.a�zZ�9�s���\rixiF�����\"��];�ص���`��@�\"1#�\"�1�N�d��NM=��̑M�y�2##cs���\08��~�eKu!\0�ۀ,�|0J�}���8�&o�x�9!F��1��5�i���G�fm�;�\n5e>q����/�w���y\Z��8s�m���ƽ���rDFFF�q`&�:v�a��xO��\ZA>�M�d��6֩�����X�ĵ����<1�d���w��f_3�1��k���/�v��4�Dba5m4VX(\n&�q��壚��q\r\"��i 0iϵQc���Lˏ�N��Y��6\\�$�a\"U!3�ױ��)���\'�|b�6v,.<��WJ��))J\'��G���G.����gdd\\i��s<������&捏,�ݾ�AU�z�������BD��*d���m�jZ��V�^���vs��> �]y�B�8cR_�$_9�0.풟��|��ڟIn�ddd��>\nx&���|q�m>��#O��>BU{�6B>�8D���#��&��(@k`cJ���L���6c���M9�>�\\5�];�s�6��-J�:�(�:�y��}�/?u�cp��#8���*_?3���Q�g�����5�<��xnv|����>�8v�!�^�h�8�\0�����C��UԸ(�cu�����w.ضҨB�82	��p(��dl�T��:��W5a\n_s���=;MB����3T�{��<��/���8*�!P���i�wP��H���Ԝ��\0!���b�X��c�醌�%�y�s���ƛ?��$�٥��>/?op*� ���7��\'���:���6���уc�:�,Ďv�L���5���ɕ/��,�-nj�����o�jʙ�	g�=��&ԞI��*�u�jxMiz+$4Q�	�d\\8���z#���ܗO�aѨ3�PU�9���9��/���Ŕ�{�����fl��o�XZ�*��_�����(��~\'�Dc� �Mcs���p�{�~)\n�I�B%�B~��mc5���{��̒�$��z����]m����<w~�&nZ.��u�uJ|��������/���G��\ZQ�ll&\Z��@��#�޾}��uMY������z�g��\'N��9G���pεgƇ���0H�E\'�N�:��x�ss<��sNұ̄9�4Eq��&c�|��������\\ٳ���s���>X��_Q���!�L\'t5�A	u\Z�k��}�Yh��\Z�j�<��^�C�S���}M��ܢB�ϫ��f�M�V�5�9�������΅�`�޽�ݻ�eYR��yO�k��S�9�{���BD�?���x<{YC>����DS�4F�\Z��k�9vp��\Z�aʑ�-e�i(BI�c;�W�X�L\Z#>|0��C�\nS���ĭ;�$�)�9YL���Ʈ�у��@!�\r#� �,.��ϱ�̌h5�z\'��>���z�;３�o���x��E7��y�֦�}�V�=��~�e=�]w��޽{�Fb�)y�}�FT��k��UL���jul�@L	����uI��	����>$�����i���F�ٱ��,�sI�7�����DY�5�\nh$����������p�QN�>��O|�W�{��,˶��;�����\"���\Zw�u�U9��9�<~>��s�2��������f����S��*!�m˥-H�3����!�h��=u5�w��1���3������\'?v�A|]!:B��h�q�3_�ݍ��s�ؿ�W��c�ݻ��(��|�ƕ�)g�m}}�O�}7W�x6�|ѻ��M�C���Ϟ|pp���<�+�ZE3�Ȓ/��gqD�N�#���kO�=��ܲ8b�Ҷ���nL�0��<3��߹&#��P�(�l䃻�kJ�����?W��5������K�{3�~���xE�S����:����Q9\'?�H#�YR[��(ܲ\\�\"O��jjj���ڣ>�oB%�\\��R������\'ݹ8\"8�*A�M��_������\'?��-{���ZŧYn]��d\n�p�wn�s�u����<od)i[D�}HBC�[H���Mwc���q�z�7$��!�T�b�B����Oߝ\"\0�	���W��?٫_܏�P� �b�������s��={vKŏ?�����[�)����d�VOMcb�X^y6�	F߯{�>�j��f�2��ع\\�J��-j3D���֝K8������������9�k��1��)��R7K[93Jr��ޓ�����ǳ��E�a�����S�{�|d�\r\\�,�_���7��ݥB���q�\Z��QW5c��vl�+��d׌_��Kè�����5BH^@��(����O��tzM��;�@�Kg\\�,�A�F��;�#�Vf6{��6��f%\n�����w�mi����͋%���\Zb�bu0v-.����R��������9�=������M�rdy>�*�������d\\�,��yUUהB�,/�!q��@�j����/~ND��\'X@����]j�(O�_C��ٹ�f0jF��g��/=�`N�\Zd�^�	�\"���ߵ>��I�%̅�\\�|����\\��o��$f�*��ktwgK�G�I.#�f�)�j��zo�\n����T�+�L���t������>�H _ж��P������o��J��c;\Zx���U���z�Ьt7%E��F!5�@��fi�d�¨�J� �b�\n�ٴ^Ӝ��D�x���ާ|t�.��0�:�BaƓ ����G���q\\H�o\Z�)i�1��Q;b��5s8u��^tl_��D�d��+Hۮ���w~KO�k�<>t9�ш�Ϣƨ�_�n�(X(��@]0�/��4o���s����cu�\'ՇA�y�qˏ��/�|Mv��qaHqx�<5\\����/D�\r,E��K��\Z-��mq៷!+��p���}����{����c�6ɥ�-�\0Aܬٶm�5m�55�|L/�=kE|=�p���#X��j\"�%m��RQ@Ke��x����7�<�ڴ�|�������{sQ�2O���]��5y�cǎ�n������}��Wrp������]�~��-�1.��	��QI�R���7P�W�}l >�mT�Cd���\"3��Y�-*��<�m�ڭ��-���5{w����+g�2.���a8\n)z��������P�7\"Y�Gq?���a&�sv)M��Bt����}�\'X�=~|��\\!4�H[v�kN�?��O���l�3��]b\Z.�$�\n�8��P�r�[�[��ɔA���I�,�z\'3���x��JM�U7��R7���T�ĉ1��~<[����xΘ������o���C`��ţx8͍ww2�Ƕp�.}U��l�\nbe��C��\'M�(e��E#͉��o�_�T5Z;w�ܒF�o�A]׭�Y�$/1��o\Z��D�T�|ZM�\ZM���0V�����c�31|����(H2W^Ad	��k��vU��G?�Q�����9�ؚ4���K�6����U}����\'�J�f��������� {<��*Z�>Aúm7\\Z���[|�,�����cpiW�9�2Q����\'N0\Z����\\�ںc9o\"DE��7�x�<��?�� ����s���.���f�\Z\r�!Dy61JԵ#��z\Zxl��P�WH�D�7x�(���^�%!�x�\r^y�+N�-���Զ2��X�O��x�8q�cW0O{�ĉ���K�5�y��X�n)iCG����yE&�t(E(��Ym�e��o�E�q�R�*�\\�Z�W��A?�رc����%Y�6\'U�>��69��	���v<L��=KKK����d��Ϻ�Ѥ�BhK*W#�<��l��iԃQ\r��>=\'��}<���\\hI��\rW3�U,j����X]]�S��T{�#G�|��on� �����ą�9c��+�����O������ݻw�CJ�S{#B��h>�W#�<_�٭���`��������O�R�:�\rMj��i\\{P8���\"������|%x��5q�E4r�ɵ���,�!�D�\"������B;$��1�T�i��qU��L@BK����p��5�t��4)������-\"�T�jR�y�Q�LcA��}�ٕH���u��m���_@eF�2�j�K�� ��۔!.�7e������^x��Q�A��m��e3�*�?7������p��x,���GWԹ���=��θZ����esL���h���Lzz���\'f@ں���CW���?!6;a6��e?���X�;F��f�]�F�ᐥH�\r#\ZE�yܨx�d{ãM��TXt?C%7÷\"�sBȜ�Յ\'��<��{��q�vix��-(�\0x0EC���,M������*��i;ގ�-322n�P�?�n�\r���X�J�:tj��>�D�������Ĥu������\'�l��Z�{�4�5d�3�L�G��\'{\r�6�,���T�%eFFƍW���k^�����`�Z��NK��X��O5˜�gdd�0q�D�^!�E���������cfTtm2iՁ��T�p:/rT��qo&̌��#���YqL�����z�@��K�j�i\r�2�L�y��XΥBc�ʳg�ߌ���-c\r�ω��I�x�&;J:�ߴ�(isqR{tumJuke��kU�N=N5�WZ�[fdd�0l�x�\n~�^yn��+!���YԱ�ԃ7A�&��iJ��;�f<�����=�̑��<9���ȸAKK�Ft�˃�E��$��ZՏ{3t�3+�q������7ߊ3�>���Ԍ�����f�J!�<��V��ιg���Z����Վi-AU\nFn�6Ih%��OFF�\r���5�@�pr-�/}��h��,��\Z!V�韊\'�M��y7�)�q��?�?�{��3��z�Yfdd�\0�e�W�-~�[/>���bQ�nˋ�����8j��:u�^YceZ�b\ZB\nG��?~����?�g����R�n���M0�ꎝ@��yS����ک $JV��T���Pu��W5\'Ϟi\'��\"���\'UQ��]\"/�gdd\\g�d+=�\Z�A\r������~��~���Nrv�_�O)%Q;Hx��J�C2�E%\"�X��o��L�����@�:H��9���ȸ>#ˀY�[��-�|#Ai�@U�V�+E���{�ϱ6��`PT3ay\\>1����VP��шgfddd|�d��W��i��!�i�\\\"��^��Y�=E�6�E{͕�	o�>+*\Z�A�l��$��<}���|gJ.���J322>�4<��$YIu������6G>�2��6�N��O\"%���N�h�%�7�� 5xzb�\"3�ށ���Y��h�sd���q]�ek�XJ�j]�	?!���f@-�-W+�ɵ\n�\"If��8T�;s��+�Ϩ:��sA���9��KN�C�B�t2�b\Z��ț��x��è�Ճ�(DQbO�QN����<������u�sJU{~���O�tO%f��&<?\'�P<B�&�49���ȸ���gLj���B���w����)�9�	�[�VuH*A\Z���\\�\nhQ��{g8����&YuP�O�	�A];MV��eFF�5̺�\"Z�=�6ᢣ�j<��~��skr�cWF�6MN�\"���\n�������[\'�\nO1^4C����zxN:~��(�!$���\n����!D�u�L�ǩq�<?��w�ϛ����������n�*iQ\'����@�DE?z�}N�[��!r��R����|h��`u��`ɷ���������F�-�$ŠT�����P�~��\r��u��>�)��@i|Hy��99[y�M�&��\n*�nY�s�G�x�[���.:�\'�ރ��_�֫����ȯqh>��i��z��W�����5�bhl�aa���у��p�<�h���u/���\ZR�t�fҎA���W��+(T�1��<�\'O�:�#jƊ�[�xn��<���Ԡ*� �r��k��2222��);���*[`\Z���D������Ǹ�	?>yF֭��\"n��ĂTTq�Qh��)Jp{�-&��bP\Z�3F�/?��;�����ٵ/���j��F���V�8###��!���1�A�kj��r��?�p�����Q)\n��S��)x�����ήQ�\"Fhg+�2AU�亨���i�s����W&���7Eյ��1���K���߼�{�~�q��u����(�����q)Qe�#jB0����0Jw?}h�=����?ss��<Qv2)Vb*���<�$n�TR\Z.)�����5 W8\nW��X�S�F��wy�b:�D3T,��,������~�0�~�%F��X(\r�fB��l�32226�DM��F;r���~�w?��ƈ�w����	#�К-6\\#��=-�*�p���V�i�iA(D4��!paDp�R�T\n�����%��/�}h������W��(���6%M�c&�R<���@��=##cs8U��7l���S\"b���30QH5Nu�کy��\Z�E\\\Z��v�1e�[����q,x�|��uEU���u���WS��	7-�������Q�������*�L+�YV�X���,J0Pu�����s�h��U�[�;��)cF\ZR�6|�GUy��D^y��h̸��J\"�!��J��UuJ�\nJW�E��u%�h�����|�L��:;o�\n!c\'���G.�����q�8��C;� U�LShh]�UHu�S+S^}�:\ZQ8��em\n��p���@A�\"����5���է$�������.��g�����=i������s��~B(����2[fddl)}ᡘ���cy����C��*ﯭ?r��\'�:�\n���\Z��2��Ғ�(���C����X%\n�Ry�����c�{>iˋc�NE���\"�$n��>]\\\'\0\0 \0IDAT!x������9���ȸ8|�w�斅�����!�n;�����z�3�s�sn��G�x�ODʑC�8:7�mI�\Z�ˆV�EÜ�[�4�:�ɜ̨F#̿x�<v�ǿq��OҚ��2|AB��P*ʱ/�)h��N�{>���Q��ȸ(;�h��{b�k�\\�Ys q<I��^���9Ǐ�;#��>��Fe�j�j�h�淩W�̅7ߵ�bk�:TQ�P�((ʒ�hLY�)�-F,�Jޟx����\'��;bQE,�Խ� Oj`F���3�5�>P��gr`���q����ZU��@m��(�f�(�ޑ�Xqbʑ�N��wNc�t4�cT��m��x�Ϡ�������A\n��	���hb���XP��j�?�\Zo�=#�q���6�!l��$�����H���ٜ23:�?�éP�� v!��C[�3�B������_�}�Չ������S�ȯ5��*�!�l�䔆���fhi�{��_Zt{�Tb!SjT��O����O��O���pۭ�8.	x�{���&���\'qaw��E��-�7�)IO\0��F�z�J�i�����/$ߨ|�ob.\n�J���h2Y4�:0���w~�޻�ݳčXZZ@��@\\̞[�!R|Q�D�i)��h���&8�\n�\"�1�A�auR�P8�Uő����ߓ�ߺ�O��v./�(f�73٭+��>r~}4[�:�fj�US��	?�@��ц�K�B��.�4:f����a�8�\"o�<ͩ3�L��Ņm�*h�R�B�Jc�&$�V\"z^���	2��ڦ䚄��W(����Z#�� HA�\n&u��?~��x_v�Xf��|�#{���j�k�����Y�N���Z;RqD�� ��Qf��#�.�l��D,jN\n�sn��/��柜���/�ٮ��pN��*��揦�cs�<ߥ��G\n\r�D4}�*�;.yR��߫*�<uU�\"��H�R��~��I�=}�=;wrӶ!��eˉ�:�fO�p6��Mf.7�� I� ���-1Q4պ�؍�	SV֦����}y�F�\\	r�@$�ޭ�mRQ�U&/�\"e�Â���M�F 3 �b:#N�8Q��H%�Z�E(�Ɣε3�4�>7�u���Z�i�4B�J�\"�!u��N�VZ0XL�b�\\]Y�:}��}>�(��(ʘn��jԼmǃ��^�D[^�,g���6ۿ�a��9\"��CLpjU�7��V�Ц�}�M�Ԍ�.��9�yT\\K�ҭ;\\�af.��Q�� 	v���_d\\w�O*�E���ӲURm%�A�j_,��H��o��]j�D!�(�X�\'��c^ q�<5�Th�����@���	;���e�F��Iѯ/��j��̘W�ҁ(c��M9���2�H?���Cĵ[��m��^R\Z>/�g�\\�<c��)X�F��:��\\p�ئ���A���R\0/B�����L*ʒ�jJ�(��l�>�mb�ޔ�?���(Q�D�\"�L�7 i��۹\"rXO9���]��筙�l�y�Y$�w����k��.�	7\r�Vhc�R�q�Ԅ��?p}<�̋��d9r]	��y�fDD{��37MB������J4^�S\Z��\rx�r��?I��\0\r��t�2�a�M�3n���p��>�q�rt}\\\rͤ�؊[Q����\r�~���xp��a�?�K�w�\\�������+� �ş26��-��E_�\"�3�pf��~�?;P(�ə��qZ�f`�C,�K�C`j���p�mEA0G! �\r\Z=7�%]NI�j[��^��$��ARnmJ����V��̴�F��x�^�-�f�)�j���}��/���æKn��\"�}�tK��%�jUͽOK�f)%��3��]2�l�.|����e?v�=m>������m������g�M�亮3��>�܈�L� �HT�$؂�X�ʮ�<Q�	��-�U�L�� �AQm����\r�Z<�*���h�`+�Y,˒(�\r�l\"�9{��9���H I �L�n�$��M����|���j����i��������#F�_}���ǟ�tW����2��nm�I�m��\r�[S�n���,�a�s6�B�������￁s�F�м!�Nfi*X2�\"��������]�,+o�@��\'h�r.[*�;Z��;*��\n,����Cg�3�6\"�/:O��\r���A���$\"b�?��[?��*Ϝ&�b�b6FCl���nN��i\0�!>v��j���V��:�@��h��E��wݬ����\"�P$)�9}i���*�+�C,����42��;�&��wX/��г��=��sT��+���owfY��*��%ag�ڴ�p��i���=y(��ؔYʦ�R��r��\0e;)=��\n���䕭���x�Z1�R[�_j����G�̧�Q��w|�V?���?}�IT#����9�\0�ClS��f=^t\0�!nr���қ��!x3j�~��-�����X\ZCT�+\n֍�m�g��n�\Z�_=^�Hx,B�Sg��G?zg��ן?�9kO�T���]�F��ӈ[7V�,��x�I����U�MxkA��稪�w�nC��s��E�ם�u_j��F�lF���.v=�HZ�2\Z�A�e6�(�t#T�G̡i(Ç�A����	8����7d��Ξ�ԋ��=hʲ}I�)�6J;��.��e�Q�S\"�1K	� {��ՑRr���A��6��Cf)j�R��ɽ�:EV�3�gq�����4�n��!�.x����ټ�J���X�=�}������3��%�ܮ<��>�2���9N�x�G���6@�LV�wVd�����Xaإ[�v�<��cb=&�\Z	�~q�R����\r}8Z\'�4��-�;�Ǽ�j�\"j��o���w��uN���㷿}�%\'�J��+\\ɦ�;Gش:Yԃ*�y��W�}����GXUĤx�����\r�GϱÚ��]z��Q�R+yK��\r뤈@����>X�XV$���*�d�\n������P���Ҳ��0������\\�������X�Q����kΝ�y�{���5^8�4j�����.\'�=�C��9v#���V�Mf��n�V���\\��5Ө8Q&!P��v��|��o�x�����*�/{@Gv��hiD6|�|����x��Ӡ�G��ƶ������^��������>�(<���������œ�	��7΍6,~�B[n���2B�♿�~��X[�̽uD{_�RPs����oyv�O���R�ծL��tz�;Q54�>�;�7H)�]8�$�<��oz�_\'��\'_z���g��T��4	#הS�\\� �����J�!�H\r�ɉ�Y��v\"�۸�1��PU��X�Dn\r,�M\\i������Ա~�sf�OKE��>F^f,ϱ�\'1ĞD�B���������*b4�O\\8�$j©�ݶ���?{��+�+j�FL8� 	�ʙ��]��kV�:|�m/�wl�e�&MS�����Z.}��S°�)�ʹ�[�,��D6��5�t3����sM/�D����k����.�p�r�\'�>�-5\'oK��G%a�&(������v����f�����������K��	<��w�w��&Z�Ak_�Wf�\r�Ni��9�:N��\0=S��g�M�O3+\r�/d���M�-����ha�K��!t,cCHj��O�N�3�ٞg�+��c�Y�ˌ ���-�`�!�[-ř�ι����2�$��������k%��:Gplcc;����H1ږ��JU�g���e9tb#�,��i{���1�%�Z���F!�|�7�78�\\���&hM�j5�z֚EY˱����F[�ɐ]�3��ȭ�/�᰿��T�i�[\nߞ�Y(aX��*usf�Ő�Nk[.�6�r�g����;��x&׶��k��Ą���d��~�qt�I�\'%�k������	���h�\\i�6RF͛�r^�ں��i�\n��L@N�}x�7?�����rv0�8����ηS�i>cĵ�~h�j�0��o�Yi3K���ƅՋ�<hZb�q�Ki���N{�]��R1�s�-=�R�2�,�%�iқVa��Ս���1s�Q[h�Ur��ph8��FT�x4���v]F�m�rF4��&k���b��,�6���0��&s�>�d���TI>\"y#���MU����.ܭ�[&�Y,c���z}Oz��\'ys��#E��4ѝ�G�j����zgp��0=�Ih	�C~�b�5�R��򂕍 ��A��>g����JoK�s�.�Z�WDjɓ�\'�7ϜX�!�X���3j�i�ʽ��U�M�m�}\'�<��G̘Չ�T�7���%�`o�D�S�q�8�FJԱ?Y\\�x���ػ���:��s��ʻ2��ߓ��&�9�	�7gKg�ۭ�6c�j�]����)V���,��Bs{o=��Ů���)q�����}`�*q$��٬L���\'�HO�˗/i�L��8�sll�\\�����IW�3����e�F3��x]t�	�,�F�B�޿�%�����&��m�t.�J�([�4��Y���<�n���*v�����Т��T��$�YJto,���M�Ԯ5n:���ȵ��lE��aa7��k�\Z���C��@��#Qfi^����#���o-1�0�g\n�Z��H���o�*�3�˫���,�6Uj�dBBب��Yd\Zo%���\n�l��2�r�w@�+��G���P-8��Q��i(2�1�][m�ZS�y�xi^r�����1�v+�ո2�	� ��5\\Kzul��i�J��ĴN��I���$x���\\kz��,�l8q�[b�g�n����רSB��[#�	?��p��?x�����٩1�wgj��oS��g���NX�)j�&�l����r�g6��tJ��3c����T9Bȼ� �8ˣ���S�[�\ro6u�.���%͔�y�	�{*�+�S.��}�P��=$��8�ȇm��&�Cs�!�l��μ����.Og����Ǟ�$�k�Ӕd���$j��`.g.�d��w��)k�DLF(����ҭPR*۱���F�8࡙L��ʙ8�s�sy��C �������5�2�����̹�=��9��vWC	>�wO�ݨA�dKL05D<��_�?���WjUD��Q��FM�wǡ�:��ШV�)��ŧEU��h�\Z���m?k���Vx��Uq�7�t����|h���/���d�_���蕭hQ6l�E�b��$����ٸ�YZ�X�b��Xf�[��Ku\"����&nd[�[�k5��Q9c�rT>`\Z�Nk�\'�G�W^\\�޹�̲���R��Éǻ��\r޿�*���\r�դP�V���\ZΥ-r�b�!�1\\�%�Zb�)��4�D�����b˙��.ƥ�kb�\nmѵs�>o2�\Z��tX���������D�BǤ�ד+���dX� ����M��;�͗s���/��-���h\\�\n�}��麶2b�<Y�b�}�Mv �\'&�J��t��{�����r�V2Ƙ�7kH�芛���+Jı>��)�H��#����^��47�FU 8��)����XZw2�i���9�w�C��~{�:WצeM��8p9-ޚ]��{���{�f�!��?�W�ϖU_}����_8�4�\n`6�*�x�G��cד�|���l�\ZMSLc\"���I婪��O#����GيD0�a��7�zf٤�]���3���-�g��jm����+;��%|�Mx�����Z�M�R�\n���C��2ghj�0��8>���]-v��\"�!�U�޻z�R�|��9u)\"+M�9KF\"�4V�a�ؘ�P5<��j�R:w�Vm]n��+ŭS0n��{�F�� x*������>��Z>�w�H��??1Gx��3��.���.́V4�{�u�&7�\ns�@���}6����3���k������\\����W���!���|�/�{� +���VH�\Z볚�xa2\nx�-$RQ���(s���?��O��Y��\\3�ɥ�w}�\\����CiKi���#�����y���Wjnn*ne߆�|�!�Z*��ڶ�8EV�ăքx�������|�:�m�p�ƿ]Z�+B���)�U���\ZOqT�C�\Z��\"��U�|� )�-�4:��nKf)-ѳO	�sY#�9��xW�gF��o>����2gˉ������<��g�QH��(e�,�bOE�Sl�Ċ�&F�DU>��-�7�F�1��`y�۫kr5�8�\"�l�̲ؖ��I9GBP/�2�,yG���(s�M�]�e���5��;�wH��p��gߔ�:�_~�W�z_��	3~��\'�<�����scML��f6Њ�b�%�����$�ub䍇Ͼ���~����(�ż,��FT~}y�cr�2П�t�\\�ı4�80\n������@�k��)���l���W6�L����ɓ��	����\"���#q��T{j�Ja�o�^~����ܕ�ƻ>���ٗ��e2����\0ȹe/Ǜ�U�F<|��@y�YR�����n猟tY�Eû���}��1L?�W�͐Ǒ�׋+�˭���ٮ��\"[t�Y�:���\\���sy�\'������l�#�g�\r�D���������;\'�n����ss�����l.�b�;V{��繸,t�#\Z��CJ�7�?M]�w�����s���ٳ���A5e�.�ۍA�����f��,��;�������_�����Yz�KE1���b��gĺ���ĸN=�1�%N�8Ŀ{�K��b�fԦ��K�>߅3���dS\n�	0�b�;�Z��*��(�03c��as����,y���A���FbM���?qIf>������f{��6�s��s��z�v�k��]�P�@p#B�*ǿ��y��JǙ[�}��;O4�o?��9:��SbJ���r|si>���`��{�!>��]?��_S~G3��I1���l!P��~���cx*��\\M���/�,)c�1�r�Ks���p�`ٹ��-Q�����w	�U�8������W�u��H��8^1\n�<����}��שB�d5�l���\\�9G;\ZN�!���X)�8���uނ���đ�������Ͼ��8o�œ����#݀\0�8��׏.˯���G8�\"��_�*�\\��vPZ�g�.�˼����B �\n_B��u���|i����>���D��~��m\0�LyֻL�J�u�M�\"	�P�d�\r1�ǿƋR�4.��\ZԴ�R���ј�ξ�S�s�1�~�4^�Y�y1���W�we*����\n���T��{� ��d���g���6�b�7U��\"�N�X��tJ]o�#�-O�ڣ\'me2\"��AΓ9A����4����������O\\\"&���̒��\\\\�:ώ!�bGWwS�Y�P5�����/���~n��_8�Tqj|ٻ6�-��;���/����oJ�A\\@�ǉ�˲\Z֫f�-XnTk��)�F1�E���gV3���)�S�?|�?x�-�D4�sWvCM3 P��x��7�}���r�_\'#x߾�l�����X�@:��\0��6;�����%�yB�<r�6�����~�3��������`Y��9��V��Ư.~9�<��>�����3����DF�;`�������6�D�5�\0f�A�jb����gM��S_���U�w@���$D	�q��7n�z^���T����hc]�\\��ˋ�4���!~\'J�M���K\Z�٤�k(��(	����7^��\Z|�IV�0�N��_��J�-j��\\\\����/���T&��>�J_�q}����,��I�_�8�+#�&%i)�g�X�Hq#��јN#Y���-O*�v�b�%���B���^z����/<�k?׬���yg��\"�����`����B���hu����_z�G�p�T	��l�`[�P�w���ڱ�޻r��L&�^�E�8����C��Oe���ϷP��$L-���I)�f�#iIY��q�d�gN}��\\y.���἟�PjI��c��ｱ����_<I<ݺ��zb�!~g���^�i�N#O��֎�r���g��J\\KXoV�m���x]~����jĸ�������W��c�����U~*�%����DJJJ	��c)�g�qF�ٴ����/�σ\'��j�����Q\rg��:������!���q��i@�S�1\"�Z���l�`���o.����*�ш��a~D�$C�m�9��3�\\Z�\nV|4�R���I1R�\Z���c��b\r�?x�~�^�Ф��!-]��G#*<�jʩ_��!������GV&@b�Q�B��ױM� g-*o��|pm����yB5�%�+ɐ���\'�ŐO�9q���Gu��\0\0 \0IDATF�j�iJ�T�����<�D��S\"nLy��!�<��ώ�����{��xGc,�e�S�0��b�����\'9�ڲ=�t�V�e�:sB�n���.����.�a0ZZ��P!.��lzz�M6y�K�O-�\\�aZqk+S�Zz�1ER�qJ�M�z\Z�����������Y<�R�y���JV2p$2{ȷ���Y���0C���g��|`�s�0*�OIt,/���-^dٴѱlL�0�8Vg��������*����U�p�>�$��\Z���S&��Q�l�)˰��F�Z�,S��i�1��XGL�i��)�\\�/|��?j2h:�+;�jJV���x)�&���^�4��y\Z�^dZ6C�|�X�k���[��FO1O\0��p�`��;��<��|��y��\n��*��m�,Y^IL@�N�9;�[\Z/���v8��/.]��^dC��B�w�G�=���6�)eC>�w��ꙙ�LК��nQ��~nYq]ģ:C|�|���\r>x�����W��ON:��fOT��Y��h���8^�5ӏT���56��|<���(��(ϟy�iJ��nNzj\0���VR���p�S/�fҚZ]��\"�(1�f��\\\r�:����\\?MrQ��̲��kV�������KW�4S&~̑q!��_A�E�,��S�ܜh}��o�4��/�.\"�,����\\BL�«�\"!��$�($o��%R���W��3G��?s/9d�	��m�iQ`�`Zce+���v-c���WNiq�����n3Ó�i^,3���{ڗ`Y�/��[��I��+b�o�=�$/�v/�;3pP�<(��l��3޻rY��K\\��q�pp<�=��#���\'��1�jS����S/���E�I2S�Q2�P�U�%�Lr�pR�\\dy�D���/����?���D��8�=z�,�	�Ǣ���!�y}r�~W��=x\"���\Z�[��&��\nl�)7\0�m�Ķ/�E,�!���@�k�i��[x�X9�(��R\0RS�ë�_~��o���\Z�d�P��T1r�������Z�lg\r��8����O=���N�%eN�s�Q?w�0�p.�GRĥD��(RL\\\\�y�_~�;կ���e�?r�cG�����ʇ���ۉ��Vy\'veS[q�]�wK�Ln�ۂd��q��$2g�4��-�U�\n�F]���L\Z	��h���n`�^æsQ�-�ڹS�1q����^Y����rm}��&a��Xpa��܏t�#�i�Q�.�l��>`�s7��~0��Y�H���y�Ρ\"�\n�2���@J��\".)�\">Uy��\"���Ư�\\e������7�L8v`�#KK�eyi�I��U��M�;�s��,I��$��Pm��C���cL�$7W[����J�u\"{�����rO?ll�\\]_����npe�f:�1���xi�%�:PH�=�+�Q�r��7��\\~�{��K��V���f���ܿԼS�\'%E��SB��>�1�F���t�GkS~��%*��*8��q�Y�*&U��*��r��N�ѥ�-��jm�����GV��6T�{�l���&3@r�t}m���Eq�=�u/6�-l��&�Q�I٘Θ��L�\r���=^^&���H�����`o��%}�@� ���{ρ��i��۔2��ʬ)�PJ�.N���:,*\Z5�4K�iJ�%�\Z�/��R���k�e�\'yE��N�0��]�Фy�eP�\"_y�(_��P�_��S���^o�,U��Y}��_|����>T$3O�9�K*S�\\��*��,�}q?��x���RJm�쁋 ��W׹\'�,<��z{0�\\f���]�J�.[c�^c>	���,4�U�\ZIS�.)�iJ�r��^{�?����!p�� FJٖbIV���F�A�xOf�;����;��rp�o�w�=\nm��٠!�G���e`,�9\r���t�{)���yCs��D	�|�/��\0�7\0�-����0s-�@�.��c�l�v�w3��]�w�9uTk�Jq�5V�L����m|�[��yz���9��c��ԙ��Su�!��9ݜP���ʏ�VB��Z\nc�����w.�H��Pʀ���_O��/��lڴ_M[I����06�����-�����3�͠;�(��9��˭��oO��/K;YOL�D}��QڕJ+[Z�et�h}*Q�M��g6@�͈�%4jV�WEbk�< ϾDKk3,y����>Ðm��Ψ�s���X���f/�i���M���ܖ������m,��^Ā���{K{n�÷m�F�E��y����y��xnɂ������d���mY�zs�#���5����г�������״]+��w��{VͽVI�dy����s�neq\0�}W��W�Z�I_U,}[��Myϝ���+����ꧻ��������I�<�)י�(C���5��)��ހ��u�{���f\0�4�;kw�r��tQY��x�[}�e�|3E���ʲ7���xK	e�7�8sy\\��\\*\n,~̇�o��>r<�29nܖ���7�I��t��\\O��Ck��^#��Z�T��n\'I�����&��T�Q#�d4��^`$֦F\"�\r���r�w��}Mi?��2��o��\"ɖ&t^��{D��[�嶧���Ӗ+r�K����:��I��I��BL5XB�Q�����g�xk;������m�8�6ex����8j�����T���]�����`s\Z���Y<��d��[M��! L���^�:MLS�,��,��98V�=K^�V��?�+�W`�[��h�����$(db����t=�DQ9+�D�+�y|o�����X&��x��Z�`�)��ݦ4��/�s�p�N.WJ�5������jM�H1%��^l����S�Fϼ��m�~v�T�~����c\\�&.�n��\nT�3��	��ڌY�|0]�Jp^sl��e�#���Raߝx۬J�����Ț1��v`���\\�N5a	��86qt�Y����c�/si�\'J�o\\�3?�������4O ����Lɂ��*�S�ж�>E��Fєd\r���z�o\\��\\��V\\����uĜ��H;^���g�\\��aך]t��ڌ��j��X���rUe�q�#��Q+W�ף���\r�:qߡ	���;�,���n�,s)�~�B�FO��g\r����O��9\"�))�wx±�-We�w�����L�&������khP�=��,�����_�5�P�b:Ww.�d�<�#�hN�[:�����@�r5�b=&�m���>e-��s�\\q�S���]B��\\������1��p��\n#ߴ��#(c���������F��� p��\n��Zj�dea����\'A�q3�?�Ӗk�y�ق�̘Δq��<���+KB�♖e��KYu�x�ު�ݠa�}���-���u¶uN����z�Y�ȗI�bV�,��XZ��$�N�Ղ�Q^���ˡ�y��1G<�j�_�$q��9T��צƸ�a�\"��Qב�k�98�;�o�N���T�{�f��q[D�o�Y�	6�����\Z�\"�Z\"�U�31�[1�N�88�K��J%y��Z��ɭ�)�ɞ����P����-�9�Y�V���ݨ`��Ltq�)��˚�{Pϲ�bn�&�&.����o��&�wu*�� �V�_��Ϊb3m7._�`��C#���\n�F._����^���Ɓ�Ӛ�\\�c\r���ĉˤ㷫S.�MY�5~];،�ƃW��x���̽�Y6Ŗ�i�jސf�)k�}���?`�qM㘖��D����Ю��my�	rss�n��h����|���x]dƧh�K�{G4c�5Z�^�ly��G�b����s|��U��__�a����^�u7t��L��up�r�,θ��2f9c��K�יT��zd��5Ƈ�&#/{�n�z6�3&KQwv��k�\0U���+쥆�h;HN��I���7�/+��ٗ������?�环����r�3+�-��/\"ZV�z*�~���B��8N#G�Wh\0���9����Aq{y��R���\\S�ى8FbxS��T��Ao^���Z\"��8\r��&M��}��5)z�|OF��ј��f�u��{�\'���:�Ac6HK5:ȇ�5�6\"1%��+��իS֦S/Uۊ�o�_]�s��%N�j��9���\\M�DC�ev����H����9��/[�uVQ��N�*�{F@��pC^�ÿ9��~����{�������h�^�ݾ�~�Ə��k��?��#�\\兪k�Mu��Tf�����8�:��<�y��[h�5׳8�4�dfi�%H*����%V�g��1�9�0l�����pd�3�1%&UVi�%ˮ�;�t�����0U��RŽ+#4��6�ٛ���]Q-\"f�2�hm���<��C1�Dn\"9DV�����O���p�1��s�2�H)���4:��N�ŕ5�Ū0��C��B����a~quƥ�u>sx����r���������THRD�%��	~~9�%��#��W�o���C+\\^�1���c�:�Q�D��\n�>M!��ue#�k)��2�#�G�=\\j�B�Xz{�<tv\0�!���/�\rd[eM5S\r���-�K\Z�=0��3�դew�qE����i:?���j�f,�����k�\\ߘfհ2x��G6�(�7#���9G]�o���Ng�����J��R�ho�w����ʠi\'��II1���l���8�\'��n��J�<���^z{�2�b�x��k�cL���1ŋ���#�N��v�\']n�9���q�I`F�ŞG#5��B��ƕ>�`B�@\"�����KB��v�4{�7�Y�Ɯ�|6OسQ����uKhJL�5�?0���ʏ�i���UD�����o-<�?}��������0(�����1��Ζ=�����\'3��8�9	88�_=��xj��J��Ʌ�9&\0LB@�L�WK$��#��rϡeD3�%��<Wg�o��SU��Ĭ��P�B�2wH��l�R~i�d����n�ZM���$���f�����^g%�Nx�׷��O�@���#�Y4��a�p��-�Y��&\\8s\Z5�ԋ��=��΅3��F%�왞�u,c�3IVz��{D�D��_������12�&\Z%��ϸ:&�G�/����,qim�$p�FQ`u�0�,����솯nl���ڳy������������L�uͱ�1�W�NZ�}I#��x⥭=�g�$f�b8-\\\0q�55�]\Z�uE��13p���4�xnSI~���>MRH�_Sai\\q(�\\�).�9�[�k7#�o���rTy���sy��`My�ṔI�h���j���5�Bd4�H)�#ѱR	G�+\\p\\����:2��C�Q\'�����V��`ۣ����|޿Xװ�5k�RS��y�)���cE�w���}��i6�\Zq�(;��k+�<\\VCܵ�e\'A(02H\"lD8�<��|&ΰZ�Ō�4^��g����\r�Zn�v`x�2<o�!p��������ȇA�g�������(\\�g�*�7�.��we�q�K�3>Z�\ZG������CT�>��{1���[oŪ�ƪfۈ����f\n����f���J���:{x�9�?��cϚ�JpU���4>&[l,��nL.��-)�q5���������[�i��Zz��Rx�2�n�+#g�I4G%�d�-I�m�T4�7�*��׊�[�|�\Z�`u��q�r���*�T\\��,�a�R�XW�pyu�o�f̒px8�<�,�� ���wd88	�c�uJoY`+EAH�ŭZvpL�Y��6�±����b�+��5����ۯ���ā�+�ûLVu����!~g�l�I���9Ԅ����c���o=�{>;M�_<4fd�:fj���/�������_�C]qliD�õ�/�L���&���oy±�	�j��)�wm��Vk�\n�*��C�2���\\����1WV��̽7Kﾯ��T�� a�T��ٴ����{���W�;��\nֻ+� �Z�9`��1Y�F8���R�[��bΛj���Y����=��gWĎ-���kQ.��D�	���&?��F�(\'��*����͔���f��)��,ф ±%��x�d	�*�B��Tu�R~�>��r��es��o����5�����C6�BL���)U{�7��AHk����a�!��̲w���r9���Jm���e}K5a,�#�>\Z���՚Y�������_Q�����)qD<b�E�G+\\^��z\rӨ��D*e��{���9�T1�|q�@�8l�ѻy�-t�n�S�e[�K#C�pZN-�F=�1q?{���L.�	���9Vm�4�F��\'�ω!��\\��l�Uuȑ�l��\\��ܳ�me���S�8K8�3P��Lف\rn�Ҷ�h*���2�41K�:\Z�e_�2�BBy�糪�ա���>�R|QC[5�Ki�Ĕ��qVsd�y��ö2�$�\n΍��Y���hDm�wH�b��(JB�)���<�bڱ��k�T<f�%g|���V�M��2�1)�Ev���Ӷx�4��~�)^�� hU�I�XB,��H�[��y�읫����n^���w`q�?�Ѳi��OB^UJI1�3�rZ��	_����$�8��s��}��8���7�1��J�m\ra���ӌP6�t��m��a�xK|����A��W6���|��x���L��¸��A���<���!*���)�H�;9w�27bI6%j�E�Le����f��Ƙ\"��:):�q��\n?p�F�$p4/�f$i����Qs��7�+`�!>�Uy�����x���L<�(��J�n�0<fƉ%���N^�xA�\rL���m�7����	��Pf`�����H��ҝ6-�Evt�KC����,���:v��-�$�f�0OR%Ƙ�:g	�#\'�9���L�PN�����)�F��b��ٟ���p�1�.�Cgϱ�	���>s��DTz��84r_}���Vԉ-}?�u\'w�7�DW�4���(!݆�ѭ%k�x�H��e�w���Fi�L){�)%Lq����=���f:��h8_& !rm�/?�ҐM1ĝ��_z��ξ�ʤ��2S�N{�	+�8ydlK��MT��gMa�5_�����sK`��+\\ݘ\"���-��v�|�O�[��s(����D��l��8�+\'�cK�I����)�x��[���Z�p���O\rg�C�b\\8��~�m�����w��b\"�P���x�h�q�fϫ��EU�֤���Z�r?Wc�\ZU\Z{R�\"ZQ�۟[�{�m~ؒ�S�|�	K5i�H)��c+|��Q�M���Ԛ�)S�N}w���Op��i���!���P5&Rq�̓�\0�O�i�sFmZ�RW�]5a��<|dlK�Y5���ɖ������c<2澃��Y�ع]�w����d�Լ�k��Ƭ�����/�8l�Z(\r\r�7fb�%��6e��3O��c#*n\Zb�[OxT�:��뵿8��1O����#�=��b%�	�+�+�G�	�V��)������R\\@��}�ߥ��&�ld3���єH�H1RO7�)�{��FS��a�%j���m�W��8�_8��lJ�\"{�.5��,3aǋ����q��V����:���sx�Hwӿ,�a\'���Cc�����7�)��{�uB�yY1�i�\rwi�q��f)\'�i�6�ʨ�f3�<�<x̼f��\ZgP�^;��\ZO}���䓌+O�Ĩ\Zg���K9��0β�nG�pa`6e�w�Z;���}Lj�X�>�2���v,cS�ɷ2K-�$)�Ƌۣ�(��(ʹ�ҒM��Չ`�S��Ys�5�μ��41K����f���<�4�SGp�l\'!Y�C�N�4���ը�bL\\8�Զ�Y9G���w����́�	#F1=+0�o�}ZI���/\Z�ߞ�\rr6-Λ��d�[��5_��GV�<)��k��e�$���֞?���$�S�ِU1�m�����,^S�ȅ3���?{������୬17��y���x��Ė4�ۡ��|l�����wv-������{SV��։��-�c�,���A[��F����\0����ٵ��D{��	\r1����-5i��j�O��{�����O�������ɗ<Ɋ�b�+�x����R��nPIn��s���݅zoPM�d��-z�Ӥ,{��}G�!�sy�H)CCP�x��ij�Qp8	��V9$�C��W��m)e�GT�Տ7?��^�9�1M]\"�ryt\"��w�H�e� ����\n�{�v����w!�G�N�\'�=�ʨB��V�<\"ƣϟ9�4B(rQy��Q;�r�!v5Ô��b�y�s��p��-��Ђ��\0\0 \0IDAT�W�@�d��-FE5>s`�&U�V����a}߀�̩�tt��\r��	xc2g�{���Ys�1���D%�+����y�y�1�i�GKJ��ry��b�]�+KR�R\0{\Z��y�Xs��\0�5�!�fe���f�>�2�hHRZu �M�Cw���c�e~����,)ԉT׌�/�w�gY��VNI�yf&|���8����現+�\"�Dz�����@9���Yؒf������x��.��Y�%�DLI���b�Tvd90�2�(� ����K�Y��9�������Y��3GV8�<:�ڤ�֊����m-��,W\'M��^��0�b�O8�k�ef�v�\Z�ןd��O��-��$�e;kg8����CUz�`s\"<w\n0ݮ~h�>��JNڈ��L��\0�?q�D��E����ٖ�?�k1�3��gb6Є���+ɭ\\��+���1����ݴ������r�f��%n_��NU��:\ro>��\n�%E�I�:+�/�F���ZC_�,�����q�}�Q4)A<�!r�6d�C��e�̕�Y��1c�~a�r-��k12k��\r�?�d�O�E��\'|\'K�]�u\n���Dh�b��gL��Ǐ�6�k=�k��O��ږc.U@��+kS2�q�b�!g�J��x&^H��������^g�}����\0\'Fcf�J�լh��\nrW����hfe�;���Nw�\"͸��\n+�1f�.�C���5m9��3Ogc2�)<emj@�!��SXiV(|\r3�;Q*�������)J�β㉕��\0�52���J����I���H�ð�))u��<~ �;6��&���S��j�ڬ?��^\Zs��O9�{)\Z����hC�	�)�_��x����9׺d�p���J��������&��c�D��Y6��EQ(o�d�LM	-v�\'�pp2AU�t�a�@�����Hje���D2�b�e��K��s�ʅ��sq}�]q��\Z�\0�\\>Ɖ��D\\Ƌ9��}X���y�=+�[�T���:\"$8z�mO��~����￾��ovˇ�C�3�,YN��PΟyf�1_���O:f��6貉�!�_9���9��ݯ,o+X���\r����,�ʔ��K5Ǟ��K��?����ʂ��q���q�\r1��+�?�fˮ�M�6M�f7�ȉ�����%ݜ����,o{f�p��#s�G�ls�iƉ����Ֆ`��$�6�[?h���=h�!�cf�t��Y)�����^~�J<�olXh2ǗBψ�7<�`��<��Ț�P�L�I��N���k8S���E�*��Go�)�\\8�4�#���F�b�}�f6U��,-�B���5Z���VF�5%�������^Ι�6�\nj	�5��&���\".7k�,ق.�9\\sW2��r�!�w��A�	������_<GͺN�\'����4��%i�$�l�l���M��ȱ�/��`�%���;��������0�,�b?\'�b�-F���/�,�H�eZ��q0��`+2ז������YZ�W[��Q����NJ/�=����\Z�L�����\n�vt4��b�!�ibY7l�2��F��Z��)L�����a�b��S��S��t��ғ�m��#Ӈ&������X�b5�Q݂\\m͍�b��0˯�3���=_��*��%S��%��|I�\n>��>(�i\'V}��L0MQѤ�LF���K��lK	��7�(�-NrZ1�]S�ӣ&����dIZ~�����88-޴��̒�M�!i8�mEޭ8\ZI\rՄ�q��R�ld�ԚM���<1YO�h(����(�s�h�93#�Yac��������	=98v]X��,;���?U�+�Bz�����ʄ��d�	3]<ObE1���\r1�w���T\0����R<�\Z#���ل%�X�Eѭ�]���e�������]�l�4L��`ey��V���^�E\0�(|��{���Q\'\Z��n�/�:�����ۍ�o[6?�=涏�m�9��5�!�;Vv�/��*,U���/�Y���D��L\n�AH������qfk�;�RZ�\Z�4�&�F�Q�)�J7��F�/����7�\0���2ln(�牴��͗�~���87;~���k�������k��)��;n{�\rk���&_(�[�!lQ��p��_)��y�����\Z%2i��݈p;�t#��l�i;���\\Y��>d����\0������]�<��\n.��C�r�̯1s*?�V<�[�\\����$}`�Rz��,8�����ۦ�ҁ�<�)(�s��tLi�`��3��׆|�����\0�d��!/�9���_d���,��-�d��rr�)s�!�6�5��GL�����5vq$1�4�@�ߓ؟whp�(��v�\'=)���b�16Y�v�c�A��b3����վ\ZHs��\rW���`dQWP͵�j�\rd�U�b+=u��y�a�\n��1��Xo;l�F��w�1 ̽��W���\r��D[|��U�+��t�������Fh���g��X�K��-��eKo�6��N�1S&��miT�QM�ǖC��/�\Z�jk�1�c.HA���y�	�d�Y�=���[�.:~�E���\0�ny�LR�@JE$�\\{�%���>\0o~������y�|�8��eRέ������z�4�_���(����emc\0�E�U�p%�}�4��n���[�Pwé��c��7�����kj�6�-g�m��>@��	j�ziT�\rZ���MHI��d�	;$�ۄ\Z�=k1��w_����z�i*/��B˺YY��+�y>X����Ͻr��x�[O�R����!�7�8Q��g_��[���__}�,���9�P+@���i��\nrr�{�uf\'-�r�V�NQƦ̲��\\و7�p�\rb\'�C)!��2���7��˞�����F��r�XR>I3�r6�c�w����^_ؽ��A2a�\nXbR���g �\'�[�!�K�\0���Ww�=����η����w7,��d����{e\'�����s�p���\n��H$�5|��s;~����o~����ɨ|�t�uB�q��7���������?}���ˣW������ߡZc��h}����Gog/�}��>��,/蝿�&[��B������?|�/<��!OK���/�\n�6#�f q���u�ZO��M+��<|�\'�������b�O�鉿�l}�	��c~ap�яԲ]�\'	���D��5ތZ?�s�C�vÙ�<_}��Ov����J�!����������s״�7\r�,�΢�Qv�sqꥷ�|o ���~l2��k�U\rʀ��L�޴��ց�\\�7��c3$�-u�{���L��>��`9R���z��U\"����w�J9�Y ܹR���&�m���U+���~������ݴ��ɞ��o��c���~�w�ܙ�K�RZY�\"R�D=H�;��ڮո��&@��6\rdĶ,Kh�\0j)E�-���\0ہ��A\n�i�:I��Nb��ŦMQk�)�\"W$��}�̽�|��s3�$w\"gt~�rgf�q�s�{�>�Yyt�`�\r�l1�ŋJ�-������Cv�0�X#��ÅH���8O�-8�s��Ya-���&�1.Ѩ�|�$\\�W[%Q��,*{n|�R+E+�<�EE�̕��+�@1C).����-ZYzWٽ��40W��v����pi�	s_�-�!���A��J�[�ΓI\0y+nwIz�3],4����}�W�l�\r��f���.�0A`.�N G��{lRN��9.��\"�f$�W�N}lI��7\0[��rjAL�g����3�����]�[���W^�Q���Mq|�	�h�m6iQ�N��n�}�\r&`�>�!�r`�\0������gnUid��,����T�*�\"�Ӥ�uH$P��f+� �o%C*@���C`K�E�=�yv�8���?H��9	�,T��#/�\0Ki�\r7^&OʻnB�P��6��3+ԇ�^ЀA�LZֈ\\��������l�Z�4`�X��p������}��}(���,��Ƀ����j�p��U�8�\Z��\\Sfe/���a��D��pv��ګ%�*ռ6\'d�\n��6���Y�f��%ʽ��R)�����n��~oS��;������NA�;X�#�}�+]\n�{�K\Z�\n�o�9�O�D��-���\0+�ޞͲ�C6ofd6C35�%[Wj��C�eB���� r�B,6rV�@�X�����ڝ+-��ƹ�W;����WG��\ZdV��fa\r�Mxd)��Ł(E� F��G��_a�}z��>����r��}���\\<؊Y�JeKҳ�\0��e����x8K0�YC�5X��#`����`)U{�]������q5��\r��f��N�i��&\Z�}j\'�tD�G�_+��Xht�,R�<m..�pf��ŖE+#dF!��\ZL�ш,K)�&���v&h��沸�e!�z���1�Þ�m;{~|�A�r�|g1z�*E���ͱ�I4ڙ�EWŤ��p��k,�-��EX�0Ƣm�u��D�Y��ЬP�)Ե���e��p�����@�`���gh}}Z�ܒ/&����V�IP\Z�\\�	b-Ғ$���R�R�R�ȋ\\1���5\r� X��Th/FT�O#>�ǃg���C�*+s����-ٟ�1�b���&�~rY1*$	�̄�fh����tI\0Z6�hv%JyӃ\"��wf�+nb)�O�J���8�\0�+�\rI� V�	f��HC�	�\r��>	�gm0E܁�\Z��ޝ_Q����Z�����(3�ԣ=aT��:!���=Y5�E�Y�*xY�\r�:��Tk�����B�ʛ������D�	L�Մ*\'<�r�\\E}\'�Z�?��g�[��}�X��$~��<�)%�-�:RLD�8ǩ�\\Ĳ�YR�TpEI./{�aFMઓUQ��9�pp�>��\Zu�YZ��=�\'[)6�F]k����	4��!��<����E��ߌ�Fꬿec6x ���X�;��D�� �:���KA��e��\Z\Z��� N\0kq���) Q�b�r�����+�N����@}��B�a�,�8t.bh��`�ҡN��Άwv�H�(J�F��k��)	9�th�C!H^&H*�y�P��L@�ׅa_\"!�;j��0#�p*�]Q�k�Z�ޫ��x��k�\Z\r�0b@�`�_Bw2��Ku(tjJIi�]:��Ѳ����;�w�T�:\"�t��&��zn˲����\"Xk]���0�!J��z��\'[+I��\'\n�����u��YG9Y�Y��)f)9:d�����QFE�Rc�?��(*D4���N��1��$��J5Ȫ�����\'�kX4S�ff��X�!�٩�\"��X����8�e)ۺg֟�2�\'4P.g��	̄,�p2�&(��ۡ:��6\"�B_}	KK�\'\\\04��&��0�t�c���X4���+!bp˲�&���Y}ǎ���@��F�F<\n��SKў�\")�c��-ˈaY��A�x:�\"X��iL���PS\n��Y��\\$�v��Yv9.��ѐf<^E���B�m��^�A��e�c��L3O�R�1���r����7\"b2(���#bPW���t�s�4�D[ą���?�w0�2L�#��דxC%re�$���BVܖ�UF�E�r,�e89K\ZزR�1��8�Pwf&T�oE+T��BU��8�/Y����|�p2,˲��?N�����r�p��$�����4���ل����ʠ���Y�b�s[�r�]��Y��rܸ�����v\0۾��x<E`D�V�l��:g��ċ���v�;owޏd9vWA)����� \\K�J/Ȗǡ9	؈w�e��c�Ն3��̒X�8�j�ʊN�����k҄�������,����y<��\"\"�q�ȘA�� �L交����#\"F�hY��e��O-Z�Ѳ�8y�Q��?}K< �\"ˢխ��#�cD����5�z`�]Y�r{ж�|�S���^~��7?W���\\3�,.1fd����b�`� �R�6�Q?����*�NB�[E�_��5\r�}E�uP���\n�C�@�$����eIAU���-��r����	���K�\\D�s��<�AF�[ӆX�,�� ��d@�خz�@�B��\0��!d���6G�!YB�����/�fƇ,�MĤ\0fhX����-���O�$��D��|�����kH���?d<������Y���^n�@l���S$������`�[�D�[.]����ՇD\n��B*��܎�_���׻&\\&X�k��}��?p��\"\0i�.�弦�Wݷ��C��Z��W)D �<�P�����>r��Xω2���E��uf�Rd`D���8�yL,��;�L�[\"�0�4�}�6�U���d���1���d�֊��K0���O�Ê<�B����� �Ea��\0%~�V�k���T��ba�=\\�����\0k�����d�PK&yc5bLίr��[˸t]\rE0p�6y�\0��9~��:&���Ԋ�b���u�Uc4���������4��]G��,֟��E<٨�WN#?*Z���\0`�pa%^���A�>�X9��uN\"��?��Xw�u}	��\0HH�p����ݎ��X���n�ŉ�&.]7M���1�2�����{��t�X.��#t��XjȆ�%�/�@�M�K>�z�;Fi߼`q�\':�e���#��Z)�K-HT��!��V�_�?D�k.�q��\n_���(0��ũ��[Ĺ�H���՗��x2���O��\n��j�߃�+�K*�d\"�m�ު�sì�1�����l�$���J��sʏ\'��#�m�=(BQ�Y���} +\Z�3!�?�:C)�br�;��m��\r�b�Ac�e0�\r�Ձl��`E�����z�?���\\��@u�*��a�t%��c�z�����D�Yv<���X�0Ϻ�\rQ�Jh�kЭxÚ:B\n�m�L��.DQ)1\"\"b2]n�=�r�V�w��!CC��^C��+�L3,��i$J���@�����][�@t9n��\"�M4��Z�`m]�e2d ,g�\Z�K�8��j�ہ@�Y�\\\"�\0Դ�[$L���u��T\n1�a��p�e`Y��v9n�W����(FC+h�`!7JD,�ȵ;j����{�������䂹���$����!����kؠj�\Z\nlQ[�,K��\"#��\nMp�x��ED��b��s��.7r���&F�244Ci��k��*�[�X�z+�9�ϓP|�2\"b@���G�\r�܇����r�2aB�u�\Z��W�\"q�E��k�@����K�\'��ч�#g�T��q �($N�,����������Ra,u��H���h�Ю�V`�ͻv\\��w�ck��Ê`��Sx�����%���b�\"ܺ1�{�n��7^��\r��k>��}��sM\0���i|�ю�XXN����qj9�}�*�_<�_;�ck��o� ۱�	]9m#�D���ۄBG�@8���E/fr���5�D3�\ZH�[)@l�H�+c��p\'�k����+��<�Xl�x�[��K����6�M���-|��lŎ�����ˌ��� �w\'��ћ7^����vя�a�����$N}�|�i�A+�)6H�3\0�10�I�o�\\Ϡ����p�RcaH�Ĩ3A�j��<�0V��O_�&������k8:���oc;��W{�q�^،� ���\"L*���\"b|19c}M�h\r/9��~�@L�J��Ĕ��2�0�D	t�1&X�!�������_/pF>�ѫ�c�&�R���u|n�ɜ0���7�_���{�R�o?�&���	��lq����k�\n�;����O��3�����ml\Z�l��k���nۀ��5����~<������n�I|n�3xp�:����wmG�m��������㒄��7n�/�~\ZI�����\'�����K8�2ع����^����oZ�?����Oi�G4;��3�p�����EB�F�P\'��bE���dD���^��\\���r3E*\n	,\Z5���Q��\'O�?Q�����m�n\0�4�7>�\r�N���lHpӕk�ef]��9�	��7g��/��~�4��	v��$���,���_�=]U�[2س�����E|�������+{ܶ���\'/�w-z�4x��¯���Gi;�r�aE���;������Dr�8\Z��W>��C �\0\0\r=IDATw^�y�u�<�^�Uh���Zk7�H�D���.�VԍSI:��B����,��m��U��c&|���CU�{�j����w�-Ԧ�%���S)^9|\Z7]������\"�N|���[Ė�׭z)��������5{?�e\0�\'��ue�:���� �x��5�f�Ӛ�8{<�F@�B���bmB�3�	~�] T���&��h7�����>���-��Z\r	�k��_t�L&ک��Y��]�����}�CWb�oÿ����GO6�������_�i�؉������*�9��#����s��f��y#f�cE��߿{{���ޭ�ǟ��m��?�����	�[��{?}���+����g/����i��G��h�T�Qg����N�ًO�L9y���N3j`f�m$`dV�$\'~�IO+�_���4��k7{�*H9+��~�7v�[;ÑM�y��t���{���W�G�IMa�5Ӹo����-\0��s.6;7����H�߼e3���Y��u9޻g?Xp���������ǈ�p&�Cp֤S��s��S.�z�`��)����i���?H��\"&�flO��̖�6�I*����\0�v�̬�os�\Z�\'e����r&��6x��s���y��\\s���=a�k�0�+�%�\'˷�~.��a����ł�mC���K�PNl�#Ϥ�S�lb��?*�6W��A�-D`X���L�\Z��%\\&r��?�����;pd��[n�ޏ籯e�g��#���_��N?�@�Ͻ>���������޿��_��2\\3��	���\n�y��4۶h�&\'��N��ݼޅ\ZIu2��3��^>��z�`V����\"��3�0_[)2z9I^H�A����e#R�;)#QN,>t�t��x�M�?t����B����:��x�Uk���|q��RN�\0��/�v�`�:�ߋ�V|��0ez���X,,�=��gϿ�vj����������]f6N��zA�_~�8]@�Y<��(�^,��n]��vty�Cw�IhSp�ߎ�M�.oD�����Ժ�Er-��۞L�ܺ	�����?q��M�����|�4����m���ݣ{���=������J��o,᫏=��޼�H514����9�s]���׹�#��������\0�oY���l���𮙾���Y�z�÷0	��,5M�Z@27{�5��E�6`(?�9~ɓ�?�7��k֟�yW*��^�����5��_>��o�s�4>����o��BD�_�����[��>~�%���}y��y�\0����o�\\�us�	_��-��8��vt�Б(Gc]v\r��ey�Z)�4�HmF姨���IE#��G��<��2��,��L�͗$�{�z���˺�4Vń~�uص�0�x�^]���������7\\\n|� ��\'c���Ӹ��~&���}�o���7�7���2ݽ=Z���p��o��4��	�n��=�]Q!,f�~�\Z�q�%��}\'���Em[��P���Ǉw�T�r���yRG��z���/��`AXL�`��b�\\7��\"�X�4C�N�N�H�-4��p��Fܶ�j�ւإ���v>�\\�}g��:Q�u�k���*��g1E���8�2~֥�G0n���q����\\y&����v|��H��f�H��s����&�j\nA�7����B��!I@�������N�#b��*�\nmnMR�,{DDD�;\\����O1W����x��Q��\'��8�)\"��X���e������U~��l|>��JǠtS�\r�k?|�a;q�,V��MA9H��i�J2<Ϙ)�ݨZ����{�֥4���X1T謟�������hYX`O0舸��3\"Kg�,�!!����ם�M����:e@W<}>�(Z�C9�^ \\VoS����(w;{2LwED��/Q��V΄3+>0Y��@ATՖ�#��\'�\0c����O�Њ�,�v	��������:���*�0�{q�U�WT\"L/5R���Q�+�����7�r�k$94�$*�@D؎,z�s�4K!a>����Q�I$H��f��\'�z�I��0.�󈈁A�!0K��nnYH\\�\"X��+%s���ľ�ZF��,]e& \0Cr�y���sR8�j!3�d�r3��{P�\r���K�B+��\0�ל��Q/\'/F`�ƕ1 �d�S��x�nx�\Z5j=�O\'ܛ�@�g\"�iv�����Q4��\"���n}z��FV���a~i�.�n�S1,�=���0?�\Z	#�	�J��kH�^Տ{�FC�0�h�1\Z5�f�����U�n�\Z֪6j��:��P�HF��r��#�bf�!d�!������Ʋ�q�-l�Y\Z��S���lX+:P[�ö�~>�̈���;HmTx�[>��4)�fe�/Y�a!�`��9W�8:���ͬP�Y��{�@�]�(��4��Nc����`�p!��?s[\\�\0�هo����Z(��#$,�)T�0!(��/:7!l!��қ��&+��Ō��#f�<޺d�x顛��O��N\\*�`�|d��@�@�By�0�8��yK������p�p\nr�c�\0��+�e0+0@)���[�rz\Z�$~\0:C��B*�MZ�}�v��&v~�Ÿr\"\"�!���.$Jc�X�T�Cua������3�4���1�7����)<\r�,C��\rV�WY\'f3+���Ɣ,���������E땤Y���Mm�\Z�����\0X�\"���b4\"b0��v�Y8�#��e6Cj��B@�@|��Rs��&�Qχ��3Z�rX<!ViA`O���T\n,%k,l-CM4�8�g_9Dw^w��bSga��3h�6�}wބ#h-R\0��<\"bpd\"P�!�Y���I�`�W+�b����j���3wI���tq��pk-x��.C�,Ck�\'H�<;��\034+X�]q�j�|�8Y��m[E����\\e&���Y��/$t�R�)\"\"b0(`�[u����\\�@|ͥ�����q�&����W��ߕ�����{��>*�ߡ�e��<��D�հb�b�����7��l��k�~ez��m�Z�3]8 �+e�2NRh�D�2\"bhg��U����k$I��}�{��F}tq�C�N�Q�I��	>�C��Ff���b\'�n�ː�!b�r-�*���y\"!SM��;{��+.Ƕ�iY;��k|�@<9���Mˈ�aH��,K�_R���8�n��R?=�@�KKH�S�i\rE����s͈��G<�ch�eP!��\r�$g�+��YP�e(��2m�p�0^;�]1�WL���\r륮����0�2\"\"����N-/8:�ړKˀҘ�OA���K\Z�*x��*��8G��|��m\0\0\0\0IEND�B`�','png',3,1,2);
/*!40000 ALTER TABLE `auth_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_session`
--

DROP TABLE IF EXISTS `auth_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(40) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_session`
--

LOCK TABLES `auth_user_session` WRITE;
/*!40000 ALTER TABLE `auth_user_session` DISABLE KEYS */;
INSERT INTO `auth_user_session` VALUES (2,'09k55qbgixgna4igs1rtbc2rty63mb1d',1);
/*!40000 ALTER TABLE `auth_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`) USING BTREE,
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1123 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (749,1,1),(750,1,2),(751,1,3),(752,1,4),(753,1,5),(754,1,6),(755,1,7),(756,1,8),(757,1,9),(758,1,10),(759,1,11),(760,1,12),(761,1,13),(762,1,14),(763,1,15),(764,1,16),(765,1,17),(766,1,18),(767,1,19),(768,1,20),(769,1,21),(770,1,22),(771,1,23),(772,1,24),(773,1,25),(774,1,26),(775,1,27),(776,1,28),(777,1,29),(778,1,30),(779,1,31),(780,1,32),(781,1,33),(782,1,34),(783,1,35),(784,1,36),(785,1,37),(786,1,38),(787,1,39),(788,1,40),(789,1,41),(790,1,42),(791,1,43),(792,1,44),(793,1,45),(794,1,46),(795,1,47),(796,1,48),(797,1,49),(798,1,50),(799,1,51),(800,1,52),(801,1,53),(802,1,54),(803,1,55),(804,1,56),(805,1,57),(806,1,58),(807,1,59),(808,1,60),(809,1,61),(810,1,62),(811,1,63),(812,1,64),(813,1,65),(814,1,66),(815,1,67),(816,1,68),(817,1,69),(818,1,70),(819,1,71),(820,1,72),(821,1,73),(822,1,74),(823,1,75),(824,1,76),(825,1,77),(826,1,78),(827,1,79),(828,1,80),(829,1,81),(830,1,82),(831,1,83),(832,1,84),(833,1,85),(834,1,86),(835,1,87),(836,1,88),(837,1,89),(838,1,90),(839,1,91),(840,1,92),(841,1,93),(842,1,94),(843,1,95),(844,1,96),(845,1,97),(846,1,98),(847,1,99),(848,1,100),(849,1,101),(850,1,102),(851,1,103),(852,1,104),(853,1,105),(854,1,106),(855,1,107),(856,1,108),(857,1,109),(858,1,110),(859,1,111),(860,1,112),(861,1,113),(862,1,114),(863,1,115),(864,1,116),(865,1,117),(866,1,118),(867,1,119),(868,1,120),(869,1,121),(870,1,122),(871,1,123),(872,1,124),(873,1,125),(874,1,126),(875,1,127),(876,1,128),(877,1,129),(878,1,130),(879,1,131),(880,1,132),(881,1,133),(882,1,134),(883,1,135),(884,1,136),(885,1,137),(886,1,138),(887,1,139),(888,1,140),(889,1,141),(890,1,142),(891,1,143),(892,1,144),(893,1,145),(894,1,146),(895,1,147),(896,1,148),(897,1,149),(898,1,150),(899,1,151),(900,1,152),(901,1,153),(902,1,154),(903,1,155),(904,1,156),(905,1,157),(906,1,158),(907,1,159),(908,1,160),(909,1,161),(910,1,162),(911,1,163),(912,1,164),(913,1,165),(914,1,166),(915,1,167),(916,1,168),(917,1,169),(918,1,170),(919,1,171),(920,1,172),(921,1,173),(922,1,174),(923,1,175),(924,1,176),(925,1,177),(926,1,178),(927,1,179),(928,1,180),(929,1,181),(930,1,182),(931,1,183),(932,1,184),(933,1,185),(934,1,186),(935,1,187);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authkey`
--

DROP TABLE IF EXISTS `authkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public_key` varchar(255) COLLATE utf8_bin NOT NULL,
  `header_key` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` longtext COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `authkey_company_id_c468be94_fk_company_profile_id` (`company_id`) USING BTREE,
  CONSTRAINT `authkey_company_id_c468be94_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authkey`
--

LOCK TABLES `authkey` WRITE;
/*!40000 ALTER TABLE `authkey` DISABLE KEYS */;
INSERT INTO `authkey` VALUES (1,'72ded067-07dd-4cc5-82cd-bcb21e8c10b9','72ded067-07dd-4cc5-82cd-bcb21e8c10b9','72ded067-07dd-4cc5-82cd-bcb21e8c10b9','2019-01-29 15:51:15.238135',1,1);
/*!40000 ALTER TABLE `authkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_branch`
--

DROP TABLE IF EXISTS `company_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_company_id_5ee217db_fk_company_profile_id` (`company_id`),
  CONSTRAINT `branch_company_id_5ee217db_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_branch`
--

LOCK TABLES `company_branch` WRITE;
/*!40000 ALTER TABLE `company_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_branch_authkey`
--

DROP TABLE IF EXISTS `company_branch_authkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_branch_authkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `authkey_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branch_authkey_branch_id_authkey_id_c671ab9e_uniq` (`branch_id`,`authkey_id`),
  KEY `branch_authkey_authkey_id_74af0269_fk_authkey_id` (`authkey_id`),
  CONSTRAINT `branch_authkey_authkey_id_74af0269_fk_authkey_id` FOREIGN KEY (`authkey_id`) REFERENCES `authkey` (`id`),
  CONSTRAINT `branch_authkey_branch_id_0dce09bd_fk_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `company_branch` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_branch_authkey`
--

LOCK TABLES `company_branch_authkey` WRITE;
/*!40000 ALTER TABLE `company_branch_authkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_branch_authkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_branch_logcollector`
--

DROP TABLE IF EXISTS `company_branch_logcollector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_branch_logcollector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `logcollector_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branch_logcollector_branch_id_logcollector_id_9a70fc2c_uniq` (`branch_id`,`logcollector_id`),
  KEY `branch_logcollector_logcollector_id_b17e9fcf_fk_logcollector_id` (`logcollector_id`),
  CONSTRAINT `branch_logcollector_branch_id_929ca649_fk_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `company_branch` (`id`),
  CONSTRAINT `branch_logcollector_logcollector_id_b17e9fcf_fk_logcollector_id` FOREIGN KEY (`logcollector_id`) REFERENCES `logcollector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_branch_logcollector`
--

LOCK TABLES `company_branch_logcollector` WRITE;
/*!40000 ALTER TABLE `company_branch_logcollector` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_branch_logcollector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_branch_source`
--

DROP TABLE IF EXISTS `company_branch_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_branch_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branch_source_branch_id_source_id_84b7dd69_uniq` (`branch_id`,`source_id`),
  KEY `branch_source_source_id_ee386889_fk_source_id` (`source_id`),
  CONSTRAINT `branch_source_branch_id_62a04e6f_fk_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `company_branch` (`id`),
  CONSTRAINT `branch_source_source_id_ee386889_fk_source_id` FOREIGN KEY (`source_id`) REFERENCES `source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_branch_source`
--

LOCK TABLES `company_branch_source` WRITE;
/*!40000 ALTER TABLE `company_branch_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_branch_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_event_log`
--

DROP TABLE IF EXISTS `company_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_event_log_company_id_c6c8d9a9_fk_company_profile_id` (`company_id`),
  CONSTRAINT `company_event_log_company_id_c6c8d9a9_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_event_log`
--

LOCK TABLES `company_event_log` WRITE;
/*!40000 ALTER TABLE `company_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_log_licence`
--

DROP TABLE IF EXISTS `company_log_licence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_log_licence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uuid` longtext COLLATE utf8_bin DEFAULT NULL,
  `key` longtext COLLATE utf8_bin DEFAULT NULL,
  `licence` longtext COLLATE utf8_bin DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `expire_date` datetime(6) DEFAULT NULL,
  `max_collector` int(11) DEFAULT NULL,
  `max_source` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_log_licence_company_id_46ca7b2e_fk_company_profile_id` (`company_id`),
  CONSTRAINT `company_log_licence_company_id_46ca7b2e_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_log_licence`
--

LOCK TABLES `company_log_licence` WRITE;
/*!40000 ALTER TABLE `company_log_licence` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_log_licence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_log_package`
--

DROP TABLE IF EXISTS `company_log_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_log_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `limit_size` double DEFAULT NULL,
  `start_date` datetime(6) NOT NULL,
  `stop_date` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `licence` longtext COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `company_log_package_company_id_f99af01d_fk_company_profile_id` (`company_id`) USING BTREE,
  CONSTRAINT `company_log_package_company_id_f99af01d_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_log_package`
--

LOCK TABLES `company_log_package` WRITE;
/*!40000 ALTER TABLE `company_log_package` DISABLE KEYS */;
INSERT INTO `company_log_package` VALUES (1,'poc',8589934592,'2019-04-26 09:20:48.389427','2019-04-26 09:20:45.000000','2019-04-26 09:20:48.389481',1,NULL);
/*!40000 ALTER TABLE `company_log_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_message`
--

DROP TABLE IF EXISTS `company_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_message_company_id_d1c17237_fk_company_profile_id` (`company_id`),
  CONSTRAINT `company_message_company_id_d1c17237_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_message`
--

LOCK TABLES `company_message` WRITE;
/*!40000 ALTER TABLE `company_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_private_key_ssh`
--

DROP TABLE IF EXISTS `company_private_key_ssh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_private_key_ssh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `private_key` longtext COLLATE utf8_bin DEFAULT NULL,
  `description` longtext COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `server` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_port` int(11) DEFAULT NULL,
  `default_path` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `company_private_key__company_id_13db2c9f_fk_company_p` (`company_id`) USING BTREE,
  CONSTRAINT `company_private_key__company_id_13db2c9f_fk_company_p` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_private_key_ssh`
--

LOCK TABLES `company_private_key_ssh` WRITE;
/*!40000 ALTER TABLE `company_private_key_ssh` DISABLE KEYS */;
INSERT INTO `company_private_key_ssh` VALUES (1,'localhost','logyou','-----BEGIN RSA PRIVATE KEY-----\r\nMIIJKQIBAAKCAgEA2H5k+nLkiOLiXVXML9ROQNVFAdVjIjNiWmXl6st7jt3Wm0qz\r\n/j0qM+KzhHZVw8VCGmtXrzscAgTNWOu3XpuwWdysDsDWnTgXnA27WW2sVkdUgz4q\r\nNxndKzC1BC0tkTk1bh75itNC9NGFjGiS+0PmHM8NDIAKwu+6JcODMLJNY1rMRdi0\r\ncGqdUradp2sgXwEKG7VCtLCcegAroAEwlT1LUAmKaqVUYu1qQeBchhmMj4Klf1O5\r\nV5Tn8Q4mGnbEYTeQ1XHnbxOdoMtm21hxptGeL2G946UwwLGXNkh+JnmzCHiLzFI+\r\nv/iQvzVXOcLzI+qh5FqwxMjOZrB6qzH6nGOlCgasspVrINi3Zex5t6eAgXeVv9A3\r\nLLHukRoF+0BsvWXiKjT5QQMQwuZrirk9hesgM+4PohvVTop75yEW/Dj7wVmsAoLj\r\nKo719su4sBUpPQVp3bWtMV7StxuGrY5KNpOdswj9WQ1AgeaMWmVxQO/S+au65yOK\r\n1lZNlnZMh/kP3czfcFlXINmuBVVEOYKqp7524uwtr1meFDIECwf+G3UZJ7GR6xrg\r\n0iMu3qeoUdN/jVYb4vpkcbxkTT8Xyzor6yV6TFRncfSRcJVQv8AfVh0+sOTUffxq\r\nQ0+NEqig104XOT4Ew/lCNWnj2Pg3MMV6XWerEeacZbuhFy48bk8YIZBDgSkCAwEA\r\nAQKCAgEAm2kwh/FOSU3F/gaHS5Z2jmgK36QVRAnrAsW/ZOupyQdK9bOMvmeeEh0d\r\njWt9acoDCAAis/IUywYzey/LNKlC0V9uTDD2X2pS2H2rDimC23TdIFHR8Dgq4sRW\r\nTac43NVam7C0pom9uQ1nd0HisWkumWOxFFYeY42/7TgKxzxX/YjCtyk3brO6OBRL\r\n3FE0rb6LSRS3zAo0aggRSQ1RmPClTdFrgd8pUtLnwl6TTNiuZJ7+uwaZOFv2nL7x\r\nb3Huy3MeD3tzDfPg5frd3XwCKiS0D4N00yRUeR+DUz57AJfAg8Y1ZPltflWrYveh\r\npB9kd1YJ3WmVF86nDGSHyrlYFEgbwmK6S+Lnp0ZUAuuNTcs8T0Fd0hmv92IAEZu8\r\ng/NyUNTmAGl+ZA/IPYqVvHsatuCMwEUJK4ee0psLkfs/EVFekKpgFjJDT9pFY5y3\r\nxV/g2BBtYXcsxjCE0fm0j3p1/aGd90WzcN8fYeGYy3GUS/s54gm8/c99V+MxmNDj\r\ntJl/jYjZ7CPMFlBGh3T8tiasR7n8/Gl08JeXuJLsJYNNSdQYMovR4aUm5UP64s8L\r\nk4YKo6pTzYR1Mp/3vyjPQqoNdKl/DIgxXlZ8GyfJCy54B5klX3vjwDYF0EKJcYhY\r\n3i/dkGItbW7UVoJSt1mUEzGB+nZAzxSaTipVm1MZLAn96nvnTPkCggEBAO8PatWy\r\n5WtW6UMezdvTJI7JRIbFsKrGTpXRIKKXb9489PSQcHTGHIsdN28lygJl6QNdAk/o\r\nbMqmTtFgyOBht+Re1cKgr9XivVZ9tZgibLi8+hq/b94WZR4H9gK76mJTs/ZAmex+\r\ndstFyG3eb5Qp7FPrLaqGmrh7kfJV9IZp92Cni8cKuipY7q3Djf/C8l8t1qaBBtXw\r\nzhCdzYyYH0vpSKHl2nAbWeRkY4hplitWLdIe2FZJEhh1lyA6uIU/DLUCKjrJqkFO\r\niXIqwSBPF+peIghOM7//mFHRYEKEq0C5caypKjYzUTcv6002KRrREvvJgOdo+4al\r\nSMtS/+nc1imYWr8CggEBAOfVnjfp49+3m/PTd6m7kAG0OfK/zalIplB1EK7tzIQ+\r\nzZVNloFRRTX4bmIoyaiFLedqBVdbIALy2opoonVz/WqhzvtCSGnL/DVAtpoz4V4z\r\nL3prhdtwjOWX1BMgujixEGlcoAhCUMCP/eyPtSmyiQIaO1Ndt0xoYGti+RwmP4e+\r\nitqU9Q3KvBxUkOUcU1Cyw0yqMs0imi/eqy9xGesT6NWC4EEHj0edv2bzaK/uYM4u\r\nNi6vzOu26IcFq12ndBX31XHP+vW11v+ag2YrsTFQzTEyvaw/+Pc3Rcbxyni3nfl5\r\n5qNH+eUk5/8RMqVPtpM3U+n7fneyiz7al3CM1oelJhcCggEAcX+lXl44NBUoXDik\r\nzghZ4/zEryPus7XBG7oVP3ycnSvdtLta2OYyKQ4vAnMzjJ3r2i/vaBbWiAQbiabk\r\n2Dssvp0T6fq2YNrsv8KhU+CMM81tBQP8zbleOrrW3wduyU4qM/EJ41FLf0jbVuZz\r\nnSmmTVVr8flEPfBVI3QRyztGOrpxT4fVSUO91fvxUAuzXOL7dUPvBeX1P8hcDbMv\r\nsK/KTys84Vrq+9d5tgtDQ8H/sTH5zkWU9M3neWLHtmNv2gR0HkMetTDfarfHx1ol\r\n5ZzZlY3jXfWw0K+SfyJT2D/zK2GJbABDP+tdUOQ08clvtOE/dR7PxGZ2wCng3Jx/\r\nhXITKwKCAQAkaiNd+Pj4DOkMFW04VeO6wMpRXNs6+dRV0u157JQxOYQlLXi0e0V5\r\nwrnj5TA3riOVs8t++ys+C1NUZjcOZ9eoRh4yzSh+pbHJ045bDkcZ+sQ8YGM4Iqee\r\n8Ig5MOzPNtCzG/9vDKuOc4+Y9sGn+QkYMXKcF55Q/BwZAgTK7R8RfVZmGvua3PtL\r\nH+Vad2aGyG1wv1MXcZXyavFMlGFT0V7DGrmKvVs+DoMf8p/A8pp2CEAueSKg66v+\r\neV9/aGwNf04hgF+U9Kj+oRB+neJJMr3oOmYchjfe7Omi5Bu/dmfz5bfacdXIrlFa\r\neSMRYEH3QbuGhyBIQN0qVD9xSE3yJHilAoIBAQC89rBKT15xMt/QIN5O5VDxkFN6\r\nxUumzZNH6tqukWX2KZszb4jWKEHBAnl987LcicZDUue8WYu/g11B3c/nmGaYYEOX\r\nrCp9e7h0IOMRGUIvuMtEk78hCO4v0TApaj9uKGvMEpMf676iOCl2wh8d9PMbkDzN\r\nhRle6sMuLiDIyjJ9Yew3HoaGpdVbwMfIBsqERn3EmQDf3szMnJGUZyq4ZZv7/5rx\r\nLxjorCnfy4K2F7d1yXEQVI03pXLErFj975rZPHwmLNNid7lSt51H/bQhifFZZX21\r\nVvpvEE5GErzSQDDciyZCO1hZ5Sjh/BgcIYtkgJXHcrJRXzZ8R5DqM2ap4FVR\r\n-----END RSA PRIVATE KEY-----','localhost all in one','2019-01-29 16:28:43.656502',1,1,'localhost',22,'/home/logyou');
/*!40000 ALTER TABLE `company_private_key_ssh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_profile`
--

DROP TABLE IF EXISTS `company_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `logo` longblob DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `address` longtext COLLATE utf8_bin DEFAULT NULL,
  `alert_mail` longtext COLLATE utf8_bin DEFAULT NULL,
  `description` longtext COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `contact_mail` longtext COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `logo_image_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email_config_id` int(11) DEFAULT NULL,
  `is_alert_line` tinyint(1) NOT NULL,
  `is_alert_mail` tinyint(1) NOT NULL,
  `expire_password` int(11) DEFAULT NULL,
  `contact_name` longtext COLLATE utf8_bin DEFAULT NULL,
  `expire_check` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `company_profile_email_config_id_e7020057_fk_email_config_id` (`email_config_id`),
  CONSTRAINT `company_profile_email_config_id_e7020057_fk_email_config_id` FOREIGN KEY (`email_config_id`) REFERENCES `email_config` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_profile`
--

LOCK TABLES `company_profile` WRITE;
/*!40000 ALTER TABLE `company_profile` DISABLE KEYS */;
INSERT INTO `company_profile` VALUES (1,'UIH','����\0JFIF\0\0\0\0\0\0��\0�Photoshop 3.0\08BIM\0\0\0\0\0�g\0RviimiC2aJL5QnBJonGm(\0bFBMD01000a9c0d0000971e00002b2800004d2c00002f300000f839000000440000c84e0000da510000c05400002a640000���ICC_PROFILE\0\0\0�\0\0\0\0\0\0\0mntrRGB XYZ �\0\0\0\0$\0acsp\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�-\0\0\0\0)�=ޯ�U�xB��ʃ9\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0D\0\0\0ybXYZ\0\0�\0\0\0bTRC\0\0�\0\0dmdd\0\0	�\0\0\0�gXYZ\0\0\nh\0\0\0gTRC\0\0�\0\0lumi\0\0\n|\0\0\0meas\0\0\n�\0\0\0$bkpt\0\0\n�\0\0\0rXYZ\0\0\n�\0\0\0rTRC\0\0�\0\0tech\0\0\n�\0\0\0vued\0\0\n�\0\0\0�wtpt\0\0p\0\0\0cprt\0\0�\0\0\07chad\0\0�\0\0\0,desc\0\0\0\0\0\0\0sRGB IEC61966-2-1 black scaled\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0$�\0\0�\0\0��curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\r%+28>ELRY`gnu|����������������&/8AKT]gqz������������\0!-8COZfr~���������� -;HUcq~���������\r+:IXgw��������\'7HYj{�������+=Oat�������2FZn�������		%	:	O	d	y	�	�	�	�	�	�\n\n\'\n=\nT\nj\n�\n�\n�\n�\n�\n�\"9Qi������*C\\u�����\r\r\r&\r@\rZ\rt\r�\r�\r�\r�\r�.Id����	%A^z����	&Ca~����1Om����&Ed����#Cc����\'Ij����4Vx���&Il����Ae����@e���� Ek���\Z\Z*\ZQ\Zw\Z�\Z�\Z�;c���*R{���Gp���@j���>i���  A l � � �!!H!u!�!�!�\"\'\"U\"�\"�\"�#\n#8#f#�#�#�$$M$|$�$�%	%8%h%�%�%�&\'&W&�&�&�\'\'I\'z\'�\'�(\r(?(q(�(�))8)k)�)�**5*h*�*�++6+i+�+�,,9,n,�,�--A-v-�-�..L.�.�.�/$/Z/�/�/�050l0�0�11J1�1�1�2*2c2�2�3\r3F33�3�4+4e4�4�55M5�5�5�676r6�6�7$7`7�7�88P8�8�99B99�9�:6:t:�:�;-;k;�;�<\'<e<�<�=\"=a=�=�> >`>�>�?!?a?�?�@#@d@�@�A)AjA�A�B0BrB�B�C:C}C�DDGD�D�EEUE�E�F\"FgF�F�G5G{G�HHKH�H�IIcI�I�J7J}J�KKSK�K�L*LrL�MMJM�M�N%NnN�O\0OIO�O�P\'PqP�QQPQ�Q�R1R|R�SS_S�S�TBT�T�U(UuU�VV\\V�V�WDW�W�X/X}X�Y\ZYiY�ZZVZ�Z�[E[�[�\\5\\�\\�]\']x]�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c�d@d�d�e=e�e�f=f�f�g=g�g�h?h�h�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn�ooxo�p+p�p�q:q�q�rKr�ss]s�ttpt�u(u�u�v>v�v�wVw�xxnx�y*y�y�zFz�{{c{�|!|�|�}A}�~~b~�#��G���\n�k�͂0����W�������G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z��M��� �����_�ɖ4���\n�u���L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v��V�ǥ8���\Z�����n��R�ĩ7�������u��\\�ЭD���-������\0�u��`�ֲK�³8���%�������y��h��Y�ѹJ�º;���.���!������\n�����z���p���g���_���X���Q���K���F���Aǿ�=ȼ�:ɹ�8ʷ�6˶�5̵�5͵�6ζ�7ϸ�9к�<Ѿ�?���D���I���N���U���\\���d���l���v��ۀ�܊�ݖ�ޢ�)߯�6��D���S���c���s����\r����2��F���[���p������(��@���X���r������4���P���m��������8���W���w����)���K���m��desc\0\0\0\0\0\0\0.IEC 61966-2-1 Default RGB Colour Space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0b�\0\0��\0\0�XYZ \0\0\0\0\0\0\0\0\0P\0\0\0\0\0\0meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0\0\03\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�sig \0\0\0\0CRT desc\0\0\0\0\0\0\0-Reference Viewing Condition in IEC 61966-2-1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0��\0\0\0\0\0�-text\0\0\0\0Copyright International Color Consortium, 2009\0\0sf32\0\0\0\0\0D\0\0����&\0\0�\0\0����������\0\0�\0\0�u��\0C\0		\n\n	\r\r\"##!  %*5-%\'2(  .?/279<<<$-BFA:F5;<9��\0C\n\n\n9& &99999999999999999999999999999999999999999999999999��\0��\0\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�\Z��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0~��ヸ�;�\0\0���q��p�\0]���:@���p\0������s�\0\0��ts��7O��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�t����@���T�e��߄�w~2�\0#KyG��D�G��g�S\0�lq�ק��i3zxgЊ\Z@9u����8\0\0�a�U�N>|��@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�?�{���������q�Li<��e�\0N��G,$�\r6�;������c�N/g\0��4�ϡ4�y�~p5q�\0���jp�|)���52\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0z~�镰�������q�Li<��e�\0N��G,$�\r.�9������c�N/g\0��4�ϡ4�y�~p5q�\0���jp�|)���52\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�G��+d\01�6�:YA�0\0I�\'�ߌ��\0���Q�儑������a�1�|�����\Z|ƞ�\"��=����8\0\0�awU�N6|��@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>�~�цV�\0cjm�t���`\0�\ZO;�{\0������	\"I��is��)�c���Ӌ��4��<3�E\r z?=��2�?�_��_��_��w��JN�]�\Z�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����E{\0������q�Li<��e�\0N��G,$�\r�5������c�N/g\0�e�Ϡ4�\0\0\0\0\0\0B��p�S \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\09��D{\0������q�Li<��e�\0N��G,$�\r�3������c�N/g\0�e�Ϡ4�\0\0\0\0\0\0B��p�S \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0yu�C{\0������q�Li<��e�\0N��G,$�\r�1������c�N/g\0�e�Ϡ4�\0���ʔ�Ҕ])EҖÞ�>�B��p�S \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���D{\0������~\0&4�w~2�\0\'GyG��D�Q��g�S���1�ק��j2��g�4�q����=��\\p\0Aڑ���]�\Z�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�+,��Þ���פ���$Xf�a�����s��\0���Q�儑��e�9�A�1�|�����\Z�����\r {qs��|�W\0\0_�_�6�g逅6|��@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0u���qN��Z�\0\0\0\0\0\0:;�=�� /�9]V~�E8~�=zq{8�-��{�CH�\\���=��\0\0��M��`!M��8A��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0$G;���ގ���J�A�\0\0\0\0\'GyG��D��+�������^�^���ja��P�Ƿ?<��uq�\0��SjF~�Saw�jd\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�eT��E�2�&��q�fF��\Zfdi���fF������n3�hY�Zxhix=x~\0X�9�32�]324��]��\0	Q\\G.��\Z(���$�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0j�IK[��\0u��g����4\0\0\0\0\0үK��rcIw�\0\0\0\0\0\0\0\0\0\0\0\0�|k�f͉�\0\0\0\0\0\0\0\0\0>�>�Un�������Y[?t=�|O�Od�&N)QlV�����>nL�oPR�W�]�q�t9==��M<��ȏb�KZ�T3�jq��g�����y>R�٫�oW��|ܙ6�$���w�8~�x��s���\0���g�	|vU��Xy��k	��֙����iz��<M\r7�5�z�����[o�W����6MS.eSt�����?o�ȉ��ǺZ�u_�=�y�M/�O���>��bi=y��5dnv=�\']��㌫��R���K��,�\0\0\0\0\0\0q���N�޷�Ϊ�⟼��ϫ5w�F���ř�wm~KW^�|i1Jaf�{lNڵ�6���2|$ƞ��V_M^�;u��9��c���f,�s��_��׳_\ZLR��Ϸ�6S�6U5�s���F���g+��G��E����\\H�Q��袚55�7|���ob���ީ���57y�~����~�`�����n�R��a��Ag̞�&�yq&O_K��c������������~��)r�Lޓ��t\'j<�f����������op{ȥ��5@\0\0\0\0\0\0���ڷ)�S!�^�I���IV��x�6-:hv����=�4z�^4qb���(�\0>��{h\'���KҞ,���h�V�����w���\"��ß^ե4z�^4qb���.�/��>$Ab�\'�9#	�l�M�?4饥��XB�D�nwsAε�>�Tz�a��N�\'�@��������?6�!�6����jo:G%�LZ�q��c����U�<{���כI�><���>�jZ�y��O�㎫3��c4rXp����9�䍼�����M\0\0\0\0\0\0\0�ΐX�\'�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0a���>�$�;�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?��\0/\0\0\0\0\0\0\0\0\0 430!12@P\"#$A`����\0\0\0�\0ƨT�j�V�U�kEZ�W�	(5��h�Z*֊����0�-ZV�ՠ�h-Zv9M\\��SW)��� !�\0�C�!���z�=~�`%�@\0ﰀ��T\0[��@\0ulAB�\n\'e�@�m|P3_�kd��\r�.�߶�t�U��\0G۲�ט������d]/�l?��\\�a���e�-�1`=����6Ⱥ_~��ҹV��-n�,[^b����\'��m�t�����J�[�}�,�my����t�_a�E�����]+�l?����ŵ�/뇽�y}��K��|�U��\0G۲�ט��_��y}��K��|�U��\0G۲�ט��_��y}��K��|�U�w3���\rp\Z�5�k���S\r6(�^b��~wI��d]/�l=�V�m�W���O��y}��K��|�U��U�/��t�_a�E�����+�l>��y���ܺO/��\"�}�a��ʶo���t�.���6Ⱥ_~�{�r�����1]-ۤ��\r�.�߶�t�U��U�/륻t�_a�E����|��ʶ#n�H�Q�HWRB��Ԑ���u$+�!]I\nAt�-�1]���\r�.�߶#�t�U�v��وܵ�/���<|�a�E����|�ʶ#j�v�1�����1-rԎ\0�y\'��W�q^M�y7��W�qMY-�t����J�[�j�]���^b��q���Y}�b7.�ʶ#j�v�1������������n]+�lFժ�vb7-y���L��������J�[�j�]���^b��*��\"��r���n�+�lFժ�vb7-y��D9�3y\"��8}}�b7n�ʶ#j�v�1������H.Z	A��Z�]P+�u@�����WT\n�]P+�u@�����.���AN�jꆮ�jꆮ�jꆥ�2�Z�ж�����WT\n�KI	��\\������T\Z�]Pi���\0R&�����jlVP�E*,��2g�t�2�]����㚁H��I\n��V�x��}��\".U�[�ڭ���騏�f�\\�?,ZL�s�D��*�t��c� Sf:�*M5(��;�\Z)4k�hcU�p�A�s�ⓦ^]&�5�9yI��G,tl�]$I�����l�]%I����p�E&�|�j��h \0&�T5XS���kf:�(^E5Q�t��5Q��EW��\nR5BЀ�Z3�$p���\nGi��0s�(R;M�|�E�TO��U0�F=U��9R���Q1��0���\01LC6j���a�vJ�IQWL|�Tݚ��E�+\Z�@@@Z6�&4r��JF(��SIwi귨����S�Q�k,��[�ȯŬ�*iD�^#��GzG��+r.�U�����8��gj�H�G��\"Ok\"F�;�Ƣ�d�;�8p���[�w��X�\0����1d�l��H��c1d\'�~}�0�qGŚ:�pF�4��-�y�&�(���8��W+t�|������ >}�o��(�b����@z��Z=�S$�*�;U5P�9i�0�e��su?�i�+��\ru�9#b��[H�Q\0Dn9pV�4��-业E\0U��MV��q��g�j9��ˠ���\"�d�;�8p�-�a>o�*7��6ȓĦx����&�ޑÇ�l�H?��7��ސh�����s��UE�m�!�a��T���i�#���\'~c�d^+̪G�i��4?��x�M=Jb1\\Y�R9*�UC�9pQ1��!�3L�\\Xp����S�4����x7�M~�J��o�u��Q�2!��8���i?�vSp⼐�iR�6��\0��G!��4.e���}����Ã�nW�\r!�W&����+Z��pp���U!��s� (H���\":C�}eC�>���RA��\0qc��\'~_�d^+���+ȏ��ţ��4.�1)J�M]�?@X@P�9)t���R���R���?�H���\0�\\_����Z�SҘ/����r\Z��#J8��\0�����t�x�dDI�(xz�ɰ�7��\Z�;�dq]1^-Y��I8T�x��\Z�Q�28�������8R�5��c��,j�( �Tݭ���f\"���џç��@�|Z-����3F��;��n\0�}��M�F1N-XJ8�����x���t�x�dDM�(h�\0�ݲ*��W�љ[Ԟ#&`�T�X����RP��\r�}=��\r[4�w+��m�7#��5`����,F��\0�\\_��\rݩ���j�]P����^��uCRϖT)��6���,�+?:��\"�d��\Z�z������O��\"PԳ�\nj�ͩ���J���V ��w*�j��j��Y\Zꇧ�^�����I��;U\nꇥdP)����\\�����ős�\rK>YP�E��T5��3��]4�:F,��JI*`ZE���T=8t�����p��H:U\nꇥd8Sgn.W�N@�O�5OU��4��\0�b�]�~z+,�U�����Q!�\'?�._��\0/\0\0\0\0\0\0\0 123!Q0@aA\"#P�CR`���\0?�����\'6���丕��%FK����qW�+.��y�b�����T��5~����F�m�q��vV���Yw\Z�i�]�#u�6�X8�m;+g��,��]����]�#u�6�[?��elܞŗq����2K��n�&�kg��쭛�!�}�I��\'���j(zuv���%�r7\\�o5���vV����i��\\��9�I�����m;+f��ݴ���Iw���$��l�b����o��g��g��g��g�$i���O�\Z�y��rM����+i�[6��2��*����/��k�^��ҵzV�fh7�y���VӲ�m�:e��U�OͳI��6�[?m;+f�S�X9]���n�V�{;ڛy�������o��,���~{^��W����/Q\'��$�D�W����y^�O(��歕��^O+�\'���j����y^�O(����\r���y]y<�3�k�\0棌�ܥc����f �Ru����lx\r���u<a�����ܢ���  w`��arv�&0��x��-���#ĵ1����GUa%Y�?\Z��7�������$�D�\',\r��1�{)b\0bn���θ��q�E�.��E��[}���LOcDA�|MHؙH�p���Kq�Gp�z�	��hDBms���.�Q��2TQ1;D:�WI��6j�����u\"Z����\0/�\'n*7#�+�+.��T<nV]J�oN�T<nG�+/�u��\0T�/���K.��0<�cd��R@��U������~CK.���A��7S7hv���)�0�� ��.\'\'p\n;��m�Yu>ݐ�����r�0�D-���Ƌ�r���p�K\rbxkH)��o��*IF,P<0�Mv^|/�T��# �aQ����e[� xc�)�e��=��z/�N�N��n(�\0av�:��|����μR˽9и��$�Å�9[��t,��a}�\0�-8�1�%��v�H*)@]��B[��T�q!@��o��1�~��Ꮌ������\0/\0\0\0\0\0\0\02 1!03@Q\"#APaC�R`q��\0?�\0K���cvajP٘Z��`��,��vafc����l��\\=���\'����\"�lwd6\n�y���,�bxo?�E`���l��\\=��Y���*�}���c�;!�Vk�p��g���y��dV\r����Y�5��\\E�>��/�����\0K��$���}��dV\r����Y�5��Y��xx��c�;!�V{�p��{<m��6E`���l�����l��t��O�]\'�\"�E[ϼ<l������+=�{�=�	�5o>��#�[+����/�r��#�ql��Y���g�k\r[Ͻ�3��6\n�}p��g�k\r[Ͻ#5$q��Y���,�Ma�y��<��A����b�1t�] 2\n�6��]|.�>ckx��2+���b�3i�+�υ�g��~��R<0f�s��fy`�ᔸ�7<��G���\\yߞ�����=M!I!�KQ�7�|�F���8\0�#��\n=Y}Ԑ?1�=�c;��<\0���Nt�ot��!���Z�������E!\'K���-naI!kFK��3Aҿ�M��v�����dqa)����ŭ쁕��$pv����ZX����d��\\PꑩI#���3S�C�RHA��W�ote�=A5ҿ��ӓ�m=9s��=R��\0\Zm�M{P��5�X�SxR��X��X�hS^�=e��.��\0�̟��jtzڄ����OaQX#���3�r��LM���5�Qz�O����/�/�Nh��=񜞥�\Z��\Z7�r���<$pTM��$d�M�3��\Z4��Y�&Ds��z��+�On��\r����#��)�\\;\'7Sr(6Vv	��=��#5��S�8�:��&asr	�~CJ,�K�Fc$#-M��v��\"$�o(�gv(ǔzB�����jkeh��S��:�1���27�d���IE�k@iE�?���K�\nH�:��\"gvF,��c&�T�.�rF^��\0_�����FC�0�\0��\06\0\0\0\0\0\0\0 !qr�123AQa�\"0@P�B�Rb�`�#����\0\0\0?�\0��6���O�n���?%�~Kt��9�n\"�~Kt����-��[��^@z-��[��O�n���?%�~^�˲[.�l�%��˲V�=++a�-�d���vKa�+A2\0�*Η/F:����mh��{8��+uV-p��d��:�\'�O���х�Wf\Z�o����\0a\n��p���z0�\n��Z-����_�!]Z.�7F!]�kE�W�։��uh�~|�=X�va���h��WV���sp�abن�^����_�!]Z.���х�Wf\Z�{W�։��uh�~`_\\�=X�va���h��WV������х�Wf\Z�{W�։}r�4�j+QZ��V����\ZrLi�h�~a��7F!]�kE�_�Z%��.�m���х�Wf\Z�{W�։����}sp�abن�^����_������\\�=X�va���h��h�~a��7F!]�kE�_�Z%��.�e⹸z0�\n��Z/j�\0Z�/��p��1\n�����+�\rh���kD�����<����_�K��~y/�%��ê�\\?0�B��z0�\n��Z%����_Y�zQ.��2���5�]_�Y��}ޔK�E��-w1Z�8�--���+tV��[��綈i�va���\0ZϾ����]Z.�o6�홆�K��k?g��D��\\?2a�O�\0}�0։u�g���(�V���f�\0!�ڳ\rh�W��~*ϻ҉uh�~j�?���|G/h�5�]_�Y��>�J%բ���L2*Q��0���왆�L5��������]Z.��\\A�!׫adV��G5�9���n�kts[������G5�9���n�kts[���l�+SnKt3[�����f�C5���k�|��V��G5�9���n�h���>3��7�[���~����_��������\0�Y�J�Xu����#��S�h�4X�h��ƋJ�0��_(\"�y������D��T�hXQ�؆D�ڜ�K��0�!�7{���&SMpu t5�Y)�1M���[-�V������.���#-\ro3$bx��D�=\Z=�[��1<I�Ҡ>.��������Nv�B\'�)�No#-\rg3$bx�������A9�.�u!ėd�k������1<Iˢw����H-�E�$��H	����VE�)�[�U�%�9������+{m�r��b���y�l_қ�H�]N���#s��?Ŝ��\"�Td&�a���Ny�2*��I[�0\Z8�[Ӓ�|�L��V�䄈sOJ��>�5�d�<It�\0úE����7�[�nS�o0��ʑT�I��DǕ�ʶ)�M�R\"E8R�$\Z��Jؿ��xwB�\\$G�c�ڞ��A���M�-R��x/�vA�Ex͹�^T\\Z!�	�/e=n:�-qOQ��e�R{۬*/\"W&(���X�r��%rcݬ���jԅ�EŢ ���S��\"�D�x�iڮE��2�U�Odl��J-&�Q����\r�MR��H�e�P4��(Yo�e��\0O�^(�o���?LL)�U\'v���§r�4M�\0��/\r�N������u*\r��/�%D�/�\0Q�\'��^3F�jQE!ϊ��5&�56j�>�G�(�9(X�p�vE�&xe�E\0�/m7Z�r���yCZ�c4�SM��<E�=�5�9���B���~��\\��EŢ ���C\rVޢ]��&#� �~�xQB���OQ{!�C�Z�����&Nw�]�6�B�m�E�OԪ.\Z�M���,Nğ�&�*��r�ߢ ���b�7�7l������&�c@�v��E�OԪ/�R�\r&|X�\\�?��O��WC�j�G:%9܅�?�~�K��E�D0?�wU�j���\r�TA��BďS�U�E�D0?�wU�t\n<X���o_�-dWY̦��)OU�z����\"�R���r�MH��6鷃�T�\0Q0�aP�ܨ���OM���$o\Z<���(�I�B��Ц,*QE1ϊ���T,K�QE�������:a���\"������u�9;�Zة��pԼ�H��.S�5��*S��hCi�]�/d0�m�%�7+��Jt_�m�R�\'�A��o��Qc�\\���km�T�I�І��n��^�a��Xԋ�\Z$�*����]�P���A��Q���)Q�H��P?����8+J�C��/�GZ�e�\'����풦�I��iĝ�C��r���km�T�I�Є�cu�\r��j�S��\0խ��D�4o�γ����x�,���kQ��%*#5\'�iP��]�;&�8+J�i�x-�v�K�0采�C�$�p�4ɦm�V�f�$��L�I���ԧDt��-|�2\0�UA��ƀt�t�U��N�y\r-`cl�)�o\"�C5)�4:�A�5L�,��:O�Yf����x��I���ט��U�:�E[\r��6L�L�f�En�jBL441+SK��W�Q\03m-En�jS�:i���t3@�\0����W��*M�eH��[������&�pT@��u���Ԅ�v�Z�4�������Ê{���n�E���)�l�j\"W\"�k?�����\0-\0\0\0\0\0\0\0 !1AQaq��@���0P��`������\0\0\0?!�\0ƨ\r����W��y^�����^��{����(��]��׻�w^��{��uB�1�K\0�{������)��>-��q^½�{\n���o�	�\0�&P����\'\0����)\'P�efI��P\"@\"�Bc�j�\\fbj\0�d~枝4��g�\rl|E_N�w���*4��g�\rl|E_N�w��\n�M-x����-�����.���P�饯8�Q�h�g�*�t�}��\nt�ׁ�[��4E��}:�>�|饯8���GCD[?WӠ]��6.�Z�3��㡢-�����.��wO-x��������\"!�l`p^�z�뗮^�z��1�&�)�^-��6��Z�3���\rm|t���l���ׁ�Ux_\rl<t���m���ׁ�Ux_\rl|t���m|��ׁ�^�����M�}���O-xŲ����-���x���O-xŰ�CD[/6��s�Z�3�o\Z����#%s7�Yh�FZ2і��e�-G���������ׁ�[Tt4E�����v����7X1��FѺxŵGCD^^Qn<!A���op�<apb��Q���C{�^�/x�����	4`�X��ڣ��//(���vط��nfzo8���h���-Ǆ(>�-��\\L�3�m�:\Z\"�q�\n�m�x��$�\0d�>���-���h���-Ǆ(>�-�;���{Z�8��c��/;(���vط��4w���R�=�^qm��CD^vQn<!A���o{��&T�Ȯ����{����z�D��RrdĨDq�c����\r�C���{޼�I�V���\\��W*�U0ơ��\0�P2,�5�-��B��B̔�*�?�x��࿇�<{�\"�[��b�6��Є�H;�*\Z���a\"2D9C0�|0wO\"C��&ް8�j^~ ��S�L(Qb*\n0�I\r2�צ6N�i��v���#�Id\'�I) �0�g�X�����F���S��u��v�D�H�:�CL�ܟi���j�Hi�ƽ1�t3NG���F��RHs!8N�R!��\0�4�S_5؇�UI\r2�N�N���V2���!\n�{)���9����PQ0(L�+M���$\\�:�\"h`��&@LJ\r2*�\nU�\n�#hၿ]���	��ǥ 4��\n`t�<���j� +Ic).����L\n\r%�w}*���&3dP*\r��+���.H0m=�Po����a13-��rԦd̜��y���,\Z��\Z�V��M�b���m��1����Q\r�\0uPh��p�ͯy1r�^;u��H�y�1D�d=�r�M��1����Q\no�#۲\Z_���D�0$��7NlDʨ1�����t�\Zz������p�\\�/��q�O%���P�����+�yW\"��54�o:%w��M��D\r���a��X�J�pJ[��h��%e��B�&Q`\Z@�A��S��ĳ�e\0���2�ĜƩUB>�G4Ѯ�2�AI2�H[R�BL�R�B��0\0e��(�ҾFGib��>Ƚ�\0�� �����6��\n�\n��|��b����/DHn�;6�+�㱷[\'6���M��1����!�(�\r����$,�1w ��A�sfHi�xFpM���0\'(�E�\Z�D3{/+%���P����#�b����&J��c�0���!f�����$��F	��J��f7�D����U�\"$�\rXP_U;-����L���WL�Y�F���l���V�@7����v���H�T#`3a��A������ͬ\0�=яU�aV\0#r��(DF+�\0E�a��A����؍��Ch��j��\0�IY8��-�͘8!7�5\n[4�F\05��G_�8?dGw�0J�\0B$�^~kz����5`A	��t ��tC�u�\0`6�D��#���7	� ����&�Gk�*�T��5� 2D��3���e^v����tD\0��dK�\0�`f6�Ԗ\'.�Ǣ\n�����������깒i��.�<��X�^����Y�TI�La�~�)c5|\0��z�U�(���4=�M��d�ys�O&+�)W��l��7~��\ZKVy�~�Q�����8R �aU������;J��u��/܊3��U&���7x�i�0*�tϤ�@�����f��i������i����FrĦ��l7jT1C�i$4��.\0Su6u�Q3 ����%��.Y��(,�꪿ӡF����X�!��@P�fA�ڗ���*5=)��]g����L ��C���h��.�\r�=E�\0�.A�hs��=��,��.��w�t`J��N�,�K�q�@@��ޡ�G���e�;��m`$��(B�\Z�	3�I;B\"�ԔQ�	�!\0Pf��!\ZR�A��0�9#P3I\"I$��`.�M�zǽ�� ia\n���Dɗz�����Y����z�؃�j�υ�-0��s�FټL�$HI5&�0\n,�\"�$���&��������)�$��D�I%�M�l�������>O�&r�����x�\"�r�#�\r���ܛ��-�\0����\0\0\0\0\0 � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �!�, �!�<���L!�\0P� �@� � � � � � �7��\0�	<�s�, ���!���� � � � � � �	|�\0�<�S�< <��%���� � � � � � �	=|�\0�<���<!<��%���� � � � � � �	<�\0�<�s�<%|��%���� � � � � � �	W<�\0�<�s�<%|��B)���� � � � � � �o<�\0�<���< ���<��<��� � � � � � �o<�\0�<���< ���<��<��� � � � � � �<�\0�<�_�<!|��\0����� � � � � � �o<��<��\0�<$|���%���� � � � � � �=���O<�\0<��< |���%���� � � � � � �,���<��<�{�<$|���%���� � � � � � � ��<��<���<%|���%���� � � � � � � ���0� ��$C\0�$�� � � � � � � � � � � � � � � � � � � � � � �� � � �^�� � � � �0� � � �^�M¢���l(�����Ђ\n4�@���W@���fiĉ��B � ���E�<� �\n��<�Bǂ@�\\WJR;!K��8Vֈ� � �\nH��� �O�U���L�B�xfEzBR�w��%v>0c � �\0� � � � � � � � �Z�� � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � ���\0)\0\0\0\0\0\0\0\0\01! q��0@AQa�����P`��\0?�/��+Ë¼+À^\0�%xJ��;�wl ļH�G8%X+ffs�n*}�\0�����G���v<��\"������X���3�I]!�����<{s:����Fpi+�<����<{c:����Fpi+�<�\r~sǶ3�ް{�m�3�L�S?�%��<�5�!��οz�<�X5�!��>��X=�􇜋�9����X}�\"���e�#lk�<�X	�0C�=��~���f�M!�[��Y���W��9C�6�i��>�7i:\"��h���X}�n�t�$A�(C�&��~���f�M!��\0�ɢ�e��a��-�[�i\rE�e��q��;U�]l2�d��\"�e��1/��L����Ra�x`�C�0��\r�e�C�NQ��EW� \0�A��\n �l(�3G` ��`a��X� \0�A��\n \0�:����C`ٗO�Z 9P�	+�: �\\�()�sF�fLA�z6�sdy�*=���sC\'pE��*��5;42����$7��Dٴ�b��Z��w�Rd��J�-2+�([1L�-w�-�L��B\"�{Ss%�]����К\r̩�Z¶2]6�Dr���\"�{Rj?e�4�dg�_��n���Aآ�0D��Y�(�QfX��0G��QX��0D��0Dࠀ0S�b\\��hq�fX�@�TV7Bm9A�h�\n|�*�0VI�5p�6aد��)\0h�I*o�\"�(�%2Ƣ!;Q��/��a@)���\0*\0\0\0\0\0\0\0\01! Aaq�0@��Q���P`����\0?�/���V�-e��pX���B����@����$�5�`�l��\n�PX���ަÿxc����J9Շ~��Hod��0s���0p0p�Cx+%D���Xw� pp0p��v��VL���\0d�\0�?�G����M������Y��p��M������Y��p��M�����K�U�Vo�\0���j�\rv+����0p�Ax+5D���~��,�-��D-�B0`�%���TH�hw�[b����VJ�\r���*��A/�|��GCC�tK��ZkMi�5���K1z�e¹\0ZkM\0l ��A�����,*8P\0�(��@D=u�tV�h�P��/�(l�DH���9X\r�Ѭ[ BWtn�ib�\r�{\']�$�yb�VI�9 �,�e��̡A�M�3K%B��\Z��s���A�����S�$s+�N8R��B�D&bA�M�͊\Z]�J�d��L\nEf���;��\0���{*_r��u���_��(7\\E�R��\'���]4�t����N��cP�d���{u��@)�V�PD��p|�z�Ex�\\�#�=D��d\0@)�.�r�6[��2���(X(Q]�\n�9@�-� �@]ʂ_\"��\"@Zb��d�\n2O!�;J�d�;�AxW�ʽLP�3��P\r��&,=��X\"Ty�\n:A���\0�\0?��\0-\0\0\0\0\0!1AQa� q��0�����P@�`����\0\0\0?�\0�T�dđ�V�����[�7� *!{�\0*�DD�p��@�����[�7�lo��������1=\n�_��+i|V�����[K�D��%�J������[���n/�t�w�D懥lO�ܟ�>+r|V����F������΅i@.��\"A`��H\nB.I(\0\0pq\Z0��\'��z�h¡���ۉDKH��\ZU�dǒ�0���)[Rй?�^s+�{qoZ�;�g�W��Ǹ���w/joy�Om�Aw���]�Žk���{=\\[�O��eܽ����=�����\n�-�_\'h������2x��2���M�7���h.���K޻n-�_\'h�����޲x��2���M�7���h.���Wޮ�qoZ�;Fg�W�Ǹ���w/joy�Om�Aw��o�*�ˋz���38�z��̸ێo��r�������4_x̢�z���38�z���3q���^���|��Ƃ����ZQqŽk���{=\\^�\0����k!�\06��q+���z��~޿o_����F�U��99q�����v�{־Nљǳ��{�n9�l5EA�PdTEA�PdTy.�����=�_\'h�����m���\0��_y�ǽk���{=\\]����\0�_w�ǽk���{=\\]����\0��_c�ǽk���{=^j�o�LAw����q�Z�;Fg�WśǸ��\0��^�������fq��qnټ{�o�\"�-��a��3ml?u�����[�l?u�����[�H Dbjq�����N7:>����{=\\[�o��h�gj��y/s�Ƃ�����Jb�>N�ǳ�ż���9�]��Ź����sx�]�q0^��Cnz�����9��.�d��Я&����[�淧�oO�ޟ5�>j	(Aahǳ�Ź���9�]��Ź����sx�]��Y�zvO�l�qn9�{�on�qny���w\\�4`�3�p.�>?ͳ�����vog皻o\'u��Aw����K�h�_1��]��5��7��{8�<��y;�o\Z���c�C�E��k�M��5��7��{8�<��y;�o\Z��qf[����QK�^P$��?ų�恹��vOg皻o\'u��Aw�5nƐ���R��r�#�_����}W侫�_U�/����~K�%�_����}W侫�_U�/����$J\'���n��j��}W龫��U�o��7�0�?7�-��%��~K�%�_����}W侩��d�|}]g��N���\0��_�~��W�[_�X�$De��\0�P%V\0ƅ���K�\ZQ�O��c\Z�L��g�J�NNv\\U�\'3O�M*�,k�6�7����B@9/6�����K��vmk��]��������1.��\\\"=� ��$�Mz��j�B&���\0��.�	���(�q%z��r�t��a�26�_�X[e_�W��z�e�G�ejOL���l�#���41|�#mXŌc�CPLKH�5��|�N�z�:�Q\0\n��@���C=|Vʕ%�I���F�n��)���fh�ChR�ү�0��@�ى��Ӡ�c���#*hs��%+8�I�ױ3F�p�sH��c1�\r\rA1,M#��҅�:��eD\0(�Z��be����9UOO��s»)�O��m�y�i\'���N�b�L��rZ�6H��\0w��;�	U y��*��FG�\\����8F��TL߭2RkI��f�0�[��13JaY�hGzV�l)��Ԁ�g��W���f�A��uh�t���r0�\',zRB��b%��n�FTY��^�B=�B8_ѥX8��/��\Zա+%�7V�53�u_�(�#b�r3h�t���p��5⢋�}��v3>�.�9��\0�zL�����ZҖ!��)�+j�tZ�A�1Gv��3�iK\n p��id1ͱ��0,ޡG�Z�i��ʏ��=)l8����ݸ6���Lfg���M�V�ь��w6khη|�7l����dV�&&/\\��3�K[|RH�-�Bm&�I2aVBfIu�����f��3+g�@�\0L��iAq�h�bҬ���?\r�%o��Y�	��� ���Ĺ��� y=�w�P��k�H�w\r6E�Hq�E����ģmkN\n,,V��R�eg,�ե�N\"��Z�����a�ɇV�R�\\��Y����RV �ΐgZy_�[�����m4R�Z�_����L���gD��t��K٦_�(\0��u�75`$��\'V5he!c����I�&�st�ߟG�3O�P@��+jΌA!�V��\00Q�n*^J>ڦ,3�cա�ơޘ���D�>�j�ai.:E�IP����[VtJHE����X�1r\n�B�Wr�+	Kkp���&H��ny�XWş�iS)�W�iP�!�R��\Z_�|��m\"�\\��Q!�{�Vb3��*�{����u;&š\\���6oQmmY�矆����|,�n#)\\;�J��xw~�m�6���rS]����jη<�7앷��eqJ��T9��b��W�^�t���v�:p�޳�M�&dXզ3Di�5z\rD��j�2��8c5�h������y��Z�Md�߳�aQ�\0N���Np�b�e�H��ޯ��\Z�3�iFY��֠aE`�U�˟Չ��2;\\�vX�\nV��sW�Pa��M�:�[HiL�a��AKҳ���,�5T�x74ٛ\ZXܤ��?Ʌ�N��9�9��zC�Q>#5�z�*�Jesh��\Z\"=�Du�>�81V���`�o�>h�E\'&��8���N%�����o�z��s5��`?E���1�����p\'Y����U�gD�ю�\04��\'&��8���N%�����m^r�~���n��@�_�V�����0LaC��AY7�<1mYҰ�\\#Jp�y54��[11ɹ+��\'��YBO�V\r��|-,i}PaV#DG�-�f@�<U8�Z�]M��=���p����\rD��\'ԡk��E(��4��:`Nu�E_@Z�џ�E����ү�P�Ď%C^f3i��8ʡ\ZH��y4m�$Z��J(B\0ֶ���0�!)�	��G�B��CpK̳[�mmux75�e]��ID�Ը��J�\0&#R�������\'��͇G�k�U��W0����T�!���b�Iw��@E�;��F�J�\\\0&i�	�/H��r\0���(L�9|�[b���rV�S��0n�V�ђ� �cή�\n^�K�D%\0�aF�7]1�w�5ګ~΀�Hwa��ޕ&�\0&i�	�/H��r\0���(L�9|�[b��0L��j{R�Kn(�T�L������@�ǭ�1hLB�p���]1(qW�>{Q�Q{%���e,��ϊN`���}-�b���4�@���H��P��o�N���麾�IЄ������ ��8d�>�|��>a��D�����������:�Q�L�Jl�f􊙸`Df�挔R��V��\0b.����@p��t3֋|5Q��+\0r5�gV�1�s��4�(���|ʦ�oV귓lX.R.�(��Y\'8_�A��AmX��R�Nr�՝[���m����5�_��)��;�U��5D\rէ3[�mlux75�e]��F�yi00:Q\'�>޾\'JW�(V�aǵ\n`�Ժ�+�[U���\Z\n��}}��j�����]K<B\"n�t@����>$H�խy\0x_@5F���,{U�CV����|�%gb__�h6\Z7��X���(h�oUԳ�!\"&��D�*@���r�(�t�\0+\0�Y}.��4d�=x[��Ck8P$0\\-]P�h�Se���\0����s�Ë#(K��>d S�\"�zS�iD���P�,N�+G0�ڒ9ڗU�)eVUe\\jN	\0�Õ3�,�>�:��\n@Ѽ���cډ!S[�� t\rP��}��j���B8+҆^�c8�f)V�怋b�ڔ�e�r�)x<�U�]sB�ɼ�x��\0�1-qhh>�]iZ�՛9�|eG.�nj {R�}�g��H��*ӽ�	\"*�	D����PH Sj���I����Z%P�P��W�w��\0��t��PW�6���\0tABd��J�C�\'�\0����','logyou.uih.co.th','Company','Company','Company','2019-01-29 15:50:21.331817',1,'logyousystem@uih.co.th','Company','jpeg',1,1,1,90,'1',1);
/*!40000 ALTER TABLE `company_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_report_graph`
--

DROP TABLE IF EXISTS `company_report_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_report_graph` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `query` longtext COLLATE utf8_bin DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `report_config_id` int(11) DEFAULT NULL,
  `report_template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_report_graph_company_id_19b4b1d4_fk_company_profile_id` (`company_id`),
  KEY `company_report_graph_report_config_id_88d0733f_fk_report_gr` (`report_config_id`),
  KEY `company_report_graph_report_template_id_ead51b83_fk_report_gr` (`report_template_id`),
  CONSTRAINT `company_report_graph_company_id_19b4b1d4_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`),
  CONSTRAINT `company_report_graph_report_config_id_88d0733f_fk_report_gr` FOREIGN KEY (`report_config_id`) REFERENCES `report_graph_config` (`id`),
  CONSTRAINT `company_report_graph_report_template_id_ead51b83_fk_report_gr` FOREIGN KEY (`report_template_id`) REFERENCES `report_graph_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_report_graph`
--

LOCK TABLES `company_report_graph` WRITE;
/*!40000 ALTER TABLE `company_report_graph` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_report_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_type`
--

DROP TABLE IF EXISTS `device_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_type`
--

LOCK TABLES `device_type` WRITE;
/*!40000 ALTER TABLE `device_type` DISABLE KEYS */;
INSERT INTO `device_type` VALUES (1,'OS Windows',NULL,1,'2019-04-19 17:26:36.934960'),(2,'OS Linux',NULL,1,'2019-04-19 17:26:36.935749'),(3,'SonicWall',NULL,1,'2019-04-19 17:26:36.935982'),(4,'Switch Cisco WS-C2960',NULL,1,'2019-04-19 17:26:37.096893'),(5,'Fortigate','Fortigate Firewall',1,'2019-11-29 16:16:20.533617'),(6,'Palo-Alto','Palo-Alto Firewall',1,'2019-11-29 16:18:47.693572'),(7,'Netflow','Netflow',1,'2019-11-29 16:19:19.586255'),(8,'NSX','NSX Firewall',1,'2019-11-29 16:19:32.956760'),(9,'Other','Other Log Type',1,'2019-11-29 16:20:23.147254'),(10,'Blue Coat Proxy','blue coat proxy',1,'2019-11-29 16:21:22.511151'),(11,'Squid Proxy','squid proxy',1,'2019-11-29 16:21:47.207151');
/*!40000 ALTER TABLE `device_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_bin DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-12-19 11:03:26.030661','1','Company',2,'[{\"changed\": {\"fields\": [\"server_url\"]}}]',37,1),(2,'2019-12-19 11:07:43.836362','1','Company',2,'[{\"changed\": {\"fields\": [\"server_url\"]}}]',37,1),(3,'2020-01-08 13:26:36.338033','1','source_status',2,'[{\"changed\": {\"fields\": [\"template\", \"is_customer\", \"is_staff\"]}}]',49,1),(4,'2020-01-08 13:26:42.945778','2','collector_status',2,'[{\"changed\": {\"fields\": [\"template\", \"is_customer\", \"is_staff\"]}}]',49,1),(5,'2020-01-08 13:26:49.387288','3','collector_cpu',2,'[{\"changed\": {\"fields\": [\"template\", \"is_customer\", \"is_staff\"]}}]',49,1),(6,'2020-01-08 13:26:55.587675','4','collector_ram',2,'[{\"changed\": {\"fields\": [\"template\", \"is_customer\", \"is_staff\"]}}]',49,1),(7,'2020-01-08 13:27:01.685735','5','collector_hdd',2,'[{\"changed\": {\"fields\": [\"template\", \"is_customer\", \"is_staff\"]}}]',49,1),(8,'2020-01-08 13:27:08.298701','6','two_factor_token',2,'[{\"changed\": {\"fields\": [\"template\", \"is_customer\", \"is_staff\"]}}]',49,1),(9,'2020-01-08 13:27:14.156511','7','two_factor_status',2,'[{\"changed\": {\"fields\": [\"template\", \"is_customer\", \"is_staff\"]}}]',49,1),(10,'2020-01-08 13:27:22.458349','8','download_log_file_status',2,'[{\"changed\": {\"fields\": [\"template\", \"is_customer\", \"is_staff\"]}}]',49,1),(11,'2020-01-08 13:27:30.821044','8','download_log_file_status',2,'[]',49,1),(12,'2020-01-08 13:27:51.225403','9','contact_mail_message',2,'[{\"changed\": {\"fields\": [\"template\", \"is_customer\", \"is_staff\"]}}]',49,1),(13,'2020-01-08 13:27:59.032785','10','source_log_matcher',2,'[{\"changed\": {\"fields\": [\"template\", \"is_customer\", \"is_staff\"]}}]',49,1),(14,'2020-01-08 13:28:07.230799','11','user_reset_password',2,'[{\"changed\": {\"fields\": [\"template\", \"is_customer\", \"is_staff\"]}}]',49,1),(15,'2020-01-08 13:28:15.016705','12','source_log_matcher_vpn',2,'[{\"changed\": {\"fields\": [\"template\", \"is_customer\", \"is_staff\"]}}]',49,1),(16,'2020-01-08 13:39:16.540406','1','Company',2,'[{\"changed\": {\"fields\": [\"server_url\"]}}]',37,1),(17,'2020-02-06 17:42:35.223296','9','<ModuleConfig : name=uihlogcollectorireport module:uihlogcollectorireport install_app:uihlogcollectorireport.apps.UihlogcollectorireportConfig>',1,'[{\"added\": {}}]',12,1),(18,'2020-02-06 17:51:08.004385','12',' app: uihlogcollectorireport ,label:Gen IReport ,model: ',2,'[]',46,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_apscheduler_djangojob`
--

DROP TABLE IF EXISTS `django_apscheduler_djangojob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_apscheduler_djangojob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `next_run_time` datetime(6) DEFAULT NULL,
  `job_state` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_apscheduler_djangojob_next_run_time_2f022619` (`next_run_time`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_apscheduler_djangojob`
--

LOCK TABLES `django_apscheduler_djangojob` WRITE;
/*!40000 ALTER TABLE `django_apscheduler_djangojob` DISABLE KEYS */;
INSERT INTO `django_apscheduler_djangojob` VALUES (1,'uihlogcollectoralert.tasks.scheduler.deleteJobExecution','2020-02-07 01:00:00.000000','��F\0\0\0\0\0\0}�(�version�K�id��7uihlogcollectoralert.tasks.scheduler.deleteJobExecution��func��7uihlogcollectoralert.tasks.scheduler:deleteJobExecution��trigger��apscheduler.triggers.cron��CronTrigger���)��}�(hK�timezone��pytz��_p���(�Asia/Bangkok�M8^K\0�LMT�t�R��\nstart_date�N�end_date�N�fields�]�(� apscheduler.triggers.cron.fields��	BaseField���)��}�(�name��year��\nis_default���expressions�]��%apscheduler.triggers.cron.expressions��\rAllExpression���)��}��step�Nsbaubh�\nMonthField���)��}�(h�month�h�h ]�h$)��}�h\'Nsbaubh�DayOfMonthField���)��}�(h�day�h�h ]�h$)��}�h\'Nsbaubh�	WeekField���)��}�(h�week�h�h ]�h$)��}�h\'Nsbaubh�DayOfWeekField���)��}�(h�day_of_week�h�h ]�h$)��}�h\'Nsbaubh\Z)��}�(h�hour�h�h ]�h\"�RangeExpression���)��}�(h\'N�first�K�last�Kubaubh\Z)��}�(h�minute�h�h ]�hM)��}�(h\'NhPK\0hQK\0ubaubh\Z)��}�(h�second�h�h ]�hM)��}�(h\'NhPK\0hQK\0ubaube�jitter�Nub�executor��default��args�)�kwargs�}�h�deleteJobExecution��misfire_grace_time�K�coalesce���\rmax_instances�K�\rnext_run_time��datetime��datetime���C\n�\0\0\0\0\0�h(hMpbK\0�+07�t�R���R�u.'),(2,'uihlogcollectoralert.services.mailmessageservice.sendAlert','2020-02-06 17:53:47.688638','��4\0\0\0\0\0\0}�(�version�K�id��:uihlogcollectoralert.services.mailmessageservice.sendAlert��func��:uihlogcollectoralert.services.mailmessageservice:sendAlert��trigger��apscheduler.triggers.interval��IntervalTrigger���)��}�(hK�timezone��pytz��_p���(�Asia/Bangkok�M8^K\0�LMT�t�R��\nstart_date��datetime��datetime���C\n�5/\n���h(hMpbK\0�+07�t�R���R��end_date�N�interval�h�	timedelta���K\0M,K\0��R��jitter�Nub�executor��default��args�)�kwargs�}��name��	sendAlert��misfire_grace_time�K�coalesce���\rmax_instances�K�\rnext_run_time�hC\n�5/\n���h��R�u.'),(3,'uihlogcollectoralert.services.alive.checkaliveservice.checkAlive','2020-02-06 17:52:47.696236','��@\0\0\0\0\0\0}�(�version�K�id��@uihlogcollectoralert.services.alive.checkaliveservice.checkAlive��func��@uihlogcollectoralert.services.alive.checkaliveservice:checkAlive��trigger��apscheduler.triggers.interval��IntervalTrigger���)��}�(hK�timezone��pytz��_p���(�Asia/Bangkok�M8^K\0�LMT�t�R��\nstart_date��datetime��datetime���C\n�1/\n���h(hMpbK\0�+07�t�R���R��end_date�N�interval�h�	timedelta���K\0K<K\0��R��jitter�Nub�executor��default��args�)�kwargs�}��name��\ncheckAlive��misfire_grace_time�K�coalesce���\rmax_instances�K�\rnext_run_time�hC\n�4/\n���h��R�u.'),(4,'uihlogcollectoralert.services.alive.callhistoryservice.callUsageHistoryService','2020-02-07 00:30:00.000000','��y\0\0\0\0\0\0}�(�version�K�id��Nuihlogcollectoralert.services.alive.callhistoryservice.callUsageHistoryService��func��Nuihlogcollectoralert.services.alive.callhistoryservice:callUsageHistoryService��trigger��apscheduler.triggers.cron��CronTrigger���)��}�(hK�timezone��pytz��_p���(�Asia/Bangkok�M8^K\0�LMT�t�R��\nstart_date�N�end_date�N�fields�]�(� apscheduler.triggers.cron.fields��	BaseField���)��}�(�name��year��\nis_default���expressions�]��%apscheduler.triggers.cron.expressions��\rAllExpression���)��}��step�Nsbaubh�\nMonthField���)��}�(h�month�h�h ]�h$)��}�h\'Nsbaubh�DayOfMonthField���)��}�(h�day�h�h ]�h$)��}�h\'Nsbaubh�	WeekField���)��}�(h�week�h�h ]�h$)��}�h\'Nsbaubh�DayOfWeekField���)��}�(h�day_of_week�h�h ]�h$)��}�h\'Nsbaubh\Z)��}�(h�hour�h�h ]�h\"�RangeExpression���)��}�(h\'N�first�K\0�last�K\0ubaubh\Z)��}�(h�minute�h�h ]�hM)��}�(h\'NhPKhQKubaubh\Z)��}�(h�second�h�h ]�hM)��}�(h\'NhPK\0hQK\0ubaube�jitter�Nub�executor��default��args�)�kwargs�}�h�callUsageHistoryService��misfire_grace_time�K�coalesce���\rmax_instances�K�\rnext_run_time��datetime��datetime���C\n�\0\0\0\0\0�h(hMpbK\0�+07�t�R���R�u.'),(5,'uihlogcollectoralert.services.pdf.callexportpdf.callExportPDFService','2020-03-01 00:30:00.000000','��k\0\0\0\0\0\0}�(�version�K�id��Duihlogcollectoralert.services.pdf.callexportpdf.callExportPDFService��func��Duihlogcollectoralert.services.pdf.callexportpdf:callExportPDFService��trigger��apscheduler.triggers.cron��CronTrigger���)��}�(hK�timezone��pytz��_p���(�Asia/Bangkok�M8^K\0�LMT�t�R��\nstart_date�N�end_date�N�fields�]�(� apscheduler.triggers.cron.fields��	BaseField���)��}�(�name��year��\nis_default���expressions�]��%apscheduler.triggers.cron.expressions��\rAllExpression���)��}��step�Nsbaubh�\nMonthField���)��}�(h�month�h�h ]�h$)��}�h\'Nsbaubh�DayOfMonthField���)��}�(h�day�h�h ]�h\"�RangeExpression���)��}�(h\'N�first�K�last�Kubaubh�	WeekField���)��}�(h�week�h�h ]�h$)��}�h\'Nsbaubh�DayOfWeekField���)��}�(h�day_of_week�h�h ]�h$)��}�h\'Nsbaubh\Z)��}�(h�hour�h�h ]�h7)��}�(h\'Nh:K\0h;K\0ubaubh\Z)��}�(h�minute�h�h ]�h7)��}�(h\'Nh:Kh;Kubaubh\Z)��}�(h�second�h�h ]�h7)��}�(h\'Nh:K\0h;K\0ubaube�jitter�Nub�executor��default��args�)�kwargs�}�h�callExportPDFService��misfire_grace_time�K�coalesce���\rmax_instances�K�\rnext_run_time��datetime��datetime���C\n�\0\0\0\0\0�h(hMpbK\0�+07�t�R���R�u.');
/*!40000 ALTER TABLE `django_apscheduler_djangojob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_apscheduler_djangojobexecution`
--

DROP TABLE IF EXISTS `django_apscheduler_djangojobexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_apscheduler_djangojobexecution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) COLLATE utf8_bin NOT NULL,
  `run_time` datetime(6) NOT NULL,
  `duration` decimal(15,2) DEFAULT NULL,
  `started` decimal(15,2) DEFAULT NULL,
  `finished` decimal(15,2) DEFAULT NULL,
  `exception` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `traceback` longtext COLLATE utf8_bin DEFAULT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_apscheduler_d_job_id_daf5090a_fk_django_ap` (`job_id`),
  KEY `django_apscheduler_djangojobexecution_run_time_16edd96b` (`run_time`),
  CONSTRAINT `django_apscheduler_d_job_id_daf5090a_fk_django_ap` FOREIGN KEY (`job_id`) REFERENCES `django_apscheduler_djangojob` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_apscheduler_djangojobexecution`
--

LOCK TABLES `django_apscheduler_djangojobexecution` WRITE;
/*!40000 ALTER TABLE `django_apscheduler_djangojobexecution` DISABLE KEYS */;
INSERT INTO `django_apscheduler_djangojobexecution` VALUES (1,'Executed','2020-02-06 17:41:45.272698',0.00,1580985705.29,1580985705.29,NULL,NULL,3),(2,'Started execution','2020-02-06 17:49:47.696236',NULL,1580986187.71,NULL,NULL,NULL,3),(3,'Executed','2020-02-06 17:49:47.696236',0.00,NULL,1580986187.72,NULL,NULL,3),(4,'Executed','2020-02-06 17:49:47.696236',0.01,1580986187.71,1580986187.72,NULL,NULL,3),(5,'Executed','2020-02-06 17:50:47.696236',0.00,1580986247.72,1580986247.72,NULL,NULL,3),(6,'Executed','2020-02-06 17:51:47.696236',0.01,1580986307.71,1580986307.72,NULL,NULL,3);
/*!40000 ALTER TABLE `django_apscheduler_djangojobexecution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(8,'authtoken','token'),(6,'contenttypes','contenttype'),(45,'django_apscheduler','djangojob'),(53,'django_apscheduler','djangojobexecution'),(54,'otp_static','staticdevice'),(55,'otp_static','statictoken'),(56,'otp_totp','totpdevice'),(7,'sessions','session'),(57,'two_factor','phonedevice'),(41,'uihlinenotify','linenotifyconfig'),(23,'uihlinenotify','view'),(42,'uihlogcollectoralert','mapcompanylinealert'),(43,'uihlogcollectoralert','messagealertconfig'),(24,'uihlogcollectoralert','view'),(60,'uihlogcollectoranalytic','companygraphreport'),(59,'uihlogcollectoranalytic','reportgraphconfig'),(58,'uihlogcollectoranalytic','reportgraphtemplate'),(69,'uihlogcollectorireport','reportjasperpdfhistory'),(68,'uihlogcollectorireport','reportjaspertemplate'),(70,'uihlogcollectorireport','reportjaspertemplatebycompany'),(22,'uihlogcollectorrestserver','expiringtoken'),(1,'uihlogdashboard','view'),(46,'uihlogmodels','adminreorderconfig'),(25,'uihlogmodels','aliveconfig'),(51,'uihlogmodels','appeventlog'),(9,'uihlogmodels','authkey'),(33,'uihlogmodels','authuserloginhistory'),(52,'uihlogmodels','authuserpassword'),(38,'uihlogmodels','authuserprofile'),(40,'uihlogmodels','authusersession'),(66,'uihlogmodels','branch'),(50,'uihlogmodels','companyloglicence'),(17,'uihlogmodels','companylogpackage'),(30,'uihlogmodels','companymessage'),(18,'uihlogmodels','companyprofile'),(34,'uihlogmodels','configintrusiondetection'),(35,'uihlogmodels','devicetype'),(39,'uihlogmodels','emailconfig'),(44,'uihlogmodels','eventlog'),(65,'uihlogmodels','gpvpnfail'),(64,'uihlogmodels','gpvpnsuccess'),(36,'uihlogmodels','intrusiondetectionhistory'),(10,'uihlogmodels','logcollector'),(28,'uihlogmodels','logcollectoralert'),(26,'uihlogmodels','logcollectoralive'),(47,'uihlogmodels','logcollectorresource'),(11,'uihlogmodels','logcollectorstatus'),(62,'uihlogmodels','logcollectorstatushistory'),(48,'uihlogmodels','mailmessage'),(49,'uihlogmodels','mailtemplate'),(19,'uihlogmodels','mapcompanyauthgroup'),(67,'uihlogmodels','mapcompanymailtemplate'),(12,'uihlogmodels','moduleconfig'),(13,'uihlogmodels','modulepublicviewconfig'),(20,'uihlogmodels','privatekeyssh'),(31,'uihlogmodels','schedulertaskconfig'),(37,'uihlogmodels','searchconfig'),(14,'uihlogmodels','source'),(29,'uihlogmodels','sourcealert'),(27,'uihlogmodels','sourcealive'),(15,'uihlogmodels','sourcestatus'),(61,'uihlogmodels','sourcestatushistory'),(63,'uihlogmodels','sourcetimeperiodrules'),(16,'uihlogmodels','sourceusage'),(32,'uihlogmodels','sourceusagehistory'),(21,'uihlogmodels','systemconfig');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-01-29 15:39:50.304356'),(2,'auth','0001_initial','2019-01-29 15:39:51.965932'),(3,'admin','0001_initial','2019-01-29 15:39:52.345272'),(4,'admin','0002_logentry_remove_auto_add','2019-01-29 15:39:52.364272'),(5,'admin','0003_logentry_add_action_flag_choices','2019-01-29 15:39:52.374276'),(6,'contenttypes','0002_remove_content_type_name','2019-01-29 15:39:52.605360'),(7,'auth','0002_alter_permission_name_max_length','2019-01-29 15:39:52.769370'),(8,'auth','0003_alter_user_email_max_length','2019-01-29 15:39:52.935379'),(9,'auth','0004_alter_user_username_opts','2019-01-29 15:39:52.952381'),(10,'auth','0005_alter_user_last_login_null','2019-01-29 15:39:53.071387'),(11,'auth','0006_require_contenttypes_0002','2019-01-29 15:39:53.079387'),(12,'auth','0007_alter_validators_add_error_messages','2019-01-29 15:39:53.094388'),(13,'auth','0008_alter_user_username_max_length','2019-01-29 15:39:53.254397'),(14,'auth','0009_alter_user_last_name_max_length','2019-01-29 15:39:53.420422'),(15,'authtoken','0001_initial','2019-01-29 15:39:53.628434'),(16,'authtoken','0002_auto_20160226_1747','2019-01-29 15:39:53.830448'),(17,'sessions','0001_initial','2019-01-29 15:39:53.914452'),(18,'uihlogcollectorrestserver','0001_initial','2019-01-29 15:39:53.923452'),(19,'uihlogmodels','0001_initial','2019-01-29 15:39:55.271940'),(20,'uihlogmodels','0002_auto_20181225_1211','2019-01-29 15:39:56.249007'),(21,'uihlogmodels','0003_add_permission','2019-01-29 15:39:56.284005'),(22,'uihlogmodels','0004_auto_20190107_1209','2019-01-29 15:39:56.375016'),(23,'uihlogmodels','0005_auto_20190107_1233','2019-01-29 15:39:56.409014'),(24,'uihlogmodels','0006_sourceusage_source_date','2019-01-29 15:39:56.424015'),(25,'uihlogmodels','0007_privatekeyssh','2019-01-29 15:39:56.638026'),(26,'uihlogmodels','0008_add_permission','2019-01-29 15:39:56.673033'),(27,'uihlogmodels','0009_add_permission','2019-01-29 15:39:56.704031'),(28,'uihlogmodels','0010_systemconfig','2019-01-29 15:39:56.753032'),(29,'uihlogmodels','0011_systemconfig_insert','2019-01-29 15:39:56.788034'),(30,'uihlogmodels','0012_source_color','2019-01-29 15:39:56.806035'),(31,'uihlogmodels','0013_systemcomfig_insert','2019-01-29 15:39:56.838038'),(32,'uihlogmodels','0014_add_permission','2019-01-29 15:39:56.875040'),(33,'uihlogmodels','0015_add_field','2019-01-29 15:39:56.900575'),(34,'uihlogmodels','0016_add_permission','2019-01-29 15:39:56.931577'),(35,'uihlogmodels','0017_add_permission','2019-01-29 15:39:56.964578'),(36,'uihlogmodels','0018_systemconfig_insert','2019-01-29 15:39:56.994581'),(37,'uihlogmodels','0019_systemconfig_insert','2019-01-29 15:39:57.030589'),(38,'auth','0010_alter_group_name_max_length','2019-04-19 17:26:00.125473'),(39,'auth','0011_update_proxy_permissions','2019-04-19 17:26:00.236352'),(40,'uihlinenotify','0001_initial','2019-04-19 17:26:00.584150'),(41,'uihlinenotify','0002_auto_20180903_1018','2019-04-19 17:26:00.652343'),(42,'uihlinenotify','0003_add_permission','2019-04-19 17:26:00.828058'),(43,'uihlogmodels','0020_aliveconfig_logcollectoralive_sourcealive','2019-04-19 17:26:01.854100'),(44,'uihlogmodels','0021_aliveconfig_insert','2019-04-19 17:26:07.004846'),(45,'uihlogmodels','0022_logcollectoralert_sourcealert','2019-04-19 17:26:07.862211'),(46,'uihlogmodels','0023_aliveconfig_is_alert','2019-04-19 17:26:12.884295'),(47,'uihlogmodels','0024_companymessage','2019-04-19 17:26:13.331067'),(48,'uihlogmodels','0025_auto_20190212_1023','2019-04-19 17:26:15.811618'),(49,'uihlogmodels','0026_auto_20190213_1432','2019-04-19 17:26:18.307292'),(50,'uihlogmodels','0027_auto_20190213_1435','2019-04-19 17:26:21.134907'),(51,'uihlogmodels','0028_schedulertaskconfig','2019-04-19 17:26:21.604576'),(52,'uihlogmodels','0029_schedulertaskconfig_insert','2019-04-19 17:26:21.756980'),(53,'uihlogmodels','0030_auto_20190214_1500','2019-04-19 17:26:22.830205'),(54,'uihlogmodels','0031_systemconfig_insert','2019-04-19 17:26:22.993569'),(55,'uihlogmodels','0032_auto_20190214_1741','2019-04-19 17:26:23.245964'),(56,'uihlogmodels','0033_aliveconfig_is_alive','2019-04-19 17:26:23.390123'),(57,'uihlogmodels','0034_update_alive_config','2019-04-19 17:26:23.533072'),(58,'uihlogmodels','0035_sourceusagehistory','2019-04-19 17:26:24.011013'),(59,'uihlogmodels','0036_authuserloginhistory','2019-04-19 17:26:25.605434'),(60,'uihlogmodels','0037_logcollectorstatus_event_per_sec','2019-04-19 17:26:25.705715'),(61,'uihlogmodels','0038_moduleconfig_app_name','2019-04-19 17:26:25.952012'),(62,'uihlogmodels','0039_insert_module_config_linenotify','2019-04-19 17:26:26.118805'),(63,'uihlogmodels','0040_add_permission','2019-04-19 17:26:26.228096'),(64,'uihlogmodels','0041_add_permission_collector_status','2019-04-19 17:26:26.377598'),(65,'uihlogmodels','0042_update_module_config','2019-04-19 17:26:26.528951'),(66,'uihlogmodels','0043_update_system_version','2019-04-19 17:26:26.770548'),(67,'uihlogmodels','0044_add_permission','2019-04-19 17:26:26.929180'),(68,'uihlogmodels','0045_add_server_company_private_key_ssh','2019-04-19 17:26:27.295987'),(69,'uihlogmodels','0046_auto_20190314_0928','2019-04-19 17:26:28.735937'),(70,'uihlogmodels','0047_auto_20190319_1259','2019-04-19 17:26:33.554852'),(71,'uihlogmodels','0048_searchconfig','2019-04-19 17:26:34.115544'),(72,'uihlogmodels','0049_change_search_config','2019-04-19 17:26:36.864703'),(73,'uihlogmodels','0050_insert_data_device_type_intrusion','2019-04-19 17:26:37.249053'),(74,'uihlogmodels','0051_companyprofile_userprofile','2019-04-19 17:26:38.857077'),(75,'uihlogmodels','0052_add_permission','2019-04-19 17:26:40.155476'),(76,'uihlogmodels','0053_systemconfig_insert','2019-04-19 17:26:40.413922'),(77,'uihlogmodels','0054_insert_module_analytic','2019-04-19 17:26:40.731132'),(78,'uihlogmodels','0055_auto_20190403_1713','2019-04-19 17:26:41.307836'),(79,'uihlogmodels','0056_systemconfig_insert','2019-04-19 17:26:42.578071'),(80,'uihlogmodels','0057_add_permission_group','2019-04-19 17:26:42.896052'),(81,'uihlogmodels','0058_authusersession','2019-04-19 17:26:43.261293'),(82,'uihlogcollectoralert','0001_initial_uihlogcollectoralert','2019-04-19 17:27:33.554841'),(83,'uihlogcollectoralert','0002_messagealertconfig','2019-04-19 17:27:36.497088'),(84,'uihlogcollectoralert','0003_insert_message_alert_config','2019-04-19 17:27:36.670402'),(85,'uihlogcollectoralert','0004_auto_20190211_1747','2019-04-19 17:27:36.809655'),(86,'uihlogcollectoralert','0005_add_permission','2019-04-19 17:27:37.100459'),(87,'uihlogmodels','0059_auto_20190426_1837','2019-04-30 10:12:25.936983'),(88,'uihlogmodels','0060_auto_20190429_0934','2019-04-30 10:12:27.597712'),(89,'django_apscheduler','0001_initial','2019-11-28 14:10:32.316478'),(90,'django_apscheduler','0002_auto_20180412_0758','2019-11-28 14:10:32.472487'),(91,'otp_static','0001_initial','2019-11-28 14:10:32.665495'),(92,'otp_totp','0001_initial','2019-11-28 14:10:32.832507'),(93,'otp_totp','0002_auto_20190420_0723','2019-11-28 14:10:32.885508'),(94,'two_factor','0001_initial','2019-11-28 14:10:32.917513'),(95,'two_factor','0002_auto_20150110_0810','2019-11-28 14:10:32.952513'),(96,'two_factor','0003_auto_20150817_1733','2019-11-28 14:10:33.015516'),(97,'two_factor','0004_auto_20160205_1827','2019-11-28 14:10:33.043519'),(98,'two_factor','0005_auto_20160224_0450','2019-11-28 14:10:33.145528'),(99,'two_factor','0006_phonedevice_key_default','2019-11-28 14:10:33.161526'),(100,'uihlogcollectoralert','0006_add_permission','2019-11-28 14:10:33.234529'),(101,'uihlogmodels','0061_add_permission','2019-11-28 14:10:33.293532'),(102,'uihlogmodels','0062_add_permission','2019-11-28 14:10:33.345535'),(103,'uihlogmodels','0063_adminreorderconfig','2019-11-28 14:10:33.411539'),(104,'uihlogmodels','0064_insert_admin_reorder','2019-11-28 14:10:33.466543'),(105,'uihlogmodels','0065_logcollectorresource','2019-11-28 14:10:33.560549'),(106,'uihlogmodels','0066_auto_20190515_1537','2019-11-28 14:10:33.720556'),(107,'uihlogmodels','0067_auto_20190517_1142','2019-11-28 14:10:33.784566'),(108,'uihlogmodels','0068_mailmessage','2019-11-28 14:10:33.840563'),(109,'uihlogmodels','0069_auto_20190521_1640','2019-11-28 14:10:33.898568'),(110,'uihlogmodels','0070_source_source_refer','2019-11-28 14:10:33.924569'),(111,'uihlogmodels','0071_mailmessage_company','2019-11-28 14:10:33.942570'),(112,'uihlogmodels','0072_mailtemplate','2019-11-28 14:10:34.181584'),(113,'uihlogmodels','0073_copy_field_source_refer','2019-11-28 14:10:34.235587'),(114,'uihlogmodels','0074_add_mail_template','2019-11-28 14:10:34.368595'),(115,'uihlogmodels','0075_add_field_company_profile','2019-11-28 14:10:34.425597'),(116,'uihlogmodels','0076_privatekeyssh_default_path','2019-11-28 14:10:34.456601'),(117,'uihlogmodels','0077_change_field_type','2019-11-28 14:10:34.569608'),(118,'uihlogmodels','0078_companyloglicence','2019-11-28 14:10:34.607609'),(119,'uihlogmodels','0079_companylogpackage_licence_key','2019-11-28 14:10:34.645611'),(120,'uihlogmodels','0080_systemconfig_add_urlweb','2019-11-28 14:10:34.702613'),(121,'uihlogmodels','0081_add_permission','2019-11-28 14:10:34.761617'),(122,'uihlogmodels','0082_appeventlog','2019-11-28 14:10:34.817622'),(123,'uihlogmodels','0083_auto_20190705_1033','2019-11-28 14:10:34.914634'),(124,'uihlogcollectoranalytic','0001_initial_analytic','2019-11-28 14:10:35.024635'),(125,'uihlogcollectoranalytic','0002_insert_config','2019-11-28 14:10:35.192643'),(126,'uihlogcollectoranalytic','0003_insert_config_reportpi','2019-11-28 14:10:35.247646'),(127,'uihlogcollectoranalytic','0004_insert_config_reportsankey','2019-11-28 14:10:35.307649'),(128,'uihlogmodels','0084_add_mail_template','2019-11-28 14:10:35.422658'),(129,'uihlogmodels','0085_change_field_mailmessage','2019-11-28 14:10:35.468659'),(130,'uihlogmodels','0086_add_mail_template','2019-11-28 14:10:35.530661'),(131,'uihlogmodels','0087_change_field_mailmessage','2019-11-28 14:10:35.631666'),(132,'uihlogmodels','0088_change_field_companyprofile','2019-11-28 14:10:35.687668'),(133,'uihlogmodels','0089_add_mail_template','2019-11-28 14:10:35.749673'),(134,'uihlogmodels','0090_mailtemplate_subject','2019-11-28 14:10:35.758672'),(135,'uihlogmodels','0091_companyprofile_expire_password','2019-11-28 14:10:35.780674'),(136,'uihlogmodels','0092_authuserpassword','2019-11-28 14:10:35.840676'),(137,'uihlogmodels','0093_add_mail_template','2019-11-28 14:10:35.989685'),(138,'uihlogmodels','0094_systemconfig_add_exppassword','2019-11-28 14:10:36.046689'),(139,'uihlogmodels','0095_companyprofile_change_field','2019-11-28 14:10:36.207696'),(140,'uihlogmodels','0096_change_field_authusersession','2019-11-28 14:10:36.324703'),(141,'uihlogmodels','0097_emailconfig_is_api','2019-11-28 14:10:36.342705'),(142,'uihlogmodels','0098_mailtemplate_add_field','2019-11-28 14:10:36.358705'),(143,'uihlogmodels','0099_auto_20191105_1319','2019-11-28 14:10:36.461712'),(144,'uihlogmodels','0100_auto_20191113_1412','2020-02-06 17:40:07.924717'),(145,'uihlogmodels','0101_logcollectorstatushistory_sourcestatushistory','2020-02-06 17:40:08.071677'),(146,'uihlogmodels','0102_auto_20200115_1413','2020-02-06 17:40:08.405614'),(147,'uihlogmodels','0103_gpvpnfail_gpvpnsuccess','2020-02-06 17:40:08.524399'),(148,'uihlogmodels','0104_branch','2020-02-06 17:40:08.606610'),(149,'uihlogmodels','0105_mapcompanymailtemplate','2020-02-06 17:40:08.752273'),(150,'uihlogmodels','0106_change_table_branch','2020-02-06 17:40:08.814874'),(151,'uihlogmodels','0107_add_host_table_gp','2020-02-06 17:40:09.019852'),(152,'uihlogcollectorireport','0001_initial','2020-02-06 17:42:51.041625'),(153,'uihlogcollectorireport','0002_reportjaspertemplatebycompany','2020-02-06 17:42:51.115010');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('09k55qbgixgna4igs1rtbc2rty63mb1d','NWRkNGJhNWYwNmU1NGNjYWZkNDdhYmM1NmRlYzg4NWIxZjJjNDkxMjp7IndpemFyZF9sb2dpbl92aWV3Ijp7InN0ZXAiOm51bGwsInN0ZXBfZGF0YSI6e30sInN0ZXBfZmlsZXMiOnt9LCJleHRyYV9kYXRhIjp7fSwidmFsaWRhdGVkX3N0ZXBfZGF0YSI6e319LCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWY2NGU1OTJhMGRlMDE0MmE3MWFiZGUxNjZjMGY5YzUzOTIwZmVhMiJ9','2020-02-06 18:41:00.124026');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_config`
--

DROP TABLE IF EXISTS `email_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_name` varchar(255) DEFAULT NULL,
  `email_backend` varchar(255) DEFAULT NULL,
  `email_host` varchar(255) DEFAULT NULL,
  `email_use_tls` tinyint(1) NOT NULL,
  `email_port` int(11) DEFAULT NULL,
  `email_host_user` varchar(255) DEFAULT NULL,
  `email_host_password` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `is_api` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_config`
--

LOCK TABLES `email_config` WRITE;
/*!40000 ALTER TABLE `email_config` DISABLE KEYS */;
INSERT INTO `email_config` VALUES (1,'Gmail logyousystem.poc@gmail.com','django.core.mail.backends.smtp.EmailBackend','smtp.gmail.com',1,587,'logyousystem.poc@gmail.com','Asdf@1234!',1,'2019-04-29 13:25:53.247134',0),(2,'Gmail logyousystem@gmail.com','django.core.mail.backends.smtp.EmailBackend','smtp.gmail.com',1,587,'logyousystem@gmail.com','M@il!@18B',1,'2019-11-29 16:14:32.219727',0),(3,'UIH Mail Server','django.core.mail.backends.smtp.EmailBackend','172.16.32.11',0,25,NULL,NULL,1,'2019-11-29 16:15:06.315755',0);
/*!40000 ALTER TABLE `email_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gp_vpn_fail`
--

DROP TABLE IF EXISTS `gp_vpn_fail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gp_vpn_fail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `public_ip` varchar(255) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `private_ip` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `login_time` datetime(6) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gp_vpn_fail_company_id_0f144d46_fk_company_profile_id` (`company_id`),
  CONSTRAINT `gp_vpn_fail_company_id_0f144d46_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gp_vpn_fail`
--

LOCK TABLES `gp_vpn_fail` WRITE;
/*!40000 ALTER TABLE `gp_vpn_fail` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_vpn_fail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gp_vpn_success`
--

DROP TABLE IF EXISTS `gp_vpn_success`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gp_vpn_success` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public_ip` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `private_ip` varchar(255) DEFAULT NULL,
  `login_time` datetime(6) DEFAULT NULL,
  `logout_time` datetime(6) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gp_vpn_success_company_id_66619833_fk_company_profile_id` (`company_id`),
  CONSTRAINT `gp_vpn_success_company_id_66619833_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gp_vpn_success`
--

LOCK TABLES `gp_vpn_success` WRITE;
/*!40000 ALTER TABLE `gp_vpn_success` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_vpn_success` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intrusion_detection_config`
--

DROP TABLE IF EXISTS `intrusion_detection_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intrusion_detection_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `filter_type` varchar(1) DEFAULT NULL,
  `filter` longtext DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `send_message` longtext DEFAULT NULL,
  `is_alert` tinyint(1) DEFAULT NULL,
  `is_alert_line` tinyint(1) DEFAULT NULL,
  `is_alert_mail` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `device_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `intrusion_detection__device_type_id_98f92286_fk_device_ty` (`device_type_id`),
  CONSTRAINT `intrusion_detection__device_type_id_98f92286_fk_device_ty` FOREIGN KEY (`device_type_id`) REFERENCES `device_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intrusion_detection_config`
--

LOCK TABLES `intrusion_detection_config` WRITE;
/*!40000 ALTER TABLE `intrusion_detection_config` DISABLE KEYS */;
INSERT INTO `intrusion_detection_config` VALUES (1,'windows-security','An account failed to log on','1','5400',0,'An account failed to log on',0,0,0,1,'2019-04-19 17:26:37.097258',1),(2,'windows-security','A user account was changed','1','4738',0,'A user account was changed',0,0,0,1,'2019-04-19 17:26:37.097711',1),(3,'windows-security','An attempt was made to change an account\'s password','1','4723',0,'An attempt was made to change an account\'s password',0,0,0,1,'2019-04-19 17:26:37.098029',1),(4,'windows-security','A computer account was created','1','4741',0,'A computer account was created',0,0,0,1,'2019-04-19 17:26:37.197136',1),(5,'windows-security','A user account was disabled','1','4725',0,'A user account was disabled',0,0,0,1,'2019-04-19 17:26:37.197473',1),(6,'windows-security','A user account was enabled','1','4722',0,'A user account was enabled',0,0,0,1,'2019-04-19 17:26:37.197833',1),(7,'windows-security','A user account was deleted','1','4726',0,'A user account was deleted',0,0,0,1,'2019-04-19 17:26:37.198109',1),(8,'windows-security','A user account was created','1','4720',0,'A user account was created',0,0,0,1,'2019-04-19 17:26:37.198373',1),(9,'windows-security','A user account was unlocked','1','4767',0,'A user account was unlocked',0,0,0,1,'2019-04-19 17:26:37.198636',1),(10,'windows-security','An account was successfully logged on','1','4624',0,'An account was successfully logged on',0,0,0,1,'2019-04-19 17:26:37.198902',1),(11,'windows-security','An account failed to log on','1','4625',0,'An account failed to log on',0,0,0,1,'2019-04-19 17:26:37.199166',1),(12,'SonicWall','SonicWall error','1','98',0,'SonicWall error',0,0,0,1,'2019-04-19 17:26:37.199409',3),(13,'SonicWall Config Change 1432','SonicWall Config Change 1432','2','(.)*(\\|1432\\|)',0,'SonicWall Config Change 1432',0,0,0,1,'2019-04-19 17:26:37.199648',3),(14,'SonicWall All login 230','SonicWall All login 230','2','(.)*(\\|230\\|)',0,'SonicWall All login 230',0,0,0,1,'2019-04-19 17:26:37.199886',3),(15,'SonicWall All login 29','SonicWall All login 29','2','(.)*(\\|29\\|)',0,'SonicWall All login 29',0,0,0,1,'2019-04-19 17:26:37.200123',3),(16,'SonicWall All login 30','SonicWall All login 30','2','(.)*(\\|30\\|)',0,'SonicWall All login 30',0,0,0,1,'2019-04-19 17:26:37.200360',3),(17,'SonicWall All login 31','SonicWall All login 31','2','(.)*(\\|31\\|)',0,'SonicWall All login 31',0,0,0,1,'2019-04-19 17:26:37.200593',3),(18,'SonicWall All login 32','SonicWall All login 32','2','(.)*(\\|32\\|)',0,'SonicWall All login 32',0,0,0,1,'2019-04-19 17:26:37.200828',3),(19,'Threat From internet 82','Threat From internet 82','2','(.)*(\\|82\\|)',0,'Threat From internet 82',0,0,0,1,'2019-04-19 17:26:37.201065',3),(20,'Threat From internet 446','Threat From internet 446','2','(.)*(\\|446\\|)',0,'Threat From internet 446',0,0,0,1,'2019-04-19 17:26:37.201300',3),(21,'Threat From internet 1369','Threat From internet 1369','2','(.)*(\\|1369\\|)',0,'Threat From internet 1369',0,0,0,1,'2019-04-19 17:26:37.201536',3),(22,'Threat From internet 1370','Threat From internet 1370','2','(.)*(\\|1370\\|)',0,'Threat From internet 1370',0,0,0,1,'2019-04-19 17:26:37.201773',3),(23,'Threat From internet 1371','Threat From internet 1371','2','(.)*(\\|1371\\|)',0,'Threat From internet 1371',0,0,0,1,'2019-04-19 17:26:37.202036',3),(24,'Cisco Switch WC-2960 Change CFGLOG_LOGGEDCMD','Cisco Switch WC-2960 Change CFGLOG_LOGGEDCMD','2','(.)*(CFGLOG_LOGGEDCMD)',0,'Cisco Switch WC-2960 Change CFGLOG_LOGGEDCMD',0,0,0,1,'2019-04-19 17:26:37.202272',4),(25,'Cisco Switch WC-2960 Login success LOGIN_SUCCESS','Cisco Switch WC-2960 Login success LOGIN_SUCCESS','2','(.)*(LOGIN_SUCCESS)',0,'Cisco Switch WC-2960 Login success LOGIN_SUCCESS',0,0,0,1,'2019-04-19 17:26:37.202530',4),(26,'Cisco Switch WC-2960 Login failed LOGIN_FAILED','Cisco Switch WC-2960 Login failed LOGIN_FAILED','2','(.)*(LOGIN_FAILED)',0,'Cisco Switch WC-2960 Login failed LOGIN_FAILED',0,0,0,1,'2019-04-19 17:26:37.202794',4);
/*!40000 ALTER TABLE `intrusion_detection_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intrusion_detection_history`
--

DROP TABLE IF EXISTS `intrusion_detection_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intrusion_detection_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `send_message` longtext DEFAULT NULL,
  `log_name` longtext DEFAULT NULL,
  `is_alert` tinyint(1) DEFAULT NULL,
  `host` longtext DEFAULT NULL,
  `log_datetime` datetime(6) DEFAULT NULL,
  `log_origin` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `intrusion_detection_config_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `intrusion_detection__intrusion_detection__1548a262_fk_intrusion` (`intrusion_detection_config_id`),
  KEY `intrusion_detection_history_source_id_dbbe3714_fk_source_id` (`source_id`),
  CONSTRAINT `intrusion_detection__intrusion_detection__1548a262_fk_intrusion` FOREIGN KEY (`intrusion_detection_config_id`) REFERENCES `intrusion_detection_config` (`id`),
  CONSTRAINT `intrusion_detection_history_source_id_dbbe3714_fk_source_id` FOREIGN KEY (`source_id`) REFERENCES `source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intrusion_detection_history`
--

LOCK TABLES `intrusion_detection_history` WRITE;
/*!40000 ALTER TABLE `intrusion_detection_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `intrusion_detection_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_notify_config`
--

DROP TABLE IF EXISTS `line_notify_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_notify_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_notify_config`
--

LOCK TABLES `line_notify_config` WRITE;
/*!40000 ALTER TABLE `line_notify_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `line_notify_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logcollector`
--

DROP TABLE IF EXISTS `logcollector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logcollector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_public` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_private` varchar(255) COLLATE utf8_bin NOT NULL,
  `cpu` double DEFAULT NULL,
  `ram` double DEFAULT NULL,
  `hdd` double DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `authkey_id` int(11) DEFAULT NULL,
  `hdd_store_day` int(11) DEFAULT NULL,
  `hdd_store_over` double DEFAULT NULL,
  `hdd_store_per_day` double DEFAULT NULL,
  `hwdetail` longtext COLLATE utf8_bin DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `authkey_id` (`authkey_id`) USING BTREE,
  CONSTRAINT `logcollector_authkey_id_e42086f5_fk_authkey_id` FOREIGN KEY (`authkey_id`) REFERENCES `authkey` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logcollector`
--

LOCK TABLES `logcollector` WRITE;
/*!40000 ALTER TABLE `logcollector` DISABLE KEYS */;
INSERT INTO `logcollector` VALUES (1,'localhost1','server','127.0.0.1','127.0.0.1',2,8,20000000000,'2019-01-29 16:27:04.988841',1,45,120,100000,'','');
/*!40000 ALTER TABLE `logcollector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logcollector_alert`
--

DROP TABLE IF EXISTS `logcollector_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logcollector_alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alive_mins` bigint(20) DEFAULT NULL,
  `log_datetime` datetime(6) DEFAULT NULL,
  `alerted` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `alive_config_id` int(11) DEFAULT NULL,
  `logcollector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logcollector_alert_alive_config_id_80783dd7_fk_alive_config_id` (`alive_config_id`),
  KEY `logcollector_alert_logcollector_id_a43b4de1_fk_logcollector_id` (`logcollector_id`),
  CONSTRAINT `logcollector_alert_alive_config_id_80783dd7_fk_alive_config_id` FOREIGN KEY (`alive_config_id`) REFERENCES `alive_config` (`id`),
  CONSTRAINT `logcollector_alert_logcollector_id_a43b4de1_fk_logcollector_id` FOREIGN KEY (`logcollector_id`) REFERENCES `logcollector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logcollector_alert`
--

LOCK TABLES `logcollector_alert` WRITE;
/*!40000 ALTER TABLE `logcollector_alert` DISABLE KEYS */;
INSERT INTO `logcollector_alert` VALUES (1,62715590,'2019-07-22 17:14:01.000000',1,'2019-07-23 10:39:16.598012',3,1),(2,63195597,'2019-07-22 17:14:01.000000',1,'2019-07-23 10:43:16.607896',3,1),(3,63435600,'2019-07-22 17:14:01.000000',1,'2019-07-23 10:51:16.608790',3,1),(4,63675598,'2019-07-22 17:14:01.000000',1,'2019-07-23 10:55:16.607598',3,1),(5,63915598,'2019-07-22 17:14:01.000000',1,'2019-07-23 10:59:16.607008',3,1),(6,64395598,'2019-07-22 17:14:01.000000',1,'2019-07-23 11:03:16.608993',3,1),(7,64635602,'2019-07-22 17:14:01.000000',1,'2019-07-23 11:11:16.611685',3,1),(8,64875597,'2019-07-22 17:14:01.000000',1,'2019-07-23 11:15:16.605239',3,1),(9,65115588,'2019-07-22 17:14:01.000000',1,'2019-07-23 11:19:16.596247',3,1),(10,68716332,'2019-07-22 17:14:01.000000',1,'2019-07-23 12:19:18.282684',3,1);
/*!40000 ALTER TABLE `logcollector_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logcollector_alive`
--

DROP TABLE IF EXISTS `logcollector_alive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logcollector_alive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alive_mins` bigint(20) DEFAULT NULL,
  `log_datetime` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `alive_config_id` int(11) DEFAULT NULL,
  `logcollector_id` int(11) DEFAULT NULL,
  `count_alert_line` int(11) DEFAULT NULL,
  `count_alert_mail` int(11) DEFAULT NULL,
  `current_is_alive` tinyint(1) DEFAULT NULL,
  `old_is_alive` tinyint(1) DEFAULT NULL,
  `last_time_interval` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logcollector_alive_alive_config_id_fb6005c9_fk_alive_config_id` (`alive_config_id`),
  KEY `logcollector_alive_logcollector_id_f0da17c8_fk_logcollector_id` (`logcollector_id`),
  CONSTRAINT `logcollector_alive_alive_config_id_fb6005c9_fk_alive_config_id` FOREIGN KEY (`alive_config_id`) REFERENCES `alive_config` (`id`),
  CONSTRAINT `logcollector_alive_logcollector_id_f0da17c8_fk_logcollector_id` FOREIGN KEY (`logcollector_id`) REFERENCES `logcollector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logcollector_alive`
--

LOCK TABLES `logcollector_alive` WRITE;
/*!40000 ALTER TABLE `logcollector_alive` DISABLE KEYS */;
INSERT INTO `logcollector_alive` VALUES (1,11136048915,'2019-07-22 17:14:01.000000','2019-04-19 18:02:17.297086',4,1,10,0,0,0,'0');
/*!40000 ALTER TABLE `logcollector_alive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logcollector_resource`
--

DROP TABLE IF EXISTS `logcollector_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logcollector_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reserve_cpu` double DEFAULT NULL,
  `reserve_ram` double DEFAULT NULL,
  `reserve_hdd` double DEFAULT NULL,
  `start_time_cpu` datetime(6) DEFAULT NULL,
  `stop_time_cpu` datetime(6) DEFAULT NULL,
  `count_time_cpu` int(11) DEFAULT NULL,
  `start_time_ram` datetime(6) DEFAULT NULL,
  `stop_time_ram` datetime(6) DEFAULT NULL,
  `count_time_ram` int(11) DEFAULT NULL,
  `start_time_hdd` datetime(6) DEFAULT NULL,
  `stop_time_hdd` datetime(6) DEFAULT NULL,
  `count_time_hdd` int(11) DEFAULT NULL,
  `logcollector_id` int(11) DEFAULT NULL,
  `cpu_alerted` tinyint(1) DEFAULT NULL,
  `hdd_alerted` tinyint(1) DEFAULT NULL,
  `ram_alerted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `logcollector_id` (`logcollector_id`),
  CONSTRAINT `logcollector_resourc_logcollector_id_43716c45_fk_logcollec` FOREIGN KEY (`logcollector_id`) REFERENCES `logcollector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logcollector_resource`
--

LOCK TABLES `logcollector_resource` WRITE;
/*!40000 ALTER TABLE `logcollector_resource` DISABLE KEYS */;
INSERT INTO `logcollector_resource` VALUES (1,75,60,19460000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0);
/*!40000 ALTER TABLE `logcollector_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logcollector_status`
--

DROP TABLE IF EXISTS `logcollector_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logcollector_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_datetime` datetime(6) DEFAULT NULL,
  `cpu_usage` double DEFAULT NULL,
  `ram_usage` double DEFAULT NULL,
  `ram_free` double DEFAULT NULL,
  `hdd_usage` double DEFAULT NULL,
  `hdd_free` double DEFAULT NULL,
  `detail` longtext COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `logcollector_id` int(11) DEFAULT NULL,
  `log_date` date DEFAULT NULL,
  `log_time` time(6) DEFAULT NULL,
  `event_per_sec` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `logcollector_status_logcollector_id_aeea22d3_fk_logcollector_id` (`logcollector_id`) USING BTREE,
  CONSTRAINT `logcollector_status_logcollector_id_aeea22d3_fk_logcollector_id` FOREIGN KEY (`logcollector_id`) REFERENCES `logcollector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logcollector_status`
--

LOCK TABLES `logcollector_status` WRITE;
/*!40000 ALTER TABLE `logcollector_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `logcollector_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logcollector_status_history`
--

DROP TABLE IF EXISTS `logcollector_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logcollector_status_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `log_datetime` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `Logcollector_alive_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `logcollector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logcollector_status__Logcollector_alive_i_6ae2e499_fk_logcollec` (`Logcollector_alive_id`),
  KEY `logcollector_status__company_id_39ffe0bd_fk_company_p` (`company_id`),
  KEY `logcollector_status__logcollector_id_71d85ba6_fk_logcollec` (`logcollector_id`),
  CONSTRAINT `logcollector_status__Logcollector_alive_i_6ae2e499_fk_logcollec` FOREIGN KEY (`Logcollector_alive_id`) REFERENCES `logcollector_alive` (`id`),
  CONSTRAINT `logcollector_status__company_id_39ffe0bd_fk_company_p` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`),
  CONSTRAINT `logcollector_status__logcollector_id_71d85ba6_fk_logcollec` FOREIGN KEY (`logcollector_id`) REFERENCES `logcollector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logcollector_status_history`
--

LOCK TABLES `logcollector_status_history` WRITE;
/*!40000 ALTER TABLE `logcollector_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `logcollector_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_message_service`
--

DROP TABLE IF EXISTS `mail_message_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_message_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8_bin DEFAULT NULL,
  `message_type` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `template` longtext COLLATE utf8_bin DEFAULT NULL,
  `from_mail` longtext COLLATE utf8_bin DEFAULT NULL,
  `is_alert_line` tinyint(1) DEFAULT NULL,
  `is_alert_mail` tinyint(1) DEFAULT NULL,
  `sended` tinyint(1) NOT NULL,
  `sended_date` datetime(6) DEFAULT NULL,
  `create_date` datetime(6) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `to_mail` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_message_service_company_id_cb611f9a_fk_company_profile_id` (`company_id`),
  CONSTRAINT `mail_message_service_company_id_cb611f9a_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_message_service`
--

LOCK TABLES `mail_message_service` WRITE;
/*!40000 ALTER TABLE `mail_message_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_message_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_template`
--

DROP TABLE IF EXISTS `mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `template` longtext COLLATE utf8_bin DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `subject` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `is_customer` tinyint(1) DEFAULT NULL,
  `is_staff` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_template`
--

LOCK TABLES `mail_template` WRITE;
/*!40000 ALTER TABLE `mail_template` DISABLE KEYS */;
INSERT INTO `mail_template` VALUES (1,'source_status','Source Status: {status}\nCompany: {company}\nSource: {name}\nMessage: \"{message}\"\nResponse at: {alive_time}',1,'LogYou Source Status',0,1),(2,'collector_status','Collector Status: {status}\nCompany: {company}\nCollector: {name}\nMessage: \"{message}\"\nResponse at: {alive_time} ',1,'LogYou Collector Status',0,1),(3,'collector_cpu','Collector CPU Status: {status}\nCompany: {company}\nCollector: {name}\nMessage: \"{message}\"\nResponse at: {alive_time} ',1,'LogYou Collector CPU Status',0,1),(4,'collector_ram','Collector RAM Status: {status}\nCompany: {company}\nCollector: {name}\nMessage: \"{message}\"\nResponse at: {alive_time} ',1,'LogYou Collector RAM Status',0,1),(5,'collector_hdd','Collector HDD Status: {status}\nCompany: {company}\nCollector: {name}\nMessage: \"{message}\"\nResponse at: {alive_time} ',1,'LogYou Collector HDD Status',0,1),(6,'two_factor_token','Two factor authentication have been generated your token\nUsername: {name}\nCompany: {company}\nStatus: {status}\nToken: {message}\nCreated at: {alive_time}',1,'LogYou TwoFactor Token',1,1),(7,'two_factor_status','Two factor authentication have been changed\nUsername: {name}\nCompany: {company}\nStatus: {status}\nMessage: {message}\nResponse at: {alive_time}',1,'LogYou TwoFactor',1,1),(8,'download_log_file_status','Downloaded & generated your password to extract log files\nFile name: {name}\nCompany: {company}\nStatus: {status}\nPassword: {message}\nCreated at: {alive_time}',1,'LogYou Downloaded Log File',1,1),(9,'contact_mail_message','Mail message form user\nUser, Email: {name}\nCompany: {company}\nMessage: {message}\nCreated at: {alive_time}',1,'Contact Message:',0,1),(10,'source_log_matcher','Log matcher\nUser: {name}\nCompany: {company}\nMessage: {status}\nMessage Detail: {message}\nResponse at: {alive_time}',1,'LogYou Matching Message:',1,1),(11,'user_reset_password','Reset Password Token\nUser: {name}\nCompany: {company}\nReset Status: {status}\nReset Password Token: {message}\nResponse at: {alive_time}',1,'LogYou User Reset Password Token',1,1),(12,'source_log_matcher_vpn','Log VPN Connection\nUser: {name}\nCompany: {company}\nMessage: {status}\nMessage Detail: {message}\nCreated at: {alive_time}',1,'LogYou SSL VPN Connection Status',1,1);
/*!40000 ALTER TABLE `mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_company_auth_group`
--

DROP TABLE IF EXISTS `map_company_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_company_auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `map_company_auth_group_company_id_3ba427b0_fk_company_profile_id` (`company_id`) USING BTREE,
  KEY `map_company_auth_group_group_id_938b8a47_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `map_company_auth_group_company_id_3ba427b0_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`),
  CONSTRAINT `map_company_auth_group_group_id_938b8a47_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_company_auth_group`
--

LOCK TABLES `map_company_auth_group` WRITE;
/*!40000 ALTER TABLE `map_company_auth_group` DISABLE KEYS */;
INSERT INTO `map_company_auth_group` VALUES (1,'2019-01-29 16:25:08.434721',1,1,1),(3,'2019-07-24 17:13:43.701492',1,1,2);
/*!40000 ALTER TABLE `map_company_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_company_line_alert`
--

DROP TABLE IF EXISTS `map_company_line_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_company_line_alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `line_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `map_company_line_alert_company_id_900ef689_fk_company_profile_id` (`company_id`),
  KEY `map_company_line_alert_line_id_4e91ff63_fk_line_notify_config_id` (`line_id`),
  CONSTRAINT `map_company_line_alert_company_id_900ef689_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`),
  CONSTRAINT `map_company_line_alert_line_id_4e91ff63_fk_line_notify_config_id` FOREIGN KEY (`line_id`) REFERENCES `line_notify_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_company_line_alert`
--

LOCK TABLES `map_company_line_alert` WRITE;
/*!40000 ALTER TABLE `map_company_line_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_company_line_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_company_mail_template`
--

DROP TABLE IF EXISTS `map_company_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_company_mail_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_customer` tinyint(1) DEFAULT NULL,
  `is_staff` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `mail_template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `map_company_mail_tem_company_id_5455bb94_fk_company_p` (`company_id`),
  KEY `map_company_mail_tem_mail_template_id_a585d709_fk_mail_temp` (`mail_template_id`),
  CONSTRAINT `map_company_mail_tem_company_id_5455bb94_fk_company_p` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`),
  CONSTRAINT `map_company_mail_tem_mail_template_id_a585d709_fk_mail_temp` FOREIGN KEY (`mail_template_id`) REFERENCES `mail_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_company_mail_template`
--

LOCK TABLES `map_company_mail_template` WRITE;
/*!40000 ALTER TABLE `map_company_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_company_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_alert_config`
--

DROP TABLE IF EXISTS `message_alert_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_alert_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `message_type` varchar(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_alert_config`
--

LOCK TABLES `message_alert_config` WRITE;
/*!40000 ALTER TABLE `message_alert_config` DISABLE KEYS */;
INSERT INTO `message_alert_config` VALUES (1,'Alert for Collector','\nFound {company} Collector\n{collector} ({collectorip}) is not alive\nfor {timealive} ago.','1',1,'2019-04-19 17:27:36.544222'),(2,'Alert for Source','\nFound {company} source\n{source} ({sourceip}) is not send message log to collector ({collector})\nfor {timealive} ago.','2',1,'2019-04-19 17:27:36.545307');
/*!40000 ALTER TABLE `message_alert_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_config`
--

DROP TABLE IF EXISTS `module_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(155) COLLATE utf8_bin NOT NULL,
  `module` varchar(255) COLLATE utf8_bin NOT NULL,
  `install_app` varchar(255) COLLATE utf8_bin NOT NULL,
  `url_app` varchar(255) COLLATE utf8_bin NOT NULL,
  `url_path` varchar(255) COLLATE utf8_bin NOT NULL,
  `alis_url_app` varchar(255) COLLATE utf8_bin NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `app_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `module` (`module`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_config`
--

LOCK TABLES `module_config` WRITE;
/*!40000 ALTER TABLE `module_config` DISABLE KEYS */;
INSERT INTO `module_config` VALUES (1,'uihlogcollectorrestserver','uihlogcollectorrestserver','uihlogcollectorrestserver.apps.UihlogcollectorrestserverConfig','uihlogcollectorrestserver.urls','/api/','api',1,'2019-04-19 17:26:26.075896',NULL),(2,'uihlogmaintemplate','uihlogmaintemplate','uihlogmaintemplate.apps.UihlogmaintemplateConfig','uihlogmaintemplate.urls','/user/','user',1,'2019-04-19 17:26:26.481568',NULL),(3,'uihlogdashboard','uihlogdashboard','uihlogdashboard.apps.UihlogdashboardConfig','uihlogdashboard.urls','/web/','dashboard',1,'2019-04-19 17:26:26.482301',NULL),(4,'Uihlogcollectorsftpclient','Uihlogcollectorsftpclient','uihlogcollectorsftpclient.apps.UihlogcollectorsftpclientConfig','uihlogcollectorsftpclient.urls','/sftpclient/','sftpclient',1,'2019-04-19 17:26:26.483032',NULL),(5,'uihlogcollectoralert','uihlogcollectoralert','uihlogcollectoralert.apps.UihlogcollectoralertConfig','uihlogcollectoralert.urls','/config/alert/','alertalarm',1,'2019-04-19 17:26:26.483740','monitoralert'),(7,'uihlinenotify','uihlinenotify','uihlinenotify.apps.UihlinenotifyConfig','uihlinenotify.urls','/config/notify/','linenotify_config',1,'2019-04-19 17:26:26.485142','linenotify'),(8,'uihlogcollectoranalytic','uihlogcollectoranalytic','uihlogcollectoranalytic.apps.UihlogcollectoranalyticConfig','uihlogcollectoranalytic.urls','/analytic/','loganalytic',1,'2019-04-19 17:26:40.651800','loganalytic'),(9,'uihlogcollectorireport','uihlogcollectorireport','uihlogcollectorireport.apps.UihlogcollectorireportConfig','uihlogcollectorireport.urls','/ireport/','logireport',1,'2020-02-06 17:42:35.222792','logireport');
/*!40000 ALTER TABLE `module_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_public_view_config`
--

DROP TABLE IF EXISTS `module_public_view_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_public_view_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(155) COLLATE utf8_bin NOT NULL,
  `module` varchar(255) COLLATE utf8_bin NOT NULL,
  `install_app` varchar(255) COLLATE utf8_bin NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `module` (`module`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_public_view_config`
--

LOCK TABLES `module_public_view_config` WRITE;
/*!40000 ALTER TABLE `module_public_view_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_public_view_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_static_staticdevice`
--

DROP TABLE IF EXISTS `otp_static_staticdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otp_static_staticdevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `otp_static_staticdevice_user_id_7f9cff2b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `otp_static_staticdevice_user_id_7f9cff2b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_static_staticdevice`
--

LOCK TABLES `otp_static_staticdevice` WRITE;
/*!40000 ALTER TABLE `otp_static_staticdevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp_static_staticdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_static_statictoken`
--

DROP TABLE IF EXISTS `otp_static_statictoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otp_static_statictoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(16) COLLATE utf8_bin NOT NULL,
  `device_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `otp_static_statictok_device_id_74b7c7d1_fk_otp_stati` (`device_id`),
  KEY `otp_static_statictoken_token_d0a51866` (`token`),
  CONSTRAINT `otp_static_statictok_device_id_74b7c7d1_fk_otp_stati` FOREIGN KEY (`device_id`) REFERENCES `otp_static_staticdevice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_static_statictoken`
--

LOCK TABLES `otp_static_statictoken` WRITE;
/*!40000 ALTER TABLE `otp_static_statictoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp_static_statictoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_totp_totpdevice`
--

DROP TABLE IF EXISTS `otp_totp_totpdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otp_totp_totpdevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `key` varchar(80) COLLATE utf8_bin NOT NULL,
  `step` smallint(5) unsigned NOT NULL,
  `t0` bigint(20) NOT NULL,
  `digits` smallint(5) unsigned NOT NULL,
  `tolerance` smallint(5) unsigned NOT NULL,
  `drift` smallint(6) NOT NULL,
  `last_t` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `throttling_failure_count` int(10) unsigned NOT NULL,
  `throttling_failure_timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `otp_totp_totpdevice_user_id_0fb18292_fk_auth_user_id` (`user_id`),
  CONSTRAINT `otp_totp_totpdevice_user_id_0fb18292_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_totp_totpdevice`
--

LOCK TABLES `otp_totp_totpdevice` WRITE;
/*!40000 ALTER TABLE `otp_totp_totpdevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp_totp_totpdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_graph_config`
--

DROP TABLE IF EXISTS `report_graph_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_graph_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` longtext COLLATE utf8_bin DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_bin NOT NULL,
  `key` varchar(255) COLLATE utf8_bin NOT NULL,
  `query` longtext COLLATE utf8_bin NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `report_template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_graph_config_report_template_id_dfd0cf78_fk_report_gr` (`report_template_id`),
  CONSTRAINT `report_graph_config_report_template_id_dfd0cf78_fk_report_gr` FOREIGN KEY (`report_template_id`) REFERENCES `report_graph_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_graph_config`
--

LOCK TABLES `report_graph_config` WRITE;
/*!40000 ALTER TABLE `report_graph_config` DISABLE KEYS */;
INSERT INTO `report_graph_config` VALUES (1,'Top Service','Top Service','Top Service','TOP_SERVICE','{\"field\":\"app.keyword\", \"max\":10}',1,1),(2,'Top Source Service','Top Source Service','Top Source Service','TOP_SOURCE','{\"field\":\"srcip.keyword\", \"max\":10}',1,2),(3,'Top Destination Service','Top Destination Service','Top Destination Service','TOP_DESTINATION','{\"field\":\"dstip.keyword\", \"max\":10}',1,2),(4,'Top User Service','Top User Service','Top User Service','TOP_USER','{\"field\":\"user.keyword\", \"max\":10}',1,2),(5,'Top User banwidth','User send+receive','Top User Banwidth','TOP_BANWIDTH_USERS','{\"field\":\"user.keyword\",\"max\":10,\"unit\":\"bytes\", \"sumField\":\"sentbyte\", \"sumFieldScript\": \"doc[\'sentbyte\'].value +  doc[\'rcvdbyte\'].value\"  }',1,2),(6,'Top User Pie','Top User Pie','Top User Pie','TOP_USER_PIE','{\"field\":\"user.keyword\", \"max\":10,\"unit\":\"request\"}',1,3),(7,'Top Banwidth Compare','Top Banwidth Compare','Top Banwidth Compare','TOP_BANWIDTH_COMPARE','{\"interval\":\"10s\",\"fieldCompare\": [{\"field\": \"sentbyte\"}, {\"field\": \"rcvdbyte\"} ] ,\"unit\":\"bytes\"}',1,5),(8,'Top Destination Blocked','Top Destination Blocked','Top Destination Blocked','TOP_DESTINATION_BLOCKED','{\"field\":\"dstip.keyword\", \"max\":10,\"unit\":\"requests\", \"must\": [{\"match_phrase\": {\"action\": { \"query\": \"Block\"}}}]}',1,1),(9,'Source To Destination','Source To Destination','Source To Destination','SOURCE_TO_DESTINATION','{\"sumField\":\"srcip.keyword\",\"max\":5,\"unit\":\"requests\", \"groupField\":\"dstip.keyword\" }',1,4),(10,'To Destination Country','To Destination Country','To Destination Country','TOP_DESTINATION_COUNTRY','{\"field\":\"dstcountry.keyword\", \"max\":10,\"unit\":\"requests\", \"must_not\": [{\"match_phrase\": {\"dstcountry.keyword\": { \"query\": \"Reserved\"}}}]}',1,3),(11,'Top Most Visit Site','Top Most Visit Site','Top Most Visit Site','TOP_MOST_VISIT_SITE','{\"field\":\"dstname.keyword\", \"max\":20,\"unit\":\"requests\" }',1,1),(12,'Top Categories','Top Categories','Top Categories','TOP_CATEGORIES','{\"field\":\"appcat.keyword\", \"max\":10,\"unit\":\"requests\" }',1,2);
/*!40000 ALTER TABLE `report_graph_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_graph_template`
--

DROP TABLE IF EXISTS `report_graph_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_graph_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `template_path` varchar(255) COLLATE utf8_bin NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_graph_template`
--

LOCK TABLES `report_graph_template` WRITE;
/*!40000 ALTER TABLE `report_graph_template` DISABLE KEYS */;
INSERT INTO `report_graph_template` VALUES (1,'graph table','analytic/report/report_table_template.html',1),(2,'graph bar y','analytic/report/report_graph_bar_template.html',1),(3,'graph pie','analytic/report/report_graph_pie_template.html',1),(4,'graph dependncy wheel','analytic/report/report_graph_dependency_wheel_template.html',1),(5,'graph area neg','analytic/report/report_graph_area_template.html',1),(6,'graph basic area','analytic/report/report_graph_basic_area_template.html',1),(7,'graph spline template','analytic/report/report_spline_template.html',1);
/*!40000 ALTER TABLE `report_graph_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_jasper_pdf_history`
--

DROP TABLE IF EXISTS `report_jasper_pdf_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_jasper_pdf_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_full_path` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `stop_date` date DEFAULT NULL,
  `report_file` longblob DEFAULT NULL,
  `create_date` datetime(6) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_jasper_pdf_hi_company_id_4df9f971_fk_company_p` (`company_id`),
  CONSTRAINT `report_jasper_pdf_hi_company_id_4df9f971_fk_company_p` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_jasper_pdf_history`
--

LOCK TABLES `report_jasper_pdf_history` WRITE;
/*!40000 ALTER TABLE `report_jasper_pdf_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_jasper_pdf_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_jasper_template`
--

DROP TABLE IF EXISTS `report_jasper_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_jasper_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `report_name` varchar(255) NOT NULL,
  `report_full_path` varchar(255) NOT NULL,
  `ordinal` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_jasper_template`
--

LOCK TABLES `report_jasper_template` WRITE;
/*!40000 ALTER TABLE `report_jasper_template` DISABLE KEYS */;
INSERT INTO `report_jasper_template` VALUES (1,'title page','rep_first_page','rep_first_page.jrxml',1,1),(2,'graph','source usage','report_list_source_usage_with_datasource.jrxml',2,0),(3,'monthly','report_monthly_with_datasource','report_monthly_with_datasource.jrxml',3,1);
/*!40000 ALTER TABLE `report_jasper_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_jasper_template_company`
--

DROP TABLE IF EXISTS `report_jasper_template_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_jasper_template_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `report_name` varchar(255) NOT NULL,
  `report_full_path` varchar(255) NOT NULL,
  `ordinal` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_jasper_templa_company_id_05b99388_fk_company_p` (`company_id`),
  CONSTRAINT `report_jasper_templa_company_id_05b99388_fk_company_p` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_jasper_template_company`
--

LOCK TABLES `report_jasper_template_company` WRITE;
/*!40000 ALTER TABLE `report_jasper_template_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_jasper_template_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_task_config`
--

DROP TABLE IF EXISTS `scheduler_task_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_task_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `interval_mins` int(11) NOT NULL,
  `delay_mins` int(11) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `task_type` varchar(1) DEFAULT NULL,
  `task_trigger` varchar(10) DEFAULT NULL,
  `trigger_args` varchar(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_task_config`
--

LOCK TABLES `scheduler_task_config` WRITE;
/*!40000 ALTER TABLE `scheduler_task_config` DISABLE KEYS */;
INSERT INTO `scheduler_task_config` VALUES (1,'checkalive 1 minus',60000,1000,'Task check alive for collector and source ','2019-04-19 17:26:21.669617',1,'1','interval','{\"second\": 300.0}'),(2,'checkalert 5 minus',300000,1000,'Task check alert','2019-04-19 17:26:21.670104',1,'2','interval','{\"second\": 300.0}'),(3,'call source usage history',300000,1000,'Check Alert','2020-02-06 17:40:08.282039',1,'3','cron','{\"hour\": 0, \"minute\": 30}'),(4,'Export PDF',0,1000,'Export PDF in last month','2020-02-06 17:40:08.284293',1,'4','cron','{\"day\":1,\"hour\":0,\"minute\":30}');
/*!40000 ALTER TABLE `scheduler_task_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_server_config`
--

DROP TABLE IF EXISTS `search_server_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_server_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `server_url` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `index_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `logcollector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_server_config_company_id_6d3b51b7_fk_company_profile_id` (`company_id`),
  KEY `search_server_config_logcollector_id_1dab6678_fk_logcollector_id` (`logcollector_id`),
  CONSTRAINT `search_server_config_company_id_6d3b51b7_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`),
  CONSTRAINT `search_server_config_logcollector_id_1dab6678_fk_logcollector_id` FOREIGN KEY (`logcollector_id`) REFERENCES `logcollector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_server_config`
--

LOCK TABLES `search_server_config` WRITE;
/*!40000 ALTER TABLE `search_server_config` DISABLE KEYS */;
INSERT INTO `search_server_config` VALUES (1,'Company','http://localhost:9200','logyou','elastic@123','com*',1,'2019-04-19 17:26:36.787601',1,1);
/*!40000 ALTER TABLE `search_server_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source`
--

DROP TABLE IF EXISTS `source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` longtext COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `authkey_id` int(11) NOT NULL,
  `color` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `device_type_id` int(11) DEFAULT NULL,
  `source_refer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `source_authkey_id_1d0d1175_fk_authkey_id` (`authkey_id`) USING BTREE,
  KEY `source_device_type_id_430d8901_fk_device_type_id` (`device_type_id`),
  CONSTRAINT `source_authkey_id_1d0d1175_fk_authkey_id` FOREIGN KEY (`authkey_id`) REFERENCES `authkey` (`id`),
  CONSTRAINT `source_device_type_id_430d8901_fk_device_type_id` FOREIGN KEY (`device_type_id`) REFERENCES `device_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source`
--

LOCK TABLES `source` WRITE;
/*!40000 ALTER TABLE `source` DISABLE KEYS */;
/*!40000 ALTER TABLE `source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_alert`
--

DROP TABLE IF EXISTS `source_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alive_mins` bigint(20) DEFAULT NULL,
  `log_datetime` datetime(6) DEFAULT NULL,
  `alerted` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `alive_config_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_alert_alive_config_id_66bcff3d_fk_alive_config_id` (`alive_config_id`),
  KEY `source_alert_source_id_3eb1f2dc_fk_source_id` (`source_id`),
  CONSTRAINT `source_alert_alive_config_id_66bcff3d_fk_alive_config_id` FOREIGN KEY (`alive_config_id`) REFERENCES `alive_config` (`id`),
  CONSTRAINT `source_alert_source_id_3eb1f2dc_fk_source_id` FOREIGN KEY (`source_id`) REFERENCES `source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_alert`
--

LOCK TABLES `source_alert` WRITE;
/*!40000 ALTER TABLE `source_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `source_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_alive`
--

DROP TABLE IF EXISTS `source_alive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_alive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alive_mins` bigint(20) DEFAULT NULL,
  `log_datetime` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `alive_config_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `count_alert_line` int(11) DEFAULT NULL,
  `count_alert_mail` int(11) DEFAULT NULL,
  `current_is_alive` tinyint(1) DEFAULT NULL,
  `old_is_alive` tinyint(1) DEFAULT NULL,
  `last_time_interval` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_alive_alive_config_id_3d374d03_fk_alive_config_id` (`alive_config_id`),
  KEY `source_alive_source_id_93cf8ce9_fk_source_id` (`source_id`),
  CONSTRAINT `source_alive_alive_config_id_3d374d03_fk_alive_config_id` FOREIGN KEY (`alive_config_id`) REFERENCES `alive_config` (`id`),
  CONSTRAINT `source_alive_source_id_93cf8ce9_fk_source_id` FOREIGN KEY (`source_id`) REFERENCES `source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_alive`
--

LOCK TABLES `source_alive` WRITE;
/*!40000 ALTER TABLE `source_alive` DISABLE KEYS */;
/*!40000 ALTER TABLE `source_alive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_status`
--

DROP TABLE IF EXISTS `source_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_datetime` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `log_date` date DEFAULT NULL,
  `log_time` time(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `source_status_source_id_acc5a2b0_fk_source_id` (`source_id`) USING BTREE,
  CONSTRAINT `source_status_source_id_acc5a2b0_fk_source_id` FOREIGN KEY (`source_id`) REFERENCES `source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_status`
--

LOCK TABLES `source_status` WRITE;
/*!40000 ALTER TABLE `source_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `source_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_status_history`
--

DROP TABLE IF EXISTS `source_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_status_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `log_datetime` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `source_alive_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_status_history_company_id_7255e4b9_fk_company_profile_id` (`company_id`),
  KEY `source_status_history_source_id_09d496b4_fk_source_id` (`source_id`),
  KEY `source_status_histor_source_alive_id_36083e5c_fk_source_al` (`source_alive_id`),
  CONSTRAINT `source_status_histor_source_alive_id_36083e5c_fk_source_al` FOREIGN KEY (`source_alive_id`) REFERENCES `source_alive` (`id`),
  CONSTRAINT `source_status_history_company_id_7255e4b9_fk_company_profile_id` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`),
  CONSTRAINT `source_status_history_source_id_09d496b4_fk_source_id` FOREIGN KEY (`source_id`) REFERENCES `source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_status_history`
--

LOCK TABLES `source_status_history` WRITE;
/*!40000 ALTER TABLE `source_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `source_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_time_period_rules`
--

DROP TABLE IF EXISTS `source_time_period_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_time_period_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_time_interval` longtext DEFAULT NULL,
  `start_time_period` time(6) DEFAULT NULL,
  `stop_time_period` time(6) DEFAULT NULL,
  `rules` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_time_period_rules_source_id_a1aa394a_fk_source_id` (`source_id`),
  CONSTRAINT `source_time_period_rules_source_id_a1aa394a_fk_source_id` FOREIGN KEY (`source_id`) REFERENCES `source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_time_period_rules`
--

LOCK TABLES `source_time_period_rules` WRITE;
/*!40000 ALTER TABLE `source_time_period_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `source_time_period_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_usage`
--

DROP TABLE IF EXISTS `source_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_usage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_datetime` datetime(6) NOT NULL,
  `total_file` int(11) NOT NULL,
  `total_size` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `log_date` date DEFAULT NULL,
  `log_time` time(6) DEFAULT NULL,
  `source_date` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `source_usage_source_id_bcb03b04_fk_source_id` (`source_id`) USING BTREE,
  CONSTRAINT `source_usage_source_id_bcb03b04_fk_source_id` FOREIGN KEY (`source_id`) REFERENCES `source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_usage`
--

LOCK TABLES `source_usage` WRITE;
/*!40000 ALTER TABLE `source_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `source_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_usage_history`
--

DROP TABLE IF EXISTS `source_usage_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_usage_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_datetime` datetime(6) NOT NULL,
  `log_date` date DEFAULT NULL,
  `log_time` time(6) DEFAULT NULL,
  `source_date` date DEFAULT NULL,
  `size` double DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_usage_history_source_id_31dab0c0_fk_source_id` (`source_id`),
  CONSTRAINT `source_usage_history_source_id_31dab0c0_fk_source_id` FOREIGN KEY (`source_id`) REFERENCES `source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_usage_history`
--

LOCK TABLES `source_usage_history` WRITE;
/*!40000 ALTER TABLE `source_usage_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `source_usage_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(250) COLLATE utf8_bin NOT NULL,
  `config_value` longtext COLLATE utf8_bin DEFAULT NULL,
  `description` longtext COLLATE utf8_bin DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
INSERT INTO `system_config` VALUES (1,'TIME_INTERVAL_SOURCE_STATUS_MILLIS','10000','Refresh interval in millisecond for \'Source Status\' ',1,'2019-01-29 15:39:56.777039'),(2,'TIME_INTERVAL_COLLECTOR_STATUS_MILLIS','10000','Refresh interval in millisecond for \'Collector Status\' ',1,'2019-01-29 15:39:56.778035'),(5,'SFTP_DEFAULT_FOLDER','log','SFTP default port',1,'2019-01-29 15:39:56.835039'),(6,'SYSTEM_VERSION','VisibleOne','System Version for Log You. 1.4.24',1,'2019-01-29 15:39:56.991582'),(7,'ELASTIC_SERVER_URL','http://localhost:9200','ELASTIC search url',1,'2019-01-29 15:39:57.026582'),(8,'ELASTIC_USER','elastic','ELASTIC search user',1,'2019-01-29 15:39:57.027584'),(9,'ELASTIC_PASSWORD','elastic','ELASTIC search password',1,'2019-01-29 15:39:57.027584'),(10,'LIMIT_COUNT_ALERT_LINE_PER_DAY','5','Limit count alert to line in a day',1,'2019-04-19 17:26:22.947862'),(11,'MARK_SEARCH_WORDS','/([*+?^!${}()|\\[\\]\\/\\\\]|OR|AND|NOT)/g','regex mark search',1,'2019-04-19 17:26:40.300895'),(12,'EMAIL_DEFAULT_CONFIG','[{\'email_name\': \'UIH Mail Server\', \'email_backend\': \'django.core.mail.backends.smtp.EmailBackend\', \'email_host\': \'172.16.32.11\', \'email_use_tls\': \'None\', \'email_port\': \'25\'}]','Default Mail Server',1,'2019-04-19 17:26:42.490516'),(13,'EMAIL_DEFAULT_RECEIVER','logyousystem@uih.co.th','Default Mail receiver is uih',1,'2019-04-19 17:26:42.490913'),(14,'ABOUT_SYSTEM','<ul class=\"list-group pmd-list\">\r\n    <li class=\"list-group-item\"><h3>WE VIEW LOG  YOU </h3> <i>Log management and monitoring system.</i></li>\r\n    <li class=\"list-group-item\">บริการจัดเก็บและบริหารจัดการข้อมูลจราจรทางคอมพิวเตอร์ ด้วยระบบจัดเก็บข้อมูลจราจรทางคอมพิวเตอร์ เป็นระยะเวลา 90 วัน ตามพระราชบัญญัติ ว่าด้วยการกระทำความผิดเกี่ยวกับคอมพิวเตอร์ พ.ศ. 2560 และรองรับปริมาณข้อมูลจราจรทางคอมพิวเตอร์</li>\r\n</ul>','ABOUT_SYSTEM',1,'2019-04-29 11:55:45.982177'),(15,'ABOUT_CONTACT','<ul class=\"list-group pmd-list\">\r\n                    <li class=\"list-group-item\"><h3>United Information Highway Co., Ltd.</h3></li>\r\n                    <li class=\"list-group-item\"><i class=\"fa fa-home\"></i>Address: 499 Benchachinda Bldg, Kamphaeng Phet 6 Rd, Ladyao, Chatuchak, Bangkok 10900. Thailand.</li>\r\n                    <li class=\"list-group-item\"><i class=\"material-icons md-dark pmd-md\"></i>Telephone : +66 2016 5678</li>\r\n                    <li class=\"list-group-item\"><i class=\"material-icons md-dark pmd-md\"></i>e-Mail : cc_support@uih.co.th</li>\r\n                </ul>','ABOUT_CONTACT',1,'2019-04-29 11:56:38.292900'),(16,'WEB_DEFAULT_URL','logyou.uih.co.th','Default url logyou.uih.co.th',1,'2019-11-28 14:10:34.696613'),(17,'EXPIRE_PASSWORD_DEFAULT','90','Default exp password 90 day',1,'2019-11-28 14:10:36.043689');
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `two_factor_phonedevice`
--

DROP TABLE IF EXISTS `two_factor_phonedevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `two_factor_phonedevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `number` varchar(128) COLLATE utf8_bin NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `method` varchar(4) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `two_factor_phonedevice_user_id_54718003_fk_auth_user_id` (`user_id`),
  CONSTRAINT `two_factor_phonedevice_user_id_54718003_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `two_factor_phonedevice`
--

LOCK TABLES `two_factor_phonedevice` WRITE;
/*!40000 ALTER TABLE `two_factor_phonedevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `two_factor_phonedevice` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-06 17:51:55
