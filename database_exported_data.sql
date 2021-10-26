-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: ghanari_messenger
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `blocking`
--

DROP TABLE IF EXISTS `blocking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocking` (
  `blocker_user` varchar(20) NOT NULL,
  `blocked_user` varchar(20) NOT NULL,
  PRIMARY KEY (`blocker_user`,`blocked_user`),
  KEY `blocked_user` (`blocked_user`),
  CONSTRAINT `blocking_ibfk_1` FOREIGN KEY (`blocker_user`) REFERENCES `ghanari_user` (`username`),
  CONSTRAINT `blocking_ibfk_2` FOREIGN KEY (`blocked_user`) REFERENCES `ghanari_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocking`
--

LOCK TABLES `blocking` WRITE;
/*!40000 ALTER TABLE `blocking` DISABLE KEYS */;
INSERT INTO `blocking` VALUES ('neginnhs','mard21'),('fb','neginnhs'),('nila77','neginnhs'),('paria70','nila77'),('neginnhs','paria70'),('nila77','paria70');
/*!40000 ALTER TABLE `blocking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `follower_user` varchar(20) NOT NULL,
  `followed_user` varchar(20) NOT NULL,
  PRIMARY KEY (`follower_user`,`followed_user`),
  KEY `followed_user` (`followed_user`),
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`follower_user`) REFERENCES `ghanari_user` (`username`),
  CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`followed_user`) REFERENCES `ghanari_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES ('neginnhs','alii'),('nila77','alii'),('neginnhs','fb'),('nila77','fb'),('nila77','neginnhs'),('neginnhs','nila77'),('nila77','paria70');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghanari_user`
--

DROP TABLE IF EXISTS `ghanari_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghanari_user` (
  `name` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pswd` varchar(128) NOT NULL,
  `birth_date` date NOT NULL,
  `reg_date` timestamp NOT NULL,
  `bio` varchar(64) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghanari_user`
--

LOCK TABLES `ghanari_user` WRITE;
/*!40000 ALTER TABLE `ghanari_user` DISABLE KEYS */;
INSERT INTO `ghanari_user` VALUES ('ali','mohammadi','alii','5599b6537c528b756782e3d1093b1544','1999-12-23','2021-05-28 09:13:38','welcome!'),('foo','boo','fb','bf5365b94961ea1e6cd377894863fc51','1979-09-10','2021-05-27 11:24:09','hello!'),('mehrdad','ardehali','mard21','e63d68023195df47388d02f7af520de9','1999-10-18','2021-07-13 14:25:52','busy'),('neign','miri','neg','c0076f112011cc677dd4d1f4439c6c66','0001-02-03','2021-07-16 15:50:05','g'),('negin','sobhani','neginnhs','bf5365b94961ea1e6cd377894863fc51','1999-10-18','2021-05-27 11:20:58','hello world!'),('nila','miri','nila77','6fcebf354791ff22e0b6d8208998eddd','2000-11-22','2021-05-27 22:16:37','welcome!'),('paria','piri','paria70','6fcebf354791ff22e0b6d8208998eddd','1991-02-02','2021-05-28 09:12:44','lucky!'),('pooyeh','motarjemi','poom','8d0e81a78078140ffd5d2f5cf4f59970','1999-10-18','2021-07-16 15:16:45','this is me');
/*!40000 ALTER TABLE `ghanari_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hash_tweet`
--

DROP TABLE IF EXISTS `hash_tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hash_tweet` (
  `id` int NOT NULL,
  `tweet_hashtag` char(6) NOT NULL,
  KEY `id` (`id`),
  KEY `tweet_hashtag` (`tweet_hashtag`),
  CONSTRAINT `hash_tweet_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tweet` (`tweet_id`),
  CONSTRAINT `hash_tweet_ibfk_2` FOREIGN KEY (`tweet_hashtag`) REFERENCES `hashtag` (`hashtag_content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hash_tweet`
--

LOCK TABLES `hash_tweet` WRITE;
/*!40000 ALTER TABLE `hash_tweet` DISABLE KEYS */;
INSERT INTO `hash_tweet` VALUES (9,'#salam'),(8,'#aaaaa'),(7,'#aaaaa'),(2,'#aaaaa'),(2,'#salam'),(1,'#salam'),(5,'#error');
/*!40000 ALTER TABLE `hash_tweet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtag`
--

DROP TABLE IF EXISTS `hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtag` (
  `hashtag_content` char(6) NOT NULL,
  PRIMARY KEY (`hashtag_content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

LOCK TABLES `hashtag` WRITE;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
INSERT INTO `hashtag` VALUES ('#aaaaa'),('#error'),('#hello'),('#negin'),('#newww'),('#salam'),('#trump');
/*!40000 ALTER TABLE `hashtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `liker` varchar(20) NOT NULL,
  `liked_tweet` int NOT NULL,
  KEY `liker` (`liker`),
  KEY `liked_tweet` (`liked_tweet`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`liker`) REFERENCES `ghanari_user` (`username`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`liked_tweet`) REFERENCES `tweet` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES ('paria70',8),('paria70',2),('paria70',1),('neginnhs',1),('neginnhs',6),('neginnhs',2),('alii',2),('fb',2),('mard21',4),('neginnhs',21);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_log`
--

DROP TABLE IF EXISTS `login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_log` (
  `username` varchar(20) NOT NULL,
  `login_date` timestamp NOT NULL,
  KEY `username` (`username`),
  CONSTRAINT `login_log_ibfk_1` FOREIGN KEY (`username`) REFERENCES `ghanari_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_log`
--

LOCK TABLES `login_log` WRITE;
/*!40000 ALTER TABLE `login_log` DISABLE KEYS */;
INSERT INTO `login_log` VALUES ('neginnhs','2021-05-27 12:29:39'),('neginnhs','2021-05-27 12:29:52'),('fb','2021-05-27 12:30:15'),('fb','2021-05-27 12:36:58'),('fb','2021-05-27 13:21:35'),('fb','2021-05-27 14:01:10'),('fb','2021-05-27 14:01:42'),('fb','2021-05-27 14:01:44'),('fb','2021-05-27 15:56:59'),('mard21','2021-07-13 14:47:23'),('nila77','2021-07-13 14:57:45'),('neginnhs','2021-07-13 14:58:25'),('mard21','2021-07-14 08:51:00'),('neginnhs','2021-07-14 16:29:37'),('nila77','2021-07-16 11:48:46'),('neginnhs','2021-07-16 11:49:57'),('mard21','2021-07-16 11:50:35'),('nila77','2021-07-16 12:15:08'),('neginnhs','2021-07-16 12:23:41'),('mard21','2021-07-16 12:24:06'),('neginnhs','2021-07-16 13:07:32'),('mard21','2021-07-16 13:59:37'),('neginnhs','2021-07-16 14:04:51'),('nila77','2021-07-16 14:05:07'),('neginnhs','2021-07-16 15:55:02'),('poom','2021-07-16 16:50:14'),('neginnhs','2021-07-16 16:50:52'),('mard21','2021-07-16 17:26:14'),('poom','2021-07-16 17:29:19'),('nila77','2021-07-16 17:29:43'),('neginnhs','2021-07-16 17:30:01'),('nila77','2021-07-16 18:13:38');
/*!40000 ALTER TABLE `login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message_content` varchar(256) DEFAULT NULL,
  `message_tweet` int DEFAULT NULL,
  `message_sender` varchar(20) NOT NULL,
  `message_receiver` varchar(20) NOT NULL,
  `message_date` timestamp NOT NULL,
  `is_valid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `message_sender` (`message_sender`),
  KEY `message_tweet` (`message_tweet`),
  KEY `message_receiver` (`message_receiver`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`message_sender`) REFERENCES `ghanari_user` (`username`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`message_tweet`) REFERENCES `tweet` (`tweet_id`),
  CONSTRAINT `message_ibfk_3` FOREIGN KEY (`message_receiver`) REFERENCES `ghanari_user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'hello',NULL,'neginnhs','paria70','2021-06-02 07:25:05',1),(2,NULL,3,'neginnhs','nila77','2021-06-02 08:29:53',1),(3,NULL,9,'alii','nila77','2021-06-02 09:18:09',0),(4,NULL,9,'neginnhs','nila77','2021-06-02 09:21:28',0),(5,NULL,3,'paria70','neginnhs','2021-06-02 09:54:53',0),(6,'whats is up',NULL,'neginnhs','nila77','2021-06-02 09:57:56',1),(7,'what',NULL,'fb','nila77','2021-06-02 10:16:48',1),(8,NULL,8,'fb','nila77','2021-06-02 10:17:11',0),(9,'hi',NULL,'alii','nila77','2021-06-02 10:24:27',1),(10,NULL,8,'fb','nila77','2021-06-02 10:25:23',0),(11,'hi',NULL,'neginnhs','paria70','2021-07-16 13:10:07',1),(12,NULL,8,'neginnhs','paria70','2021-07-16 13:11:13',1),(13,'orchid',NULL,'neginnhs','mard21','2021-07-16 13:13:08',1),(14,NULL,8,'neginnhs','mard21','2021-07-16 13:20:40',1),(15,NULL,6,'neginnhs','mard21','2021-07-16 13:21:22',0),(16,NULL,NULL,'neginnhs','mard21','2021-07-16 13:22:18',1),(17,NULL,NULL,'neginnhs','mard21','2021-07-16 13:23:42',1),(18,NULL,2,'neginnhs','mard21','2021-07-16 17:18:37',1),(19,'hello',NULL,'neginnhs','mard21','2021-07-16 17:19:08',1),(20,NULL,3,'neginnhs','mard21','2021-07-16 17:19:29',0);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweet`
--

DROP TABLE IF EXISTS `tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet` (
  `tweet_id` int NOT NULL AUTO_INCREMENT,
  `tweet_content` varchar(256) NOT NULL,
  `tweet_sender` varchar(20) NOT NULL,
  `tweet_date` timestamp NOT NULL,
  `is_comment` tinyint(1) DEFAULT NULL,
  `comment_to` int DEFAULT NULL,
  PRIMARY KEY (`tweet_id`),
  KEY `comment_to` (`comment_to`),
  KEY `tweet_sender` (`tweet_sender`),
  CONSTRAINT `tweet_ibfk_1` FOREIGN KEY (`comment_to`) REFERENCES `tweet` (`tweet_id`),
  CONSTRAINT `tweet_ibfk_2` FOREIGN KEY (`tweet_sender`) REFERENCES `ghanari_user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet`
--

LOCK TABLES `tweet` WRITE;
/*!40000 ALTER TABLE `tweet` DISABLE KEYS */;
INSERT INTO `tweet` VALUES (1,'my first tweet!','neginnhs','2021-05-28 12:00:51',0,NULL),(2,'hello!','neginnhs','2021-05-28 12:00:53',0,NULL),(3,'monday!','fb','2021-05-28 12:00:54',0,NULL),(4,'busy today!','fb','2021-05-28 12:00:55',0,NULL),(5,'monday!','fb','2021-05-28 12:00:56',0,NULL),(6,'happy!','nila77','2021-05-28 12:00:58',0,NULL),(7,'sad today!','nila77','2021-05-28 12:00:59',0,NULL),(8,'aaaaa!','paria70','2021-05-28 12:01:00',0,NULL),(9,'yesssssss!','paria70','2021-05-28 12:01:01',0,NULL),(10,'halli hallo!','alii','2021-05-28 12:01:02',0,NULL),(13,'great!!','nila77','2021-05-28 13:09:24',1,3),(14,'niceee!!','neginnhs','2021-05-28 13:09:38',1,3),(15,'whatt?!!','alii','2021-05-28 13:25:22',1,14),(16,'halli #error hallo!','neginnhs','2021-06-04 09:07:57',0,NULL),(17,'halli #errora hallo!','neginnhs','2021-06-04 09:09:06',0,NULL),(18,'whatt?!!','alii','2021-06-04 14:33:30',1,14),(20,'flower','mard21','2021-07-14 09:48:07',0,NULL),(21,'flower','mard21','2021-07-14 10:12:31',0,NULL),(22,'white orchid','mard21','2021-07-14 12:29:02',0,NULL),(23,'orchid','neginnhs','2021-07-14 16:30:04',0,NULL),(24,'orchid','neginnhs','2021-07-14 17:54:25',0,NULL),(25,'nice!','neginnhs','2021-07-16 09:24:21',1,4),(26,'nice!','neginnhs','2021-07-16 09:24:44',1,4),(27,'nice!','neginnhs','2021-07-16 09:25:31',1,4),(28,'a!','neginnhs','2021-07-16 09:32:04',1,4),(29,'a!','neginnhs','2021-07-16 09:34:29',1,4),(30,'a!','neginnhs','2021-07-16 09:35:46',1,4),(31,'a!','neginnhs','2021-07-16 09:38:42',1,4),(32,'a!','neginnhs','2021-07-16 09:39:13',1,4),(33,'thanks!','neginnhs','2021-07-16 09:46:25',1,22),(34,'cm on cm!!','neginnhs','2021-07-16 09:47:58',1,33),(35,'proud!','neginnhs','2021-07-16 16:05:54',0,NULL),(36,'i like it','neginnhs','2021-07-16 16:30:15',1,21);
/*!40000 ALTER TABLE `tweet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ghanari_messenger'
--
/*!50003 DROP PROCEDURE IF EXISTS `block_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `block_user`(in target varchar(20))
begin 
	declare uname varchar(20);
    call get_signed_in_user(uname);
    
     if (uname=target) then 
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'you can not block yourself';
	else 
		 if ((select username from ghanari_user where username=target) is null) then 
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'the user you want to block does not exist!';
		else 
			if ((select blocker_user from blocking where blocker_user=uname and blocked_user=target) is null) then
				insert into  blocking(blocker_user, blocked_user) values (uname, target);
			else 
				SIGNAL SQLSTATE '42927'
				SET MESSAGE_TEXT = 'you have already blocked this user!!';
			end if;
		 end if;
	 end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comment_on_tweet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `comment_on_tweet`(in tid int, in cm_content varchar(256))
begin 
	
	declare target varchar(20);
    declare uname varchar(20);
    call get_signed_in_user(uname);
    call get_tweet_sender(tid, target);
    
    if (exists (select blocker_user from blocking where blocker_user=target and blocked_user=uname)) then
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'you have been blocked!!';
	else
		insert into tweet(tweet_id,tweet_content, tweet_sender,tweet_date,is_comment,comment_to) values
		(tweet_id, cm_content, uname, current_timestamp(), true, tid);
	end if;
		
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_new_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_account`(in fname VARCHAR(20),in lname varchar(20),in uname varchar(20),in passwd varchar(128),
in bdate DATE, in biog varchar(64))
begin 
	if ((select username from ghanari_user where username=uname) is NULL) then 
		insert into ghanari_user values (
		fname, 
		lname, 
		uname,
		md5(passwd),
		bdate,
		current_timestamp(),
		biog
		);
    else 
		SIGNAL SQLSTATE '42927'
		SET MESSAGE_TEXT = 'This username is occupied';
	END IF;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `follow_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `follow_user`(in target varchar(20))
begin 
	-- get signed in user 
	declare uname varchar(20);
    call get_signed_in_user(uname);
    
    if (uname=target) then 
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'you can not follow yourself';
	else 
		 if ((select username from ghanari_user where username=target) is null) then 
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'the user you want to follow does not exist!';
		else 
			if ((select follower_user from follow where follower_user=uname and followed_user=target) is null) then
				insert into follow(follower_user,followed_user) values (uname, target);
			else 
				SIGNAL SQLSTATE '42927'
				SET MESSAGE_TEXT = 'you are already following this user!';
			end if;
		 end if;
	 end if;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_message_senders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_message_senders`()
begin 
	declare uname varchar(20);
	call get_signed_in_user(uname);
    
    select distinct message_sender
	from message
	where message_receiver=uname and is_valid=true
	order by message_date desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_comments_of_tweet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_comments_of_tweet`(in tid int)
begin 
	declare target varchar(20);
    declare uname varchar(20);
    call get_signed_in_user(uname);
    call get_tweet_sender(tid, target);
    
    if (exists (select blocker_user from blocking where blocker_user=target and blocked_user=uname)) then
		select * 
        from tweet
        where not exists(select blocker_user
						 from blocking
                         where blocker_user=target and blocked_user=uname);
	else
		select *
        from tweet as t
        where t.comment_to=tid and not exists(select tweet_sender 
											  from tweet, blocking
											  where blocked_user=uname
											  and blocker_user = t.tweet_sender);
	  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_following_activity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_following_activity`()
begin 
	declare uname varchar(20);
	call get_signed_in_user(uname);
    
    
	select *
    from tweet
    where tweet_sender in (select followed_user
						   from follow
							 where follower_user=uname) and not exists (select blocker_user
																		from blocking
																		where blocker_user=tweet_sender
																		and blocked_user=uname)
	order by tweet_date desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_likers_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_likers_list`(in tid int)
begin 
	declare target varchar(20);
    declare uname varchar(20);
    call get_signed_in_user(uname);
    call get_tweet_sender(tid, target);
    
    if (exists (select blocker_user from blocking where blocker_user=target and blocked_user=uname)) then
		select null as result FROM DUAL;
        
	else
		select liker
        from likes as l
        where l.liked_tweet=tid and not exists(select *
											   from blocking 
                                               where blocker_user=l.liker and blocked_user=uname);
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_like_num` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_like_num`(in tid int)
begin 
	declare target varchar(20);
    declare uname varchar(20);
    call get_signed_in_user(uname);
    call get_tweet_sender(tid, target);
    
    if (exists (select blocker_user from blocking where blocker_user=target and blocked_user=uname)) then
		select 0 as result FROM DUAL;
	else
		select count(liked_tweet) as like_num
        from likes
        where liked_tweet = tid;
	end if;
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_messages_from_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_messages_from_user`(in target varchar(20))
begin 
	declare uname varchar(20);
	call get_signed_in_user(uname);
    
    select * 
	from message 
	where message_receiver=uname and message_sender=target and is_valid=true
	order by message_date desc;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_personal_tweet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_personal_tweet`()
begin 
	declare t_sender varchar(20);
    call get_signed_in_user(t_sender);
    
	select *
	from tweet 
	where tweet_sender=t_sender
	order by tweet_date asc;

    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_popular_tweets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_popular_tweets`()
begin 
    declare uname varchar(20);
    call get_signed_in_user(uname);
    
    (with likes_num(like_num, liked_tweet) as 
	(select count(liker) as like_num, liked_tweet
	from likes
	group by liked_tweet
	order by like_num desc)

	select t.tweet_id, t.tweet_content, t.tweet_sender, t.tweet_date, t.is_comment,
	t.comment_to, ifnull(like_num, 0) as number_of_likes 
	from tweet  as t left join likes_num as l on t.tweet_id = l.liked_tweet
	where not exists (select *
					  from blocking
					  where blocked_user=uname and blocker_user= t.tweet_sender))
	order by l.like_num desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_signed_in_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_signed_in_user`(out uname varchar(20))
begin
	select username
    into uname
    from login_log 
    order by login_date desc
    limit 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_tweet_sender` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tweet_sender`(in tid int, out uname varchar(20))
begin 
	select tweet_sender
    into uname
    from tweet
    where tweet_id=tid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_activity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_activity`(in target varchar(20))
begin 
	declare uname varchar(20);
    call get_signed_in_user(uname);
    
    if (uname=target) then 
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'use get personal tweet feature to get your own tweets!';
	else 
		 if ((select username from ghanari_user where username=target) is null) then 
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'the user does not exist!';
		else
			if ((select blocker_user from blocking where blocker_user=target and blocked_user=uname) is null) then 
				select * 
                from tweet 
                where tweet_sender=target
                order by tweet_date desc;
			else 
				select *
                from tweet
                where not exists (select blocker_user
								  from blocking
                                  where blocker_user=target and blocked_user=uname);
			end if;
		end if;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_login_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_login_log`(uname VARCHAR(20))
begin 
	select * 
    from login_log
    where username = uname
    order by login_date desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `like_tweet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `like_tweet`(in tid int)
begin 
	declare target varchar(20);
    declare uname varchar(20);
    call get_signed_in_user(uname);
    call get_tweet_sender(tid, target);
    
    if (exists (select blocker_user from blocking where blocker_user=target and blocked_user=uname)) then
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'you have been blocked!!';
	else
		if (not exists (select liker from likes where liker=uname and liked_tweet=tid)) then
			insert into likes values
			(uname, tid);
		else
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'you have already liked this tweet!!';
		end if;
	end if;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in uname VARCHAR(20), in passwd varchar(128))
begin 
if ((select username from ghanari_user as g
	where g.username=uname and md5(passwd) = g.pswd) is not null) then
    insert into login_log values (uname, current_timestamp());
else 
	SIGNAL SQLSTATE '42927'
	SET MESSAGE_TEXT = 'login unsuccessful, invalid data';
end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_message_text` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `send_message_text`(in receiver varchar(20), in m_content varchar(256))
begin 
	declare sender varchar(20);
	call get_signed_in_user(sender);
    
		if (exists (select blocker_user from blocking where blocker_user=receiver and blocked_user=sender)) then
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'blocked! can not send message';
		else
			insert into message(message_id, message_content, message_tweet,
			message_sender, message_receiver, message_date,is_valid) values
            (message_id, m_content, null, sender, receiver,current_timestamp(), true);
		end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_message_tweet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `send_message_tweet`(in receiver varchar(20), in m_tweet int)
begin 
	declare target varchar(20);
	declare sender varchar(20);
	call get_signed_in_user(sender);
    call get_tweet_sender(m_tweet, target);
    
    if (exists (select blocker_user from blocking where blocker_user=receiver and blocked_user=sender)) then
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'blocked! can not send message';
		else
			if (exists(select blocker_user from blocking where blocker_user=target and blocked_user=sender)) then
				insert into message(message_id, message_content, message_tweet,
				message_sender, message_receiver, message_date,is_valid) values
				(message_id, null, m_tweet, sender, receiver,current_timestamp(), false);
			else 
				insert into message(message_id, message_content, message_tweet,
				message_sender, message_receiver, message_date,is_valid) values
				(message_id, null, m_tweet, sender, receiver,current_timestamp(), true);
			end if;
		end if;		
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unblock_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unblock_user`(in target varchar(20))
begin 
	declare uname varchar(20);
    call get_signed_in_user(uname);
    
   if (uname=target) then 
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'you can not unblock yourself!';
	else 
		 if ((select username from ghanari_user where username=target) is null) then 
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'the user you want to unblock does not exist!';
		else 
			if ((select blocker_user from blocking where blocker_user=uname and blocked_user=target) is null) then
				SIGNAL SQLSTATE '42927'
				SET MESSAGE_TEXT = 'you have not blocked this user!';
			else 
				delete from blocking
				where blocker_user=uname and blocked_user=target;
			end if;
		 end if;
	 end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unfollow_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unfollow_user`(in target varchar(20))
begin 
	declare uname varchar(20);
    call get_signed_in_user(uname);
    
   if (uname=target) then 
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'you can not unfollow yourself!';
	else 
		 if ((select username from ghanari_user where username=target) is null) then 
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'the user you want to unfollow does not exist!';
		else 
			if ((select follower_user from follow where follower_user=uname and followed_user=target) is null) then
				SIGNAL SQLSTATE '42927'
				SET MESSAGE_TEXT = 'you are not following this user!';
			else 
				delete from follow
				where follower_user=uname and followed_user=target;
			end if;
		 end if;
	 end if;
     
end ;;
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

-- Dump completed on 2021-07-16 23:27:13
