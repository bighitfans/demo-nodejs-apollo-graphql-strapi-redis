-- MariaDB dump 10.19  Distrib 10.6.8-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: gqlserver
-- ------------------------------------------------------
-- Server version	10.6.8-MariaDB-1:10.6.8+maria~focal

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

use gqlserver;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_mobile_unique` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zipcode` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_store`
--

DROP TABLE IF EXISTS `core_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_store`
--

LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;
INSERT INTO `core_store` VALUES (1,'model_def_strapi::core-store','{\"uid\":\"strapi::core-store\",\"collectionName\":\"core_store\",\"info\":{\"name\":\"core_store\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}}','object',NULL,NULL),(2,'model_def_application::account.account','{\"uid\":\"application::account.account\",\"collectionName\":\"accounts\",\"kind\":\"collectionType\",\"info\":{\"name\":\"account\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"Name\":{\"type\":\"string\",\"required\":true},\"mobile\":{\"type\":\"integer\",\"max\":10,\"required\":true,\"unique\":true},\"avatar\":{\"collection\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"files\",\"images\",\"videos\"],\"plugin\":\"upload\",\"required\":false,\"pluginOptions\":{}},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(3,'model_def_application::address.address','{\"uid\":\"application::address.address\",\"collectionName\":\"addresses\",\"kind\":\"collectionType\",\"info\":{\"name\":\"address\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"zipcode\":{\"type\":\"integer\"},\"city\":{\"type\":\"string\"},\"landmark\":{\"type\":\"string\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(4,'model_def_application::employee.employee','{\"uid\":\"application::employee.employee\",\"collectionName\":\"employees\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Employee\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"email\":{\"type\":\"email\"},\"doj\":{\"type\":\"date\"},\"dob\":{\"type\":\"date\"},\"tasks\":{\"collection\":\"task\",\"via\":\"employee\",\"isVirtual\":true},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(5,'model_def_application::task.task','{\"uid\":\"application::task.task\",\"collectionName\":\"tasks\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Task\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"description\":{\"type\":\"string\"},\"is_complete\":{\"type\":\"boolean\"},\"employee\":{\"via\":\"tasks\",\"model\":\"employee\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(6,'model_def_strapi::webhooks','{\"uid\":\"strapi::webhooks\",\"collectionName\":\"strapi_webhooks\",\"info\":{\"name\":\"Strapi webhooks\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\"},\"url\":{\"type\":\"text\"},\"headers\":{\"type\":\"json\"},\"events\":{\"type\":\"json\"},\"enabled\":{\"type\":\"boolean\"}}}','object',NULL,NULL),(7,'model_def_strapi::permission','{\"uid\":\"strapi::permission\",\"collectionName\":\"strapi_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Permission\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"model\":\"role\",\"plugin\":\"admin\"}}}','object',NULL,NULL),(8,'model_def_strapi::role','{\"uid\":\"strapi::role\",\"collectionName\":\"strapi_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Role\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"collection\":\"user\",\"via\":\"roles\",\"plugin\":\"admin\",\"attribute\":\"user\",\"column\":\"id\",\"isVirtual\":true},\"permissions\":{\"configurable\":false,\"plugin\":\"admin\",\"collection\":\"permission\",\"via\":\"role\",\"isVirtual\":true}}}','object',NULL,NULL),(9,'model_def_strapi::user','{\"uid\":\"strapi::user\",\"collectionName\":\"strapi_administrator\",\"kind\":\"collectionType\",\"info\":{\"name\":\"User\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"collection\":\"role\",\"collectionName\":\"strapi_users_roles\",\"via\":\"users\",\"dominant\":true,\"plugin\":\"admin\",\"configurable\":false,\"private\":true,\"attribute\":\"role\",\"column\":\"id\",\"isVirtual\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false}}}','object',NULL,NULL),(10,'model_def_plugins::users-permissions.permission','{\"uid\":\"plugins::users-permissions.permission\",\"collectionName\":\"users-permissions_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"permission\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false}},\"attributes\":{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(11,'model_def_plugins::users-permissions.role','{\"uid\":\"plugins::users-permissions.role\",\"collectionName\":\"users-permissions_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"role\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(12,'model_def_plugins::users-permissions.user','{\"uid\":\"plugins::users-permissions.user\",\"collectionName\":\"users-permissions_user\",\"kind\":\"collectionType\",\"info\":{\"name\":\"user\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(13,'model_def_plugins::upload.file','{\"uid\":\"plugins::upload.file\",\"collectionName\":\"upload_file\",\"kind\":\"collectionType\",\"info\":{\"name\":\"file\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(14,'model_def_plugins::i18n.locale','{\"uid\":\"plugins::i18n.locale\",\"collectionName\":\"i18n_locales\",\"kind\":\"collectionType\",\"info\":{\"name\":\"locale\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(15,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"http://localhost:25080/capi/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"http://localhost:25080/capi/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"http://localhost:25080/capi/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"http://localhost:25080/capi/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"http://localhost:25080/capi/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"http://localhost:25080/capi/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"http://localhost:25080/capi/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"http://localhost:25080/capi/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"http://localhost:25080/capi/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"http://localhost:25080/capi/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"http://localhost:25080/capi/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"http://localhost:25080/capi/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"http://localhost:25080/capi/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"enabled\":false,\"icon\":\"book\",\"key\":\"\",\"secret\":\"\",\"callback\":\"http://localhost:25080/capi/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"}}','object','',''),(16,'plugin_upload_settings','{\"sizeOptimization\":true,\"responsiveDimensions\":true}','object','development',''),(17,'plugin_content_manager_configuration_content_types::application::account.account','{\"uid\":\"application::account.account\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"Name\",\"defaultSortBy\":\"Name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"Name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"mobile\":{\"edit\":{\"label\":\"Mobile\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mobile\",\"searchable\":true,\"sortable\":true}},\"avatar\":{\"edit\":{\"label\":\"Avatar\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Avatar\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"Name\",\"mobile\",\"avatar\"],\"editRelations\":[],\"edit\":[[{\"name\":\"Name\",\"size\":6},{\"name\":\"mobile\",\"size\":4}],[{\"name\":\"avatar\",\"size\":6}]]}}','object','',''),(18,'plugin_content_manager_configuration_content_types::application::employee.employee','{\"uid\":\"application::employee.employee\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"doj\":{\"edit\":{\"label\":\"Doj\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Doj\",\"searchable\":true,\"sortable\":true}},\"dob\":{\"edit\":{\"label\":\"Dob\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Dob\",\"searchable\":true,\"sortable\":true}},\"tasks\":{\"edit\":{\"label\":\"Tasks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"Tasks\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"email\",\"doj\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"doj\",\"size\":4},{\"name\":\"dob\",\"size\":4}]],\"editRelations\":[\"tasks\"]}}','object','',''),(19,'plugin_content_manager_configuration_content_types::application::address.address','{\"uid\":\"application::address.address\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"city\",\"defaultSortBy\":\"city\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"zipcode\":{\"edit\":{\"label\":\"Zipcode\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Zipcode\",\"searchable\":true,\"sortable\":true}},\"city\":{\"edit\":{\"label\":\"City\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"City\",\"searchable\":true,\"sortable\":true}},\"landmark\":{\"edit\":{\"label\":\"Landmark\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Landmark\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"zipcode\",\"city\",\"landmark\"],\"editRelations\":[],\"edit\":[[{\"name\":\"zipcode\",\"size\":4},{\"name\":\"city\",\"size\":6}],[{\"name\":\"landmark\",\"size\":6}]]}}','object','',''),(20,'plugin_content_manager_configuration_content_types::application::task.task','{\"uid\":\"application::task.task\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Title\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"is_complete\":{\"edit\":{\"label\":\"Is_complete\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Is_complete\",\"searchable\":true,\"sortable\":true}},\"employee\":{\"edit\":{\"label\":\"Employee\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Employee\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"description\",\"is_complete\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"is_complete\",\"size\":4}]],\"editRelations\":[\"employee\"]}}','object','',''),(21,'plugin_content_manager_configuration_content_types::strapi::permission','{\"uid\":\"strapi::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"Subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"Properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"Conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}]]}}','object','',''),(22,'plugin_content_manager_configuration_content_types::strapi::role','{\"uid\":\"strapi::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"editRelations\":[\"users\",\"permissions\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6}]]}}','object','',''),(23,'plugin_content_manager_configuration_content_types::plugins::i18n.locale','{\"uid\":\"plugins::i18n.locale\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"created_at\"],\"editRelations\":[],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]}}','object','',''),(24,'plugin_content_manager_configuration_content_types::plugins::users-permissions.role','{\"uid\":\"plugins::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"type\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"editRelations\":[\"permissions\",\"users\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]}}','object','',''),(25,'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission','{\"uid\":\"plugins::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"type\",\"defaultSortBy\":\"type\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"controller\":{\"edit\":{\"label\":\"Controller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Controller\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"enabled\":{\"edit\":{\"label\":\"Enabled\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Enabled\",\"searchable\":true,\"sortable\":true}},\"policy\":{\"edit\":{\"label\":\"Policy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Policy\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"type\",\"controller\",\"action\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"controller\",\"size\":6}],[{\"name\":\"action\",\"size\":6},{\"name\":\"enabled\",\"size\":4}],[{\"name\":\"policy\",\"size\":6}]]}}','object','',''),(26,'plugin_i18n_default_locale','\"en\"','string','',''),(27,'plugin_content_manager_configuration_content_types::strapi::user','{\"uid\":\"strapi::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"Firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"Lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"RegistrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"RegistrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"IsActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"IsActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"Roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"PreferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreferedLanguage\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"editRelations\":[\"roles\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"preferedLanguage\",\"size\":6}]]}}','object','',''),(28,'plugin_content_manager_configuration_content_types::plugins::users-permissions.user','{\"uid\":\"plugins::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"ConfirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ConfirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"Confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}]]}}','object','',''),(29,'plugin_content_manager_configuration_content_types::plugins::upload.file','{\"uid\":\"plugins::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"AlternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"AlternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"Caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"Width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"Height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"Formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"Hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"Ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"Mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"Size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"PreviewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreviewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"Provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider_metadata\",\"searchable\":false,\"sortable\":false}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"editRelations\":[\"related\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}]]}}','object','',''),(30,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object','',''),(31,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}','object','',''),(32,'core_admin_auth','{\"providers\":{\"autoRegister\":false,\"defaultRole\":null}}','object','','');
/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Robert ','robert@demo.com','2019-11-05','1980-10-10','2022-05-30 07:35:58',1,1,'2022-05-30 07:35:46','2022-05-30 07:35:58');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n_locales`
--

DROP TABLE IF EXISTS `i18n_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i18n_locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `i18n_locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i18n_locales`
--

LOCK TABLES `i18n_locales` WRITE;
/*!40000 ALTER TABLE `i18n_locales` DISABLE KEYS */;
INSERT INTO `i18n_locales` VALUES (1,'English (en)','en',NULL,NULL,'2022-05-30 07:22:02','2022-05-30 07:22:02');
/*!40000 ALTER TABLE `i18n_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_administrator`
--

DROP TABLE IF EXISTS `strapi_administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_administrator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `registrationToken` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `preferedLanguage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_administrator_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_administrator`
--

LOCK TABLES `strapi_administrator` WRITE;
/*!40000 ALTER TABLE `strapi_administrator` DISABLE KEYS */;
INSERT INTO `strapi_administrator` VALUES (1,'Demo','App',NULL,'demo@app.com','$2a$10$YPLreQUCdMn.LBgl9IwUteZ4dpup4uWHj6IT2t2PO2oZbKMXVHx1i',NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `strapi_administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_permission`
--

DROP TABLE IF EXISTS `strapi_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `properties` longtext DEFAULT NULL,
  `conditions` longtext DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_permission`
--

LOCK TABLES `strapi_permission` WRITE;
/*!40000 ALTER TABLE `strapi_permission` DISABLE KEYS */;
INSERT INTO `strapi_permission` VALUES (1,'plugins::content-manager.explorer.create','application::account.account','{\"fields\":[\"Name\",\"mobile\",\"avatar\"]}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(2,'plugins::content-manager.explorer.create','application::address.address','{\"fields\":[\"zipcode\",\"city\",\"landmark\"]}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(3,'plugins::content-manager.explorer.create','application::employee.employee','{\"fields\":[\"name\",\"email\",\"doj\",\"dob\"]}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(4,'plugins::content-manager.explorer.read','application::account.account','{\"fields\":[\"Name\",\"mobile\",\"avatar\"]}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(5,'plugins::content-manager.explorer.read','application::employee.employee','{\"fields\":[\"name\",\"email\",\"doj\",\"dob\"]}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(6,'plugins::content-manager.explorer.read','application::task.task','{\"fields\":[\"title\",\"description\",\"is_complete\"]}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(7,'plugins::content-manager.explorer.create','application::task.task','{\"fields\":[\"title\",\"description\",\"is_complete\"]}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(8,'plugins::content-manager.explorer.update','application::address.address','{\"fields\":[\"zipcode\",\"city\",\"landmark\"]}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(9,'plugins::content-manager.explorer.update','application::account.account','{\"fields\":[\"Name\",\"mobile\",\"avatar\"]}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(10,'plugins::content-manager.explorer.read','application::address.address','{\"fields\":[\"zipcode\",\"city\",\"landmark\"]}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(11,'plugins::content-manager.explorer.delete','application::address.address','{}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(12,'plugins::content-manager.explorer.update','application::task.task','{\"fields\":[\"title\",\"description\",\"is_complete\"]}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(13,'plugins::content-manager.explorer.delete','application::employee.employee','{}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(14,'plugins::content-manager.explorer.delete','application::task.task','{}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(15,'plugins::content-manager.explorer.update','application::employee.employee','{\"fields\":[\"name\",\"email\",\"doj\",\"dob\"]}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(16,'plugins::content-manager.explorer.delete','application::account.account','{}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(17,'plugins::content-manager.explorer.publish','application::account.account','{}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(18,'plugins::content-manager.explorer.publish','application::address.address','{}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(19,'plugins::content-manager.explorer.publish','application::employee.employee','{}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(20,'plugins::content-manager.explorer.publish','application::task.task','{}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(21,'plugins::upload.read',NULL,'{}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(22,'plugins::upload.assets.create',NULL,'{}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(23,'plugins::upload.assets.update',NULL,'{}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(24,'plugins::upload.assets.copy-link',NULL,'{}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(25,'plugins::upload.assets.download',NULL,'{}','[]',2,'2022-05-30 07:22:04','2022-05-30 07:22:04'),(26,'plugins::content-manager.explorer.create','application::employee.employee','{\"fields\":[\"name\",\"email\",\"doj\",\"dob\"]}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:04','2022-05-30 07:22:05'),(27,'plugins::content-manager.explorer.create','application::address.address','{\"fields\":[\"zipcode\",\"city\",\"landmark\"]}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:04','2022-05-30 07:22:05'),(28,'plugins::content-manager.explorer.create','application::account.account','{\"fields\":[\"Name\",\"mobile\",\"avatar\"]}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:04','2022-05-30 07:22:05'),(29,'plugins::content-manager.explorer.create','application::task.task','{\"fields\":[\"title\",\"description\",\"is_complete\"]}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:04','2022-05-30 07:22:05'),(30,'plugins::content-manager.explorer.read','application::address.address','{\"fields\":[\"zipcode\",\"city\",\"landmark\"]}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:04','2022-05-30 07:22:05'),(31,'plugins::content-manager.explorer.read','application::account.account','{\"fields\":[\"Name\",\"mobile\",\"avatar\"]}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:04','2022-05-30 07:22:05'),(32,'plugins::content-manager.explorer.read','application::task.task','{\"fields\":[\"title\",\"description\",\"is_complete\"]}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:04','2022-05-30 07:22:05'),(33,'plugins::content-manager.explorer.update','application::address.address','{\"fields\":[\"zipcode\",\"city\",\"landmark\"]}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:04','2022-05-30 07:22:05'),(34,'plugins::content-manager.explorer.update','application::account.account','{\"fields\":[\"Name\",\"mobile\",\"avatar\"]}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:04','2022-05-30 07:22:05'),(35,'plugins::content-manager.explorer.read','application::employee.employee','{\"fields\":[\"name\",\"email\",\"doj\",\"dob\"]}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:04','2022-05-30 07:22:05'),(36,'plugins::content-manager.explorer.update','application::employee.employee','{\"fields\":[\"name\",\"email\",\"doj\",\"dob\"]}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(37,'plugins::content-manager.explorer.update','application::task.task','{\"fields\":[\"title\",\"description\",\"is_complete\"]}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(38,'plugins::content-manager.explorer.delete','application::account.account','{}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(39,'plugins::content-manager.explorer.delete','application::address.address','{}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(40,'plugins::content-manager.explorer.delete','application::employee.employee','{}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(41,'plugins::content-manager.explorer.delete','application::task.task','{}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(42,'plugins::upload.read',NULL,'{}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(43,'plugins::upload.assets.create',NULL,'{}','[]',3,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(44,'plugins::upload.assets.update',NULL,'{}','[\"admin::is-creator\"]',3,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(45,'plugins::upload.assets.download',NULL,'{}','[]',3,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(46,'plugins::upload.assets.copy-link',NULL,'{}','[]',3,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(47,'plugins::content-manager.explorer.create','application::account.account','{\"fields\":[\"Name\",\"mobile\",\"avatar\"]}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(48,'plugins::content-manager.explorer.read','application::account.account','{\"fields\":[\"Name\",\"mobile\",\"avatar\"]}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(49,'plugins::content-manager.explorer.read','application::address.address','{\"fields\":[\"zipcode\",\"city\",\"landmark\"]}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(51,'plugins::content-manager.explorer.create','application::address.address','{\"fields\":[\"zipcode\",\"city\",\"landmark\"]}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(55,'plugins::content-manager.explorer.create','plugins::users-permissions.user','{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(56,'plugins::content-manager.explorer.read','plugins::users-permissions.user','{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(57,'plugins::content-manager.explorer.update','application::account.account','{\"fields\":[\"Name\",\"mobile\",\"avatar\"]}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(58,'plugins::content-manager.explorer.update','application::address.address','{\"fields\":[\"zipcode\",\"city\",\"landmark\"]}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(61,'plugins::content-manager.explorer.update','plugins::users-permissions.user','{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(71,'plugins::content-type-builder.read',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(72,'plugins::email.settings.read',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(73,'plugins::upload.read',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(74,'plugins::upload.assets.create',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(75,'plugins::upload.assets.update',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(76,'plugins::upload.assets.download',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(77,'plugins::upload.assets.copy-link',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(78,'plugins::i18n.locale.create',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(79,'plugins::i18n.locale.read',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(80,'plugins::upload.settings.read',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(81,'plugins::i18n.locale.update',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(82,'plugins::i18n.locale.delete',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(83,'plugins::content-manager.single-types.configure-view',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(84,'plugins::content-manager.collection-types.configure-view',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(85,'plugins::content-manager.components.configure-layout',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(86,'plugins::users-permissions.roles.create',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(87,'plugins::users-permissions.roles.read',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(88,'plugins::users-permissions.roles.delete',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(89,'plugins::users-permissions.roles.update',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(90,'plugins::users-permissions.providers.read',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(91,'plugins::users-permissions.providers.update',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(92,'plugins::users-permissions.email-templates.read',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(93,'plugins::users-permissions.advanced-settings.read',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(94,'plugins::users-permissions.email-templates.update',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(95,'admin::marketplace.read',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(96,'plugins::users-permissions.advanced-settings.update',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(97,'admin::marketplace.plugins.install',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(98,'admin::marketplace.plugins.uninstall',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(99,'admin::webhooks.read',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(100,'admin::webhooks.create',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(101,'admin::webhooks.update',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(102,'admin::webhooks.delete',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(103,'admin::users.read',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(104,'admin::users.create',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(105,'admin::users.update',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(106,'admin::users.delete',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(107,'admin::roles.create',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(108,'admin::roles.read',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(109,'admin::roles.update',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(110,'admin::roles.delete',NULL,'{}','[]',1,'2022-05-30 07:22:05','2022-05-30 07:22:05'),(111,'plugins::content-manager.explorer.create','application::employee.employee','{\"fields\":[\"name\",\"email\",\"doj\",\"dob\",\"tasks\"]}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(112,'plugins::content-manager.explorer.create','application::task.task','{\"fields\":[\"title\",\"description\",\"is_complete\",\"employee\"]}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(113,'plugins::content-manager.explorer.read','application::employee.employee','{\"fields\":[\"name\",\"email\",\"doj\",\"dob\",\"tasks\"]}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(114,'plugins::content-manager.explorer.read','application::task.task','{\"fields\":[\"title\",\"description\",\"is_complete\",\"employee\"]}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(115,'plugins::content-manager.explorer.update','application::employee.employee','{\"fields\":[\"name\",\"email\",\"doj\",\"dob\",\"tasks\"]}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(116,'plugins::content-manager.explorer.update','application::task.task','{\"fields\":[\"title\",\"description\",\"is_complete\",\"employee\"]}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(117,'plugins::content-manager.explorer.delete','application::account.account','{}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(118,'plugins::content-manager.explorer.delete','application::address.address','{}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(119,'plugins::content-manager.explorer.delete','application::employee.employee','{}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(120,'plugins::content-manager.explorer.delete','application::task.task','{}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(121,'plugins::content-manager.explorer.delete','plugins::users-permissions.user','{}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(122,'plugins::content-manager.explorer.publish','application::account.account','{}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(123,'plugins::content-manager.explorer.publish','application::address.address','{}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(124,'plugins::content-manager.explorer.publish','application::task.task','{}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13'),(125,'plugins::content-manager.explorer.publish','application::employee.employee','{}','[]',1,'2022-05-30 08:21:13','2022-05-30 08:21:13');
/*!40000 ALTER TABLE `strapi_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_role`
--

DROP TABLE IF EXISTS `strapi_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_role_name_unique` (`name`),
  UNIQUE KEY `strapi_role_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_role`
--

LOCK TABLES `strapi_role` WRITE;
/*!40000 ALTER TABLE `strapi_role` DISABLE KEYS */;
INSERT INTO `strapi_role` VALUES (1,'Super Admin','strapi-super-admin','Super Admins can access and manage all features and settings.','2022-05-30 07:22:04','2022-05-30 07:22:04'),(2,'Editor','strapi-editor','Editors can manage and publish contents including those of other users.','2022-05-30 07:22:04','2022-05-30 07:22:04'),(3,'Author','strapi-author','Authors can manage the content they have created.','2022-05-30 07:22:04','2022-05-30 07:22:04');
/*!40000 ALTER TABLE `strapi_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_users_roles`
--

DROP TABLE IF EXISTS `strapi_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_users_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_users_roles`
--

LOCK TABLES `strapi_users_roles` WRITE;
/*!40000 ALTER TABLE `strapi_users_roles` DISABLE KEYS */;
INSERT INTO `strapi_users_roles` VALUES (1,1,1);
/*!40000 ALTER TABLE `strapi_users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_webhooks`
--

DROP TABLE IF EXISTS `strapi_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `headers` longtext DEFAULT NULL,
  `events` longtext DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_webhooks`
--

LOCK TABLES `strapi_webhooks` WRITE;
/*!40000 ALTER TABLE `strapi_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_complete` tinyint(1) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `employee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'procure laptops','procure laptops for team',NULL,'2022-05-30 08:23:47',1,1,'2022-05-30 08:23:45','2022-05-30 08:23:47',1);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file`
--

DROP TABLE IF EXISTS `upload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alternativeText` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext DEFAULT NULL,
  `hash` varchar(255) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_metadata` longtext DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file`
--

LOCK TABLES `upload_file` WRITE;
/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_morph`
--

DROP TABLE IF EXISTS `upload_file_morph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_file_morph` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext DEFAULT NULL,
  `field` longtext DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_morph`
--

LOCK TABLES `upload_file_morph` WRITE;
/*!40000 ALTER TABLE `upload_file_morph` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_morph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_permission`
--

DROP TABLE IF EXISTS `users-permissions_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users-permissions_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_permission`
--

LOCK TABLES `users-permissions_permission` WRITE;
/*!40000 ALTER TABLE `users-permissions_permission` DISABLE KEYS */;
INSERT INTO `users-permissions_permission` VALUES (1,'application','account','count',0,'',1,NULL,NULL),(2,'application','account','create',0,'',1,NULL,NULL),(3,'application','account','create',0,'',2,NULL,NULL),(4,'application','account','delete',0,'',2,NULL,NULL),(5,'application','account','find',0,'',2,NULL,NULL),(6,'application','account','findone',0,'',1,NULL,NULL),(7,'application','account','delete',0,'',1,NULL,NULL),(8,'application','account','count',0,'',2,NULL,NULL),(9,'application','account','find',0,'',1,NULL,NULL),(10,'application','account','findone',0,'',2,NULL,NULL),(11,'application','account','update',0,'',1,NULL,NULL),(12,'application','account','update',0,'',2,NULL,NULL),(13,'application','address','count',0,'',1,NULL,NULL),(14,'application','address','count',0,'',2,NULL,NULL),(15,'application','address','create',0,'',2,NULL,NULL),(16,'application','address','delete',0,'',1,NULL,NULL),(17,'application','address','delete',0,'',2,NULL,NULL),(18,'application','address','create',0,'',1,NULL,NULL),(19,'application','address','find',0,'',1,NULL,NULL),(20,'application','address','find',0,'',2,NULL,NULL),(21,'application','address','findone',0,'',1,NULL,NULL),(22,'application','address','findone',0,'',2,NULL,NULL),(23,'application','address','update',0,'',2,NULL,NULL),(24,'application','employee','create',1,'',2,NULL,NULL),(25,'application','employee','count',0,'',1,NULL,NULL),(26,'application','employee','count',1,'',2,NULL,NULL),(27,'application','employee','create',0,'',1,NULL,NULL),(28,'application','address','update',0,'',1,NULL,NULL),(29,'application','employee','delete',0,'',1,NULL,NULL),(30,'application','employee','delete',1,'',2,NULL,NULL),(31,'application','employee','find',0,'',1,NULL,NULL),(32,'application','employee','find',1,'',2,NULL,NULL),(33,'application','employee','findone',1,'',2,NULL,NULL),(34,'application','employee','update',0,'',1,NULL,NULL),(35,'application','employee','findone',0,'',1,NULL,NULL),(36,'application','task','count',0,'',1,NULL,NULL),(37,'application','employee','update',1,'',2,NULL,NULL),(38,'application','task','count',1,'',2,NULL,NULL),(39,'application','task','create',0,'',1,NULL,NULL),(40,'application','task','create',1,'',2,NULL,NULL),(41,'application','task','delete',0,'',1,NULL,NULL),(42,'application','task','delete',1,'',2,NULL,NULL),(43,'application','task','find',0,'',1,NULL,NULL),(44,'application','task','findone',0,'',1,NULL,NULL),(45,'application','task','findone',1,'',2,NULL,NULL),(46,'application','task','find',1,'',2,NULL,NULL),(47,'application','task','update',0,'',1,NULL,NULL),(48,'application','task','update',1,'',2,NULL,NULL),(49,'content-manager','collection-types','bulkdelete',0,'',1,NULL,NULL),(50,'content-manager','collection-types','bulkdelete',0,'',2,NULL,NULL),(51,'content-manager','collection-types','create',0,'',1,NULL,NULL),(52,'content-manager','collection-types','create',0,'',2,NULL,NULL),(53,'content-manager','collection-types','delete',0,'',2,NULL,NULL),(54,'content-manager','collection-types','delete',0,'',1,NULL,NULL),(55,'content-manager','collection-types','find',0,'',1,NULL,NULL),(56,'content-manager','collection-types','find',0,'',2,NULL,NULL),(57,'content-manager','collection-types','findone',0,'',1,NULL,NULL),(58,'content-manager','collection-types','findone',0,'',2,NULL,NULL),(59,'content-manager','collection-types','previewmanyrelations',0,'',2,NULL,NULL),(60,'content-manager','collection-types','previewmanyrelations',0,'',1,NULL,NULL),(61,'content-manager','collection-types','publish',0,'',1,NULL,NULL),(62,'content-manager','collection-types','publish',0,'',2,NULL,NULL),(63,'content-manager','collection-types','unpublish',0,'',1,NULL,NULL),(64,'content-manager','collection-types','unpublish',0,'',2,NULL,NULL),(65,'content-manager','collection-types','update',0,'',1,NULL,NULL),(66,'content-manager','collection-types','update',0,'',2,NULL,NULL),(67,'content-manager','components','findcomponentconfiguration',0,'',1,NULL,NULL),(68,'content-manager','components','findcomponentconfiguration',0,'',2,NULL,NULL),(69,'content-manager','components','findcomponents',0,'',1,NULL,NULL),(70,'content-manager','components','findcomponents',0,'',2,NULL,NULL),(71,'content-manager','components','updatecomponentconfiguration',0,'',1,NULL,NULL),(72,'content-manager','components','updatecomponentconfiguration',0,'',2,NULL,NULL),(73,'content-manager','content-types','findcontenttypes',0,'',1,NULL,NULL),(74,'content-manager','content-types','findcontenttypeconfiguration',0,'',2,NULL,NULL),(75,'content-manager','content-types','findcontenttypeconfiguration',0,'',1,NULL,NULL),(76,'content-manager','content-types','findcontenttypes',0,'',2,NULL,NULL),(77,'content-manager','content-types','findcontenttypessettings',0,'',2,NULL,NULL),(78,'content-manager','content-types','findcontenttypessettings',0,'',1,NULL,NULL),(79,'content-manager','content-types','updatecontenttypeconfiguration',0,'',1,NULL,NULL),(80,'content-manager','content-types','updatecontenttypeconfiguration',0,'',2,NULL,NULL),(81,'content-manager','relations','find',0,'',1,NULL,NULL),(82,'content-manager','relations','find',0,'',2,NULL,NULL),(83,'content-manager','single-types','createorupdate',0,'',1,NULL,NULL),(84,'content-manager','single-types','createorupdate',0,'',2,NULL,NULL),(85,'content-manager','single-types','delete',0,'',1,NULL,NULL),(86,'content-manager','single-types','delete',0,'',2,NULL,NULL),(87,'content-manager','single-types','find',0,'',1,NULL,NULL),(88,'content-manager','single-types','find',0,'',2,NULL,NULL),(89,'content-manager','single-types','publish',0,'',1,NULL,NULL),(90,'content-manager','single-types','publish',0,'',2,NULL,NULL),(91,'content-manager','single-types','unpublish',0,'',2,NULL,NULL),(92,'content-manager','single-types','unpublish',0,'',1,NULL,NULL),(93,'content-manager','uid','checkuidavailability',0,'',1,NULL,NULL),(94,'content-manager','uid','checkuidavailability',0,'',2,NULL,NULL),(95,'content-manager','uid','generateuid',0,'',1,NULL,NULL),(96,'content-manager','uid','generateuid',0,'',2,NULL,NULL),(97,'content-type-builder','builder','getreservednames',0,'',1,NULL,NULL),(98,'content-type-builder','builder','getreservednames',0,'',2,NULL,NULL),(99,'content-type-builder','componentcategories','deletecategory',0,'',1,NULL,NULL),(100,'content-type-builder','componentcategories','deletecategory',0,'',2,NULL,NULL),(101,'content-type-builder','componentcategories','editcategory',0,'',1,NULL,NULL),(102,'content-type-builder','componentcategories','editcategory',0,'',2,NULL,NULL),(103,'content-type-builder','components','createcomponent',0,'',1,NULL,NULL),(104,'content-type-builder','components','deletecomponent',0,'',1,NULL,NULL),(105,'content-type-builder','components','createcomponent',0,'',2,NULL,NULL),(106,'content-type-builder','components','deletecomponent',0,'',2,NULL,NULL),(107,'content-type-builder','components','getcomponent',0,'',1,NULL,NULL),(108,'content-type-builder','components','getcomponent',0,'',2,NULL,NULL),(109,'content-type-builder','components','getcomponents',0,'',1,NULL,NULL),(110,'content-type-builder','components','getcomponents',0,'',2,NULL,NULL),(111,'content-type-builder','components','updatecomponent',0,'',1,NULL,NULL),(112,'content-type-builder','components','updatecomponent',0,'',2,NULL,NULL),(113,'content-type-builder','connections','getconnections',0,'',1,NULL,NULL),(114,'content-type-builder','connections','getconnections',0,'',2,NULL,NULL),(115,'content-type-builder','contenttypes','createcontenttype',0,'',1,NULL,NULL),(116,'content-type-builder','contenttypes','createcontenttype',0,'',2,NULL,NULL),(117,'content-type-builder','contenttypes','deletecontenttype',0,'',2,NULL,NULL),(118,'content-type-builder','contenttypes','deletecontenttype',0,'',1,NULL,NULL),(119,'content-type-builder','contenttypes','getcontenttype',0,'',1,NULL,NULL),(120,'content-type-builder','contenttypes','getcontenttype',0,'',2,NULL,NULL),(121,'content-type-builder','contenttypes','getcontenttypes',0,'',1,NULL,NULL),(122,'content-type-builder','contenttypes','getcontenttypes',0,'',2,NULL,NULL),(123,'content-type-builder','contenttypes','updatecontenttype',0,'',1,NULL,NULL),(124,'content-type-builder','contenttypes','updatecontenttype',0,'',2,NULL,NULL),(125,'email','email','getsettings',0,'',2,NULL,NULL),(126,'email','email','getsettings',0,'',1,NULL,NULL),(127,'email','email','send',0,'',1,NULL,NULL),(128,'email','email','send',0,'',2,NULL,NULL),(129,'email','email','test',0,'',1,NULL,NULL),(130,'email','email','test',0,'',2,NULL,NULL),(131,'i18n','content-types','getnonlocalizedattributes',0,'',2,NULL,NULL),(132,'i18n','content-types','getnonlocalizedattributes',0,'',1,NULL,NULL),(133,'i18n','iso-locales','listisolocales',0,'',1,NULL,NULL),(134,'i18n','iso-locales','listisolocales',0,'',2,NULL,NULL),(135,'i18n','locales','createlocale',0,'',1,NULL,NULL),(136,'i18n','locales','createlocale',0,'',2,NULL,NULL),(137,'i18n','locales','deletelocale',0,'',1,NULL,NULL),(138,'i18n','locales','deletelocale',0,'',2,NULL,NULL),(139,'i18n','locales','listlocales',0,'',1,NULL,NULL),(140,'i18n','locales','listlocales',0,'',2,NULL,NULL),(141,'i18n','locales','updatelocale',0,'',1,NULL,NULL),(142,'i18n','locales','updatelocale',0,'',2,NULL,NULL),(143,'upload','upload','count',0,'',1,NULL,NULL),(144,'upload','upload','count',0,'',2,NULL,NULL),(145,'upload','upload','destroy',0,'',2,NULL,NULL),(146,'upload','upload','destroy',0,'',1,NULL,NULL),(147,'upload','upload','find',0,'',1,NULL,NULL),(148,'upload','upload','find',0,'',2,NULL,NULL),(149,'upload','upload','findone',0,'',1,NULL,NULL),(150,'upload','upload','findone',0,'',2,NULL,NULL),(151,'upload','upload','getsettings',0,'',1,NULL,NULL),(152,'upload','upload','getsettings',0,'',2,NULL,NULL),(153,'upload','upload','search',0,'',1,NULL,NULL),(154,'upload','upload','search',0,'',2,NULL,NULL),(155,'upload','upload','updatesettings',0,'',1,NULL,NULL),(156,'upload','upload','updatesettings',0,'',2,NULL,NULL),(157,'upload','upload','upload',0,'',1,NULL,NULL),(158,'upload','upload','upload',0,'',2,NULL,NULL),(159,'users-permissions','auth','callback',0,'',1,NULL,NULL),(160,'users-permissions','auth','callback',1,'',2,NULL,NULL),(161,'users-permissions','auth','connect',1,'',1,NULL,NULL),(162,'users-permissions','auth','connect',1,'',2,NULL,NULL),(163,'users-permissions','auth','emailconfirmation',0,'',1,NULL,NULL),(164,'users-permissions','auth','emailconfirmation',1,'',2,NULL,NULL),(165,'users-permissions','auth','forgotpassword',0,'',1,NULL,NULL),(166,'users-permissions','auth','forgotpassword',1,'',2,NULL,NULL),(167,'users-permissions','auth','register',0,'',1,NULL,NULL),(168,'users-permissions','auth','register',1,'',2,NULL,NULL),(169,'users-permissions','auth','resetpassword',0,'',1,NULL,NULL),(170,'users-permissions','auth','resetpassword',1,'',2,NULL,NULL),(171,'users-permissions','auth','sendemailconfirmation',0,'',1,NULL,NULL),(172,'users-permissions','user','count',0,'',1,NULL,NULL),(173,'users-permissions','auth','sendemailconfirmation',0,'',2,NULL,NULL),(174,'users-permissions','user','count',0,'',2,NULL,NULL),(175,'users-permissions','user','create',0,'',2,NULL,NULL),(176,'users-permissions','user','create',0,'',1,NULL,NULL),(177,'users-permissions','user','destroy',0,'',1,NULL,NULL),(178,'users-permissions','user','destroy',0,'',2,NULL,NULL),(179,'users-permissions','user','destroyall',0,'',1,NULL,NULL),(180,'users-permissions','user','destroyall',0,'',2,NULL,NULL),(181,'users-permissions','user','find',0,'',1,NULL,NULL),(182,'users-permissions','user','findone',0,'',2,NULL,NULL),(183,'users-permissions','user','find',0,'',2,NULL,NULL),(184,'users-permissions','user','findone',0,'',1,NULL,NULL),(185,'users-permissions','user','me',1,'',1,NULL,NULL),(186,'users-permissions','user','me',1,'',2,NULL,NULL),(187,'users-permissions','user','update',0,'',1,NULL,NULL),(188,'users-permissions','user','update',0,'',2,NULL,NULL),(189,'users-permissions','userspermissions','createrole',0,'',1,NULL,NULL),(190,'users-permissions','userspermissions','createrole',0,'',2,NULL,NULL),(191,'users-permissions','userspermissions','deleterole',0,'',2,NULL,NULL),(192,'users-permissions','userspermissions','getadvancedsettings',0,'',1,NULL,NULL),(193,'users-permissions','userspermissions','deleterole',0,'',1,NULL,NULL),(194,'users-permissions','userspermissions','getadvancedsettings',0,'',2,NULL,NULL),(195,'users-permissions','userspermissions','getemailtemplate',0,'',1,NULL,NULL),(196,'users-permissions','userspermissions','getemailtemplate',0,'',2,NULL,NULL),(197,'users-permissions','userspermissions','getpermissions',0,'',1,NULL,NULL),(198,'users-permissions','userspermissions','getpermissions',0,'',2,NULL,NULL),(199,'users-permissions','userspermissions','getpolicies',0,'',1,NULL,NULL),(200,'users-permissions','userspermissions','getpolicies',0,'',2,NULL,NULL),(201,'users-permissions','userspermissions','getproviders',0,'',1,NULL,NULL),(202,'users-permissions','userspermissions','getproviders',0,'',2,NULL,NULL),(203,'users-permissions','userspermissions','getrole',0,'',2,NULL,NULL),(204,'users-permissions','userspermissions','getrole',0,'',1,NULL,NULL),(205,'users-permissions','userspermissions','getroles',0,'',2,NULL,NULL),(206,'users-permissions','userspermissions','getroles',0,'',1,NULL,NULL),(207,'users-permissions','userspermissions','getroutes',0,'',1,NULL,NULL),(208,'users-permissions','userspermissions','getroutes',0,'',2,NULL,NULL),(209,'users-permissions','userspermissions','index',0,'',1,NULL,NULL),(210,'users-permissions','userspermissions','searchusers',0,'',1,NULL,NULL),(211,'users-permissions','userspermissions','index',0,'',2,NULL,NULL),(212,'users-permissions','userspermissions','updateadvancedsettings',0,'',1,NULL,NULL),(213,'users-permissions','userspermissions','updateadvancedsettings',0,'',2,NULL,NULL),(214,'users-permissions','userspermissions','searchusers',0,'',2,NULL,NULL),(215,'users-permissions','userspermissions','updateemailtemplate',0,'',1,NULL,NULL),(216,'users-permissions','userspermissions','updateemailtemplate',0,'',2,NULL,NULL),(217,'users-permissions','userspermissions','updateproviders',0,'',1,NULL,NULL),(218,'users-permissions','userspermissions','updateproviders',0,'',2,NULL,NULL),(219,'users-permissions','userspermissions','updaterole',0,'',1,NULL,NULL),(220,'users-permissions','userspermissions','updaterole',0,'',2,NULL,NULL);
/*!40000 ALTER TABLE `users-permissions_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_role`
--

DROP TABLE IF EXISTS `users-permissions_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users-permissions_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_role_type_unique` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_role`
--

LOCK TABLES `users-permissions_role` WRITE;
/*!40000 ALTER TABLE `users-permissions_role` DISABLE KEYS */;
INSERT INTO `users-permissions_role` VALUES (1,'Authenticated','Default role given to authenticated user.','authenticated',NULL,NULL),(2,'Public','Default role given to unauthenticated user.','public',NULL,NULL);
/*!40000 ALTER TABLE `users-permissions_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_user`
--

DROP TABLE IF EXISTS `users-permissions_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users-permissions_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmationToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_user_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_user`
--

LOCK TABLES `users-permissions_user` WRITE;
/*!40000 ALTER TABLE `users-permissions_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `users-permissions_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-30  8:47:45
