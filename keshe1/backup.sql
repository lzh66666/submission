-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: keshe1
-- ------------------------------------------------------
-- Server version	5.5.62-log

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` varchar(255) NOT NULL COMMENT '作者ID',
  `account_` varchar(255) NOT NULL COMMENT '作者登录账号',
  `password_` varchar(255) NOT NULL COMMENT '作者登录密码',
  `name_` varchar(255) NOT NULL COMMENT '作者姓名',
  `contact` varchar(255) NOT NULL COMMENT '作者联系方式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `author_account__uindex` (`account_`),
  UNIQUE KEY `author_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作者表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('20a1043f-15cc-4c53-ae6a-957ad62b63f6','hs','hshshs','何俗','12345678901'),('79b64fc3-6e82-4fe5-a931-1009b75e6400','lzh','lzhlzh','卢泽华','12345678900'),('a7db8231-0c80-45eb-920d-9ca2bb5d3741','zyc','zyczyc','朱禹丞','12345678902');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_submission_mapping`
--

DROP TABLE IF EXISTS `author_submission_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_submission_mapping` (
  `id` varchar(255) NOT NULL COMMENT '订单编号',
  `author_id` varchar(255) DEFAULT NULL COMMENT '作者编号',
  `submission_id` varchar(255) DEFAULT NULL COMMENT '稿件编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `author_submission_mapping_id_uindex` (`id`),
  KEY `author_submission_mapping_author_id_fk` (`author_id`),
  KEY `author_submission_mapping_submission_id_fk` (`submission_id`),
  CONSTRAINT `author_submission_mapping_author_id_fk` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `author_submission_mapping_submission_id_fk` FOREIGN KEY (`submission_id`) REFERENCES `submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作者投稿表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_submission_mapping`
--

LOCK TABLES `author_submission_mapping` WRITE;
/*!40000 ALTER TABLE `author_submission_mapping` DISABLE KEYS */;
INSERT INTO `author_submission_mapping` VALUES ('2f39bec3-a167-4461-b587-bead284b7310','79b64fc3-6e82-4fe5-a931-1009b75e6400','7889f19d-1ccc-4338-8ac1-a2b5b8caf82d'),('46094867-ff91-4099-a72e-26fc159e9f26','79b64fc3-6e82-4fe5-a931-1009b75e6400','64090631-124d-4867-9b8a-585fde6f83d9'),('a496a957-a8d3-48d0-b94b-4c1168b41198','20a1043f-15cc-4c53-ae6a-957ad62b63f6','fa3a40be-6ccf-4d8f-b028-a50f9d86098d');
/*!40000 ALTER TABLE `author_submission_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_submission_mapping`
--

DROP TABLE IF EXISTS `review_submission_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_submission_mapping` (
  `id` varchar(255) NOT NULL COMMENT '订单编号',
  `state` tinyint(4) DEFAULT NULL COMMENT '审阅标记',
  `payment` int(11) DEFAULT NULL COMMENT '稿费',
  `charge` int(11) DEFAULT NULL COMMENT '版面费',
  `reviewer_id` varchar(255) DEFAULT NULL COMMENT '审稿人ID',
  `submission_id` varchar(255) DEFAULT NULL COMMENT '稿件ID',
  `fee` int(11) DEFAULT NULL COMMENT '审稿费',
  `fee_state` int(11) DEFAULT '0' COMMENT '审稿费是否收到标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `review_submission_mapping_id_uindex` (`id`),
  KEY `review_submission_mapping_reviewer_id_fk` (`reviewer_id`),
  KEY `review_submission_mapping_submission_id_fk` (`submission_id`),
  CONSTRAINT `review_submission_mapping_reviewer_id_fk` FOREIGN KEY (`reviewer_id`) REFERENCES `reviewer` (`id`),
  CONSTRAINT `review_submission_mapping_submission_id_fk` FOREIGN KEY (`submission_id`) REFERENCES `submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审阅稿件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_submission_mapping`
--

LOCK TABLES `review_submission_mapping` WRITE;
/*!40000 ALTER TABLE `review_submission_mapping` DISABLE KEYS */;
INSERT INTO `review_submission_mapping` VALUES ('42f2e982-d91f-4af7-b74c-b4c4a3c9c37a',1,3,3,'cbc8e9f0-54dd-4d8b-9877-032c49f10517','fa3a40be-6ccf-4d8f-b028-a50f9d86098d',3,0),('53de2aff-565b-4e4d-8d2d-e98db49c2fd8',1,12,12,'d485d94d-6d22-414a-ae15-720d8236bbe0','7889f19d-1ccc-4338-8ac1-a2b5b8caf82d',12,1),('bc57b5b9-a6d2-4b92-b4b7-26ac9ff04907',1,45,23,'cbc8e9f0-54dd-4d8b-9877-032c49f10517','64090631-124d-4867-9b8a-585fde6f83d9',32,0);
/*!40000 ALTER TABLE `review_submission_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer`
--

DROP TABLE IF EXISTS `reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewer` (
  `id` varchar(255) NOT NULL COMMENT '审稿人ID',
  `account_` varchar(255) NOT NULL COMMENT '审稿人登录账号',
  `password_` varchar(255) NOT NULL COMMENT '审稿人登录密码',
  `name_` varchar(255) NOT NULL COMMENT '审稿人姓名',
  `contact` varchar(255) NOT NULL COMMENT '审稿人联系方式',
  `total` bigint(20) NOT NULL COMMENT '审稿人审稿费总计',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewer_account__uindex` (`account_`),
  UNIQUE KEY `reviewer_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审稿人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer`
--

LOCK TABLES `reviewer` WRITE;
/*!40000 ALTER TABLE `reviewer` DISABLE KEYS */;
INSERT INTO `reviewer` VALUES ('043db4e0-cf83-4c39-9b8d-b4380b290b78','zyc1','zyc1zyc1','丞禹朱','12345678902',0),('cbc8e9f0-54dd-4d8b-9877-032c49f10517','hs1','hs1hs1','俗何','12345678901',35),('d485d94d-6d22-414a-ae15-720d8236bbe0','lzh1','lzh1lzh1','华泽卢','12345678900',12);
/*!40000 ALTER TABLE `reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission`
--

DROP TABLE IF EXISTS `submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission` (
  `id` varchar(255) NOT NULL COMMENT '稿件编号',
  `name_` varchar(255) DEFAULT NULL COMMENT '稿件名称',
  `state` tinyint(4) DEFAULT NULL COMMENT '稿件状态\n0 未投递 投递->1\n1 已投递 审稿人接稿->2\n2 待审核 审阅->3,4\n3 未通过\n4 审阅通过',
  `content` text COMMENT '稿件内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='稿件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
INSERT INTO `submission` VALUES ('64090631-124d-4867-9b8a-585fde6f83d9','你好',5,'123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789'),('7889f19d-1ccc-4338-8ac1-a2b5b8caf82d','hello,卢泽华',5,'hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华'),('fa3a40be-6ccf-4d8f-b028-a50f9d86098d','hello,何俗',5,'何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗');
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER g_afterupdate_submission
AFTER UPDATE
ON `submission` FOR EACH ROW
BEGIN
IF old.state=5 THEN
UPDATE `review_submission_mapping` SET fee_state=1 WHERE `submission_id` = old.id;
END IF;
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

-- Dump completed on 2020-06-19 11:35:28
