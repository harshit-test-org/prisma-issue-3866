-- MySQL dump 10.13  Distrib 5.7.31, for osx10.15 (x86_64)
--
-- Host: localhost    Database: issue_3866
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `_Migration`
--

DROP TABLE IF EXISTS `_Migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Migration` (
  `revision` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datamodel` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` int(11) NOT NULL,
  `rolled_back` int(11) NOT NULL,
  `datamodel_steps` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `database_migration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `errors` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `started_at` datetime(3) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`revision`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_Migration`
--

LOCK TABLES `_Migration` WRITE;
/*!40000 ALTER TABLE `_Migration` DISABLE KEYS */;
INSERT INTO `_Migration` VALUES (1,'20201007084703','datasource db {\n  provider = \"mysql\"\n  url      = \"***\"\n}\n\nmodel Account {\n  id               Int              @id @map(\"account_id\")\n  accountAddresses AccountAddress[]\n  members          Member[]\n\n  @@map(\"accounts\")\n}\n\nmodel Member {\n  id        Int     @id @map(\"member_id\")\n  accountID Int     @map(\"account_id\")\n  account   Account @relation(fields: [accountID], references: [id])\n\n  @@map(\"members\")\n}\n\nmodel Address {\n  id               Int              @id @map(\"address_id\")\n  accountAddresses AccountAddress[]\n\n  @@map(\"addresses\")\n}\n\nmodel AccountAddress {\n  accountID Int     @map(\"account_id\")\n  account   Account @relation(fields: [accountID], references: [id])\n  addressID Int     @map(\"address_id\")\n  address   Address @relation(fields: [addressID], references: [id])\n\n  @@id([accountID, addressID])\n  @@map(\"account_addresses\")\n}\n','MigrationSuccess',7,0,'[{\"tag\":\"CreateSource\",\"source\":\"db\"},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Source\",\"source\":\"db\"},\"argument\":\"provider\",\"value\":\"\\\"mysql\\\"\"},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Source\",\"source\":\"db\"},\"argument\":\"url\",\"value\":\"\\\"***\\\"\"},{\"tag\":\"CreateModel\",\"model\":\"Account\"},{\"tag\":\"CreateField\",\"model\":\"Account\",\"field\":\"id\",\"type\":\"Int\",\"arity\":\"Required\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Field\",\"model\":\"Account\",\"field\":\"id\"},\"directive\":\"id\"}},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Field\",\"model\":\"Account\",\"field\":\"id\"},\"directive\":\"map\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Field\",\"model\":\"Account\",\"field\":\"id\"},\"directive\":\"map\"},\"argument\":\"\",\"value\":\"\\\"account_id\\\"\"},{\"tag\":\"CreateField\",\"model\":\"Account\",\"field\":\"accountAddresses\",\"type\":\"AccountAddress\",\"arity\":\"List\"},{\"tag\":\"CreateField\",\"model\":\"Account\",\"field\":\"members\",\"type\":\"Member\",\"arity\":\"List\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Model\",\"model\":\"Account\"},\"directive\":\"map\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Model\",\"model\":\"Account\"},\"directive\":\"map\"},\"argument\":\"\",\"value\":\"\\\"accounts\\\"\"},{\"tag\":\"CreateModel\",\"model\":\"Member\"},{\"tag\":\"CreateField\",\"model\":\"Member\",\"field\":\"id\",\"type\":\"Int\",\"arity\":\"Required\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Field\",\"model\":\"Member\",\"field\":\"id\"},\"directive\":\"id\"}},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Field\",\"model\":\"Member\",\"field\":\"id\"},\"directive\":\"map\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Field\",\"model\":\"Member\",\"field\":\"id\"},\"directive\":\"map\"},\"argument\":\"\",\"value\":\"\\\"member_id\\\"\"},{\"tag\":\"CreateField\",\"model\":\"Member\",\"field\":\"accountID\",\"type\":\"Int\",\"arity\":\"Required\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Field\",\"model\":\"Member\",\"field\":\"accountID\"},\"directive\":\"map\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Field\",\"model\":\"Member\",\"field\":\"accountID\"},\"directive\":\"map\"},\"argument\":\"\",\"value\":\"\\\"account_id\\\"\"},{\"tag\":\"CreateField\",\"model\":\"Member\",\"field\":\"account\",\"type\":\"Account\",\"arity\":\"Required\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Field\",\"model\":\"Member\",\"field\":\"account\"},\"directive\":\"relation\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Field\",\"model\":\"Member\",\"field\":\"account\"},\"directive\":\"relation\"},\"argument\":\"fields\",\"value\":\"[accountID]\"},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Field\",\"model\":\"Member\",\"field\":\"account\"},\"directive\":\"relation\"},\"argument\":\"references\",\"value\":\"[id]\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Model\",\"model\":\"Member\"},\"directive\":\"map\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Model\",\"model\":\"Member\"},\"directive\":\"map\"},\"argument\":\"\",\"value\":\"\\\"members\\\"\"},{\"tag\":\"CreateModel\",\"model\":\"Address\"},{\"tag\":\"CreateField\",\"model\":\"Address\",\"field\":\"id\",\"type\":\"Int\",\"arity\":\"Required\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Field\",\"model\":\"Address\",\"field\":\"id\"},\"directive\":\"id\"}},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Field\",\"model\":\"Address\",\"field\":\"id\"},\"directive\":\"map\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Field\",\"model\":\"Address\",\"field\":\"id\"},\"directive\":\"map\"},\"argument\":\"\",\"value\":\"\\\"address_id\\\"\"},{\"tag\":\"CreateField\",\"model\":\"Address\",\"field\":\"accountAddresses\",\"type\":\"AccountAddress\",\"arity\":\"List\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Model\",\"model\":\"Address\"},\"directive\":\"map\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Model\",\"model\":\"Address\"},\"directive\":\"map\"},\"argument\":\"\",\"value\":\"\\\"addresses\\\"\"},{\"tag\":\"CreateModel\",\"model\":\"AccountAddress\"},{\"tag\":\"CreateField\",\"model\":\"AccountAddress\",\"field\":\"accountID\",\"type\":\"Int\",\"arity\":\"Required\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Field\",\"model\":\"AccountAddress\",\"field\":\"accountID\"},\"directive\":\"map\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Field\",\"model\":\"AccountAddress\",\"field\":\"accountID\"},\"directive\":\"map\"},\"argument\":\"\",\"value\":\"\\\"account_id\\\"\"},{\"tag\":\"CreateField\",\"model\":\"AccountAddress\",\"field\":\"account\",\"type\":\"Account\",\"arity\":\"Required\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Field\",\"model\":\"AccountAddress\",\"field\":\"account\"},\"directive\":\"relation\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Field\",\"model\":\"AccountAddress\",\"field\":\"account\"},\"directive\":\"relation\"},\"argument\":\"fields\",\"value\":\"[accountID]\"},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Field\",\"model\":\"AccountAddress\",\"field\":\"account\"},\"directive\":\"relation\"},\"argument\":\"references\",\"value\":\"[id]\"},{\"tag\":\"CreateField\",\"model\":\"AccountAddress\",\"field\":\"addressID\",\"type\":\"Int\",\"arity\":\"Required\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Field\",\"model\":\"AccountAddress\",\"field\":\"addressID\"},\"directive\":\"map\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Field\",\"model\":\"AccountAddress\",\"field\":\"addressID\"},\"directive\":\"map\"},\"argument\":\"\",\"value\":\"\\\"address_id\\\"\"},{\"tag\":\"CreateField\",\"model\":\"AccountAddress\",\"field\":\"address\",\"type\":\"Address\",\"arity\":\"Required\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Field\",\"model\":\"AccountAddress\",\"field\":\"address\"},\"directive\":\"relation\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Field\",\"model\":\"AccountAddress\",\"field\":\"address\"},\"directive\":\"relation\"},\"argument\":\"fields\",\"value\":\"[addressID]\"},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Field\",\"model\":\"AccountAddress\",\"field\":\"address\"},\"directive\":\"relation\"},\"argument\":\"references\",\"value\":\"[id]\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Model\",\"model\":\"AccountAddress\"},\"directive\":\"id\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Model\",\"model\":\"AccountAddress\"},\"directive\":\"id\"},\"argument\":\"\",\"value\":\"[accountID, addressID]\"},{\"tag\":\"CreateDirective\",\"location\":{\"path\":{\"tag\":\"Model\",\"model\":\"AccountAddress\"},\"directive\":\"map\"}},{\"tag\":\"CreateArgument\",\"location\":{\"tag\":\"Directive\",\"path\":{\"tag\":\"Model\",\"model\":\"AccountAddress\"},\"directive\":\"map\"},\"argument\":\"\",\"value\":\"\\\"account_addresses\\\"\"}]','{\"before\":{\"tables\":[{\"name\":\"_Migration\",\"columns\":[{\"name\":\"revision\",\"tpe\":{\"dataType\":\"int\",\"fullDataType\":\"int(11)\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":\"Int\"},\"default\":null,\"autoIncrement\":true},{\"name\":\"name\",\"tpe\":{\"dataType\":\"text\",\"fullDataType\":\"text\",\"characterMaximumLength\":65535,\"family\":\"string\",\"arity\":\"required\",\"nativeType\":\"Text\"},\"default\":null,\"autoIncrement\":false},{\"name\":\"datamodel\",\"tpe\":{\"dataType\":\"longtext\",\"fullDataType\":\"longtext\",\"characterMaximumLength\":4294967295,\"family\":\"string\",\"arity\":\"required\",\"nativeType\":\"LongText\"},\"default\":null,\"autoIncrement\":false},{\"name\":\"status\",\"tpe\":{\"dataType\":\"text\",\"fullDataType\":\"text\",\"characterMaximumLength\":65535,\"family\":\"string\",\"arity\":\"required\",\"nativeType\":\"Text\"},\"default\":null,\"autoIncrement\":false},{\"name\":\"applied\",\"tpe\":{\"dataType\":\"int\",\"fullDataType\":\"int(11)\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":\"Int\"},\"default\":null,\"autoIncrement\":false},{\"name\":\"rolled_back\",\"tpe\":{\"dataType\":\"int\",\"fullDataType\":\"int(11)\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":\"Int\"},\"default\":null,\"autoIncrement\":false},{\"name\":\"datamodel_steps\",\"tpe\":{\"dataType\":\"longtext\",\"fullDataType\":\"longtext\",\"characterMaximumLength\":4294967295,\"family\":\"string\",\"arity\":\"required\",\"nativeType\":\"LongText\"},\"default\":null,\"autoIncrement\":false},{\"name\":\"database_migration\",\"tpe\":{\"dataType\":\"longtext\",\"fullDataType\":\"longtext\",\"characterMaximumLength\":4294967295,\"family\":\"string\",\"arity\":\"required\",\"nativeType\":\"LongText\"},\"default\":null,\"autoIncrement\":false},{\"name\":\"errors\",\"tpe\":{\"dataType\":\"longtext\",\"fullDataType\":\"longtext\",\"characterMaximumLength\":4294967295,\"family\":\"string\",\"arity\":\"required\",\"nativeType\":\"LongText\"},\"default\":null,\"autoIncrement\":false},{\"name\":\"started_at\",\"tpe\":{\"dataType\":\"datetime\",\"fullDataType\":\"datetime(3)\",\"characterMaximumLength\":null,\"family\":\"dateTime\",\"arity\":\"required\",\"nativeType\":{\"DateTime\":3}},\"default\":null,\"autoIncrement\":false},{\"name\":\"finished_at\",\"tpe\":{\"dataType\":\"datetime\",\"fullDataType\":\"datetime(3)\",\"characterMaximumLength\":null,\"family\":\"dateTime\",\"arity\":\"nullable\",\"nativeType\":{\"DateTime\":3}},\"default\":null,\"autoIncrement\":false}],\"indices\":[],\"primaryKey\":{\"columns\":[\"revision\"],\"sequence\":null,\"constraintName\":null},\"foreignKeys\":[]}],\"enums\":[],\"sequences\":[]},\"after\":{\"tables\":[{\"name\":\"accounts\",\"columns\":[{\"name\":\"account_id\",\"tpe\":{\"dataType\":\"\",\"fullDataType\":\"\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":null},\"default\":null,\"autoIncrement\":false}],\"indices\":[],\"primaryKey\":{\"columns\":[\"account_id\"],\"sequence\":null,\"constraintName\":null},\"foreignKeys\":[]},{\"name\":\"members\",\"columns\":[{\"name\":\"member_id\",\"tpe\":{\"dataType\":\"\",\"fullDataType\":\"\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":null},\"default\":null,\"autoIncrement\":false},{\"name\":\"account_id\",\"tpe\":{\"dataType\":\"\",\"fullDataType\":\"\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":null},\"default\":null,\"autoIncrement\":false}],\"indices\":[],\"primaryKey\":{\"columns\":[\"member_id\"],\"sequence\":null,\"constraintName\":null},\"foreignKeys\":[{\"constraintName\":null,\"columns\":[\"account_id\"],\"referencedTable\":\"accounts\",\"referencedColumns\":[\"account_id\"],\"onDeleteAction\":\"cascade\",\"onUpdateAction\":\"cascade\"}]},{\"name\":\"addresses\",\"columns\":[{\"name\":\"address_id\",\"tpe\":{\"dataType\":\"\",\"fullDataType\":\"\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":null},\"default\":null,\"autoIncrement\":false}],\"indices\":[],\"primaryKey\":{\"columns\":[\"address_id\"],\"sequence\":null,\"constraintName\":null},\"foreignKeys\":[]},{\"name\":\"account_addresses\",\"columns\":[{\"name\":\"account_id\",\"tpe\":{\"dataType\":\"\",\"fullDataType\":\"\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":null},\"default\":null,\"autoIncrement\":false},{\"name\":\"address_id\",\"tpe\":{\"dataType\":\"\",\"fullDataType\":\"\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":null},\"default\":null,\"autoIncrement\":false}],\"indices\":[],\"primaryKey\":{\"columns\":[\"account_id\",\"address_id\"],\"sequence\":null,\"constraintName\":null},\"foreignKeys\":[{\"constraintName\":null,\"columns\":[\"account_id\"],\"referencedTable\":\"accounts\",\"referencedColumns\":[\"account_id\"],\"onDeleteAction\":\"cascade\",\"onUpdateAction\":\"cascade\"},{\"constraintName\":null,\"columns\":[\"address_id\"],\"referencedTable\":\"addresses\",\"referencedColumns\":[\"address_id\"],\"onDeleteAction\":\"cascade\",\"onUpdateAction\":\"cascade\"}]}],\"enums\":[],\"sequences\":[]},\"steps\":[{\"CreateTable\":{\"table\":{\"name\":\"accounts\",\"columns\":[{\"name\":\"account_id\",\"tpe\":{\"dataType\":\"\",\"fullDataType\":\"\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":null},\"default\":null,\"autoIncrement\":false}],\"indices\":[],\"primaryKey\":{\"columns\":[\"account_id\"],\"sequence\":null,\"constraintName\":null},\"foreignKeys\":[]}}},{\"CreateTable\":{\"table\":{\"name\":\"members\",\"columns\":[{\"name\":\"member_id\",\"tpe\":{\"dataType\":\"\",\"fullDataType\":\"\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":null},\"default\":null,\"autoIncrement\":false},{\"name\":\"account_id\",\"tpe\":{\"dataType\":\"\",\"fullDataType\":\"\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":null},\"default\":null,\"autoIncrement\":false}],\"indices\":[],\"primaryKey\":{\"columns\":[\"member_id\"],\"sequence\":null,\"constraintName\":null},\"foreignKeys\":[{\"constraintName\":null,\"columns\":[\"account_id\"],\"referencedTable\":\"accounts\",\"referencedColumns\":[\"account_id\"],\"onDeleteAction\":\"cascade\",\"onUpdateAction\":\"cascade\"}]}}},{\"CreateTable\":{\"table\":{\"name\":\"addresses\",\"columns\":[{\"name\":\"address_id\",\"tpe\":{\"dataType\":\"\",\"fullDataType\":\"\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":null},\"default\":null,\"autoIncrement\":false}],\"indices\":[],\"primaryKey\":{\"columns\":[\"address_id\"],\"sequence\":null,\"constraintName\":null},\"foreignKeys\":[]}}},{\"CreateTable\":{\"table\":{\"name\":\"account_addresses\",\"columns\":[{\"name\":\"account_id\",\"tpe\":{\"dataType\":\"\",\"fullDataType\":\"\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":null},\"default\":null,\"autoIncrement\":false},{\"name\":\"address_id\",\"tpe\":{\"dataType\":\"\",\"fullDataType\":\"\",\"characterMaximumLength\":null,\"family\":\"int\",\"arity\":\"required\",\"nativeType\":null},\"default\":null,\"autoIncrement\":false}],\"indices\":[],\"primaryKey\":{\"columns\":[\"account_id\",\"address_id\"],\"sequence\":null,\"constraintName\":null},\"foreignKeys\":[{\"constraintName\":null,\"columns\":[\"account_id\"],\"referencedTable\":\"accounts\",\"referencedColumns\":[\"account_id\"],\"onDeleteAction\":\"cascade\",\"onUpdateAction\":\"cascade\"},{\"constraintName\":null,\"columns\":[\"address_id\"],\"referencedTable\":\"addresses\",\"referencedColumns\":[\"address_id\"],\"onDeleteAction\":\"cascade\",\"onUpdateAction\":\"cascade\"}]}}},{\"AddForeignKey\":{\"table\":\"members\",\"foreign_key\":{\"constraintName\":null,\"columns\":[\"account_id\"],\"referencedTable\":\"accounts\",\"referencedColumns\":[\"account_id\"],\"onDeleteAction\":\"cascade\",\"onUpdateAction\":\"cascade\"}}},{\"AddForeignKey\":{\"table\":\"account_addresses\",\"foreign_key\":{\"constraintName\":null,\"columns\":[\"account_id\"],\"referencedTable\":\"accounts\",\"referencedColumns\":[\"account_id\"],\"onDeleteAction\":\"cascade\",\"onUpdateAction\":\"cascade\"}}},{\"AddForeignKey\":{\"table\":\"account_addresses\",\"foreign_key\":{\"constraintName\":null,\"columns\":[\"address_id\"],\"referencedTable\":\"addresses\",\"referencedColumns\":[\"address_id\"],\"onDeleteAction\":\"cascade\",\"onUpdateAction\":\"cascade\"}}}]}','[]','2020-10-07 08:47:03.834','2020-10-07 08:47:03.930');
/*!40000 ALTER TABLE `_Migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_addresses`
--

DROP TABLE IF EXISTS `account_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_addresses` (
  `account_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`account_id`,`address_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `account_addresses_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_addresses_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_addresses`
--

LOCK TABLES `account_addresses` WRITE;
/*!40000 ALTER TABLE `account_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`member_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-07 15:30:07
