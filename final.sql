CREATE DATABASE IF NOT EXISTS `Quiz` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Quiz`;
-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Quiz
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.13.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id`              INT(11)              NOT NULL AUTO_INCREMENT,
  `action_time`     DATETIME             NOT NULL,
  `user_id`         INT(11)              NOT NULL,
  `content_type_id` INT(11) DEFAULT NULL,
  `object_id`       LONGTEXT,
  `object_repr`     VARCHAR(200)         NOT NULL,
  `action_flag`     SMALLINT(5) UNSIGNED NOT NULL,
  `change_message`  LONGTEXT             NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =8
  DEFAULT CHARSET =utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1, '2013-05-23 21:00:31', 1, 9, '37', '1 [2] (Новый)', 3, ''), (2, '2013-05-23 21:00:31', 1, 9, '36', '123 [1] (Новый)', 3, ''), (3, '2013-05-23 21:00:31', 1, 9, '35', 'Новый проект [1] (Окончен)', 3, ''), (4, '2013-05-23 21:00:31', 1, 9, '34', 'Lookup [1] (Новый)', 3, ''), (5, '2013-05-23 21:03:03', 1, 8, '1', '1: Skype: unclelem', 3, ''), (6, '2013-05-23 21:03:31', 1, 3, '2', 'uncle_Lem', 2, 'Changed username, password, first_name and last_name.'), (7, '2013-05-23 21:03:59', 1, 3, '4', 'TestUser', 2, 'Changed username, password, first_name and last_name.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id`              INT(11)      NOT NULL AUTO_INCREMENT,
  `name`            VARCHAR(50)  NOT NULL,
  `content_type_id` INT(11)      NOT NULL,
  `codename`        VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`, `codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =43
  DEFAULT CHARSET =utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission'), (2, 'Can change permission', 1, 'change_permission'), (3, 'Can delete permission', 1, 'delete_permission'), (4, 'Can add group', 2, 'add_group'), (5, 'Can change group', 2, 'change_group'), (6, 'Can delete group', 2, 'delete_group'), (7, 'Can add user', 3, 'add_user'), (8, 'Can change user', 3, 'change_user'), (9, 'Can delete user', 3, 'delete_user'), (10, 'Can add content type', 4, 'add_contenttype'), (11, 'Can change content type', 4, 'change_contenttype'), (12, 'Can delete content type', 4, 'delete_contenttype'), (13, 'Can add session', 5, 'add_session'), (14, 'Can change session', 5, 'change_session'), (15, 'Can delete session', 5, 'delete_session'), (16, 'Can add site', 6, 'add_site'), (17, 'Can change site', 6, 'change_site'), (18, 'Can delete site', 6, 'delete_site'), (19, 'Can add project status', 7, 'add_projectstatus'), (20, 'Can change project status', 7, 'change_projectstatus'), (21, 'Can delete project status', 7, 'delete_projectstatus'), (22, 'Can add contacts', 8, 'add_contacts'), (23, 'Can change contacts', 8, 'change_contacts'), (24, 'Can delete contacts', 8, 'delete_contacts'), (25, 'Can add project', 9, 'add_project'), (26, 'Can change project', 9, 'change_project'), (27, 'Can delete project', 9, 'delete_project'), (28, 'Can add group type', 10, 'add_grouptype'), (29, 'Can change group type', 10, 'change_grouptype'), (30, 'Can delete group type', 10, 'delete_grouptype'), (31, 'Can add question group', 11, 'add_questiongroup'), (32, 'Can change question group', 11, 'change_questiongroup'), (33, 'Can delete question group', 11, 'delete_questiongroup'), (34, 'Can add question', 12, 'add_question'), (35, 'Can change question', 12, 'change_question'), (36, 'Can delete question', 12, 'delete_question'), (37, 'Can add answer', 13, 'add_answer'), (38, 'Can change answer', 13, 'change_answer'), (39, 'Can delete answer', 13, 'delete_answer'), (40, 'Can add log entry', 14, 'add_logentry'), (41, 'Can change log entry', 14, 'change_logentry'), (42, 'Can delete log entry', 14, 'delete_logentry');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id`   INT(11)     NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8;
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
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id`            INT(11) NOT NULL AUTO_INCREMENT,
  `group_id`      INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`, `permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id`        INT(11)      NOT NULL AUTO_INCREMENT,
  `name`      VARCHAR(100) NOT NULL,
  `app_label` VARCHAR(100) NOT NULL,
  `model`     VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`, `model`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =15
  DEFAULT CHARSET =utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1, 'permission', 'auth', 'permission'), (2, 'group', 'auth', 'group'), (3, 'user', 'auth', 'user'), (4, 'content type', 'contenttypes', 'contenttype'), (5, 'session', 'sessions', 'session'), (6, 'site', 'sites', 'site'), (7, 'project status', 'quiz', 'projectstatus'), (8, 'contacts', 'quiz', 'contacts'), (9, 'project', 'quiz', 'project'), (10, 'group type', 'quiz', 'grouptype'), (11, 'question group', 'quiz', 'questiongroup'), (12, 'question', 'quiz', 'question'), (13, 'answer', 'quiz', 'answer'), (14, 'log entry', 'admin', 'logentry');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id`            INT(11) NOT NULL AUTO_INCREMENT,
  `user_id`       INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`, `permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question`
--

DROP TABLE IF EXISTS `quiz_question`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_question` (
  `id`                   INT(11)                 NOT NULL AUTO_INCREMENT,
  `position`             INT(11)                 NOT NULL,
  `text`                 VARCHAR(300)
                         COLLATE utf8_unicode_ci NOT NULL,
  `id_question_group_id` INT(11)                 NOT NULL,
  `is_valuable`          TINYINT(1)              NOT NULL,
  `value`                DOUBLE                  NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_question_b61b8061` (`id_question_group_id`),
  CONSTRAINT `id_question_group_id_refs_id_54028a19` FOREIGN KEY (`id_question_group_id`) REFERENCES `quiz_questiongroup` (`id`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =31
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question`
--

LOCK TABLES `quiz_question` WRITE;
/*!40000 ALTER TABLE `quiz_question` DISABLE KEYS */;
INSERT INTO `quiz_question` VALUES (1, 0, 'Mobile/iOS', 1, 1, 150), (2, 1, 'Mobile/Android', 1, 1, 200), (3, 2, 'Mobile/Оба варианта', 1, 1, 350), (4, 3, 'Без мобильного приложения', 1, 1, 0), (5, 4, 'Не уверен', 1, 1, 233), (6, 0, 'PHP/Durpal', 2, 1, 230), (7, 1, 'Java', 2, 1, 400), (8, 2, 'Без серверного приложения', 2, 1, 0), (9, 3, 'Не уверен', 2, 1, 315), (10, 0, '< 1000 USD', 3, 1, 1000), (11, 1, '1000-5000 USD', 3, 1, 5000), (12, 2, '5000-10000 USD', 3, 1, 10000), (13, 3, 'Не уверен', 3, 1, 5333), (14, 0, 'Есть ли вайерфреймы?', 4, 1, 0.25), (15, 1, 'Есть ли техническое задание?', 4, 1, 0.25), (16, 2, 'Есть ли приложение-образец?', 4, 1, 0.25), (17, 3, 'Дополнительные файлы?', 4, 1, 0.25), (18, 0, 'Каждое требование отдельной строкой', 5, 1, 0), (19, 1, 'Аутентификация пользователей', 6, 1, 20), (20, 2, 'Различные роли пользователей', 6, 1, 24), (21, 3, 'Секция управления пользователями', 6, 1, 50), (22, 4, 'Секция управления содержимым', 6, 1, 40), (23, 5, 'Push уведомления', 6, 1, 12), (24, 6, 'E-mail уведомления', 6, 1, 6), (25, 1, 'Каждое требование отдельной строкой', 7, 1, 20), (26, 1, '<1 неделя', 8, 1, 40), (27, 2, '1-4 недели', 8, 1, 160), (28, 3, '4-8 недели', 8, 1, 320), (29, 4, '2-6 месяцев', 8, 1, 960), (30, 5, 'Более 6 месяцев', 8, 1, 1500);
/*!40000 ALTER TABLE `quiz_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answer`
--

DROP TABLE IF EXISTS `quiz_answer`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_answer` (
  `id`          INT(11)                 NOT NULL AUTO_INCREMENT,
  `project_id`  INT(11)                 NOT NULL,
  `question_id` INT(11)                 NOT NULL,
  `value`       VARCHAR(300)
                COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_answer_b6620684` (`project_id`),
  KEY `quiz_answer_1f92e550` (`question_id`),
  CONSTRAINT `project_id_refs_id_8dec98b` FOREIGN KEY (`project_id`) REFERENCES `quiz_project` (`id`),
  CONSTRAINT `question_id_refs_id_938f428f` FOREIGN KEY (`question_id`) REFERENCES `quiz_question` (`id`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =998
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answer`
--

LOCK TABLES `quiz_answer` WRITE;
/*!40000 ALTER TABLE `quiz_answer` DISABLE KEYS */;
INSERT INTO `quiz_answer` VALUES (168, 11, 1, '0'), (169, 11, 2, '1'), (170, 11, 3, '0'), (171, 11, 4, '0'), (172, 11, 5, '0'), (173, 11, 6, '0'), (174, 11, 7, '0'), (175, 11, 8, '1'), (176, 11, 9, '0'), (177, 11, 10, '1'), (178, 11, 11, '0'), (179, 11, 12, '0'), (180, 11, 13, '0'), (181, 11, 14, '0'), (182, 11, 15, '1'), (183, 11, 16, '0'), (184, 11, 17, '0'), (188, 11, 26, '0'), (189, 11, 27, '1'), (190, 11, 28, '0'), (191, 11, 29, '0'), (192, 11, 30, '0'), (193, 12, 1, '0'), (194, 12, 2, '1'), (195, 12, 3, '0'), (196, 12, 4, '0'), (197, 12, 5, '0'), (198, 12, 6, '0'), (199, 12, 7, '0'), (200, 12, 8, '1'), (201, 12, 9, '0'), (202, 12, 10, '1'), (203, 12, 11, '0'), (204, 12, 12, '0'), (205, 12, 13, '0'), (206, 12, 14, '1'), (207, 12, 15, '1'), (208, 12, 16, '0'), (209, 12, 17, '0'), (213, 12, 19, '0'), (214, 12, 20, '0'), (215, 12, 21, '0'), (216, 12, 22, '0'), (217, 12, 23, '0'), (218, 12, 24, '0'), (219, 12, 26, '0'), (220, 12, 27, '1'), (221, 12, 28, '0'), (222, 12, 29, '0'), (223, 12, 30, '0'), (224, 11, 18, 'Screens'), (225, 11, 18, 'Difficulty levels'), (226, 11, 18, 'Levels'), (227, 12, 18, '2 вида таймера'), (228, 12, 18, 'нотификации'), (229, 12, 18, 'секундомеры'), (230, 13, 1, '0'), (231, 13, 2, '1'), (232, 13, 3, '0'), (233, 13, 4, '0'), (234, 13, 5, '0'), (235, 13, 6, '0'), (236, 13, 7, '0'), (237, 13, 8, '1'), (238, 13, 9, '0'), (239, 13, 10, '1'), (240, 13, 11, '0'), (241, 13, 12, '0'), (242, 13, 13, '0'), (243, 13, 14, '0'), (244, 13, 15, '1'), (245, 13, 16, '1'), (246, 13, 17, '0'), (247, 13, 18, 'Поиск в локальной базе'), (248, 13, 18, 'Поиск в удаленной базе'), (249, 13, 18, 'Переход eng - fr'), (250, 13, 18, 'Переход fr - eng'), (251, 13, 26, '0'), (252, 13, 27, '1'), (253, 13, 28, '0'), (254, 13, 29, '0'), (255, 13, 30, '0'), (256, 14, 1, '0'), (257, 14, 2, '1'), (258, 14, 3, '0'), (259, 14, 4, '0'), (260, 14, 5, '0'), (261, 14, 6, '0'), (262, 14, 7, '0'), (263, 14, 8, '1'), (264, 14, 9, '0'), (265, 14, 10, '1'), (266, 14, 11, '0'), (267, 14, 12, '0'), (268, 14, 13, '0'), (269, 14, 14, '0'), (270, 14, 15, '1'), (271, 14, 16, '0'), (272, 14, 17, '0'), (273, 14, 18, 'Работа с фронтальной камерой'), (274, 14, 18, 'Хранение данных'), (275, 14, 18, 'Отлавливание ложных паролей'), (276, 14, 19, '0'), (277, 14, 20, '0'), (278, 14, 21, '0'), (279, 14, 22, '0'), (280, 14, 23, '0'), (281, 14, 24, '0'), (282, 14, 26, '0'), (283, 14, 27, '1'), (284, 14, 28, '0'), (285, 14, 29, '0'), (286, 14, 30, '0'), (287, 15, 1, '0'), (288, 15, 2, '1'), (289, 15, 3, '0'), (290, 15, 4, '0'), (291, 15, 5, '0'), (292, 15, 6, '0'), (293, 15, 7, '0'), (294, 15, 8, '1'), (295, 15, 9, '0'), (296, 15, 10, '1'), (297, 15, 11, '0'), (298, 15, 12, '0'), (299, 15, 13, '0'), (300, 15, 14, '0'), (301, 15, 15, '0'), (302, 15, 16, '1'), (303, 15, 17, '0'), (304, 15, 18, 'req1'), (305, 15, 18, 'req2'), (306, 15, 18, 'req3'), (307, 15, 19, '0'), (308, 15, 20, '0'), (309, 15, 21, '0'), (310, 15, 22, '0'), (311, 15, 23, '0'), (312, 15, 24, '0'), (313, 15, 26, '0'), (314, 15, 27, '1'), (315, 15, 28, '0'), (316, 15, 29, '0'), (317, 15, 30, '0'), (318, 16, 1, '0'), (319, 16, 2, '1'), (320, 16, 3, '0'), (321, 16, 4, '0'), (322, 16, 5, '0'), (323, 16, 6, '0'), (324, 16, 7, '0'), (325, 16, 8, '1'), (326, 16, 9, '0'), (327, 16, 10, '1'), (328, 16, 11, '0'), (329, 16, 12, '0'), (330, 16, 13, '0'), (331, 16, 14, '1'), (332, 16, 15, '1'), (333, 16, 16, '0'), (334, 16, 17, '0'), (335, 16, 18, 'req1'), (336, 16, 18, 'req2'), (337, 16, 18, 'req3'), (338, 16, 19, '0'), (339, 16, 20, '0'), (340, 16, 21, '0'), (341, 16, 22, '0'), (342, 16, 23, '0'), (343, 16, 24, '0'), (344, 16, 26, '0'), (345, 16, 27, '1'), (346, 16, 28, '0'), (347, 16, 29, '0'), (348, 16, 30, '0'), (349, 17, 1, '0'), (350, 17, 2, '0'), (351, 17, 3, '1'), (352, 17, 4, '0'), (353, 17, 5, '0'), (354, 17, 6, '0'), (355, 17, 7, '0'), (356, 17, 8, '1'), (357, 17, 9, '0'), (358, 17, 10, '0'), (359, 17, 11, '1'), (360, 17, 12, '0'), (361, 17, 13, '0'), (362, 17, 14, '1'), (363, 17, 15, '1'), (364, 17, 16, '0'), (365, 17, 17, '0'), (366, 17, 18, 'req1'), (367, 17, 18, 'req2'), (368, 17, 18, 'req3'), (369, 17, 18, 'req4'), (370, 17, 18, 'req5'), (371, 17, 19, '0'), (372, 17, 20, '0'), (373, 17, 21, '0'), (374, 17, 22, '0'), (375, 17, 23, '0'), (376, 17, 24, '0'), (377, 17, 26, '0'), (378, 17, 27, '0'), (379, 17, 28, '1'), (380, 17, 29, '0'), (381, 17, 30, '0'), (382, 18, 1, '0'), (383, 18, 2, '1'), (384, 18, 3, '0'), (385, 18, 4, '0'), (386, 18, 5, '0'), (387, 18, 6, '0'), (388, 18, 7, '0'), (389, 18, 8, '1'), (390, 18, 9, '0'), (391, 18, 10, '1'), (392, 18, 11, '0'), (393, 18, 12, '0'), (394, 18, 13, '0'), (395, 18, 14, '1'), (396, 18, 15, '1'), (397, 18, 16, '0'), (398, 18, 17, '0'), (399, 18, 18, 'req1'), (400, 18, 18, 'req2'), (401, 18, 18, 'req3'), (402, 18, 18, 'req4'), (403, 18, 26, '0'), (404, 18, 27, '1'), (405, 18, 28, '0'), (406, 18, 29, '0'), (407, 18, 30, '0'), (408, 19, 1, '0'), (409, 19, 2, '1'), (410, 19, 3, '0'), (411, 19, 4, '0'), (412, 19, 5, '0'), (413, 19, 6, '0'), (414, 19, 7, '0'), (415, 19, 8, '1'), (416, 19, 9, '0'), (417, 19, 10, '1'), (418, 19, 11, '0'), (419, 19, 12, '0'), (420, 19, 13, '0'), (421, 19, 14, '1'), (422, 19, 15, '1'), (423, 19, 16, '0'), (424, 19, 17, '0'), (425, 19, 18, 'req1'), (426, 19, 18, 'req2'), (427, 19, 18, 'req3'), (428, 19, 18, 'req4'), (429, 19, 19, '0'), (430, 19, 20, '0'), (431, 19, 21, '0'), (432, 19, 22, '0'), (433, 19, 23, '0'), (434, 19, 24, '0'), (435, 19, 26, '0'), (436, 19, 27, '1'), (437, 19, 28, '0'), (438, 19, 29, '0'), (439, 19, 30, '0'), (440, 20, 1, '0'), (441, 20, 2, '1'), (442, 20, 3, '0'), (443, 20, 4, '0'), (444, 20, 5, '0'), (445, 20, 6, '0'), (446, 20, 7, '0'), (447, 20, 8, '1'), (448, 20, 9, '0'), (449, 20, 10, '1'), (450, 20, 11, '0'), (451, 20, 12, '0'), (452, 20, 13, '0'), (453, 20, 14, '1'), (454, 20, 15, '1'), (455, 20, 16, '0'), (456, 20, 17, '0'), (457, 20, 18, 'req1'), (458, 20, 18, 'req2'), (459, 20, 18, 'req3'), (460, 20, 18, 'req4'), (461, 20, 19, '0'), (462, 20, 20, '0'), (463, 20, 21, '0'), (464, 20, 22, '0'), (465, 20, 23, '0'), (466, 20, 24, '0'), (467, 20, 26, '0'), (468, 20, 27, '1'), (469, 20, 28, '0'), (470, 20, 29, '0'), (471, 20, 30, '0'), (472, 21, 1, '0'), (473, 21, 2, '1'), (474, 21, 3, '0'), (475, 21, 4, '0'), (476, 21, 5, '0'), (477, 21, 6, '0'), (478, 21, 7, '0'), (479, 21, 8, '1'), (480, 21, 9, '0'), (481, 21, 10, '1'), (482, 21, 11, '0'), (483, 21, 12, '0'), (484, 21, 13, '0'), (485, 21, 14, '1'), (486, 21, 15, '1'), (487, 21, 16, '0'), (488, 21, 17, '0'), (489, 21, 18, 'req1'), (490, 21, 18, 'req2'), (491, 21, 18, 'req3'), (492, 21, 18, 'req4'), (493, 21, 19, '0'), (494, 21, 20, '0'), (495, 21, 21, '0'), (496, 21, 22, '0'), (497, 21, 23, '0'), (498, 21, 24, '0'), (499, 21, 26, '0'), (500, 21, 27, '1'), (501, 21, 28, '0'), (502, 21, 29, '0'), (503, 21, 30, '0'), (504, 22, 1, '0'), (505, 22, 2, '1'), (506, 22, 3, '0'), (507, 22, 4, '0'), (508, 22, 5, '0'), (509, 22, 6, '0'), (510, 22, 7, '0'), (511, 22, 8, '1'), (512, 22, 9, '0'), (513, 22, 10, '0'), (514, 22, 11, '1'), (515, 22, 12, '0'), (516, 22, 13, '0'), (517, 22, 14, '0'), (518, 22, 15, '0'), (519, 22, 16, '1'), (520, 22, 17, '0'), (521, 22, 18, 'req1'), (522, 22, 18, 'req2'), (523, 22, 18, 'req3'), (524, 22, 18, 'req4'), (525, 22, 18, 'req5'), (526, 22, 19, '0'), (527, 22, 20, '0'), (528, 22, 21, '0'), (529, 22, 22, '0'), (530, 22, 23, '0'), (531, 22, 24, '0'), (532, 22, 26, '0'), (533, 22, 27, '0'), (534, 22, 28, '1'), (535, 22, 29, '0'), (536, 22, 30, '0'), (537, 23, 1, '1'), (538, 23, 2, '0'), (539, 23, 3, '0'), (540, 23, 4, '0'), (541, 23, 5, '0'), (542, 23, 6, '0'), (543, 23, 7, '0'), (544, 23, 8, '1'), (545, 23, 9, '0'), (546, 23, 10, '0'), (547, 23, 11, '1'), (548, 23, 12, '0'), (549, 23, 13, '0'), (550, 23, 14, '1'), (551, 23, 15, '0'), (552, 23, 16, '0'), (553, 23, 17, '0'), (554, 23, 18, 'req1'), (555, 23, 18, 'req2'), (556, 23, 18, 'req3'), (557, 23, 18, 'req4'), (558, 23, 18, 'req5'), (559, 23, 18, 'req6'), (560, 23, 18, 'req7'), (561, 23, 18, 'req8'), (562, 23, 18, 'req9'), (563, 23, 18, 'req10'), (564, 23, 18, 'req11'), (565, 23, 19, '0'), (566, 23, 20, '0'), (567, 23, 21, '0'), (568, 23, 22, '0'), (569, 23, 23, '0'), (570, 23, 24, '0'), (571, 23, 26, '0'), (572, 23, 27, '0'), (573, 23, 28, '0'), (574, 23, 29, '1'), (575, 23, 30, '0'), (576, 24, 1, '0'), (577, 24, 2, '1'), (578, 24, 3, '0'), (579, 24, 4, '0'), (580, 24, 5, '0'), (581, 24, 6, '0'), (582, 24, 7, '0'), (583, 24, 8, '1'), (584, 24, 9, '0'), (585, 24, 10, '1'), (586, 24, 11, '0'), (587, 24, 12, '0'), (588, 24, 13, '0'), (589, 24, 14, '0'), (590, 24, 15, '0'), (591, 24, 16, '1'), (592, 24, 17, '0'), (593, 24, 18, 'req1'), (594, 24, 18, 'req2'), (595, 24, 18, 'req3'), (596, 24, 18, 'req4'), (597, 24, 26, '0'), (598, 24, 27, '1'), (599, 24, 28, '0'), (600, 24, 29, '0'), (601, 24, 30, '0'), (602, 25, 1, '1'), (603, 25, 2, '0'), (604, 25, 3, '0'), (605, 25, 4, '0'), (606, 25, 5, '0'), (607, 25, 6, '0'), (608, 25, 7, '0'), (609, 25, 8, '1'), (610, 25, 9, '0'), (611, 25, 10, '1'), (612, 25, 11, '0'), (613, 25, 12, '0'), (614, 25, 13, '0'), (615, 25, 14, '1'), (616, 25, 15, '0'), (617, 25, 16, '0'), (618, 25, 17, '0'), (619, 25, 18, 'req1'), (620, 25, 18, 'req2'), (621, 25, 18, 'req3'), (622, 25, 19, '0'), (623, 25, 20, '0'), (624, 25, 21, '0'), (625, 25, 22, '0'), (626, 25, 23, '0'), (627, 25, 24, '0'), (628, 25, 26, '0'), (629, 25, 27, '1'), (630, 25, 28, '0'), (631, 25, 29, '0'), (632, 25, 30, '0'), (633, 26, 1, '0'), (634, 26, 2, '1'), (635, 26, 3, '0'), (636, 26, 4, '0'), (637, 26, 5, '0'), (638, 26, 6, '0'), (639, 26, 7, '0'), (640, 26, 8, '1'), (641, 26, 9, '0'), (642, 26, 10, '0'), (643, 26, 11, '1'), (644, 26, 12, '0'), (645, 26, 13, '0'), (646, 26, 14, '1'), (647, 26, 15, '0'), (648, 26, 16, '0'), (649, 26, 17, '0'), (650, 26, 18, 'req1'), (651, 26, 18, 'req2'), (652, 26, 18, 'req3'), (653, 26, 18, 'req4'), (654, 26, 26, '0'), (655, 26, 27, '0'), (656, 26, 28, '0'), (657, 26, 29, '1'), (658, 26, 30, '0'), (659, 27, 1, '0'), (660, 27, 2, '1'), (661, 27, 3, '0'), (662, 27, 4, '0'), (663, 27, 5, '0'), (664, 27, 6, '0'), (665, 27, 7, '0'), (666, 27, 8, '1'), (667, 27, 9, '0'), (668, 27, 10, '1'), (669, 27, 11, '0'), (670, 27, 12, '0'), (671, 27, 13, '0'), (672, 27, 14, '0'), (673, 27, 15, '0'), (674, 27, 16, '0'), (675, 27, 17, '0'), (676, 27, 18, 'Antichess AI'), (677, 27, 18, 'Different AI levels'), (678, 27, 18, 'Statistics'), (679, 27, 18, 'Different color themes'), (680, 27, 18, 'Sound effects'), (681, 27, 18, 'Highlight available pieces'), (682, 27, 26, '0'), (683, 27, 27, '0'), (684, 27, 28, '1'), (685, 27, 29, '0'), (686, 27, 30, '0'), (687, 28, 1, '0'), (688, 28, 2, '1'), (689, 28, 3, '0'), (690, 28, 4, '0'), (691, 28, 5, '0'), (692, 28, 6, '0'), (693, 28, 7, '0'), (694, 28, 8, '1'), (695, 28, 9, '0'), (696, 28, 10, '1'), (697, 28, 11, '0'), (698, 28, 12, '0'), (699, 28, 13, '0'), (700, 28, 14, '1'), (701, 28, 15, '0'), (702, 28, 16, '0'), (703, 28, 17, '0'), (704, 28, 18, '4iR AI'), (705, 28, 18, 'Different AI levels'), (706, 28, 18, 'Statistics'), (707, 28, 18, 'User profiles'), (708, 28, 18, 'Sound effects'), (709, 28, 18, 'Bluetooth game'), (710, 28, 18, 'Avatar from camera'), (711, 28, 18, 'Avatar from presets'), (712, 28, 18, 'Avatar from file'), (713, 28, 19, '0'), (714, 28, 20, '0'), (715, 28, 21, '0'), (716, 28, 22, '0'), (717, 28, 23, '0'), (718, 28, 24, '0'), (719, 28, 26, '0'), (720, 28, 27, '0'), (721, 28, 28, '1'), (722, 28, 29, '0'), (723, 28, 30, '0'), (724, 29, 1, '1'), (725, 29, 2, '0'), (726, 29, 3, '0'), (727, 29, 4, '0'), (728, 29, 5, '0'), (729, 29, 6, '0'), (730, 29, 7, '1'), (731, 29, 8, '0'), (732, 29, 9, '0'), (733, 29, 10, '0'), (734, 29, 11, '1'), (735, 29, 12, '0'), (736, 29, 13, '0'), (737, 29, 14, '0'), (738, 29, 15, '1'), (739, 29, 16, '1'), (740, 29, 17, '0'), (741, 29, 18, 'req1'), (742, 29, 18, 'req2'), (743, 29, 18, 'req3'), (744, 29, 18, 'req4'), (745, 29, 19, '1'), (746, 29, 20, '1'), (747, 29, 21, '1'), (748, 29, 22, '0'), (749, 29, 23, '0'), (750, 29, 24, '1'), (751, 29, 25, 'req1'), (752, 29, 25, 'req2'), (753, 29, 25, 'req3'), (754, 29, 25, 'req4'), (755, 29, 25, 'req5'), (756, 29, 25, 'req6'), (757, 29, 25, 'req7'), (758, 29, 25, 'req8'), (759, 29, 26, '0'), (760, 29, 27, '0'), (761, 29, 28, '0'), (762, 29, 29, '0'), (763, 29, 30, '1'), (764, 30, 1, '0'), (765, 30, 2, '1'), (766, 30, 3, '0'), (767, 30, 4, '0'), (768, 30, 5, '0'), (769, 30, 6, '1'), (770, 30, 7, '0'), (771, 30, 8, '0'), (772, 30, 9, '0'), (773, 30, 10, '0'), (774, 30, 11, '1'), (775, 30, 12, '0'), (776, 30, 13, '0'), (777, 30, 14, '0'), (778, 30, 15, '0'), (779, 30, 16, '1'), (780, 30, 17, '1'), (781, 30, 18, 'req1'), (782, 30, 18, 'req2'), (783, 30, 18, 'req3'), (784, 30, 18, 'req4'), (785, 30, 18, 'req5'), (786, 30, 19, '0'), (787, 30, 20, '0'), (788, 30, 21, '0'), (789, 30, 22, '1'), (790, 30, 23, '1'), (791, 30, 24, '0'), (792, 30, 25, 'req1'), (793, 30, 25, 'req2'), (794, 30, 25, 'req3'), (795, 30, 26, '0'), (796, 30, 27, '0'), (797, 30, 28, '0'), (798, 30, 29, '1'), (799, 30, 30, '0'), (800, 31, 1, '0'), (801, 31, 2, '0'), (802, 31, 3, '1'), (803, 31, 4, '0'), (804, 31, 5, '0'), (805, 31, 6, '0'), (806, 31, 7, '1'), (807, 31, 8, '0'), (808, 31, 9, '0'), (809, 31, 10, '0'), (810, 31, 11, '1'), (811, 31, 12, '0'), (812, 31, 13, '0'), (813, 31, 14, '1'), (814, 31, 15, '1'), (815, 31, 16, '0'), (816, 31, 17, '0'), (817, 31, 18, 'req1'), (818, 31, 18, 'req2'), (819, 31, 18, 'req3'), (820, 31, 19, '1'), (821, 31, 20, '0'), (822, 31, 21, '0'), (823, 31, 22, '1'), (824, 31, 23, '1'), (825, 31, 24, '1'), (826, 31, 25, 'req1'), (827, 31, 25, 'req2'), (828, 31, 25, 'req3'), (829, 31, 25, 'req4'), (830, 31, 25, 'req5'), (831, 31, 26, '0'), (832, 31, 27, '0'), (833, 31, 28, '0'), (834, 31, 29, '0'), (835, 31, 30, '1'), (836, 32, 1, '0'), (837, 32, 2, '1'), (838, 32, 3, '0'), (839, 32, 4, '0'), (840, 32, 5, '0'), (841, 32, 6, '1'), (842, 32, 7, '0'), (843, 32, 8, '0'), (844, 32, 9, '0'), (845, 32, 10, '0'), (846, 32, 11, '0'), (847, 32, 12, '1'), (848, 32, 13, '0'), (849, 32, 14, '1'), (850, 32, 15, '0'), (851, 32, 16, '0'), (852, 32, 17, '1'), (853, 32, 18, 'req1'), (854, 32, 18, 'req2'), (855, 32, 18, 'req3'), (856, 32, 18, 'req4'), (857, 32, 18, 'req5'), (858, 32, 18, 'req6'), (859, 32, 19, '0'), (860, 32, 20, '0'), (861, 32, 21, '0'), (862, 32, 22, '1'), (863, 32, 23, '0'), (864, 32, 24, '0'), (865, 32, 25, 'req1'), (866, 32, 25, 'req2'), (867, 32, 25, 'req3'), (868, 32, 26, '0'), (869, 32, 27, '0'), (870, 32, 28, '1'), (871, 32, 29, '0'), (872, 32, 30, '0'), (873, 33, 1, '1'), (874, 33, 2, '0'), (875, 33, 3, '0'), (876, 33, 4, '0'), (877, 33, 5, '0'), (878, 33, 6, '0'), (879, 33, 7, '1'), (880, 33, 8, '0'), (881, 33, 9, '0'), (882, 33, 10, '0'), (883, 33, 11, '0'), (884, 33, 12, '1'), (885, 33, 13, '0'), (886, 33, 14, '1'), (887, 33, 15, '1'), (888, 33, 16, '0'), (889, 33, 17, '0'), (890, 33, 18, 'req1'), (891, 33, 18, 'req2'), (892, 33, 18, 'req3'), (893, 33, 18, 'req4'), (894, 33, 18, 'req5'), (895, 33, 18, 'req6'), (896, 33, 19, '1'), (897, 33, 20, '0'), (898, 33, 21, '1'), (899, 33, 22, '0'), (900, 33, 23, '0'), (901, 33, 24, '0'), (902, 33, 25, 'req1'), (903, 33, 25, 'req2'), (904, 33, 25, 'req3'), (905, 33, 25, 'req4'), (906, 33, 26, '0'), (907, 33, 27, '0'), (908, 33, 28, '0'), (909, 33, 29, '1'), (910, 33, 30, '0'), (967, 38, 1, '0'), (968, 38, 2, '1'), (969, 38, 3, '0'), (970, 38, 4, '0'), (971, 38, 5, '0'), (972, 38, 6, '0'), (973, 38, 7, '0'), (974, 38, 8, '1'), (975, 38, 9, '0'), (976, 38, 10, '1'), (977, 38, 11, '0'), (978, 38, 12, '0'), (979, 38, 13, '0'), (980, 38, 14, '0'), (981, 38, 15, '0'), (982, 38, 16, '1'), (983, 38, 17, '0'), (984, 38, 18, 'Соединение с существующим сервером через JSON'), (985, 38, 18, 'Парковочные места и информация - в виде пинов на Google Maps'), (986, 38, 18, 'Экран с возможностью отправить информацию о новом месте'), (987, 38, 19, '0'), (988, 38, 20, '0'), (989, 38, 21, '0'), (990, 38, 22, '0'), (991, 38, 23, '0'), (992, 38, 24, '0'), (993, 38, 26, '1'), (994, 38, 27, '0'), (995, 38, 28, '0'), (996, 38, 29, '0'), (997, 38, 30, '0');
/*!40000 ALTER TABLE `quiz_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id`     INT(11)      NOT NULL AUTO_INCREMENT,
  `domain` VARCHAR(100) NOT NULL,
  `name`   VARCHAR(50)  NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =2
  DEFAULT CHARSET =utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1, 'example.com', 'example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_grouptype`
--

DROP TABLE IF EXISTS `quiz_grouptype`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_grouptype` (
  `id`         INT(11)                 NOT NULL AUTO_INCREMENT,
  `group_type` VARCHAR(45)
               COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =5
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_grouptype`
--

LOCK TABLES `quiz_grouptype` WRITE;
/*!40000 ALTER TABLE `quiz_grouptype` DISABLE KEYS */;
INSERT INTO `quiz_grouptype` VALUES (2, 'enum'), (3, 'checkbox'), (4, 'radio');
/*!40000 ALTER TABLE `quiz_grouptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_projectstatus`
--

DROP TABLE IF EXISTS `quiz_projectstatus`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_projectstatus` (
  `id`       INT(11)      NOT NULL AUTO_INCREMENT,
  `name`     VARCHAR(100) NOT NULL,
  `readable` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =5
  DEFAULT CHARSET =utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_projectstatus`
--

LOCK TABLES `quiz_projectstatus` WRITE;
/*!40000 ALTER TABLE `quiz_projectstatus` DISABLE KEYS */;
INSERT INTO `quiz_projectstatus` VALUES (1, 'New', 'Новый'), (2, 'Submitted', 'В рассмотрении'), (3, 'Started', 'В процессе'), (4, 'Finished', 'Окончен');
/*!40000 ALTER TABLE `quiz_projectstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_questiongroup`
--

DROP TABLE IF EXISTS `quiz_questiongroup`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_questiongroup` (
  `id`                     INT(11)      NOT NULL AUTO_INCREMENT,
  `position_No`            INT(11)      NOT NULL,
  `group_header`           VARCHAR(300) NOT NULL,
  `group_type_id`          INT(11)      NOT NULL,
  `regression_coefficient` DOUBLE       NOT NULL,
  `included`               INT(11)      NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_questiongroup_50cd04b2` (`group_type_id`),
  CONSTRAINT `group_type_id_refs_id_a9a4cd8f` FOREIGN KEY (`group_type_id`) REFERENCES `quiz_grouptype` (`id`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =10
  DEFAULT CHARSET =utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_questiongroup`
--

LOCK TABLES `quiz_questiongroup` WRITE;
/*!40000 ALTER TABLE `quiz_questiongroup` DISABLE KEYS */;
INSERT INTO `quiz_questiongroup` VALUES (1, 1, 'Тип мобильной платформы', 4, 0.614053836297493, 1), (2, 2, 'Тип сервера', 4, - 1.01111763759289, 1), (3, 3, 'Бюджет', 4, 0.0144270160757231, 1), (4, 4, 'Детали клиентского приложения', 3, - 422.426962833495, 1), (5, 5, 'Функциональные требования к клиентскому приложению', 2, 0, 0), (6, 6, 'Детали серверного приложения', 3, 38.2299988203534, 1), (7, 7, 'Функциональные требования к серверному приложению', 2, - 88.16703509108, 1), (8, 8, 'Сроки выполнения', 4, 0.476824929764591, 1), (9, 0, 'Базовая группа', 3, 99.2569564864215, 1);
/*!40000 ALTER TABLE `quiz_questiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key`  VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT    NOT NULL,
  `expire_date`  DATETIME    NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('e05a0a4df2d6a19c5127eceb217a084b', 'MDZjNDg4OGYyNGNhZDJmNThiODJmN2Y2YzM2MDU1NjNhODcyOTk2OTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-06-06 21:08:32');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id`       INT(11) NOT NULL AUTO_INCREMENT,
  `user_id`  INT(11) NOT NULL,
  `group_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`, `group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_contacts`
--

DROP TABLE IF EXISTS `quiz_contacts`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_contacts` (
  `id`      INT(11)                 NOT NULL AUTO_INCREMENT,
  `user_id` INT(11)                 NOT NULL,
  `value`   VARCHAR(300)
            COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_contacts_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_4a8f98f4` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =4
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_contacts`
--

LOCK TABLES `quiz_contacts` WRITE;
/*!40000 ALTER TABLE `quiz_contacts` DISABLE KEYS */;
INSERT INTO `quiz_contacts` VALUES (2, 2, 'Skype: uncle.lem'), (3, 4, 'Tel.: +380500386625');
/*!40000 ALTER TABLE `quiz_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_project`
--

DROP TABLE IF EXISTS `quiz_project`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_project` (
  `id`          INT(11)                 NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(75)
                COLLATE utf8_unicode_ci NOT NULL,
  `owner_id`    INT(11)                 NOT NULL,
  `status_id`   INT(11)                 NOT NULL,
  `real_result` DOUBLE                  NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_project_5d52dd10` (`owner_id`),
  KEY `quiz_project_44224078` (`status_id`),
  CONSTRAINT `owner_id_refs_id_8bedde5f` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `status_id_refs_id_3be83d8d` FOREIGN KEY (`status_id`) REFERENCES `quiz_projectstatus` (`id`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =39
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_project`
--

LOCK TABLES `quiz_project` WRITE;
/*!40000 ALTER TABLE `quiz_project` DISABLE KEYS */;
INSERT INTO `quiz_project` VALUES (11, 'Змейка', 2, 4, 170), (12, 'Таймер', 2, 4, 80), (13, 'Verb', 2, 4, 100), (14, 'Watchdog', 2, 4, 180), (15, 'Conjugator', 2, 4, 190), (16, 'Таймер1440', 2, 4, 120), (17, 'Top10 Cards Quiz', 2, 4, 320), (18, 'Русские загадки', 2, 4, 120), (19, 'Английские загадки', 2, 4, 90), (20, 'Немецкие загадки', 2, 4, 130), (21, 'Итальянские загадки', 2, 4, 120), (22, 'Маленький первооткрыватель', 2, 4, 400), (23, 'Sign Me Up', 2, 4, 480), (24, 'Японская поэзия', 2, 4, 160), (25, 'Кривое зеркало', 2, 4, 140), (26, 'Спички', 2, 4, 750), (27, 'Антишахматы', 2, 4, 400), (28, 'четыре в ряд', 2, 4, 400), (29, 's1', 2, 4, 3500), (30, 's2', 2, 4, 2000), (31, 's3', 2, 4, 3000), (32, 's4', 2, 4, 1300), (33, 'serv5', 2, 4, 2550), (38, 'Парковки', 4, 2, 0);
/*!40000 ALTER TABLE `quiz_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id`           INT(11)      NOT NULL AUTO_INCREMENT,
  `username`     VARCHAR(30)  NOT NULL,
  `first_name`   VARCHAR(30)  NOT NULL,
  `last_name`    VARCHAR(30)  NOT NULL,
  `email`        VARCHAR(75)  NOT NULL,
  `password`     VARCHAR(128) NOT NULL,
  `is_staff`     TINYINT(1)   NOT NULL,
  `is_active`    TINYINT(1)   NOT NULL,
  `is_superuser` TINYINT(1)   NOT NULL,
  `last_login`   DATETIME     NOT NULL,
  `date_joined`  DATETIME     NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =5
  DEFAULT CHARSET =utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1, 'root', '', '', 'uncle.lem@yandex.ru', 'pbkdf2_sha256$10000$GtyasEwaG40O$rdkP/2vfcril4gbUusp1xUvVYoEaUD34PtkJXgLuyyU=', 1, 1, 1, '2013-05-23 21:08:32', '2013-05-23 20:32:15'), (2, 'uncle_Lem', 'Sergey', 'Khokhlov', 'uncle.lem@yandex.ru', 'pbkdf2_sha256$10000$H0Mqeg8SIa0I$gFUDGgOtxwumUpWIdrSNWgWiZPPaxFEZqBeTHextYSw=', 0, 1, 0, '2013-05-23 21:04:25', '2013-05-23 20:56:50'), (4, 'TestUser', 'Test', 'User', 'uncle.lem@yandex.ru', 'pbkdf2_sha256$10000$TyWLtQb76Hqo$+9IOJI2Xia7hQ+GQi5piXAheDTo6VMCRZNjn6FsNxxk=', 0, 1, 0, '2013-05-23 21:04:56', '2013-05-23 20:57:24');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2013-05-24  0:33:00
