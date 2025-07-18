-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: 192.168.100.168    Database: zzyl
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Database `zzyl`
--
CREATE DATABASE IF NOT EXISTS zzyl;
USE zzyl;

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bed`
(
    `id`          bigint   NOT NULL AUTO_INCREMENT COMMENT '床位ID',
    `bed_number`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '床位编号',
    `bed_status`  int                                                           DEFAULT NULL COMMENT '床位状态: 未入住0, 已入住1 ',
    `sort`        int                                                           DEFAULT NULL COMMENT '床位号',
    `room_id`     bigint                                                        DEFAULT NULL COMMENT '房间ID',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_time` datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `create_by`   bigint                                                        DEFAULT NULL COMMENT '创建人id',
    `update_by`   bigint                                                        DEFAULT NULL COMMENT '更新人id',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `bed_number` (`bed_number`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 201
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='床位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed`
    DISABLE KEYS */;
INSERT INTO `bed`
VALUES (1, '101-1', 1, 1, 1, '2023-09-26 17:39:53', '2023-10-05 15:59:24', 1671403256519078138, 1671403256519078164,
        NULL),
       (2, '102-1', 0, 1, 2, '2023-09-26 17:40:01', '2023-10-05 16:00:05', 1671403256519078138, 1671403256519078164,
        NULL),
       (3, '102-2', 0, 2, 2, '2023-09-26 17:40:09', '2023-10-05 15:59:45', 1671403256519078138, 1671403256519078164,
        NULL),
       (4, '103-1', 0, 1, 3, '2023-09-26 17:40:42', '2023-10-05 16:00:21', 1671403256519078138, 1671403256519078164,
        NULL),
       (5, '104-1', 1, 1, 4, '2023-09-26 17:40:49', '2023-09-26 17:45:39', 1671403256519078138, 1671403256519078138,
        NULL),
       (6, '104-2', 1, 2, 4, '2023-09-26 17:40:54', '2023-10-20 23:22:12', 1671403256519078138, 1671403256519078164,
        NULL),
       (7, '105-1', 0, 1, 5, '2023-09-26 17:41:09', '2023-09-26 17:45:52', 1671403256519078138, 1671403256519078138,
        NULL),
       (8, '106-1', 0, 1, 6, '2023-09-26 17:41:16', '2023-09-26 17:45:58', 1671403256519078138, 1671403256519078138,
        NULL),
       (9, '106-2', 0, 2, 6, '2023-09-26 17:41:24', '2023-09-26 17:46:04', 1671403256519078138, 1671403256519078138,
        NULL),
       (10, '107-1', 0, 1, 7, '2023-09-26 17:41:32', '2023-12-21 09:37:49', 1671403256519078138, 1671403256519078138,
        NULL),
       (11, '201-1', 0, 1, 8, '2023-09-26 17:44:53', '2023-10-13 10:40:27', 1671403256519078138, 1671403256519078164,
        NULL),
       (12, '202-1', 0, 1, 9, '2023-09-26 17:46:33', '2023-09-26 17:46:33', 1671403256519078138, NULL, NULL),
       (13, '202-2', 0, 2, 9, '2023-09-26 17:46:47', '2023-09-26 17:46:47', 1671403256519078138, NULL, NULL),
       (14, '203-1', 0, 1, 10, '2023-09-26 18:43:58', '2023-09-26 18:43:58', 1671403256519078138, NULL, NULL),
       (15, '204-1', 0, 1, 11, '2023-09-26 18:44:03', '2023-09-26 18:44:03', 1671403256519078138, NULL, NULL),
       (16, '204-2', 0, 2, 11, '2023-09-26 18:44:12', '2023-09-26 18:44:12', 1671403256519078138, NULL, NULL),
       (18, '205-1', 0, 1, 12, '2023-09-26 18:44:23', '2023-12-20 18:40:07', 1671403256519078138, 1671403256519078138,
        NULL),
       (19, '206-1', 0, 1, 13, '2023-09-26 18:44:36', '2023-12-20 21:43:10', 1671403256519078138, 1671403256519078138,
        NULL),
       (20, '206-2', 0, 2, 13, '2023-09-26 18:44:42', '2023-09-26 18:44:48', 1671403256519078138, 1671403256519078138,
        NULL),
       (21, '207-1', 0, 1, 14, '2023-09-26 18:45:01', '2023-09-26 18:45:01', 1671403256519078138, NULL, NULL),
       (22, '301-2', 0, 1, 15, '2023-09-26 18:45:26', '2023-12-26 19:35:06', 1671403256519078138, 1671403256519078138,
        NULL),
       (23, '302-1', 0, 1, 16, '2023-09-26 18:45:31', '2023-09-26 18:45:31', 1671403256519078138, NULL, NULL),
       (24, '302-3', 0, 2, 16, '2023-09-26 18:45:39', '2023-12-26 19:35:15', 1671403256519078138, 1671403256519078138,
        NULL),
       (25, '303-1', 0, 1, 17, '2023-09-26 18:45:44', '2023-09-26 18:45:44', 1671403256519078138, NULL, NULL),
       (27, '304-1', 0, 1, 18, '2023-09-26 18:45:55', '2023-09-26 18:45:55', 1671403256519078138, NULL, NULL),
       (28, '304-2', 0, 2, 18, '2023-09-26 18:46:04', '2023-09-26 18:46:04', 1671403256519078138, NULL, NULL),
       (29, '305-1', 0, 1, 19, '2023-09-26 18:46:11', '2023-12-21 10:04:47', 1671403256519078138, 1671403256519078138,
        NULL),
       (30, '306-1', 0, 1, 20, '2023-09-26 18:46:16', '2023-09-26 18:46:16', 1671403256519078138, NULL, NULL),
       (31, '306-2', 0, 2, 20, '2023-09-26 18:46:22', '2023-09-26 19:08:50', 1671403256519078138, 1671403256519078138,
        NULL),
       (32, '307-1', 0, 1, 21, '2023-09-26 18:46:29', '2023-09-26 18:46:29', 1671403256519078138, NULL, NULL),
       (33, '401-1', 0, 1, 22, '2023-09-26 18:52:14', '2023-09-26 18:52:14', 1671403256519078138, NULL, NULL),
       (34, '402-1', 0, 1, 23, '2023-09-26 18:52:22', '2023-09-26 18:52:22', 1671403256519078138, NULL, NULL),
       (35, '402-2', 0, 2, 23, '2023-09-26 18:52:35', '2023-09-26 18:52:38', 1671403256519078138, 1671403256519078138,
        NULL),
       (36, '403-1', 0, 1, 24, '2023-09-26 18:52:47', '2023-09-26 18:52:47', 1671403256519078138, NULL, NULL),
       (37, '404-1', 0, 1, 25, '2023-09-26 18:52:54', '2023-09-26 18:52:54', 1671403256519078138, NULL, NULL),
       (38, '404-2', 0, 2, 25, '2023-09-26 18:53:02', '2023-09-26 18:53:10', 1671403256519078138, 1671403256519078138,
        NULL),
       (39, '405-1', 0, 1, 26, '2023-09-26 18:53:18', '2023-09-26 18:53:18', 1671403256519078138, NULL, NULL),
       (40, '406-1', 0, 1, 27, '2023-09-26 18:53:27', '2023-09-26 18:53:27', 1671403256519078138, NULL, NULL),
       (41, '406-2', 0, 2, 27, '2023-09-26 18:53:36', '2023-09-26 18:53:36', 1671403256519078138, NULL, NULL),
       (42, '407-1', 0, 1, 28, '2023-09-26 18:53:44', '2023-09-26 18:53:44', 1671403256519078138, NULL, NULL),
       (43, '501-1', 0, 1, 29, '2023-09-26 18:55:47', '2023-09-26 18:55:47', 1671403256519078138, NULL, NULL),
       (44, '502-1', 0, 1, 31, '2023-09-26 18:55:52', '2023-09-26 18:55:52', 1671403256519078138, NULL, NULL),
       (45, '502-2', 0, 2, 31, '2023-09-26 18:56:02', '2023-09-26 18:56:02', 1671403256519078138, NULL, NULL),
       (46, '503-1', 0, 1, 32, '2023-09-26 18:56:10', '2023-09-26 18:56:10', 1671403256519078138, NULL, NULL),
       (48, '504-1', 0, 1, 33, '2023-09-26 18:56:26', '2023-09-26 18:56:26', 1671403256519078138, NULL, NULL),
       (49, '504-2', 0, 2, 33, '2023-09-26 18:56:32', '2023-09-26 18:56:32', 1671403256519078138, NULL, NULL),
       (50, '505-1', 0, 1, 34, '2023-09-26 18:56:37', '2023-09-26 18:56:37', 1671403256519078138, NULL, NULL),
       (52, '506-1', 0, 1, 35, '2023-09-26 18:56:49', '2023-09-26 18:56:49', 1671403256519078138, NULL, NULL),
       (53, '506-2', 0, 2, 35, '2023-09-26 18:56:54', '2023-09-26 18:56:54', 1671403256519078138, NULL, NULL),
       (54, '507-1', 0, 1, 36, '2023-09-26 18:57:00', '2023-09-26 18:57:00', 1671403256519078138, NULL, NULL),
       (55, '601-1', 0, 1, 37, '2023-09-26 19:05:11', '2023-09-28 22:53:28', 1671403256519078138, 1671403256519078164,
        NULL),
       (56, '602-1', 0, 1, 38, '2023-09-26 19:05:16', '2023-09-26 19:05:16', 1671403256519078138, NULL, NULL),
       (57, '602-2', 0, 2, 38, '2023-09-26 19:05:24', '2023-09-26 19:05:24', 1671403256519078138, NULL, NULL),
       (58, '603-1', 0, 1, 39, '2023-09-26 19:05:29', '2023-09-26 19:05:29', 1671403256519078138, NULL, NULL),
       (59, '604-1', 0, 1, 40, '2023-09-26 19:05:33', '2023-09-26 19:05:33', 1671403256519078138, NULL, NULL),
       (60, '604-2', 0, 2, 40, '2023-09-26 19:05:38', '2023-09-26 19:05:38', 1671403256519078138, NULL, NULL),
       (61, '605-1', 0, 1, 41, '2023-09-26 19:05:43', '2023-09-26 19:05:43', 1671403256519078138, NULL, NULL),
       (62, '606-1', 0, 1, 42, '2023-09-26 19:05:48', '2023-09-26 19:05:48', 1671403256519078138, NULL, NULL),
       (63, '606-2', 0, 2, 42, '2023-09-26 19:05:54', '2023-09-26 19:05:54', 1671403256519078138, NULL, NULL),
       (64, '607-1', 0, 1, 43, '2023-09-26 19:05:59', '2023-09-26 19:05:59', 1671403256519078138, NULL, NULL),
       (65, '701-1', 0, 1, 44, '2023-09-26 19:06:10', '2023-09-26 19:06:10', 1671403256519078138, NULL, NULL),
       (66, '702-1', 0, 1, 45, '2023-09-26 19:06:14', '2023-09-26 19:06:26', 1671403256519078138, 1671403256519078138,
        NULL),
       (68, '702-2', 0, 2, 45, '2023-09-26 19:06:35', '2023-09-26 19:06:35', 1671403256519078138, NULL, NULL),
       (69, '703-1', 0, 1, 46, '2023-09-26 19:06:41', '2023-09-26 19:06:41', 1671403256519078138, NULL, NULL),
       (70, '704-1', 0, 1, 47, '2023-09-26 19:06:46', '2023-12-20 14:28:22', 1671403256519078138, 1671403256519078138,
        NULL),
       (71, '704-2', 0, 2, 47, '2023-09-26 19:06:52', '2023-09-26 19:06:57', 1671403256519078138, 1671403256519078138,
        NULL),
       (72, '705-1', 0, 1, 48, '2023-09-26 19:07:04', '2023-09-26 19:07:04', 1671403256519078138, NULL, NULL),
       (73, '706-1', 0, 1, 49, '2023-09-26 19:07:10', '2023-09-26 19:07:10', 1671403256519078138, NULL, NULL),
       (74, '706-2', 0, 2, 49, '2023-09-26 19:07:14', '2023-09-26 19:07:19', 1671403256519078138, 1671403256519078138,
        NULL),
       (75, '707-1', 0, 1, 50, '2023-09-26 19:07:25', '2023-09-26 19:07:25', 1671403256519078138, NULL, NULL),
       (76, '801-1', 0, 1, 51, '2023-09-26 19:07:41', '2023-09-26 19:07:41', 1671403256519078138, NULL, NULL),
       (77, '803-1', 0, 1, 53, '2023-09-26 19:07:46', '2023-09-26 19:07:46', 1671403256519078138, NULL, NULL),
       (78, '805-1', 0, 1, 55, '2023-09-26 19:07:51', '2023-09-26 19:07:51', 1671403256519078138, NULL, NULL),
       (79, '807-1', 0, 1, 57, '2023-09-26 19:07:56', '2023-09-26 19:07:56', 1671403256519078138, 1, NULL),
       (80, '802-1', 0, 1, 52, '2023-09-26 19:08:04', '2023-09-26 19:08:04', 1671403256519078138, NULL, NULL),
       (81, '801-2', 0, 2, 52, '2023-09-26 19:08:09', '2023-09-26 19:08:09', 1671403256519078138, NULL, NULL),
       (82, '804-1', 0, 1, 54, '2023-09-26 19:08:15', '2023-09-26 19:08:15', 1671403256519078138, NULL, NULL),
       (83, '804-2', 0, 2, 54, '2023-09-26 19:08:22', '2023-09-26 19:08:22', 1671403256519078138, NULL, NULL),
       (84, '806-1', 0, 1, 56, '2023-09-26 19:08:28', '2023-09-26 19:08:28', 1671403256519078138, NULL, NULL),
       (85, '806-2', 0, 2, 56, '2023-09-26 19:08:35', '2023-09-26 19:08:35', 1671403256519078138, 1, NULL),
       (170, '101-2', 1, 2, 1, '2023-12-21 11:45:09', '2023-12-21 11:45:09', 1671403256519078138, 1, NULL),
       (171, '103-2', 0, 1, 3, '2023-12-23 16:12:34', '2023-12-23 16:22:03', 1671403256519078138, 1671403256519078138,
        NULL),
       (173, '1111', 0, 1, 67, '2023-12-23 17:59:23', '2023-12-23 17:59:23', 1671403256519078138, NULL, NULL),
       (177, '1011', 0, 1, 74, '2023-12-26 19:32:07', '2023-12-26 19:32:07', 1671403256519078138, NULL, NULL),
       (178, '101', 0, 1, 74, '2023-12-26 19:32:15', '2023-12-26 19:32:15', 1671403256519078138, NULL, NULL),
       (188, NULL, 0, NULL, 2, '2024-05-24 18:56:30', NULL, 1, NULL, NULL),
       (196, '109-01', 0, 1, 81, '2024-07-31 11:29:18', NULL, 1, NULL, NULL),
       (200, '1201-1', NULL, 1, 83, '2024-10-04 00:03:31', NULL, 1, NULL, NULL);
/*!40000 ALTER TABLE `bed`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elder`
--

DROP TABLE IF EXISTS `elder`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elder`
(
    `id`                          bigint                                                       NOT NULL AUTO_INCREMENT COMMENT 'id',
    `name`                        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '名称',
    `image`                       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '图片',
    `id_card_no`                  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT NULL COMMENT '身份证号',
    `sex`                         int                                                                   DEFAULT NULL COMMENT '性别（0:女  1:男）',
    `status`                      int                                                          NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1:启用  2:请假 3:退住中 4入住中 5已退住）',
    `phone`                       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
    `birthday`                    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT NULL COMMENT '出生日期',
    `address`                     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '家庭住址',
    `id_card_national_emblem_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '身份证国徽面',
    `id_card_portrait_img`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '身份证人像面',
    `create_time`                 datetime                                                     NOT NULL COMMENT '创建时间',
    `update_time`                 datetime                                                              DEFAULT NULL COMMENT '更新时间',
    `create_by`                   bigint                                                                DEFAULT NULL COMMENT '创建人id',
    `update_by`                   bigint                                                                DEFAULT NULL COMMENT '更新人id',
    `remark`                      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '备注',
    `bed_number`                  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT NULL COMMENT '床位编号',
    `bed_id`                      bigint                                                                DEFAULT NULL COMMENT '床位id',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `name_id_card_no` (`name`, `id_card_no`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 329
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='老人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder`
--

LOCK TABLES `elder` WRITE;
/*!40000 ALTER TABLE `elder`
    DISABLE KEYS */;
INSERT INTO `elder`
VALUES (325, '13211223322', 'https://itheim.oss-cn-beijing.aliyuncs.com/1fb24c20-ec99-44b3-8691-766c5508b347.jpg',
        '132123196712131234', 1, 1, '13211223322', '2024-08-22', '13211223322',
        'https://itheim.oss-cn-beijing.aliyuncs.com/b79d8d1e-1015-4d04-83e9-a22d3cc47869.jpg',
        'https://itheim.oss-cn-beijing.aliyuncs.com/07ee1b38-b611-4955-8339-fad02a6d7fc6.jpg', '2024-08-27 16:43:20',
        NULL, 1, NULL, NULL, '104-1', 5),
       (326, '李天龙', 'https://itheim.oss-cn-beijing.aliyuncs.com/8aef5eb9-436f-4ece-b68f-34d957d6b050.png',
        '132123196712131239', 1, 1, '13222334433', '1967-12-13', '北京市昌平区',
        'https://itheim.oss-cn-beijing.aliyuncs.com/816d7d6c-d13e-4ec6-9879-68d4f8054935.jpg',
        'https://itheim.oss-cn-beijing.aliyuncs.com/f96f4666-c58f-4f69-bf15-8a521788330f.jpg', '2024-08-27 16:50:09',
        NULL, 1, NULL, NULL, '104-2', 6),
       (327, '老李', 'https://itheim.oss-cn-beijing.aliyuncs.com/1510df9e-fca8-4a35-9443-8e4bacad0e03.png',
        '132123195612132345', 1, 1, '13212349900', '1956-12-13', '北京市昌平区',
        'https://itheim.oss-cn-beijing.aliyuncs.com/c265f4da-2197-4cfa-91b8-f627a4875c3c.jpg',
        'https://itheim.oss-cn-beijing.aliyuncs.com/08347a75-7e07-49ed-bfad-65a553517c52.jpg', '2024-09-12 18:51:36',
        NULL, 1, NULL, NULL, '101-2', 170),
       (328, '老李头儿', NULL, '410725196904056698', 1, 1, '15100000001', '2023-07-04', '知道人色然', NULL, NULL,
        '2024-09-12 19:10:23', NULL, 1, NULL, NULL, '101-1', 1);
/*!40000 ALTER TABLE `elder`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floor`
--

DROP TABLE IF EXISTS `floor`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floor`
(
    `id`          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
    `code`        bigint                                                        DEFAULT NULL COMMENT '编号',
    `create_time` datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `create_by`   bigint                                                        DEFAULT NULL COMMENT '创建人id',
    `update_by`   bigint                                                        DEFAULT NULL COMMENT '更新人id',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 414
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC COMMENT ='楼层表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floor`
--

LOCK TABLES `floor` WRITE;
/*!40000 ALTER TABLE `floor`
    DISABLE KEYS */;
INSERT INTO `floor`
VALUES (1, '1楼', 11, '2023-09-26 16:10:27', '2024-05-24 17:57:28', 1671403256519078153, 1, NULL),
       (2, '2楼', 2, '2023-09-26 17:37:20', '2023-09-26 17:37:20', 1671403256519078138, NULL, NULL),
       (3, '3楼', 3, '2023-09-26 17:37:26', '2023-09-26 17:37:26', 1671403256519078138, NULL, NULL),
       (4, '4楼', 4, '2023-09-26 17:37:32', '2023-09-26 17:37:32', 1671403256519078138, NULL, NULL),
       (5, '5楼', 5, '2023-09-26 17:37:38', '2023-09-26 17:37:38', 1671403256519078138, NULL, NULL),
       (6, '6楼', 6, '2023-09-26 17:37:42', '2023-09-26 17:37:59', 1671403256519078138, 1671403256519078138, NULL),
       (7, '7楼', 7, '2023-09-26 17:37:47', '2023-09-26 17:37:52', 1671403256519078138, 1671403256519078138, NULL),
       (8, '8楼', 8, '2023-09-26 17:38:09', '2023-09-26 17:38:09', 1671403256519078138, NULL, NULL),
       (391, '9楼', 8, '2023-12-18 14:53:50', '2023-12-18 14:53:50', 1671403256519078138, NULL, NULL),
       (401, '10楼', 9, '2023-12-26 19:29:54', '2023-12-27 10:15:34', 1671403256519078138, 1671403256519078138, NULL),
       (406, '12楼', 1, '2024-05-27 14:07:32', '2024-05-27 14:14:46', 1, 1, NULL);
/*!40000 ALTER TABLE `floor`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table`
(
    `table_id`          bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_name`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '表名称',
    `table_comment`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '表描述',
    `sub_table_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '关联子表的表名',
    `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '子表关联的外键名',
    `class_name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '实体类名称',
    `tpl_category`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
    `tpl_web_type`      varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
    `package_name`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '生成包路径',
    `module_name`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '生成模块名',
    `business_name`     varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '生成业务名',
    `function_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '生成功能名',
    `function_author`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '生成功能作者',
    `gen_type`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci       DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
    `gen_path`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
    `options`           varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
    `create_by`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT '' COMMENT '创建者',
    `create_time`       datetime                                                       DEFAULT NULL COMMENT '创建时间',
    `update_by`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT '' COMMENT '更新者',
    `update_time`       datetime                                                       DEFAULT NULL COMMENT '更新时间',
    `remark`            varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column`
(
    `column_id`      bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_id`       bigint                                                        DEFAULT NULL COMMENT '归属表编号',
    `column_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
    `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
    `column_type`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
    `java_type`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
    `java_field`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
    `is_pk`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '是否主键（1是）',
    `is_increment`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '是否自增（1是）',
    `is_required`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '是否必填（1是）',
    `is_insert`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '是否为插入字段（1是）',
    `is_edit`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '是否编辑字段（1是）',
    `is_list`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '是否列表字段（1是）',
    `is_query`       char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '是否查询字段（1是）',
    `query_type`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
    `html_type`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `dict_type`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
    `sort`           int                                                           DEFAULT NULL COMMENT '排序',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '创建者',
    `create_time`    datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '更新者',
    `update_time`    datetime                                                      DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 262
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nursing_project`
--

DROP TABLE IF EXISTS `nursing_project`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nursing_project`
(
    `id`                  bigint   NOT NULL AUTO_INCREMENT COMMENT '编号',
    `name`                varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '名称',
    `order_no`            int                                                           DEFAULT NULL COMMENT '排序号',
    `unit`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '单位',
    `price`               decimal(10, 2)                                                DEFAULT NULL COMMENT '价格',
    `image`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片',
    `nursing_requirement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '护理要求',
    `status`              int      NOT NULL                                             DEFAULT '1' COMMENT '状态（0：禁用，1：启用）',
    `create_by`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '创建人',
    `update_by`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '更新人',
    `remark`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
    `create_time`         datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         datetime                                                      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='护理项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nursing_project`
--

LOCK TABLES `nursing_project` WRITE;
/*!40000 ALTER TABLE `nursing_project`
    DISABLE KEYS */;
INSERT INTO `nursing_project`
VALUES (1, '修剪指甲', 1, '次', 10.00,
        'https://itheim.oss-cn-beijing.aliyuncs.com/b6631465-1684-41fe-8ccd-0b027cb91e90.png', '无', 1, '1', NULL, NULL,
        '2024-08-29 16:51:50', '2024-08-29 08:50:45'),
       (2, '衣物清洁', 1, '件', 5.00,
        'https://itheim.oss-cn-beijing.aliyuncs.com/41fc58d3-0627-4fa9-8459-906599aa1efa.png', '无', 1, '1', NULL, NULL,
        '2024-08-29 16:52:27', '2024-08-29 08:51:21'),
       (3, '整理床铺', 1, '次', 15.00,
        'https://itheim.oss-cn-beijing.aliyuncs.com/e611fcc9-dc45-49ac-abeb-f2ea99c2cffc.png', '无', 1, '1', NULL, NULL,
        '2024-08-29 16:52:52', '2024-08-29 08:51:46'),
       (4, '助餐', 1, '餐', 15.00,
        'https://itheim.oss-cn-beijing.aliyuncs.com/d91ba642-88e5-4c3d-8e50-a681ae3300e5.png', '无', 1, '1', NULL, NULL,
        '2024-08-29 16:53:29', '2024-08-29 08:52:24'),
       (5, '助浴', 1, '次', 40.00,
        'https://itheim.oss-cn-beijing.aliyuncs.com/125df948-7646-4fce-b322-1db0a84856e7.png', '无', 1, '1', NULL, NULL,
        '2024-08-29 16:53:51', '2024-08-29 08:52:46'),
       (6, '洗头', 1, '次', 20.00,
        'https://itheim.oss-cn-beijing.aliyuncs.com/a38883fc-870b-40ff-a256-54ce2fc17af9.png', '无', 1, '1', NULL, NULL,
        '2024-08-29 16:54:22', '2024-08-29 08:53:17'),
       (7, '洗脸', 1, '次', 15.00,
        'https://itheim.oss-cn-beijing.aliyuncs.com/95b0ad37-5d61-4ec2-a961-d6fb691a18f0.png', '无', 1, '1', NULL, NULL,
        '2024-08-29 16:54:45', '2024-08-29 08:53:40'),
       (8, '洗脚', 1, '次', 20.00,
        'https://itheim.oss-cn-beijing.aliyuncs.com/8437eb2d-3ea5-4eee-9d78-017bc8b3a66e.png', '无', 1, '1', NULL, NULL,
        '2024-08-29 16:55:08', '2024-08-29 08:54:03'),
       (9, '心理咨询', 1, '小时', 80.00,
        'https://itheim.oss-cn-beijing.aliyuncs.com/dc004cc2-688c-4d22-8fbc-8e923219a2bd.png', '无', 1, '1', NULL, NULL,
        '2024-08-29 16:55:37', '2024-08-29 08:54:32');
/*!40000 ALTER TABLE `nursing_project`
    ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `nursing_plan`
--

DROP TABLE IF EXISTS `nursing_plan`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nursing_plan`
(
    `id`          int                                                           NOT NULL AUTO_INCREMENT COMMENT '编号',
    `sort_no`     int                                                                    DEFAULT NULL COMMENT '排序号',
    `plan_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
    `status`      tinyint                                                       NOT NULL DEFAULT '0' COMMENT '状态 0禁用 1启用',
    `create_time` datetime                                                      NOT NULL COMMENT '创建时间',
    `update_time` datetime                                                               DEFAULT NULL COMMENT '更新时间',
    `create_by`   bigint                                                                 DEFAULT NULL COMMENT '创建人id',
    `update_by`   bigint                                                                 DEFAULT NULL COMMENT '更新人id',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `plan_name` (`plan_name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 136
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='护理计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nursing_plan`
--

LOCK TABLES `nursing_plan` WRITE;
/*!40000 ALTER TABLE `nursing_plan`
    DISABLE KEYS */;
INSERT INTO `nursing_plan`
VALUES (133, 1, '1号护理计划', 1, '2024-08-19 19:17:31', NULL, NULL, NULL, NULL),
       (134, 1, '2号护理计划', 1, '2024-08-19 19:36:10', NULL, NULL, NULL, NULL),
       (135, 1, '3号护理计划', 1, '2024-08-29 16:56:39', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `nursing_plan`
    ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `nursing_level`
--

DROP TABLE IF EXISTS `nursing_level`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nursing_level`
(
    `id`          int                                                          NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '等级名称',
    `lplan_id`    int                                                          NOT NULL COMMENT '护理计划ID',
    `fee`         decimal(10, 2)                                               NOT NULL COMMENT '护理费用',
    `status`      tinyint(1)                                                   NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：启用）',
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '等级说明',
    `create_time` datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`   bigint                                                                DEFAULT NULL COMMENT '创建人id',
    `update_by`   bigint                                                                DEFAULT NULL COMMENT '更新人id',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '备注',
    `update_time` datetime                                                              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 79
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='护理等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nursing_level`
--

LOCK TABLES `nursing_level` WRITE;
/*!40000 ALTER TABLE `nursing_level`
    DISABLE KEYS */;
INSERT INTO `nursing_level`
VALUES (76, '2号护理等级', 134, 1500.00, 1, '1223', '2024-08-14 16:33:16', NULL, NULL, NULL, '2024-08-29 16:57:23'),
       (77, '1号护理计划', 133, 2000.00, 1, '1223', '2024-08-20 11:18:21', NULL, NULL, NULL, '2024-08-29 16:57:05'),
       (78, '3号护理等级', 135, 3000.00, 1, '无', '2024-08-29 16:58:00', NULL, NULL, NULL, '2024-08-29 08:56:55');
/*!40000 ALTER TABLE `nursing_level`
    ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `nursing_project_plan`
--

DROP TABLE IF EXISTS `nursing_project_plan`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nursing_project_plan`
(
    `id`                int                                                          NOT NULL AUTO_INCREMENT,
    `plan_id`           int                                                          NOT NULL COMMENT '计划id',
    `project_id`        int                                                          NOT NULL COMMENT '项目id',
    `execute_time`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '计划执行时间',
    `execute_cycle`     int                                                          NOT NULL COMMENT '执行周期 0 天 1 周 2月',
    `execute_frequency` int                                                          NOT NULL COMMENT '执行频次',
    `create_time`       datetime                                                     NOT NULL COMMENT '创建时间',
    `update_time`       datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `create_by`         bigint                                                        DEFAULT NULL COMMENT '创建人id',
    `update_by`         bigint                                                        DEFAULT NULL COMMENT '更新人id',
    `remark`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1743
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='护理计划和项目关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nursing_project_plan`
--

LOCK TABLES `nursing_project_plan` WRITE;
/*!40000 ALTER TABLE `nursing_project_plan`
    DISABLE KEYS */;
INSERT INTO `nursing_project_plan`
VALUES (1736, 133, 87, '19:16:49', 1, 7, '2024-08-19 11:28:43', NULL, NULL, NULL, NULL),
       (1737, 133, 85, '19:28:34', 1, 1, '2024-08-19 11:28:43', NULL, NULL, NULL, NULL),
       (1739, 135, 1, '16:55:58', 2, 1, '2024-08-29 08:55:34', NULL, NULL, NULL, NULL),
       (1740, 135, 5, '16:56:09', 0, 1, '2024-08-29 08:55:34', NULL, NULL, NULL, NULL),
       (1741, 135, 4, '08:00:00', 0, 1, '2024-08-29 08:55:34', NULL, NULL, NULL, NULL),
       (1742, 134, 1, '19:28:45', 0, 1, '2024-10-03 14:50:59', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `nursing_project_plan`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room`
(
    `id`          bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `code`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '房间编号',
    `sort`        int                                                           DEFAULT NULL COMMENT '排序号',
    `type_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '房间类型名称',
    `floor_id`    bigint                                                        DEFAULT NULL COMMENT '楼层id',
    `create_time` datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `is_deleted`  tinyint(1)                                                    DEFAULT '0' COMMENT '是否删除',
    `create_by`   bigint                                                        DEFAULT NULL COMMENT '创建人id',
    `update_by`   bigint                                                        DEFAULT NULL COMMENT '更新人id',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 89
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='房间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room`
    DISABLE KEYS */;
INSERT INTO `room`
VALUES (1, '101', 1, '豪华单人间', 1, '2023-09-26 17:38:25', '2023-12-23 16:19:55', 0, 1671403256519078138,
        1671403256519078138, NULL),
       (2, '102', 2, '普通双人间', 1, '2023-09-26 17:38:32', '2023-09-26 17:38:32', 0, 1671403256519078138, NULL, NULL),
       (3, '103', 3, '普通单人间', 1, '2023-09-26 17:38:41', '2023-09-26 17:38:41', 0, 1671403256519078138, NULL, NULL),
       (4, '104', 4, '豪华双人间', 1, '2023-09-26 17:38:48', '2023-09-26 17:38:48', 0, 1671403256519078138, NULL, NULL),
       (5, '105', 5, '豪华单人间', 1, '2023-09-26 17:38:55', '2023-09-26 17:38:55', 0, 1671403256519078138, NULL, NULL),
       (6, '106', 6, '双人套房', 1, '2023-09-26 17:39:05', '2023-09-26 17:39:05', 0, 1671403256519078138, NULL, NULL),
       (7, '107', 7, '单人套房', 1, '2023-09-26 17:39:13', '2023-09-26 17:39:13', 0, 1671403256519078138, NULL, NULL),
       (8, '201', 1, '特护房', 2, '2023-09-26 17:42:02', '2023-09-26 17:42:02', 0, 1671403256519078138, NULL, NULL),
       (9, '202', 2, '普通双人间', 2, '2023-09-26 17:42:08', '2023-09-26 17:42:08', 0, 1671403256519078138, NULL, NULL),
       (10, '203', 3, '普通单人间', 2, '2023-09-26 17:42:15', '2023-09-26 17:42:15', 0, 1671403256519078138, NULL,
        NULL),
       (11, '204', 4, '豪华双人间', 2, '2023-09-26 17:42:22', '2023-09-26 17:42:22', 0, 1671403256519078138, NULL,
        NULL),
       (12, '205', 5, '豪华单人间', 2, '2023-09-26 17:42:30', '2023-09-26 17:42:30', 0, 1671403256519078138, NULL,
        NULL),
       (13, '206', 6, '双人套房', 2, '2023-09-26 17:42:41', '2023-09-26 17:42:41', 0, 1671403256519078138, NULL, NULL),
       (14, '207', 7, '单人套房', 2, '2023-09-26 17:42:48', '2023-09-26 17:42:48', 0, 1671403256519078138, NULL, NULL),
       (15, '301', 1, '特护房', 3, '2023-09-26 17:43:54', '2023-09-26 17:43:54', 0, 1671403256519078138, NULL, NULL),
       (16, '302', 2, '普通双人间', 3, '2023-09-26 17:44:01', '2023-09-26 17:44:01', 0, 1671403256519078138, NULL,
        NULL),
       (17, '303', 3, '普通单人间', 3, '2023-09-26 17:44:09', '2023-09-26 17:44:09', 0, 1671403256519078138, NULL,
        NULL),
       (18, '304', 4, '豪华双人间', 3, '2023-09-26 17:44:17', '2023-09-26 17:44:17', 0, 1671403256519078138, NULL,
        NULL),
       (19, '305', 5, '豪华单人间', 3, '2023-09-26 17:44:24', '2023-09-26 17:44:24', 0, 1671403256519078138, NULL,
        NULL),
       (20, '306', 6, '双人套房', 3, '2023-09-26 17:44:33', '2023-09-26 17:44:33', 0, 1671403256519078138, NULL, NULL),
       (21, '307', 7, '单人套房', 3, '2023-09-26 17:44:42', '2023-09-26 17:44:42', 0, 1671403256519078138, NULL, NULL),
       (22, '401', 1, '特护房', 4, '2023-09-26 18:51:10', '2023-09-26 18:51:10', 0, 1671403256519078138, NULL, NULL),
       (23, '402', 2, '普通双人间', 4, '2023-09-26 18:51:17', '2023-09-26 18:51:17', 0, 1671403256519078138, NULL,
        NULL),
       (24, '403', 3, '普通单人间', 4, '2023-09-26 18:51:23', '2023-09-26 18:51:23', 0, 1671403256519078138, NULL,
        NULL),
       (25, '404', 4, '豪华双人间', 4, '2023-09-26 18:51:32', '2023-09-26 18:51:32', 0, 1671403256519078138, NULL,
        NULL),
       (26, '405', 5, '豪华单人间', 4, '2023-09-26 18:51:42', '2023-09-26 18:51:42', 0, 1671403256519078138, NULL,
        NULL),
       (27, '406', 6, '双人套房', 4, '2023-09-26 18:51:54', '2023-09-26 18:51:54', 0, 1671403256519078138, NULL, NULL),
       (28, '407', 7, '单人套房', 4, '2023-09-26 18:52:03', '2023-09-26 18:52:03', 0, 1671403256519078138, NULL, NULL),
       (29, '501', 1, '特护房', 5, '2023-09-26 18:53:54', '2023-09-26 18:53:54', 0, 1671403256519078138, NULL, NULL),
       (31, '502', 2, '普通双人间', 5, '2023-09-26 18:54:05', '2023-09-26 18:54:05', 0, 1671403256519078138, NULL,
        NULL),
       (32, '503', 3, '普通单人间', 5, '2023-09-26 18:54:12', '2023-09-26 18:54:12', 0, 1671403256519078138, NULL,
        NULL),
       (33, '504', 4, '豪华双人间', 5, '2023-09-26 18:54:20', '2023-09-26 18:54:20', 0, 1671403256519078138, NULL,
        NULL),
       (34, '505', 5, '豪华单人间', 5, '2023-09-26 18:54:28', '2023-09-26 18:54:28', 0, 1671403256519078138, NULL,
        NULL),
       (35, '506', 6, '双人套房', 5, '2023-09-26 18:54:37', '2023-09-26 18:54:37', 0, 1671403256519078138, NULL, NULL),
       (36, '507', 7, '单人套房', 5, '2023-09-26 18:54:47', '2023-09-26 18:54:47', 0, 1671403256519078138, NULL, NULL),
       (37, '601', 1, '特护房', 6, '2023-09-26 18:57:14', '2023-09-26 18:57:14', 0, 1671403256519078138, NULL, NULL),
       (38, '602', 2, '普通双人间', 6, '2023-09-26 18:57:20', '2023-09-26 18:57:20', 0, 1671403256519078138, NULL,
        NULL),
       (39, '603', 3, '普通单人间', 6, '2023-09-26 18:57:28', '2023-09-26 18:57:28', 0, 1671403256519078138, NULL,
        NULL),
       (40, '604', 4, '豪华双人间', 6, '2023-09-26 18:57:36', '2023-09-26 18:57:36', 0, 1671403256519078138, NULL,
        NULL),
       (41, '605', 5, '豪华单人间', 6, '2023-09-26 19:01:36', '2023-09-26 19:01:36', 0, 1671403256519078138, NULL,
        NULL),
       (42, '606', 6, '双人套房', 6, '2023-09-26 19:01:45', '2023-09-26 19:01:45', 0, 1671403256519078138, NULL, NULL),
       (43, '607', 7, '单人套房', 6, '2023-09-26 19:01:54', '2023-09-26 19:01:54', 0, 1671403256519078138, NULL, NULL),
       (44, '701', 1, '特护房', 7, '2023-09-26 19:02:13', '2023-09-26 19:02:13', 0, 1671403256519078138, NULL, NULL),
       (45, '702', 2, '普通双人间', 7, '2023-09-26 19:02:20', '2023-09-26 19:02:20', 0, 1671403256519078138, NULL,
        NULL),
       (46, '703', 3, '普通单人间', 7, '2023-09-26 19:02:28', '2023-09-26 19:02:28', 0, 1671403256519078138, NULL,
        NULL),
       (47, '704', 4, '豪华双人间', 7, '2023-09-26 19:02:49', '2023-09-26 19:02:49', 0, 1671403256519078138, NULL,
        NULL),
       (48, '705', 5, '豪华单人间', 7, '2023-09-26 19:03:00', '2023-09-26 19:03:00', 0, 1671403256519078138, NULL,
        NULL),
       (49, '706', 6, '双人套房', 7, '2023-09-26 19:03:07', '2023-09-26 19:03:07', 0, 1671403256519078138, NULL, NULL),
       (50, '707', 7, '单人套房', 7, '2023-09-26 19:03:15', '2023-09-26 19:03:15', 0, 1671403256519078138, NULL, NULL),
       (51, '801', 1, '特护房', 8, '2023-09-26 19:03:49', '2023-09-26 19:03:49', 0, 1671403256519078138, NULL, NULL),
       (52, '802', 2, '普通双人间', 8, '2023-09-26 19:03:57', '2023-09-26 19:03:57', 0, 1671403256519078138, NULL,
        NULL),
       (53, '803', 3, '普通单人间', 8, '2023-09-26 19:04:04', '2023-09-26 19:04:04', 0, 1671403256519078138, NULL,
        NULL),
       (54, '804', 4, '豪华双人间', 8, '2023-09-26 19:04:13', '2023-09-26 19:04:13', 0, 1671403256519078138, NULL,
        NULL),
       (55, '805', 5, '豪华单人间', 8, '2023-09-26 19:04:45', '2023-09-26 19:04:45', 0, 1671403256519078138, NULL,
        NULL),
       (56, '806', 6, '双人套房', 8, '2023-09-26 19:04:52', '2023-09-26 19:04:52', 0, 1671403256519078138, NULL, NULL),
       (57, '807', 7, '单人套房', 8, '2023-09-26 19:05:00', '2023-09-26 19:05:00', 0, 1671403256519078138, NULL, NULL),
       (67, '108', 1, '普通单人间', 1, '2023-12-23 16:12:46', '2023-12-23 17:08:47', 0, 1671403256519078138,
        1671403256519078138, NULL),
       (81, '109', 1, '单人套房', 1, '2024-05-27 10:28:37', NULL, 0, 1, NULL, NULL),
       (83, '1201', 1, '双人套房', 406, '2024-05-27 14:14:54', NULL, 0, 1, NULL, NULL),
       (86, '102-2', 1, '豪华单人间', 406, '2024-08-22 18:49:21', NULL, 0, 1, NULL, NULL);
/*!40000 ALTER TABLE `room`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type`
(
    `id`           bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `name`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '房型名称',
    `bed_count`    int                                                          NOT NULL DEFAULT '0' COMMENT '床位数量',
    `price`        decimal(10, 2)                                               NOT NULL COMMENT '床位费用',
    `introduction` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '介绍',
    `photo`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '照片',
    `status`       tinyint                                                      NOT NULL COMMENT '状态，0：禁用，1：启用',
    `create_time`  datetime                                                     NOT NULL COMMENT '创建时间',
    `update_time`  datetime                                                              DEFAULT NULL COMMENT '更新时间',
    `create_by`    bigint                                                                DEFAULT NULL COMMENT '创建人id',
    `update_by`    bigint                                                                DEFAULT NULL COMMENT '更新人id',
    `remark`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 117
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='房型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type`
    DISABLE KEYS */;
INSERT INTO `room_type`
VALUES (1, '单人套房', 0, 4000.00, '宽敞舒适的套房，配备独立卫生间和基本生活设施，满足独自居住的需求，提供私密性和舒适度',
        'https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/e2f1031b-e23e-4379-95d4-ce8fe382f58f.png', 1,
        '2023-09-26 15:57:50', '2024-10-03 23:54:34', 1671403256519078153, 1, NULL),
       (2, '双人套房', 0, 6000.00, '适合夫妻或朋友两人居住的套房，设有独立卫生间和基本生活设施，提供共享空间和私密性',
        'https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/ff84c185-2e28-431c-951d-d004cc2d5bdc.png', 1,
        '2023-09-26 15:58:51', '2023-09-26 15:58:51', 1671403256519078153, NULL, NULL),
       (3, '豪华单人间', 0, 3000.00,
        '豪华装修的单人房间，提供舒适的居住环境和高品质的服务，设计精美，配备独立卫生间和必需设施',
        'https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/d803832c-5b93-4cae-ba95-aeb52ab0c5e0.png', 1,
        '2023-09-26 15:59:33', '2023-09-26 15:59:33', 1671403256519078153, NULL, NULL),
       (4, '豪华双人间', 0, 4500.00, '精心装修的双人房间，提供舒适和豪华的居住环境，配备独立卫生间和高品质的家具',
        'https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/c3522da7-4c5c-48d2-94f9-9f0b95a048d2.png', 1,
        '2023-09-26 16:00:03', '2024-08-22 16:12:20', 1671403256519078153, 1, NULL),
       (5, '普通单人间', 0, 2000.00,
        '简洁实用的单人房间，提供基本的居住设施和舒适度，适合独自居住的老年人，提供相对经济实惠的居住选择',
        'https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/1a330b1c-b0a1-463d-8d9a-221ef17c314f.png', 1,
        '2023-09-26 16:00:27', '2023-09-26 16:00:27', 1671403256519078153, NULL, NULL),
       (103, '我的房型设置', 0, 6000.00, '啊傻瓜按个按个',
        'https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/9c4a9926-2f58-4306-a8c5-122adb8e700e.jpeg', 1,
        '2023-12-25 16:04:00', '2023-12-25 16:04:00', 1671403256519078138, NULL, NULL),
       (110, '测试修改', 5, 1000.00, '12312312312312312312312312312312312312312312312312',
        'https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/00167193-00f1-49a6-85e5-74dd0b93819e.png', 1,
        '2023-12-27 00:07:07', '2024-08-22 19:05:53', 1671403256519078138, 1, NULL),
       (115, '测试新增', 10, 3500.00, '水电费方式',
        'https://itheim.oss-cn-beijing.aliyuncs.com/8fe7b29d-fce0-4201-becb-0586e8284a9d.png', 1, '2024-08-22 19:06:33',
        '2024-08-22 19:06:41', 1, 1, '是否'),
       (116, '标准双人间', 10, 1500.00, '123',
        'https://itheim.oss-cn-beijing.aliyuncs.com/91c4a814-efd5-4093-a5ac-963b41047019.png', 1, '2024-09-12 22:52:36',
        '2024-09-12 22:55:10', 1, 1, '123');
/*!40000 ALTER TABLE `room_type`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config`
(
    `config_id`    int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
    `config_type`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
    `create_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '创建者',
    `create_time`  datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '更新者',
    `update_time`  datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config`
    DISABLE KEYS */;
INSERT INTO `sys_config`
VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-08-14 02:48:24', '',
        NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
       (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-08-14 02:48:24', '', NULL,
        '初始化密码 123456'),
       (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-08-14 02:48:24', '', NULL,
        '深色主题theme-dark，浅色主题theme-light'),
       (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-08-14 02:48:24', '', NULL,
        '是否开启验证码功能（true开启，false关闭）'),
       (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-08-14 02:48:24',
        '', NULL, '是否开启注册用户功能（true开启，false关闭）'),
       (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-08-14 02:48:24', '', NULL,
        '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
    `parent_id`   bigint                                                       DEFAULT '0' COMMENT '父部门id',
    `ancestors`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
    `dept_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
    `order_num`   int                                                          DEFAULT '0' COMMENT '显示顺序',
    `leader`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                     DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 200
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept`
    DISABLE KEYS */;
INSERT INTO `sys_dept`
VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-14 02:48:23', '',
        NULL),
       (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-08-14 02:48:23', '', NULL),
       (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-08-14 02:48:23', '', NULL),
       (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-08-14 02:48:23', '', NULL),
       (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-08-14 02:48:23', '', NULL),
       (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-08-14 02:48:23', '', NULL),
       (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-08-14 02:48:23', '', NULL),
       (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-08-14 02:48:23', '', NULL),
       (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-08-14 02:48:23', '', NULL),
       (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-08-14 02:48:23', '', NULL);
/*!40000 ALTER TABLE `sys_dept`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data`
(
    `dict_code`   bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int                                                           DEFAULT '0' COMMENT '字典排序',
    `dict_label`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 109
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data`
    DISABLE KEYS */;
INSERT INTO `sys_dict_data`
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '性别男'),
       (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '性别女'),
       (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '性别未知'),
       (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '显示菜单'),
       (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '隐藏菜单'),
       (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '正常状态'),
       (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '停用状态'),
       (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '正常状态'),
       (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '停用状态'),
       (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '默认分组'),
       (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '系统分组'),
       (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '系统默认是'),
       (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '系统默认否'),
       (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '通知'),
       (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '公告'),
       (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '正常状态'),
       (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '关闭状态'),
       (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '其他操作'),
       (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '新增操作'),
       (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '修改操作'),
       (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '删除操作'),
       (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '授权操作'),
       (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '导出操作'),
       (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '导入操作'),
       (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '强退操作'),
       (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '生成操作'),
       (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '清空操作'),
       (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '正常状态'),
       (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-08-14 02:48:24', '', NULL,
        '停用状态'),
       (100, 0, '启用', '1', 'nursing_project_status', NULL, 'default', 'N', '0', 'admin', '2024-08-18 02:41:15', '',
        NULL, NULL),
       (101, 0, '禁用', '0', 'nursing_project_status', NULL, 'default', 'N', '0', 'admin', '2024-08-18 02:41:30', '',
        NULL, NULL),
       (103, 0, '启用', '1', 'nursing_plan_status', NULL, 'default', 'N', '0', 'admin', '2024-08-19 11:00:04', '', NULL,
        NULL),
       (104, 0, '禁用', '2', 'nursing_plan_status', NULL, 'default', 'N', '0', 'admin', '2024-08-19 11:00:10', '', NULL,
        NULL),
       (105, 0, '启用', '1', 'nursing_level_status', NULL, 'default', 'N', '0', 'admin', '2024-08-20 03:04:14', '',
        NULL, NULL),
       (106, 0, '禁用', '0', 'nursing_level_status', NULL, 'default', 'N', '0', 'admin', '2024-08-20 03:04:21', '',
        NULL, NULL),
       (107, 0, '已入住', '0', 'admission_status', NULL, 'default', 'N', '0', 'admin', '2024-08-31 03:20:26', '', NULL,
        NULL),
       (108, 0, '未入住', '1', 'admission_status', NULL, 'default', 'N', '0', 'admin', '2024-08-31 03:20:35', '', NULL,
        NULL);
/*!40000 ALTER TABLE `sys_dict_data`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type`
(
    `dict_id`     bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_id`) USING BTREE,
    UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 104
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type`
    DISABLE KEYS */;
INSERT INTO `sys_dict_type`
VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '用户性别列表'),
       (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '菜单状态列表'),
       (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '系统开关列表'),
       (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '任务状态列表'),
       (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '任务分组列表'),
       (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '系统是否列表'),
       (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '通知类型列表'),
       (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '通知状态列表'),
       (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '操作类型列表'),
       (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-08-14 02:48:24', '', NULL, '登录状态列表'),
       (100, '护理项目状态', 'nursing_project_status', '0', 'admin', '2024-08-18 02:40:48', '', NULL, NULL),
       (101, '护理计划状态', 'nursing_plan_status', '0', 'admin', '2024-08-19 10:59:40', '', NULL, NULL),
       (102, '护理等级状态', 'nursing_level_status', '0', 'admin', '2024-08-20 03:04:03', '', NULL, NULL),
       (103, '健康评估-入住状态', 'admission_status', '0', 'admin', '2024-08-31 03:19:57', '', NULL, NULL);
/*!40000 ALTER TABLE `sys_dict_type`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job`
(
    `job_id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '任务ID',
    `job_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '任务名称',
    `job_group`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
    `invoke_target`   varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
    `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT '' COMMENT 'cron执行表达式',
    `misfire_policy`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
    `concurrent`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci               DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
    `status`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci               DEFAULT '0' COMMENT '状态（0正常 1暂停）',
    `create_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT '' COMMENT '创建者',
    `create_time`     datetime                                                               DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT '' COMMENT '更新者',
    `update_time`     datetime                                                               DEFAULT NULL COMMENT '更新时间',
    `remark`          varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT '' COMMENT '备注信息',
    PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job`
    DISABLE KEYS */;
INSERT INTO `sys_job`
VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin',
        '2024-08-14 02:48:24', '', NULL, ''),
       (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin',
        '2024-08-14 02:48:24', '', NULL, ''),
       (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?',
        '3', '1', '1', 'admin', '2024-08-14 02:48:24', '', NULL, '');
/*!40000 ALTER TABLE `sys_job`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log`
(
    `job_log_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
    `job_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '任务名称',
    `job_group`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '任务组名',
    `invoke_target`  varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
    `job_message`    varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '日志信息',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci       DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
    `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
    `create_time`    datetime                                                       DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor`
(
    `info_id`        bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
    `user_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '用户账号',
    `ipaddr`         varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
    `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
    `browser`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '浏览器类型',
    `os`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '操作系统',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
    `msg`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
    `login_time`     datetime                                                      DEFAULT NULL COMMENT '访问时间',
    PRIMARY KEY (`info_id`) USING BTREE,
    KEY `idx_sys_logininfor_s` (`status`) USING BTREE,
    KEY `idx_sys_logininfor_lt` (`login_time`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 197
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor`
    DISABLE KEYS */;
INSERT INTO `sys_logininfor`
VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-14 02:54:16'),
       (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2024-08-14 03:20:32'),
       (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-14 03:20:40'),
       (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-14 04:21:52'),
       (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-14 07:36:43'),
       (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-14 07:49:48'),
       (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-14 08:24:37'),
       (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2024-08-14 08:32:48'),
       (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-14 08:32:52'),
       (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2024-08-18 01:47:10'),
       (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-18 01:47:14'),
       (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2024-08-18 02:40:15'),
       (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-18 02:40:18'),
       (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-18 03:46:09'),
       (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-18 04:34:20'),
       (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-18 06:15:19'),
       (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-18 07:08:20'),
       (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-18 11:24:56'),
       (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-19 02:22:04'),
       (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-19 07:14:04'),
       (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-19 08:46:55'),
       (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-19 10:58:07'),
       (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-19 12:19:50'),
       (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-19 13:26:44'),
       (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-19 14:33:19'),
       (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-20 01:53:18'),
       (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2024-08-20 01:54:45'),
       (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-20 01:54:49'),
       (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-20 12:16:31'),
       (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-20 13:07:33'),
       (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-21 02:37:32'),
       (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-21 03:14:36'),
       (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-21 06:08:52'),
       (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-22 03:36:06'),
       (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-22 03:47:06'),
       (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-22 06:36:32'),
       (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-22 06:44:22'),
       (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-22 06:48:14'),
       (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-22 08:09:53'),
       (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-22 08:37:07'),
       (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-22 10:37:38'),
       (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-22 12:05:05'),
       (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-22 12:15:51'),
       (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-23 12:20:22'),
       (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-23 14:07:06'),
       (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2024-08-24 02:40:19'),
       (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-24 02:40:25'),
       (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-24 03:43:54'),
       (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-24 06:32:35'),
       (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2024-08-24 06:36:05'),
       (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-24 06:36:09'),
       (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-24 07:53:34'),
       (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-25 07:54:03'),
       (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-25 08:31:27'),
       (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-25 12:23:25'),
       (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-26 06:07:27'),
       (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-26 08:40:31'),
       (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-26 09:50:34'),
       (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-26 11:26:27'),
       (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-26 12:07:34'),
       (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-26 14:22:24'),
       (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-26 15:18:25'),
       (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-27 02:17:54'),
       (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-27 03:41:31'),
       (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2024-08-27 06:25:06'),
       (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2024-08-27 06:25:10'),
       (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-27 06:25:13'),
       (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-27 07:32:00'),
       (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-27 08:39:36'),
       (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-29 06:38:53'),
       (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-29 06:46:34'),
       (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-29 06:51:27'),
       (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-29 07:34:49'),
       (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-29 08:17:29'),
       (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2024-08-30 06:29:43'),
       (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-30 06:29:45'),
       (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-30 07:12:44'),
       (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-30 08:07:00'),
       (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-30 08:53:46'),
       (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-31 02:24:01'),
       (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-09-01 02:38:35'),
       (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-09-01 03:15:35'),
       (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-09-01 03:51:04'),
       (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-09-01 06:29:01'),
       (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-09-01 11:47:50'),
       (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-09-02 11:33:09'),
       (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-09-11 16:03:21'),
       (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-09-11 17:25:25'),
       (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-09-11 23:17:18'),
       (189, 'admin', '172.16.43.100', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-12 18:42:50'),
       (190, 'lisi', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误',
        '2024-09-12 18:47:41'),
       (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-09-12 18:47:57'),
       (192, 'admin', '172.16.43.100', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-09-12 18:59:12'),
       (193, 'admin', '172.16.43.190', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-09-12 19:26:05'),
       (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 13:22:01'),
       (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 13:34:31'),
       (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 14:45:19');
/*!40000 ALTER TABLE `sys_logininfor`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu`
(
    `menu_id`     bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
    `parent_id`   bigint                                                        DEFAULT '0' COMMENT '父菜单ID',
    `order_num`   int                                                           DEFAULT '0' COMMENT '显示顺序',
    `path`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
    `component`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
    `query`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
    `route_name`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '路由名称',
    `is_frame`    int                                                           DEFAULT '1' COMMENT '是否为外链（0是 1否）',
    `is_cache`    int                                                           DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
    `menu_type`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `visible`     char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
    `perms`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2049
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu`
    DISABLE KEYS */;
INSERT INTO `sys_menu`
VALUES (1, '系统管理', 0, 6, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-08-14 02:48:23',
        'admin', '2024-08-29 06:40:54', '系统管理目录'),
       (2, '系统监控', 0, 7, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin',
        '2024-08-14 02:48:23', 'admin', '2024-08-29 06:41:07', '系统监控目录'),
       (3, '系统工具', 0, 8, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-08-14 02:48:23',
        'admin', '2024-08-29 06:41:14', '系统工具目录'),
       (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '1', '0', '', 'guide', 'admin',
        '2024-08-14 02:48:23', 'admin', '2024-08-20 01:57:10', '若依官网地址'),
       (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user',
        'admin', '2024-08-14 02:48:23', '', NULL, '用户管理菜单'),
       (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples',
        'admin', '2024-08-14 02:48:23', '', NULL, '角色管理菜单'),
       (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list',
        'tree-table', 'admin', '2024-08-14 02:48:23', '', NULL, '菜单管理菜单'),
       (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree',
        'admin', '2024-08-14 02:48:23', '', NULL, '部门管理菜单'),
       (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post',
        'admin', '2024-08-14 02:48:23', '', NULL, '岗位管理菜单'),
       (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict',
        'admin', '2024-08-14 02:48:23', '', NULL, '字典管理菜单'),
       (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list',
        'edit', 'admin', '2024-08-14 02:48:23', '', NULL, '参数设置菜单'),
       (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list',
        'message', 'admin', '2024-08-14 02:48:23', '', NULL, '通知公告菜单'),
       (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-08-14 02:48:23', '',
        NULL, '日志管理菜单'),
       (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list',
        'online', 'admin', '2024-08-14 02:48:23', '', NULL, '在线用户菜单'),
       (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job',
        'admin', '2024-08-14 02:48:23', '', NULL, '定时任务菜单'),
       (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list',
        'druid', 'admin', '2024-08-14 02:48:23', '', NULL, '数据监控菜单'),
       (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list',
        'server', 'admin', '2024-08-14 02:48:23', '', NULL, '服务监控菜单'),
       (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list',
        'redis', 'admin', '2024-08-14 02:48:23', '', NULL, '缓存监控菜单'),
       (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list',
        'redis-list', 'admin', '2024-08-14 02:48:23', '', NULL, '缓存列表菜单'),
       (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build',
        'admin', '2024-08-14 02:48:23', '', NULL, '表单构建菜单'),
       (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin',
        '2024-08-14 02:48:23', '', NULL, '代码生成菜单'),
       (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list',
        'swagger', 'admin', '2024-08-14 02:48:23', '', NULL, '系统接口菜单'),
       (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0',
        'monitor:operlog:list', 'form', 'admin', '2024-08-14 02:48:23', '', NULL, '操作日志菜单'),
       (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0',
        'monitor:logininfor:list', 'logininfor', 'admin', '2024-08-14 02:48:23', '', NULL, '登录日志菜单'),
       (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin',
        '2024-08-14 02:48:23', '', NULL, ''),
       (2000, '服务管理', 0, 4, 'serve', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'example', 'admin',
        '2024-08-14 02:59:12', 'admin', '2024-08-29 06:42:37', ''),
       -- 护理项目（先插入）
       (2001, '护理项目', 2000, 1, 'project', 'serve/project/index', NULL, '', 1, 0, 'C', '0', '0',
        'serve:project:list', 'color', 'admin', '2024-08-14 03:00:15', 'admin', '2024-08-22 12:16:12', '护理项目菜单'),
       (2002, '护理项目查询', 2001, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'serve:project:query', '#', 'admin',
        '2024-08-14 03:00:15', '', NULL, ''),
       (2003, '护理项目新增', 2001, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'serve:project:add', '#', 'admin',
        '2024-08-14 03:00:15', '', NULL, ''),
       (2004, '护理项目修改', 2001, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'serve:project:edit', '#', 'admin',
        '2024-08-14 03:00:15', '', NULL, ''),
       (2005, '护理项目删除', 2001, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'serve:project:remove', '#', 'admin',
        '2024-08-14 03:00:15', '', NULL, ''),
       (2006, '护理项目导出', 2001, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'serve:project:export', '#', 'admin',
        '2024-08-14 03:00:15', '', NULL, ''),
       -- 护理计划（接着插入）
       (2013, '护理计划', 2000, 2, 'plan', 'serve/plan/index', NULL, '', 1, 0, 'C', '0', '0', 'serve:plan:list',
        'druid', 'admin', '2024-08-14 08:29:10', 'admin', '2024-10-03 10:49:49', '护理计划菜单'),
       (2014, '护理计划查询', 2013, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'nursing:nursingPlan:query', '#',
        'admin', '2024-08-14 08:29:10', '', NULL, ''),
       (2015, '护理计划新增', 2013, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'nursing:nursingPlan:add', '#', 'admin',
        '2024-08-14 08:29:10', '', NULL, ''),
       (2016, '护理计划修改', 2013, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'nursing:nursingPlan:edit', '#', 'admin',
        '2024-08-14 08:29:10', '', NULL, ''),
       (2017, '护理计划删除', 2013, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'nursing:nursingPlan:remove', '#',
        'admin', '2024-08-14 08:29:10', '', NULL, ''),
       (2018, '护理计划导出', 2013, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'nursing:nursingPlan:export', '#',
        'admin', '2024-08-14 08:29:10', '', NULL, ''),
       -- 护理等级（最后插入）
       (2007, '护理等级', 2000, 3, 'level', 'serve/level/index', NULL, '', 1, 0, 'C', '0', '0', 'serve:level:list',
        'guide', 'admin', '2024-08-14 08:29:05', 'admin', '2024-10-03 10:49:54', '护理等级菜单'),
       (2008, '护理等级查询', 2007, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'serve:level:query', '#', 'admin',
        '2024-08-14 08:29:05', 'admin', '2024-10-03 10:47:20', ''),
       (2009, '护理等级新增', 2007, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'serve:level:add', '#', 'admin',
        '2024-08-14 08:29:05', 'admin', '2024-10-03 10:47:27', ''),
       (2010, '护理等级修改', 2007, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'serve:level:edit', '#', 'admin',
        '2024-08-14 08:29:05', 'admin', '2024-10-03 10:47:32', ''),
       (2011, '护理等级删除', 2007, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'serve:level:remove', '#', 'admin',
        '2024-08-14 08:29:05', 'admin', '2024-10-03 10:47:37', ''),
       (2012, '护理等级导出', 2007, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'serve:level:export', '#', 'admin',
        '2024-08-14 08:29:05', 'admin', '2024-10-03 10:47:42', ''),
       -- 服务管理下其他原有内容（顺序不变）
       (2043, '任务安排详情', 2000, 1, 'arrangeDetails', 'serve/arrange/details', NULL, '', 1, 0, 'C', '1', '0', '',
        '#', 'admin', '2024-08-29 06:53:37', 'admin', '2024-10-03 10:48:50', ''),
       (2041, '负责老人', 2000, 4, 'oldPeople', 'serve/oldPeople/index', NULL, '', 1, 0, 'C', '0', '0', '', 'peoples',
        'admin', '2024-08-29 06:52:12', 'admin', '2024-10-03 10:48:56', ''),
       (2042, '任务安排', 2000, 5, 'arrange', 'serve/arrange/index', NULL, '', 1, 0, 'C', '0', '0', '', 'redis-list',
        'admin', '2024-08-29 06:53:06', 'admin', '2024-10-03 10:49:01', ''),
       (2019, '在住管理', 0, 3, 'liveIn', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'date-range', 'admin',
        '2024-08-22 06:49:19', 'admin', '2024-08-29 06:42:27', ''),
       (2020, '房型设置', 2019, 0, 'houseSet', 'nursing/roomType/index', NULL, '', 1, 0, 'C', '0', '0', NULL, 'size',
        'admin', '2024-08-22 06:50:50', '', NULL, ''),
       (2021, '床位预览', 2019, 2, 'floor', 'nursing/floor/index', NULL, '', 1, 0, 'C', '0', '0', NULL, 'tree-table',
        'admin', '2024-08-22 08:15:05', '', NULL, ''),
       (2022, '入退管理', 0, 2, 'enterQuit', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'component', 'admin',
        '2024-08-23 12:52:34', 'admin', '2024-08-29 06:42:15', ''),
       (2023, '入住办理', 2022, 1, 'checkIn', 'nursing/checkIn/index', NULL, '', 1, 0, 'C', '0', '0',
        'nursing:checkIn:list', 'edit', 'admin', '2024-08-23 13:13:48', 'admin', '2024-08-24 02:58:12', '入住菜单'),
       (2024, '入住查询', 2023, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'nursing:checkIn:query', '#', 'admin',
        '2024-08-23 13:13:48', '', NULL, ''),
       (2025, '入住新增', 2023, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'nursing:checkIn:add', '#', 'admin',
        '2024-08-23 13:13:48', '', NULL, ''),
       (2026, '入住修改', 2023, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'nursing:checkIn:edit', '#', 'admin',
        '2024-08-23 13:13:48', '', NULL, ''),
       (2027, '入住删除', 2023, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'nursing:checkIn:remove', '#', 'admin',
        '2024-08-23 13:13:48', '', NULL, ''),
       (2028, '入住导出', 2023, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'nursing:checkIn:export', '#', 'admin',
        '2024-08-23 13:13:48', '', NULL, ''),
       (2035, '入住详情', 2022, 0, 'checkInInfo', 'nursing/checkIn/details', NULL, '', 1, 0, 'C', '1', '0', NULL,
        'checkbox', 'admin', '2024-08-24 03:44:48', '', NULL, ''),
       (2036, '来访管理', 0, 1, 'appointment', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'button', 'admin',
        '2024-08-29 06:41:45', '', NULL, ''),
       (2037, '智能监测', 0, 5, 'intelligence', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'exit-fullscreen', 'admin',
        '2024-08-29 06:43:14', '', NULL, ''),
       (2038, '预约信息', 2036, 1, 'reservation', 'nursing/reservation/index', NULL, '', 1, 0, 'C', '0', '0', NULL,
        'dashboard', 'admin', '2024-08-29 06:47:29', '', NULL, ''),
       (2039, '健康评估', 2022, 1, 'healthAssessment', 'nursing/healthAssessment/index', NULL, '', 1, 0, 'C', '0', '0',
        NULL, 'eye', 'admin', '2024-08-29 06:48:51', '', NULL, ''),
       (2040, '评估详情', 2022, 2, 'healthDetails', 'nursing/healthAssessment/details', NULL, '', 1, 0, 'C', '1', '0',
        '', '#', 'admin', '2024-08-29 06:49:53', 'admin', '2024-08-29 06:50:06', ''),
       (2044, '设备管理', 2037, 0, 'device', 'nursing/device/index', NULL, '', 1, 0, 'C', '0', '0', '', 'tool', 'admin',
        '2024-08-29 06:54:54', 'admin', '2024-08-29 07:13:42', ''),
       (2045, '设备详情', 2037, 0, 'details', 'nursing/device/details', NULL, '', 1, 0, 'C', '1', '0', NULL, '#',
        'admin', '2024-08-29 06:55:25', '', NULL, ''),
       (2046, '新增报警规则', 2037, 0, 'ruleDetails', 'nursing/alertRule/details', NULL, '', 1, 0, 'C', '1', '0', NULL,
        '#', 'admin', '2024-08-29 06:56:01', '', NULL, ''),
       (2047, '报警规则', 2037, 1, 'alertRule', 'nursing/alertRule/index', NULL, '', 1, 0, 'C', '0', '0', NULL,
        'nested', 'admin', '2024-08-29 06:56:48', '', NULL, ''),
       (2048, '报警数据', 2037, 2, 'alertData', 'nursing/alertData/index', NULL, '', 1, 0, 'C', '0', '0', NULL, 'skill',
        'admin', '2024-08-29 06:57:25', '', NULL, '');
/*!40000 ALTER TABLE `sys_menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice`
(
    `notice_id`      int                                                          NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `notice_title`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
    `notice_type`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '公告类型（1通知 2公告）',
    `notice_content` longblob COMMENT '公告内容',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '创建者',
    `create_time`    datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '更新者',
    `update_time`    datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `remark`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice`
    DISABLE KEYS */;
INSERT INTO `sys_notice`
VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', _binary '新版本内容', '0', 'admin', '2024-08-14 02:48:24', '',
        NULL, '管理员'),
       (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', _binary '维护内容', '0', 'admin', '2024-08-14 02:48:24', '',
        NULL, '管理员');
/*!40000 ALTER TABLE `sys_notice`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log`
(
    `oper_id`        bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
    `title`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT '' COMMENT '模块标题',
    `business_type`  int                                                            DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
    `method`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '方法名称',
    `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT '' COMMENT '请求方式',
    `operator_type`  int                                                            DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
    `oper_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT '' COMMENT '操作人员',
    `dept_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT '' COMMENT '部门名称',
    `oper_url`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '请求URL',
    `oper_ip`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '主机地址',
    `oper_location`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '操作地点',
    `oper_param`     varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
    `json_result`    varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
    `status`         int                                                            DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
    `error_msg`      varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
    `oper_time`      datetime                                                       DEFAULT NULL COMMENT '操作时间',
    `cost_time`      bigint                                                         DEFAULT '0' COMMENT '消耗时间',
    PRIMARY KEY (`oper_id`) USING BTREE,
    KEY `idx_sys_oper_log_bt` (`business_type`) USING BTREE,
    KEY `idx_sys_oper_log_s` (`status`) USING BTREE,
    KEY `idx_sys_oper_log_ot` (`oper_time`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 390
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log`
    DISABLE KEYS */;
INSERT INTO `sys_oper_log`
VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nursing_project\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-14 02:56:15', 107),
       (101, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"project\",\"className\":\"NursingProject\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 02:56:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 02:56:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderNo\",\"columnComment\":\"排序号\",\"columnId\":3,\"columnName\":\"order_no\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 02:56:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"orderNo\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Unit\",\"columnComment\":\"单位\",\"columnId\":4,\"columnName\":\"unit\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 02:56:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"unit\",\"javaType\":\"String\",\"li',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-14 02:57:47', 67),
       (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"服务管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"serve\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-14 02:59:12', 25),
       (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"project\",\"className\":\"NursingProject\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 02:56:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-08-14 02:57:47\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 02:56:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-08-14 02:57:47\",\"usableColumn\":false},{\"capJavaField\":\"OrderNo\",\"columnComment\":\"排序号\",\"columnId\":3,\"columnName\":\"order_no\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 02:56:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"orderNo\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-08-14 02:57:47\",\"usableColumn\":false},{\"capJavaField\":\"Unit\",\"columnComment\":\"单位\",\"columnId\":4,\"columnName\":\"unit\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 02:56:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInse',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-14 02:59:30', 60),
       (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nursing_project\"}', '', 0, '',
        '2024-08-14 02:59:33', 445),
       (105, '护理项目', 1, 'com.ruoyi.serve.controller.NursingProjectController.add()', 'POST', 1, 'admin', '研发部门',
        '/serve/project', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-14 11:02:15\",\"id\":84,\"image\":\"/profile/upload/2024/08/14/复建运动@2x_20240814110214A001.png\",\"name\":\"11\",\"nursingRequirement\":\"111\",\"orderNo\":11,\"params\":{},\"price\":1,\"unit\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-14 03:02:16', 31),
       (106, '护理项目', 2, 'com.ruoyi.serve.controller.NursingProjectController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/serve/project', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-14 11:02:16\",\"id\":84,\"image\":\"/profile/upload/2024/08/14/复建运动@2x_20240814110214A001.png\",\"name\":\"222\",\"nursingRequirement\":\"111\",\"orderNo\":2,\"params\":{},\"price\":1,\"status\":1,\"unit\":\"2\",\"updateTime\":\"2024-08-14 11:02:21\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-14 03:02:21', 8),
       (107, '护理项目', 3, 'com.ruoyi.serve.controller.NursingProjectController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/serve/project/84', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-14 03:02:24', 9),
       (108, '护理项目', 1, 'com.ruoyi.serve.controller.NursingProjectController.add()', 'POST', 1, 'admin', '研发部门',
        '/serve/project', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-14 11:39:59\",\"id\":85,\"image\":\"/profile/upload/2024/08/14/助餐@2x_20240814113958A001.png\",\"name\":\"测试护理项目\",\"nursingRequirement\":\"测试护理项目\",\"orderNo\":1,\"params\":{},\"price\":50,\"unit\":\"元\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-14 03:40:00', 42),
       (109, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP',
        '{\"tables\":\"nursing_level,nursing_plan,nursing_project_plan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        '', '2024-08-14 07:37:36', 199),
       (110, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"nursingLevel\",\"className\":\"NursingLevel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":14,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"等级名称\",\"columnId\":15,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LplanId\",\"columnComment\":\"护理计划ID\",\"columnId\":16,\"columnName\":\"lplan_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"lplanId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Fee\",\"columnComment\":\"护理费用\",\"columnId\":17,\"columnName\":\"fee\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"fee\",\"javaType\":\"B',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-14 08:27:28', 108),
       (111, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"nursingPlan\",\"className\":\"NursingPlan\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SortNo\",\"columnComment\":\"排序号\",\"columnId\":26,\"columnName\":\"sort_no\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"sortNo\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PlanName\",\"columnComment\":\"名称\",\"columnId\":27,\"columnName\":\"plan_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"planName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态 0禁用 1启用\",\"columnId\":28,\"columnName\":\"status\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"status\",\"j',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-14 08:28:14', 45),
       (112, '代码生成', 8, 'com.zzyl.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门',
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nursing_level,nursing_plan\"}', '', 0, '',
        '2024-08-14 08:28:26', 349),
       (113, '护理等级', 1, 'com.zzyl.nursing.controller.NursingLevelController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/nursingLevel', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-14 16:33:15\",\"description\":\"1223\",\"fee\":100,\"id\":76,\"lplanId\":1,\"name\":\"测试护理等级\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-14 08:33:16', 17),
       (114, '护理计划', 1, 'com.zzyl.nursing.controller.NursingPlanController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/nursingPlan', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-14 16:33:35\",\"id\":129,\"params\":{},\"planName\":\"测试护理等级\",\"sortNo\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-14 08:33:36', 8),
       (115, '护理项目', 1, 'com.zzyl.nursing.controller.NursingProjectController.add()', 'POST', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-18 09:57:59\",\"id\":86,\"image\":\"/profile/upload/2024/08/18/助浴@2x_20240818095758A001.png\",\"name\":\"22\",\"nursingRequirement\":\"22\",\"orderNo\":2,\"params\":{},\"price\":2,\"unit\":\"2\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-18 01:57:59', 20),
       (116, '护理项目', 2, 'com.zzyl.nursing.controller.NursingProjectController.edit()', 'PUT', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"id\":85,\"params\":{},\"status\":1,\"updateTime\":\"2024-08-18 10:14:02\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-18 02:14:03', 5),
       (117, '护理项目', 2, 'com.zzyl.nursing.controller.NursingProjectController.edit()', 'PUT', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"id\":85,\"params\":{},\"status\":0,\"updateTime\":\"2024-08-18 10:14:05\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-18 02:14:05', 4),
       (118, '护理项目', 2, 'com.zzyl.nursing.controller.NursingProjectController.edit()', 'PUT', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"id\":86,\"params\":{},\"status\":0,\"updateTime\":\"2024-08-18 10:14:08\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-18 02:14:08', 3),
       (119, '护理项目', 2, 'com.zzyl.nursing.controller.NursingProjectController.edit()', 'PUT', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"id\":86,\"params\":{},\"status\":1,\"updateTime\":\"2024-08-18 10:14:10\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-18 02:14:10', 5),
       (120, '字典类型', 1, 'com.zzyl.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"护理项目状态\",\"dictType\":\"nursing_project_status\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-18 02:40:48', 11),
       (121, '字典数据', 1, 'com.zzyl.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"启用\",\"dictSort\":0,\"dictType\":\"nursing_project_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-18 02:41:15', 12),
       (122, '字典数据', 1, 'com.zzyl.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"禁用\",\"dictSort\":0,\"dictType\":\"nursing_project_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-18 02:41:30', 11),
       (123, '字典数据', 1, 'com.zzyl.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"其他\",\"dictSort\":0,\"dictType\":\"nursing_project_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-18 02:43:19', 9),
       (124, '字典类型', 3, 'com.zzyl.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dict/data/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-18 02:43:47', 17),
       (125, '护理项目', 1, 'com.zzyl.nursing.controller.NursingProjectController.add()', 'POST', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-18 10:58:31\",\"id\":87,\"image\":\"/profile/upload/2024/08/18/助餐@2x_20240818105812A002.png\",\"name\":\"喂饭\",\"nursingRequirement\":\"无\",\"orderNo\":1,\"params\":{},\"price\":6,\"status\":1,\"unit\":\"元\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-18 02:58:31', 7),
       (126, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/nursingPlan', '127.0.0.1', '内网IP',
        '{\"id\":129,\"params\":{},\"status\":1,\"updateTime\":\"2024-08-19 10:47:23\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 02:47:23', 23),
       (127, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/nursingPlan', '127.0.0.1', '内网IP',
        '{\"id\":129,\"params\":{},\"status\":1,\"updateTime\":\"2024-08-19 10:47:42\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 02:47:42', 5),
       (128, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/nursingPlan', '127.0.0.1', '内网IP',
        '{\"id\":129,\"params\":{},\"status\":0,\"updateTime\":\"2024-08-19 10:49:01\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 02:49:01', 13),
       (129, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/nursingPlan', '127.0.0.1', '内网IP',
        '{\"id\":129,\"params\":{},\"status\":1,\"updateTime\":\"2024-08-19 10:52:03\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 02:52:03', 6),
       (130, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/nursingPlan', '127.0.0.1', '内网IP',
        '{\"id\":129,\"params\":{},\"status\":0,\"updateTime\":\"2024-08-19 10:52:05\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 02:52:05', 5),
       (131, '护理计划', 1, 'com.zzyl.nursing.controller.NursingPlanController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/nursingPlan', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-19 10:53:03\",\"id\":130,\"params\":{},\"planName\":\"6号护理计划\",\"sortNo\":1,\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 02:53:03', 6),
       (132, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/nursingPlan', '127.0.0.1', '内网IP',
        '{\"id\":130,\"params\":{},\"status\":0,\"updateTime\":\"2024-08-19 10:53:13\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 02:53:13', 4),
       (133, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/nursingPlan', '127.0.0.1', '内网IP',
        '{\"id\":130,\"params\":{},\"status\":1,\"updateTime\":\"2024-08-19 10:53:15\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 02:53:15', 4),
       (134, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"id\":129,\"params\":{},\"status\":1,\"updateTime\":\"2024-08-19 16:47:04\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 08:47:04', 11),
       (135, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"id\":129,\"params\":{},\"status\":0,\"updateTime\":\"2024-08-19 16:47:06\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 08:47:06', 4),
       (136, '护理计划', 1, 'com.zzyl.nursing.controller.NursingPlanController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"planName\":\"测试护理计划1\",\"projectPlans\":[{\"executeCycle\":0,\"executeFrequency\":1,\"executeTime\":\"17:11:40\",\"params\":{},\"projectId\":86},{\"executeCycle\":1,\"executeFrequency\":1,\"executeTime\":\"17:11:52\",\"params\":{},\"projectId\":87}],\"sortNo\":1,\"status\":1}',
        '', 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'create_time\' doesn\'t have a default value\r\n### The error may exist in file [E:\\code\\2024\\zzyl-ruoyi-ai-code\\day02\\zzyl\\zzyl-nursing-platform\\target\\classes\\mapper\\nursing\\NursingPlanMapper.xml]\r\n### The error may involve com.zzyl.nursing.mapper.NursingPlanMapper.insertNursingPlan-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into nursing_plan          ( sort_no,             plan_name,             status )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'create_time\' doesn\'t have a default value\n; Field \'create_time\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'create_time\' doesn\'t have a default value',
        '2024-08-19 09:11:58', 57),
       (137, '护理计划', 1, 'com.zzyl.nursing.controller.NursingPlanController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"planName\":\"测试护理计划1\",\"projectPlans\":[{\"executeCycle\":0,\"executeFrequency\":1,\"executeTime\":\"17:11:40\",\"params\":{},\"projectId\":86},{\"executeCycle\":1,\"executeFrequency\":1,\"executeTime\":\"17:11:52\",\"params\":{},\"projectId\":87}],\"sortNo\":1,\"status\":1}',
        '', 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'create_time\' doesn\'t have a default value\r\n### The error may exist in file [E:\\code\\2024\\zzyl-ruoyi-ai-code\\day02\\zzyl\\zzyl-nursing-platform\\target\\classes\\mapper\\nursing\\NursingPlanMapper.xml]\r\n### The error may involve com.zzyl.nursing.mapper.NursingPlanMapper.insertNursingPlan-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into nursing_plan          ( sort_no,             plan_name,             status )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'create_time\' doesn\'t have a default value\n; Field \'create_time\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'create_time\' doesn\'t have a default value',
        '2024-08-19 09:12:07', 7),
       (138, '护理计划', 1, 'com.zzyl.nursing.controller.NursingPlanController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"planName\":\"测试护理计划1\",\"projectPlans\":[{\"executeCycle\":0,\"executeFrequency\":1,\"executeTime\":\"17:11:40\",\"params\":{},\"projectId\":86},{\"executeCycle\":1,\"executeFrequency\":1,\"executeTime\":\"17:11:52\",\"params\":{},\"projectId\":87}],\"sortNo\":1,\"status\":1}',
        '', 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'create_time\' cannot be null\r\n### The error may exist in file [E:\\code\\2024\\zzyl-ruoyi-ai-code\\day02\\zzyl\\zzyl-nursing-platform\\target\\classes\\mapper\\nursing\\NursingProjectPlanMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO nursing_project_plan (plan_id, project_id, execute_time, execute_cycle, execute_frequency,         create_by, update_by, create_time, update_time)         VALUES                        (?, ?, ?, ?, ?,             ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?,             ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'create_time\' cannot be null\n; Column \'create_time\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'create_time\' cannot be null',
        '2024-08-19 09:13:23', 303),
       (139, '护理计划', 1, 'com.zzyl.nursing.controller.NursingPlanController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"planName\":\"测试护理计划1\",\"projectPlans\":[{\"executeCycle\":0,\"executeFrequency\":1,\"executeTime\":\"17:11:40\",\"params\":{},\"projectId\":86},{\"executeCycle\":1,\"executeFrequency\":1,\"executeTime\":\"17:11:52\",\"params\":{},\"projectId\":87}],\"sortNo\":1,\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 09:15:13', 215),
       (140, '护理计划', 3, 'com.zzyl.nursing.controller.NursingPlanController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/plan/129', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-19 10:58:35', 16),
       (141, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"id\":130,\"params\":{},\"status\":0,\"updateTime\":\"2024-08-19 18:58:46\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 10:58:46', 15),
       (142, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"id\":130,\"params\":{},\"status\":1,\"updateTime\":\"2024-08-19 18:58:48\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 10:58:48', 7),
       (143, '字典类型', 1, 'com.zzyl.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"护理计划状态\",\"dictType\":\"nursing_plan_status\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 10:59:40', 16),
       (144, '字典数据', 1, 'com.zzyl.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"启用\",\"dictSort\":0,\"dictType\":\"nursing_plan_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 11:00:04', 15),
       (145, '字典数据', 1, 'com.zzyl.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"禁用\",\"dictSort\":0,\"dictType\":\"nursing_plan_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 11:00:10', 15),
       (146, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"id\":132,\"planName\":\"测试护理计划1\",\"projectPlans\":[{\"createTime\":\"2024-08-19 09:15:13\",\"executeCycle\":1,\"executeFrequency\":1,\"executeTime\":\"17:11:52\",\"id\":1728,\"params\":{},\"planId\":132,\"projectId\":87}],\"sortNo\":1,\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 11:12:59', 36),
       (147, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"id\":132,\"planName\":\"测试护理计划1\",\"projectPlans\":[{\"createTime\":\"2024-08-19 09:15:13\",\"executeCycle\":1,\"executeFrequency\":1,\"executeTime\":\"17:11:52\",\"id\":1728,\"params\":{},\"planId\":132,\"projectId\":87}],\"sortNo\":1,\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 11:13:15', 11),
       (148, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"id\":132,\"planName\":\"测试护理计划1\",\"projectPlans\":[{\"createTime\":\"2024-08-19 11:13:15\",\"executeCycle\":1,\"executeFrequency\":1,\"executeTime\":\"17:11:52\",\"id\":1730,\"params\":{},\"planId\":132,\"projectId\":87}],\"sortNo\":1,\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 11:14:48', 71979),
       (149, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"id\":132,\"planName\":\"测试护理计划1\",\"projectPlans\":[{\"createTime\":\"2024-08-19 09:15:13\",\"executeCycle\":0,\"executeFrequency\":1,\"executeTime\":\"17:11:40\",\"id\":1727,\"params\":{},\"planId\":132,\"projectId\":86},{\"createTime\":\"2024-08-19 11:14:48\",\"executeCycle\":1,\"executeFrequency\":1,\"executeTime\":\"17:11:52\",\"id\":1731,\"params\":{},\"planId\":132,\"projectId\":87}],\"sortNo\":1,\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 11:16:40', 5657),
       (150, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"id\":132,\"planName\":\"测试护理计划1\",\"projectPlans\":[{\"createTime\":\"2024-08-19 11:16:40\",\"executeCycle\":1,\"executeFrequency\":1,\"executeTime\":\"17:11:52\",\"id\":1733,\"params\":{},\"planId\":132,\"projectId\":87}],\"sortNo\":1,\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 11:16:46', 32),
       (151, '护理计划', 3, 'com.zzyl.nursing.controller.NursingPlanController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/plan/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-19 11:16:58', 8),
       (152, '护理计划', 3, 'com.zzyl.nursing.controller.NursingPlanController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/plan/132', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-19 11:17:05', 10),
       (153, '护理计划', 1, 'com.zzyl.nursing.controller.NursingPlanController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"planName\":\"1号护理计划\",\"projectPlans\":[{\"executeCycle\":1,\"executeFrequency\":7,\"executeTime\":\"19:16:49\",\"params\":{},\"projectId\":87}],\"sortNo\":1,\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 11:17:31', 20),
       (154, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP', '{\"id\":133,\"status\":0}', '', 1,
        'nested exception is org.apache.ibatis.builder.BuilderException: The expression \'list\' evaluated to a null value.',
        '2024-08-19 11:17:37', 8),
       (155, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP', '{\"id\":133,\"status\":0}', '', 1,
        'nested exception is org.apache.ibatis.builder.BuilderException: The expression \'list\' evaluated to a null value.',
        '2024-08-19 11:17:45', 5),
       (156, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP', '{\"id\":133,\"status\":0}', '', 1,
        'nested exception is org.apache.ibatis.builder.BuilderException: The expression \'list\' evaluated to a null value.',
        '2024-08-19 11:17:55', 7),
       (157, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP', '{\"id\":133,\"status\":0}', '', 1, '', '2024-08-19 11:27:23', 15),
       (158, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP', '{\"id\":133,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        '', '2024-08-19 11:28:24', 2392),
       (159, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP', '{\"id\":133,\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        '', '2024-08-19 11:28:28', 12),
       (160, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP', '{\"id\":133,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        '', '2024-08-19 11:28:30', 16),
       (161, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP', '{\"id\":133,\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        '', '2024-08-19 11:28:32', 10),
       (162, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"id\":133,\"planName\":\"1号护理计划\",\"projectPlans\":[{\"createTime\":\"2024-08-19 11:17:31\",\"executeCycle\":1,\"executeFrequency\":7,\"executeTime\":\"19:16:49\",\"id\":1735,\"params\":{},\"planId\":133,\"projectId\":87},{\"executeCycle\":1,\"executeFrequency\":1,\"executeTime\":\"19:28:34\",\"params\":{},\"projectId\":85}],\"sortNo\":1,\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 11:28:43', 19),
       (163, '护理计划', 1, 'com.zzyl.nursing.controller.NursingPlanController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"planName\":\"2号护理计划\",\"projectPlans\":[{\"executeCycle\":0,\"executeFrequency\":1,\"executeTime\":\"19:28:45\",\"params\":{},\"projectId\":85}],\"sortNo\":1,\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 11:36:10', 34),
       (164, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP', '{\"id\":134,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        '', '2024-08-19 11:36:13', 6),
       (165, '护理项目', 2, 'com.zzyl.nursing.controller.NursingProjectController.edit()', 'PUT', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-18 09:57:59\",\"id\":86,\"image\":\"/profile/upload/2024/08/18/助浴@2x_20240818095758A001.png\",\"name\":\"洗衣服\",\"nursingRequirement\":\"22\",\"orderNo\":2,\"params\":{},\"price\":5,\"status\":1,\"unit\":\"元\",\"updateTime\":\"2024-08-19 20:24:49\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-19 12:24:49', 10),
       (166, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2024-08-14 02:48:23\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 01:57:10', 20),
       (167, '护理等级', 2, 'com.zzyl.nursing.controller.NursingLevelController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"id\":76,\"params\":{},\"status\":0,\"updateTime\":\"2024-08-20 10:49:50\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 02:49:49', 10),
       (168, '护理等级', 2, 'com.zzyl.nursing.controller.NursingLevelController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"id\":76,\"params\":{},\"status\":1,\"updateTime\":\"2024-08-20 10:49:52\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 02:49:52', 4),
       (169, '护理等级', 2, 'com.zzyl.nursing.controller.NursingLevelController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"id\":76,\"params\":{},\"status\":0,\"updateTime\":\"2024-08-20 10:55:09\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 02:55:09', 24),
       (170, '护理等级', 2, 'com.zzyl.nursing.controller.NursingLevelController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"id\":76,\"params\":{},\"status\":1,\"updateTime\":\"2024-08-20 10:55:11\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 02:55:11', 4),
       (171, '护理等级', 2, 'com.zzyl.nursing.controller.NursingLevelController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"id\":76,\"params\":{},\"status\":0,\"updateTime\":\"2024-08-20 10:55:15\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 02:55:15', 4),
       (172, '护理等级', 2, 'com.zzyl.nursing.controller.NursingLevelController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"id\":76,\"params\":{},\"status\":1,\"updateTime\":\"2024-08-20 10:55:20\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 02:55:20', 6),
       (173, '护理等级', 2, 'com.zzyl.nursing.controller.NursingLevelController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"id\":76,\"params\":{},\"status\":0,\"updateTime\":\"2024-08-20 10:55:23\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 02:55:23', 4),
       (174, '护理等级', 2, 'com.zzyl.nursing.controller.NursingLevelController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"id\":76,\"params\":{},\"status\":1,\"updateTime\":\"2024-08-20 11:02:26\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 03:02:26', 22),
       (175, '字典类型', 1, 'com.zzyl.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"护理等级状态\",\"dictType\":\"nursing_level_status\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 03:04:03', 14),
       (176, '字典数据', 1, 'com.zzyl.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"启用\",\"dictSort\":0,\"dictType\":\"nursing_level_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 03:04:14', 11),
       (177, '字典数据', 1, 'com.zzyl.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"禁用\",\"dictSort\":0,\"dictType\":\"nursing_level_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 03:04:21', 10),
       (178, '护理等级', 1, 'com.zzyl.nursing.controller.NursingLevelController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-20 11:18:08\",\"description\":\"1223\",\"lplanId\":133,\"name\":\"1号护理计划\",\"params\":{},\"status\":1}',
        '', 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'fee\' doesn\'t have a default value\r\n### The error may exist in file [E:\\code\\2024\\zzyl-ruoyi-ai-code\\day02\\zzyl\\zzyl-nursing-platform\\target\\classes\\mapper\\nursing\\NursingLevelMapper.xml]\r\n### The error may involve com.zzyl.nursing.mapper.NursingLevelMapper.insertNursingLevel-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into nursing_level          ( name,             lplan_id,                          status,             description,             create_time )           values ( ?,             ?,                          ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'fee\' doesn\'t have a default value\n; Field \'fee\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'fee\' doesn\'t have a default value',
        '2024-08-20 03:18:08', 58),
       (179, '护理等级', 1, 'com.zzyl.nursing.controller.NursingLevelController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-20 11:18:21\",\"description\":\"1223\",\"fee\":2000,\"id\":77,\"lplanId\":133,\"name\":\"1号护理计划\",\"params\":{},\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 03:18:21', 7),
       (180, '护理等级', 2, 'com.zzyl.nursing.controller.NursingLevelController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"id\":77,\"params\":{},\"status\":0,\"updateTime\":\"2024-08-20 11:18:35\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 03:18:35', 7),
       (181, '护理等级', 2, 'com.zzyl.nursing.controller.NursingLevelController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"id\":77,\"params\":{},\"status\":1,\"updateTime\":\"2024-08-20 11:18:37\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 03:18:37', 5),
       (182, '护理等级', 2, 'com.zzyl.nursing.controller.NursingLevelController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-20 11:18:21\",\"description\":\"1223\",\"fee\":2000,\"id\":77,\"lplanId\":134,\"name\":\"1号护理计划\",\"params\":{},\"status\":1,\"updateTime\":\"2024-08-20 11:18:45\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-20 03:18:45', 4),
       (183, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"projectPlan\",\"className\":\"NursingProjectPlan\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":34,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PlanId\",\"columnComment\":\"计划id\",\"columnId\":35,\"columnName\":\"plan_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"planId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProjectId\",\"columnComment\":\"项目id\",\"columnId\":36,\"columnName\":\"project_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"projectId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ExecuteTime\",\"columnComment\":\"计划执行时间\",\"columnId\":37,\"columnName\":\"execute_time\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"executeTime\",\"javaType\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-21 02:39:05', 89),
       (184, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"projectPlan\",\"className\":\"NursingProjectPlan\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":34,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-08-21 02:39:05\",\"usableColumn\":false},{\"capJavaField\":\"PlanId\",\"columnComment\":\"计划id\",\"columnId\":35,\"columnName\":\"plan_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"planId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-08-21 02:39:05\",\"usableColumn\":false},{\"capJavaField\":\"ProjectId\",\"columnComment\":\"项目id\",\"columnId\":36,\"columnName\":\"project_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"projectId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-08-21 02:39:05\",\"usableColumn\":false},{\"capJavaField\":\"ExecuteTime\",\"columnComment\":\"计划执行时间\",\"columnId\":37,\"columnName\":\"execute_time\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-21 02:39:42', 83),
       (185, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"nursingLevel\",\"className\":\"NursingLevel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":14,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-08-14 08:27:28\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"等级名称\",\"columnId\":15,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-08-14 08:27:28\",\"usableColumn\":false},{\"capJavaField\":\"LplanId\",\"columnComment\":\"护理计划ID\",\"columnId\":16,\"columnName\":\"lplan_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"lplanId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-08-14 08:27:28\",\"usableColumn\":false},{\"capJavaField\":\"Fee\",\"columnComment\":\"护理费用\",\"columnId\":17,\"columnName\":\"fee\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 07:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-21 03:24:12', 212),
       (186, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"project\",\"className\":\"NursingProject\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 02:56:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-08-14 02:59:29\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 02:56:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-08-14 02:59:29\",\"usableColumn\":false},{\"capJavaField\":\"OrderNo\",\"columnComment\":\"排序号\",\"columnId\":3,\"columnName\":\"order_no\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 02:56:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"orderNo\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-08-14 02:59:29\",\"usableColumn\":false},{\"capJavaField\":\"Unit\",\"columnComment\":\"单位\",\"columnId\":4,\"columnName\":\"unit\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 02:56:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInse',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-21 03:44:32', 156),
       (187, '代码生成', 6, 'com.zzyl.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"check_in\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-21 03:46:38', 81),
       (188, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"checkIn\",\"className\":\"CheckIn\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":45,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-21 03:46:38\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CheckInCode\",\"columnComment\":\"编号\",\"columnId\":46,\"columnName\":\"check_in_code\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-21 03:46:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"checkInCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":47,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-21 03:46:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ElderId\",\"columnComment\":\"老人id\",\"columnId\":48,\"columnName\":\"elder_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-21 03:46:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderId\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-21 03:47:35', 70),
       (189, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"在住管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"liveIn\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 06:49:19', 26),
       (190, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/roomType/index\",\"createBy\":\"admin\",\"icon\":\"size\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"房型设置\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2019,\"path\":\"houseSet\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 06:50:50', 9),
       (191, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":4,\"params\":{},\"status\":0,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 14:54:22\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 06:54:25', 23),
       (192, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":4,\"params\":{},\"status\":0,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 14:54:25\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 06:54:28', 7),
       (193, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":4,\"params\":{},\"status\":0,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 14:54:35\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 06:54:38', 6),
       (194, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":4,\"params\":{},\"status\":0,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 14:56:59\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 06:57:01', 29221),
       (195, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":4,\"params\":{},\"status\":0,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 14:58:01\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 06:58:04', 4065),
       (196, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":4,\"params\":{},\"status\":0,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 16:10:12\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 08:10:14', 14),
       (197, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":4,\"params\":{},\"status\":0,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 16:10:32\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 08:10:35', 10),
       (198, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":4,\"params\":{},\"status\":1,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 16:11:39\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 08:11:41', 5),
       (199, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":4,\"params\":{},\"status\":0,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 16:11:42\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 08:11:44', 5),
       (200, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":4,\"params\":{},\"status\":1,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 16:12:02\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 08:12:05', 8),
       (201, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":4,\"params\":{},\"status\":0,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 16:12:18\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 08:12:21', 7),
       (202, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":4,\"params\":{},\"status\":1,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 16:12:20\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 08:12:23', 6),
       (203, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/floor/index\",\"createBy\":\"admin\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"床位预览\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2019,\"path\":\"floor\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 08:15:05', 14),
       (204, '楼层', 1, 'com.zzyl.nursing.controller.FloorController.add()', 'POST', 1, 'admin', '研发部门',
        '/elder/floor', '127.0.0.1', '内网IP',
        '{\"code\":1,\"createBy\":\"1\",\"createTime\":\"2024-08-22 16:19:50\",\"id\":411,\"name\":\"88\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 08:19:53', 13),
       (205, '楼层', 3, 'com.zzyl.nursing.controller.FloorController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/elder/floor/411', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-22 08:29:18', 14),
       (206, '房间', 1, 'com.zzyl.nursing.controller.RoomController.add()', 'POST', 1, 'admin', '研发部门',
        '/elder/room', '127.0.0.1', '内网IP',
        '{\"code\":\"102-2\",\"createBy\":\"1\",\"createTime\":\"2024-08-22 18:49:20\",\"floorId\":406,\"id\":86,\"params\":{},\"sort\":1,\"typeName\":\"豪华单人间\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 10:49:23', 13),
       (207, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":105,\"params\":{},\"status\":0,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 19:05:25\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 11:05:28', 6),
       (208, '房型', 3, 'com.zzyl.nursing.controller.RoomTypeController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/elder/roomType/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-22 11:05:30', 6),
       (209, '房型', 3, 'com.zzyl.nursing.controller.RoomTypeController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/elder/roomType/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-22 11:05:33', 5),
       (210, '房型', 3, 'com.zzyl.nursing.controller.RoomTypeController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/elder/roomType/114', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-22 11:05:38', 5),
       (211, '房型', 3, 'com.zzyl.nursing.controller.RoomTypeController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/elder/roomType/112', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-22 11:05:41', 5),
       (212, '房型', 3, 'com.zzyl.nursing.controller.RoomTypeController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/elder/roomType/113', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-22 11:05:46', 5),
       (213, '房型', 3, 'com.zzyl.nursing.controller.RoomTypeController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/elder/roomType/111', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-22 11:05:51', 5),
       (214, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":110,\"params\":{},\"status\":0,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 19:05:50\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 11:05:53', 5),
       (215, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":110,\"params\":{},\"status\":1,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 19:05:52\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 11:05:55', 4),
       (216, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"bedCount\":5,\"createBy\":\"1671403256519078138\",\"createTime\":\"2023-12-27 00:07:07\",\"id\":110,\"introduction\":\"12312312312312312312312312312312312312312312312312\",\"name\":\"测试修改\",\"params\":{},\"photo\":\"https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/00167193-00f1-49a6-85e5-74dd0b93819e.png\",\"price\":1000,\"status\":1,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 19:05:53\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 11:06:10', 9),
       (217, '房型', 1, 'com.zzyl.nursing.controller.RoomTypeController.add()', 'POST', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"bedCount\":10,\"createBy\":\"1\",\"createTime\":\"2024-08-22 19:06:33\",\"id\":115,\"introduction\":\"水电费方式\",\"name\":\"测试新增\",\"params\":{},\"photo\":\"https://itheim.oss-cn-beijing.aliyuncs.com/8fe7b29d-fce0-4201-becb-0586e8284a9d.png\",\"price\":3500,\"remark\":\"是否\",\"status\":0}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 11:06:36', 7),
       (218, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":115,\"params\":{},\"status\":1,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 19:06:41\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 11:06:44', 5),
       (219, '楼层', 1, 'com.zzyl.nursing.controller.FloorController.add()', 'POST', 1, 'admin', '研发部门',
        '/elder/floor', '127.0.0.1', '内网IP',
        '{\"code\":1,\"createBy\":\"1\",\"createTime\":\"2024-08-22 19:06:55\",\"id\":412,\"name\":\"13楼\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 11:06:58', 4),
       (220, '房间', 1, 'com.zzyl.nursing.controller.RoomController.add()', 'POST', 1, 'admin', '研发部门',
        '/elder/room', '127.0.0.1', '内网IP',
        '{\"code\":\"1301\",\"createBy\":\"1\",\"createTime\":\"2024-08-22 19:07:05\",\"floorId\":412,\"id\":87,\"params\":{},\"sort\":1,\"typeName\":\"双人套房\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 11:07:07', 8),
       (221, '床位', 1, 'com.zzyl.nursing.controller.BedController.add()', 'POST', 1, 'admin', '研发部门', '/elder/bed',
        '127.0.0.1', '内网IP',
        '{\"bedNumber\":\"1301-1\",\"createBy\":\"1\",\"createTime\":\"2024-08-22 19:07:15\",\"id\":197,\"params\":{},\"roomId\":87,\"sort\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 11:07:18', 7),
       (222, '床位', 1, 'com.zzyl.nursing.controller.BedController.add()', 'POST', 1, 'admin', '研发部门', '/elder/bed',
        '127.0.0.1', '内网IP',
        '{\"bedNumber\":\"1301-2\",\"createBy\":\"1\",\"createTime\":\"2024-08-22 19:07:22\",\"id\":198,\"params\":{},\"roomId\":87,\"sort\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 11:07:25', 4),
       (223, '床位', 2, 'com.zzyl.nursing.controller.BedController.edit()', 'PUT', 1, 'admin', '研发部门', '/elder/bed',
        '127.0.0.1', '内网IP',
        '{\"bedNumber\":\"1301-7\",\"id\":197,\"params\":{},\"roomId\":87,\"sort\":1,\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 19:07:28\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 11:07:31', 7),
       (224, '床位', 3, 'com.zzyl.nursing.controller.BedController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/elder/bed/197', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-22 11:07:34', 9),
       (225, '床位', 3, 'com.zzyl.nursing.controller.BedController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/elder/bed/198', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-22 11:07:37', 6),
       (226, '房间', 2, 'com.zzyl.nursing.controller.RoomController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/room', '127.0.0.1', '内网IP',
        '{\"code\":\"1302\",\"id\":87,\"params\":{},\"sort\":1,\"typeName\":\"豪华双人间\",\"updateBy\":\"1\",\"updateTime\":\"2024-08-22 19:07:43\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 11:07:46', 6),
       (227, '房间', 3, 'com.zzyl.nursing.controller.RoomController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/elder/room/87', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-22 11:07:52', 6),
       (228, '楼层', 3, 'com.zzyl.nursing.controller.FloorController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/elder/floor/412', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-22 11:07:56', 6),
       (229, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"serve/project/index\",\"createTime\":\"2024-08-14 03:00:15\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"护理项目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"project\",\"perms\":\"serve:project:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 12:16:12', 11),
       (230, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/nursingLevel/index\",\"createTime\":\"2024-08-14 08:29:05\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"护理等级\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"nursingLevel\",\"perms\":\"nursing:nursingLevel:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 12:16:22', 7),
       (231, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/nursingPlan/index\",\"createTime\":\"2024-08-14 08:29:10\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"护理计划\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"nursingPlan\",\"perms\":\"nursing:nursingPlan:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-22 12:16:43', 10),
       (232, '代码生成', 3, 'com.zzyl.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:21:12',
        41),
       (233, '代码生成', 3, 'com.zzyl.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:21:18',
        13),
       (234, '代码生成', 3, 'com.zzyl.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:21:20',
        16),
       (235, '代码生成', 3, 'com.zzyl.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:21:22',
        12),
       (236, '代码生成', 3, 'com.zzyl.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:21:24',
        12),
       (237, '代码生成', 6, 'com.zzyl.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP',
        '{\"tables\":\"contract,check_in_config,check_in,elder\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-23 12:21:32', 364),
       (238, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"checkIn\",\"className\":\"CheckIn\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":58,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ElderId\",\"columnComment\":\"老人ID\",\"columnId\":59,\"columnName\":\"elder_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"IdNumber\",\"columnComment\":\"身份证号\",\"columnId\":60,\"columnName\":\"id_number\",\"columnType\":\"varchar(18)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"idNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartDate\",\"columnComment\":\"入住开始时间\",\"columnId\":61,\"columnName\":\"start_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"startD',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:22:45', 76),
       (239, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"checkInConfig\",\"className\":\"CheckInConfig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":72,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CheckInId\",\"columnComment\":\"入住表ID\",\"columnId\":73,\"columnName\":\"check_in_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"checkInId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CareLevelId\",\"columnComment\":\"护理等级ID\",\"columnId\":74,\"columnName\":\"care_level_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"careLevelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CareLevelName\",\"columnComment\":\"护理等级名称\",\"columnId\":75,\"columnName\":\"care_level_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRe',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:23:31', 81),
       (240, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"contract\",\"className\":\"Contract\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":90,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ElderId\",\"columnComment\":\"老人ID\",\"columnId\":91,\"columnName\":\"elder_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContractName\",\"columnComment\":\"合同名称\",\"columnId\":92,\"columnName\":\"contract_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contractName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContractNumber\",\"columnComment\":\"合同编号\",\"columnId\":93,\"columnName\":\"contract_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:23:58', 87),
       (241, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"elder\",\"className\":\"Elder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":111,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":112,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Image\",\"columnComment\":\"图片\",\"columnId\":113,\"columnName\":\"image\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"image\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"IdCardNo\",\"columnComment\":\"身份证号\",\"columnId\":114,\"columnName\":\"id_card_no\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"idCardNo\",\"ja',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:24:18', 73),
       (242, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"checkIn\",\"className\":\"CheckIn\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":58,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:22:45\",\"usableColumn\":false},{\"capJavaField\":\"ElderId\",\"columnComment\":\"老人ID\",\"columnId\":59,\"columnName\":\"elder_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:22:45\",\"usableColumn\":false},{\"capJavaField\":\"IdNumber\",\"columnComment\":\"身份证号\",\"columnId\":60,\"columnName\":\"id_number\",\"columnType\":\"varchar(18)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"idNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:22:45\",\"usableColumn\":false},{\"capJavaField\":\"StartDate\",\"columnComment\":\"入住开始时间\",\"columnId\":61,\"columnName\":\"start_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"i',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:26:43', 97),
       (243, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"checkInConfig\",\"className\":\"CheckInConfig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":72,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:23:31\",\"usableColumn\":false},{\"capJavaField\":\"CheckInId\",\"columnComment\":\"入住表ID\",\"columnId\":73,\"columnName\":\"check_in_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"checkInId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:23:31\",\"usableColumn\":false},{\"capJavaField\":\"CareLevelId\",\"columnComment\":\"护理等级ID\",\"columnId\":74,\"columnName\":\"care_level_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"careLevelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:23:31\",\"usableColumn\":false},{\"capJavaField\":\"CareLevelName\",\"columnComment\":\"护理等级名称\",\"columnId\":75,\"columnName\":\"care_level_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":fals',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:27:19', 74),
       (244, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"contract\",\"className\":\"Contract\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":90,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:23:58\",\"usableColumn\":false},{\"capJavaField\":\"ElderId\",\"columnComment\":\"老人ID\",\"columnId\":91,\"columnName\":\"elder_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:23:58\",\"usableColumn\":false},{\"capJavaField\":\"ContractName\",\"columnComment\":\"合同名称\",\"columnId\":92,\"columnName\":\"contract_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contractName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:23:58\",\"usableColumn\":false},{\"capJavaField\":\"ContractNumber\",\"columnComment\":\"合同编号\",\"columnId\":93,\"columnName\":\"contract_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"ins',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:27:57', 88),
       (245, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"elder\",\"className\":\"Elder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":111,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:24:18\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":112,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:24:18\",\"usableColumn\":false},{\"capJavaField\":\"Image\",\"columnComment\":\"图片\",\"columnId\":113,\"columnName\":\"image\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"image\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:24:18\",\"usableColumn\":false},{\"capJavaField\":\"IdCardNo\",\"columnComment\":\"身份证号\",\"columnId\":114,\"columnName\":\"id_card_no\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrem',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:28:53', 72),
       (246, '代码生成', 8, 'com.zzyl.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门',
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"check_in,check_in_config,contract,elder\"}', '',
        0, '', '2024-08-23 12:35:43', 748),
       (247, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"入退管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"enterQuit\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:52:34', 34),
       (248, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"checkIn\",\"className\":\"CheckIn\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":58,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:26:43\",\"usableColumn\":false},{\"capJavaField\":\"ElderId\",\"columnComment\":\"老人ID\",\"columnId\":59,\"columnName\":\"elder_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:26:43\",\"usableColumn\":false},{\"capJavaField\":\"IdNumber\",\"columnComment\":\"身份证号\",\"columnId\":60,\"columnName\":\"id_number\",\"columnType\":\"varchar(18)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"idNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:26:43\",\"usableColumn\":false},{\"capJavaField\":\"StartDate\",\"columnComment\":\"入住开始时间\",\"columnId\":61,\"columnName\":\"start_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"i',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:57:16', 152),
       (249, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"contract\",\"className\":\"Contract\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":90,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:27:57\",\"usableColumn\":false},{\"capJavaField\":\"ElderId\",\"columnComment\":\"老人ID\",\"columnId\":91,\"columnName\":\"elder_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:27:57\",\"usableColumn\":false},{\"capJavaField\":\"ContractName\",\"columnComment\":\"合同名称\",\"columnId\":92,\"columnName\":\"contract_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contractName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 12:27:57\",\"usableColumn\":false},{\"capJavaField\":\"ContractNumber\",\"columnComment\":\"合同编号\",\"columnId\":93,\"columnName\":\"contract_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"ins',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 12:58:53', 124),
       (250, '代码生成', 8, 'com.zzyl.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门',
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"check_in,check_in_config,contract,elder\"}', '',
        0, '', '2024-08-23 13:00:15', 629),
       (251, '代码生成', 2, 'com.zzyl.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门',
        '/tool/gen/synchDb/check_in', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-23 13:28:23', 157),
       (252, '代码生成', 2, 'com.zzyl.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门',
        '/tool/gen/synchDb/contract', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-23 13:28:27', 141),
       (253, '代码生成', 2, 'com.zzyl.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门',
        '/tool/gen/synchDb/check_in_config', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-23 13:28:34', 115),
       (254, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"contract\",\"className\":\"Contract\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":90,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 13:28:27\",\"usableColumn\":false},{\"capJavaField\":\"ElderId\",\"columnComment\":\"老人ID\",\"columnId\":91,\"columnName\":\"elder_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 13:28:27\",\"usableColumn\":false},{\"capJavaField\":\"ContractName\",\"columnComment\":\"合同名称\",\"columnId\":92,\"columnName\":\"contract_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contractName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 13:28:27\",\"usableColumn\":false},{\"capJavaField\":\"ContractNumber\",\"columnComment\":\"合同编号\",\"columnId\":93,\"columnName\":\"contract_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"ins',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 13:29:42', 124),
       (255, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"checkInConfig\",\"className\":\"CheckInConfig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":72,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 13:28:34\",\"usableColumn\":false},{\"capJavaField\":\"CheckInId\",\"columnComment\":\"入住表ID\",\"columnId\":73,\"columnName\":\"check_in_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"checkInId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 13:28:34\",\"usableColumn\":false},{\"capJavaField\":\"CareLevelId\",\"columnComment\":\"护理等级ID\",\"columnId\":74,\"columnName\":\"care_level_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"careLevelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 13:28:34\",\"usableColumn\":false},{\"capJavaField\":\"CareLevelName\",\"columnComment\":\"护理等级名称\",\"columnId\":75,\"columnName\":\"care_level_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 12:21:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":fals',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 13:30:20', 88),
       (256, '代码生成', 3, 'com.zzyl.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/7,6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-23 13:30:49', 20),
       (257, '代码生成', 6, 'com.zzyl.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"check_in_config,check_in\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 13:30:56', 138),
       (258, '代码生成', 3, 'com.zzyl.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/10,11', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-23 13:32:19', 15),
       (259, '代码生成', 6, 'com.zzyl.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"check_in_config,check_in\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 13:32:24', 124),
       (260, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"checkIn\",\"className\":\"CheckIn\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":161,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 13:32:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ElderId\",\"columnComment\":\"老人ID\",\"columnId\":162,\"columnName\":\"elder_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 13:32:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"IdCardNo\",\"columnComment\":\"身份证号\",\"columnId\":163,\"columnName\":\"id_card_no\",\"columnType\":\"char(18)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 13:32:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"idCardNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartDate\",\"columnComment\":\"入住开始时间\",\"columnId\":164,\"columnName\":\"start_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 13:32:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"start',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 13:33:23', 60),
       (261, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"check_in_config\",\"className\":\"CheckInConfig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":175,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 13:32:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CheckInId\",\"columnComment\":\"入住表ID\",\"columnId\":176,\"columnName\":\"check_in_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 13:32:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"checkInId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NursingLevelId\",\"columnComment\":\"护理等级ID\",\"columnId\":177,\"columnName\":\"nursing_level_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 13:32:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nursingLevelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NursingLevelName\",\"columnComment\":\"护理等级名称\",\"columnId\":178,\"columnName\":\"nursing_level_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 13:32:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 13:34:17', 85),
       (262, '代码生成', 8, 'com.zzyl.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门',
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"check_in,check_in_config\"}', '', 0, '',
        '2024-08-23 13:34:27', 332),
       (263, '代码生成', 3, 'com.zzyl.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/13,12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-23 14:07:17', 36),
       (264, '代码生成', 6, 'com.zzyl.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"check_in_config,check_in\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 14:07:25', 220),
       (265, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"checkIn\",\"className\":\"CheckIn\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":193,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 14:07:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ElderName\",\"columnComment\":\"老人姓名\",\"columnId\":194,\"columnName\":\"elder_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 14:07:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ElderId\",\"columnComment\":\"老人ID\",\"columnId\":195,\"columnName\":\"elder_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 14:07:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"IdCardNo\",\"columnComment\":\"身份证号\",\"columnId\":196,\"columnName\":\"id_card_no\",\"columnType\":\"char(18)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 14:07:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 14:09:15', 103),
       (266, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"checkInConfig\",\"className\":\"CheckInConfig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":208,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 14:07:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CheckInId\",\"columnComment\":\"入住表ID\",\"columnId\":209,\"columnName\":\"check_in_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 14:07:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"checkInId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NursingLevelId\",\"columnComment\":\"护理等级ID\",\"columnId\":210,\"columnName\":\"nursing_level_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 14:07:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nursingLevelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NursingLevelName\",\"columnComment\":\"护理等级名称\",\"columnId\":211,\"columnName\":\"nursing_level_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 14:07:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"i',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 14:10:08', 114),
       (267, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"checkIn\",\"className\":\"CheckIn\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":193,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 14:07:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 14:09:15\",\"usableColumn\":false},{\"capJavaField\":\"ElderName\",\"columnComment\":\"老人姓名\",\"columnId\":194,\"columnName\":\"elder_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 14:07:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 14:09:15\",\"usableColumn\":false},{\"capJavaField\":\"ElderId\",\"columnComment\":\"老人ID\",\"columnId\":195,\"columnName\":\"elder_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 14:07:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2024-08-23 14:09:15\",\"usableColumn\":false},{\"capJavaField\":\"IdCardNo\",\"columnComment\":\"身份证号\",\"columnId\":196,\"columnName\":\"id_card_no\",\"columnType\":\"char(18)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-23 14:07:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdi',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-23 14:10:18', 80),
       (268, '代码生成', 8, 'com.zzyl.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门',
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"check_in,check_in_config\"}', '', 0, '',
        '2024-08-23 14:10:23', 420),
       (269, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/checkIn/index\",\"createTime\":\"2024-08-23 13:13:48\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"入住办理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2022,\"path\":\"checkIn\",\"perms\":\"nursing:checkIn:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-24 02:58:12', 37),
       (270, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/checkIn/details\",\"createBy\":\"admin\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"入住详情\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2022,\"path\":\"checkInInfo\",\"status\":\"0\",\"visible\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-24 03:44:48', 12),
       (271, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2024-08-14 02:48:23\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:40:54', 20),
       (272, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2024-08-14 02:48:23\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:41:07', 9),
       (273, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2024-08-14 02:48:23\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:41:14', 10),
       (274, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"来访管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appointment\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:41:45', 10),
       (275, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2024-08-23 12:52:34\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"入退管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"enterQuit\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:42:15', 11),
       (276, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2024-08-22 06:49:19\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"在住管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"liveIn\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:42:27', 9),
       (277, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2024-08-14 02:59:12\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"服务管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"serve\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:42:37', 11),
       (278, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"exit-fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"智能监测\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"intelligence\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:43:14', 10),
       (279, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/reservation/index\",\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"预约信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2036,\"path\":\"reservation\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:47:29', 10),
       (280, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/healthAssessment/index\",\"createBy\":\"admin\",\"icon\":\"eye\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"健康评估\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2022,\"path\":\"healthAssessment\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:48:51', 9),
       (281, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/healthAssessment/details\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"评估详情\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2022,\"path\":\"healthDetails\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:49:53', 10),
       (282, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/healthAssessment/details\",\"createTime\":\"2024-08-29 06:49:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2040,\"menuName\":\"评估详情\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2022,\"path\":\"healthDetails\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:50:06', 9),
       (283, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/oldPeople/index\",\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"负责老师\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"oldPeople\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:52:12', 9),
       (284, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/oldPeople/index\",\"createTime\":\"2024-08-29 06:52:12\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"负责老人\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"oldPeople\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:52:23', 8),
       (285, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/arrange/index\",\"createBy\":\"admin\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"任务安排\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"arrange\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:53:06', 8),
       (286, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/arrange/details\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"任务安排详情\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"arrangeDetails\",\"status\":\"0\",\"visible\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:53:37', 11),
       (287, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/device/index\",\"createBy\":\"admin\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2037,\"path\":\"device\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:54:54', 8),
       (288, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/device/details\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备详情\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2037,\"path\":\"details\",\"status\":\"0\",\"visible\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:55:25', 9),
       (289, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/alertRule/details\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增报警规则\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2037,\"path\":\"ruleDetails\",\"status\":\"0\",\"visible\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:56:01', 9),
       (290, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/alertRule/index\",\"createBy\":\"admin\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"报警规则\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2037,\"path\":\"alertRule\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:56:48', 8),
       (291, '菜单管理', 1, 'com.zzyl.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/alertData/index\",\"createBy\":\"admin\",\"icon\":\"skill\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"报警数据\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2037,\"path\":\"alertData\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 06:57:25', 30),
       (292, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/device/index\",\"createTime\":\"2024-08-29 06:54:54\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2044,\"menuName\":\"设备管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2037,\"path\":\"device\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 07:13:42', 11),
       (293, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"nursing/contract/index\",\"createTime\":\"2024-08-23 13:13:55\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"合同\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2019,\"path\":\"contract\",\"perms\":\"nursing:contract:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 07:35:27', 9),
       (294, '护理项目', 1, 'com.zzyl.nursing.controller.NursingProjectController.add()', 'POST', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"createBy\":\"1\",\"createTime\":\"2024-08-29 16:47:36\",\"id\":1825787069131255811,\"image\":\"https://itheim.oss-cn-beijing.aliyuncs.com/2b6c0e57-feda-4029-8cbb-99181674f474.png\",\"name\":\"修剪指甲\",\"orderNo\":1,\"params\":{},\"price\":10,\"status\":1,\"unit\":\"次\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:46:32', 38),
       (295, '护理项目', 1, 'com.zzyl.nursing.controller.NursingProjectController.add()', 'POST', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"createBy\":\"1\",\"createTime\":\"2024-08-29 16:51:49\",\"id\":1,\"image\":\"https://itheim.oss-cn-beijing.aliyuncs.com/b6631465-1684-41fe-8ccd-0b027cb91e90.png\",\"name\":\"修剪指甲\",\"nursingRequirement\":\"无\",\"orderNo\":1,\"params\":{},\"price\":10,\"status\":1,\"unit\":\"次\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:50:45', 9),
       (296, '护理项目', 1, 'com.zzyl.nursing.controller.NursingProjectController.add()', 'POST', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"createBy\":\"1\",\"createTime\":\"2024-08-29 16:52:26\",\"id\":2,\"image\":\"https://itheim.oss-cn-beijing.aliyuncs.com/41fc58d3-0627-4fa9-8459-906599aa1efa.png\",\"name\":\"衣物清洁\",\"nursingRequirement\":\"无\",\"orderNo\":1,\"params\":{},\"price\":5,\"status\":1,\"unit\":\"件\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:51:21', 6),
       (297, '护理项目', 1, 'com.zzyl.nursing.controller.NursingProjectController.add()', 'POST', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"createBy\":\"1\",\"createTime\":\"2024-08-29 16:52:51\",\"id\":3,\"image\":\"https://itheim.oss-cn-beijing.aliyuncs.com/e611fcc9-dc45-49ac-abeb-f2ea99c2cffc.png\",\"name\":\"整理床铺\",\"nursingRequirement\":\"无\",\"orderNo\":1,\"params\":{},\"price\":15,\"status\":1,\"unit\":\"次\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:51:46', 8),
       (298, '护理项目', 1, 'com.zzyl.nursing.controller.NursingProjectController.add()', 'POST', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"createBy\":\"1\",\"createTime\":\"2024-08-29 16:53:29\",\"id\":4,\"image\":\"https://itheim.oss-cn-beijing.aliyuncs.com/d91ba642-88e5-4c3d-8e50-a681ae3300e5.png\",\"name\":\"助餐\",\"nursingRequirement\":\"无\",\"orderNo\":1,\"params\":{},\"price\":15,\"status\":1,\"unit\":\"餐\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:52:24', 6),
       (299, '护理项目', 1, 'com.zzyl.nursing.controller.NursingProjectController.add()', 'POST', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"createBy\":\"1\",\"createTime\":\"2024-08-29 16:53:51\",\"id\":5,\"image\":\"https://itheim.oss-cn-beijing.aliyuncs.com/125df948-7646-4fce-b322-1db0a84856e7.png\",\"name\":\"助浴\",\"nursingRequirement\":\"无\",\"orderNo\":1,\"params\":{},\"price\":40,\"status\":1,\"unit\":\"次\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:52:46', 11),
       (300, '护理项目', 1, 'com.zzyl.nursing.controller.NursingProjectController.add()', 'POST', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"createBy\":\"1\",\"createTime\":\"2024-08-29 16:54:21\",\"id\":6,\"image\":\"https://itheim.oss-cn-beijing.aliyuncs.com/a38883fc-870b-40ff-a256-54ce2fc17af9.png\",\"name\":\"洗头\",\"nursingRequirement\":\"无\",\"orderNo\":1,\"params\":{},\"price\":20,\"status\":1,\"unit\":\"次\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:53:17', 6),
       (301, '护理项目', 1, 'com.zzyl.nursing.controller.NursingProjectController.add()', 'POST', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"createBy\":\"1\",\"createTime\":\"2024-08-29 16:54:45\",\"id\":7,\"image\":\"https://itheim.oss-cn-beijing.aliyuncs.com/95b0ad37-5d61-4ec2-a961-d6fb691a18f0.png\",\"name\":\"洗脸\",\"nursingRequirement\":\"无\",\"orderNo\":1,\"params\":{},\"price\":15,\"status\":1,\"unit\":\"次\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:53:40', 6),
       (302, '护理项目', 1, 'com.zzyl.nursing.controller.NursingProjectController.add()', 'POST', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"createBy\":\"1\",\"createTime\":\"2024-08-29 16:55:08\",\"id\":8,\"image\":\"https://itheim.oss-cn-beijing.aliyuncs.com/8437eb2d-3ea5-4eee-9d78-017bc8b3a66e.png\",\"name\":\"洗脚\",\"nursingRequirement\":\"无\",\"orderNo\":1,\"params\":{},\"price\":20,\"status\":1,\"unit\":\"次\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:54:03', 7),
       (303, '护理项目', 1, 'com.zzyl.nursing.controller.NursingProjectController.add()', 'POST', 1, 'admin',
        '研发部门', '/serve/project', '127.0.0.1', '内网IP',
        '{\"createBy\":\"1\",\"createTime\":\"2024-08-29 16:55:36\",\"id\":9,\"image\":\"https://itheim.oss-cn-beijing.aliyuncs.com/dc004cc2-688c-4d22-8fbc-8e923219a2bd.png\",\"name\":\"心理咨询\",\"nursingRequirement\":\"无\",\"orderNo\":1,\"params\":{},\"price\":80,\"status\":1,\"unit\":\"小时\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:54:32', 6),
       (304, '护理计划', 2, 'com.zzyl.nursing.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP', '{\"id\":134,\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        '', '2024-08-29 08:54:51', 72),
       (305, '护理计划', 1, 'com.zzyl.nursing.controller.NursingPlanController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/plan', '127.0.0.1', '内网IP',
        '{\"planName\":\"3号护理计划\",\"projectPlans\":[{\"executeCycle\":2,\"executeFrequency\":1,\"executeTime\":\"16:55:58\",\"params\":{},\"projectId\":1},{\"executeCycle\":0,\"executeFrequency\":1,\"executeTime\":\"16:56:09\",\"params\":{},\"projectId\":5},{\"executeCycle\":0,\"executeFrequency\":1,\"executeTime\":\"08:00:00\",\"params\":{},\"projectId\":4}],\"sortNo\":1,\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:55:34', 22),
       (306, '护理等级', 2, 'com.zzyl.nursing.controller.NursingLevelController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-20 11:18:21\",\"description\":\"1223\",\"fee\":2000,\"id\":77,\"lplanId\":133,\"name\":\"1号护理计划\",\"params\":{},\"status\":1,\"updateBy\":\"1\",\"updateTime\":\"2024-08-29 16:57:05\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:56:00', 11),
       (307, '护理等级', 2, 'com.zzyl.nursing.controller.NursingLevelController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2024-08-14 16:33:16\",\"description\":\"1223\",\"fee\":1500,\"id\":76,\"lplanId\":134,\"name\":\"2号护理等级\",\"params\":{},\"status\":1,\"updateBy\":\"1\",\"updateTime\":\"2024-08-29 16:57:23\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:56:18', 7),
       (308, '护理等级', 1, 'com.zzyl.nursing.controller.NursingLevelController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/level', '127.0.0.1', '内网IP',
        '{\"createBy\":\"1\",\"createTime\":\"2024-08-29 16:57:59\",\"description\":\"无\",\"fee\":3000,\"id\":78,\"lplanId\":135,\"name\":\"3号护理等级\",\"params\":{},\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-29 08:56:55', 9),
       (309, '代码生成', 3, 'com.zzyl.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/8,9,14,15', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '',
        '2024-08-30 06:29:55', 38),
       (310, '代码生成', 6, 'com.zzyl.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"health_assessment\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-30 06:38:33', 286),
       (311, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"healthAssessment\",\"className\":\"HealthAssessment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":226,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-30 06:38:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ElderName\",\"columnComment\":\"老人姓名\",\"columnId\":227,\"columnName\":\"elder_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-30 06:38:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"elderName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"IdCard\",\"columnComment\":\"身份证号\",\"columnId\":228,\"columnName\":\"id_card\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-30 06:38:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"idCard\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BirthDate\",\"columnComment\":\"出生日期\",\"columnId\":229,\"columnName\":\"birth_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-08-30 06:38:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-30 06:40:25', 156),
       (312, '代码生成', 8, 'com.zzyl.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门',
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"health_assessment\"}', '', 0, '',
        '2024-08-30 06:40:42', 149),
       (313, '健康评估', 1, 'com.zzyl.nursing.controller.HealthAssessmentController.add()', 'POST', 1, 'admin',
        '研发部门', '/nursing/healthAssessment', '127.0.0.1', '内网IP',
        '{\"elderName\":\"李爱过\",\"idCard\":\"130123196712131234\",\"physicalExamInstitution\":\"黑马程序员\",\"physicalReportUrl\":\"https://itheim.oss-cn-beijing.aliyuncs.com/dc6314d8-0b68-414b-8825-053794004f39.pdf\"}',
        '{\"msg\":\"操作成功\",\"code\":200,\"data\":5}', 0, '', '2024-08-30 07:14:57', 85205),
       (314, '健康评估', 1, 'com.zzyl.nursing.controller.HealthAssessmentController.add()', 'POST', 1, 'admin',
        '研发部门', '/nursing/healthAssessment', '127.0.0.1', '内网IP',
        '{\"elderName\":\"李天龙\",\"idCard\":\"123123194912191235\",\"physicalExamInstitution\":\"黑马\",\"physicalReportUrl\":\"https://itheim.oss-cn-beijing.aliyuncs.com/e6f72807-b17f-4f9b-98c3-71f21a7809fe.pdf\"}',
        '', 1, 'Request failed: Model ERNIE-4.0-8K-Latest is not supported for chat', '2024-08-30 08:09:45', 96),
       (315, '健康评估', 1, 'com.zzyl.nursing.controller.HealthAssessmentController.add()', 'POST', 1, 'admin',
        '研发部门', '/nursing/healthAssessment', '127.0.0.1', '内网IP',
        '{\"elderName\":\"张芳\",\"idCard\":\"123123194908011235\",\"physicalExamInstitution\":\"黑马\",\"physicalReportUrl\":\"https://itheim.oss-cn-beijing.aliyuncs.com/83aac1e0-e375-4ea0-a7fa-e6ad54c89f67.pdf\"}',
        '', 1, 'Text \'2023.10.10\' could not be parsed at index 4', '2024-08-30 08:19:50', 119210),
       (316, '健康评估', 1, 'com.zzyl.nursing.controller.HealthAssessmentController.add()', 'POST', 1, 'admin',
        '研发部门', '/nursing/healthAssessment', '127.0.0.1', '内网IP',
        '{\"elderName\":\"张芳\",\"idCard\":\"123192194912151235\",\"physicalExamInstitution\":\"黑马\",\"physicalReportUrl\":\"https://itheim.oss-cn-beijing.aliyuncs.com/0e5b16c3-8ee0-4adb-b0a6-9cc83863ed3a.pdf\"}',
        '', 1, 'Text \'2023.10.10\' could not be parsed at index 4', '2024-08-30 08:28:44', 114957),
       (317, '健康评估', 1, 'com.zzyl.nursing.controller.HealthAssessmentController.add()', 'POST', 1, 'admin',
        '研发部门', '/nursing/healthAssessment', '127.0.0.1', '内网IP',
        '{\"elderName\":\"张芳\",\"idCard\":\"112123194904081235\",\"physicalExamInstitution\":\"黑马\",\"physicalReportUrl\":\"https://itheim.oss-cn-beijing.aliyuncs.com/3ba497a8-01dc-4e37-80aa-1f0015d2f045.pdf\"}',
        '{\"msg\":\"操作成功\",\"code\":200,\"data\":6}', 0, '', '2024-08-30 08:58:18', 124963),
       (318, '健康评估', 1, 'com.zzyl.nursing.controller.HealthAssessmentController.add()', 'POST', 1, 'admin',
        '研发部门', '/nursing/healthAssessment', '127.0.0.1', '内网IP',
        '{\"elderName\":\"李天龙\",\"idCard\":\"132123195212190912\",\"physicalExamInstitution\":\"黑马\",\"physicalReportUrl\":\"https://itheim.oss-cn-beijing.aliyuncs.com/29e42721-91f4-4df9-bc7d-d10e7b2f8a95.pdf\"}',
        '', 1,
        'Request failed with api error: {\"error_code\":17,\"error_msg\":\"Open api daily request limit reached\"}',
        '2024-08-30 09:09:47', 326),
       (319, '字典类型', 1, 'com.zzyl.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"健康评估-入住状态\",\"dictType\":\"admission_status\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-31 03:19:57', 24),
       (320, '字典数据', 1, 'com.zzyl.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已入住\",\"dictSort\":0,\"dictType\":\"admission_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-31 03:20:26', 13),
       (321, '字典数据', 1, 'com.zzyl.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未入住\",\"dictSort\":0,\"dictType\":\"admission_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-08-31 03:20:35', 10),
       (322, '健康评估', 1, 'com.zzyl.nursing.controller.HealthAssessmentController.add()', 'POST', 1, 'admin',
        '研发部门', '/nursing/healthAssessment', '127.0.0.1', '内网IP',
        '{\"elderName\":\"张三\",\"idCard\":\"130123196712131239\",\"physicalExamInstitution\":\"黑马体检\",\"physicalReportUrl\":\"https://itheim.oss-cn-beijing.aliyuncs.com/c4564cc2-ece8-4337-9c3b-95f76eda3ba4.pdf\"}',
        '', 1,
        'Request failed with api error: {\"error_code\":17,\"error_msg\":\"Open api daily request limit reached\"}',
        '2024-08-31 03:44:12', 322),
       (323, '健康评估', 1, 'com.zzyl.nursing.controller.HealthAssessmentController.add()', 'POST', 1, 'admin',
        '研发部门', '/nursing/healthAssessment', '127.0.0.1', '内网IP',
        '{\"elderName\":\"张三\",\"idCard\":\"130123196712131234\",\"physicalExamInstitution\":\"黑马体检\",\"physicalReportUrl\":\"https://itheim.oss-cn-beijing.aliyuncs.com/142b3c36-6b30-4286-beeb-1d77f53ed306.pdf\"}',
        '{\"msg\":\"操作成功\",\"code\":200,\"data\":7}', 0, '', '2024-08-31 03:48:56', 114376),
       (324, '健康评估', 1, 'com.zzyl.nursing.controller.HealthAssessmentController.add()', 'POST', 1, 'admin',
        '研发部门', '/nursing/healthAssessment', '127.0.0.1', '内网IP',
        '{\"elderName\":\"罗架构\",\"idCard\":\"132123196012161267\",\"physicalExamInstitution\":\"黑马体检\",\"physicalReportUrl\":\"https://itheim.oss-cn-beijing.aliyuncs.com/1fabebdf-7358-4ac6-8c55-e621b6a410a6.pdf\"}',
        '{\"msg\":\"操作成功\",\"code\":200,\"data\":8}', 0, '', '2024-09-01 03:20:49', 85938),
       (325, '健康评估', 1, 'com.zzyl.nursing.controller.HealthAssessmentController.add()', 'POST', 1, 'admin',
        '研发部门', '/nursing/healthAssessment', '127.0.0.1', '内网IP',
        '{\"elderName\":\"李天龙\",\"idCard\":\"132123196006121234\",\"physicalExamInstitution\":\"黑马体检\",\"physicalReportUrl\":\"https://itheim.oss-cn-beijing.aliyuncs.com/7b6df8e2-95ce-4df8-b60f-97e1272f6045.pdf\"}',
        '{\"msg\":\"操作成功\",\"code\":200,\"data\":9}', 0, '', '2024-09-01 11:47:51', 90471),
       (326, '代码生成', 6, 'com.zzyl.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"family_member\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-09-02 11:38:49', 111),
       (327, '代码生成', 2, 'com.zzyl.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"member\",\"className\":\"FamilyMember\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":251,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-02 11:38:49\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"手机号\",\"columnId\":252,\"columnName\":\"phone\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-02 11:38:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"phone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":253,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-02 11:38:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Avatar\",\"columnComment\":\"头像\",\"columnId\":254,\"columnName\":\"avatar\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-02 11:38:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"avatar\",\"javaTyp',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, '', '2024-09-02 11:39:28', 81),
       (328, '代码生成', 8, 'com.zzyl.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门',
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"family_member\"}', '', 0, '',
        '2024-09-02 11:39:37', 238),
       (329, '设备', 2, 'com.zzyl.nursing.controller.DeviceController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/device', '172.16.43.100', '内网IP',
        '{\"bindingLocation\":\"6\",\"deviceDescription\":\"1,4,6\",\"deviceName\":\"xinzengshebei00\",\"id\":202,\"iotId\":\"GDgIaMVb0qzhg2mc9ufTj0rk00\",\"locationType\":1,\"nickname\":\"新增设备001\",\"params\":{},\"physicalLocationType\":2,\"productKey\":\"j0rk0xgSbjY\",\"remark\":\"1楼,104,104-2\",\"updateBy\":\"1\",\"updateTime\":\"2024-09-12 19:00:39\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-12 19:00:39', 257),
       (330, '报警规则', 1, 'com.zzyl.nursing.controller.AlertRuleController.add()', 'POST', 1, 'admin', '研发部门',
        '/nursing/alertRule', '172.16.43.100', '内网IP',
        '{\"alertDataType\":0,\"alertEffectivePeriod\":\"00:00:00~23:59:59\",\"alertRuleName\":\"水电费第三方\",\"alertSilentPeriod\":5,\"createBy\":\"1\",\"createTime\":\"2024-09-12 19:05:16\",\"deviceName\":\"watch_08\",\"duration\":1,\"functionId\":\"BatteryPercentage\",\"functionName\":\"用电量\",\"id\":52,\"iotId\":\"TGI9pd72wDbEMvAElvYWj0rk00\",\"moduleId\":\"-1\",\"moduleName\":\"默认模块\",\"operator\":\">=\",\"params\":{},\"productKey\":\"j0rk0xgSbjY\",\"productName\":\"健康定位报警手表\",\"remark\":\"5\",\"status\":1,\"value\":60.0}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-12 19:05:16', 11),
       (331, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/41', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:05:59', 7),
       (332, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/40', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:01', 3),
       (333, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/39', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:04', 4),
       (334, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/38', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:06', 3),
       (335, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/36', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:08', 4),
       (336, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/35', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:10', 4),
       (337, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/34', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:13', 3),
       (338, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/33', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:15', 3),
       (339, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/32', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:18', 4),
       (340, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/31', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:20', 4),
       (341, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/29', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:22', 4),
       (342, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/30', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:24', 4),
       (343, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/27', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:26', 3),
       (344, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/42', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:28', 7),
       (345, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/43', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:30', 3),
       (346, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/44', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:39', 3),
       (347, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/45', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:42', 3),
       (348, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/47', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:44', 3),
       (349, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/48', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:46', 3),
       (350, '报警规则', 3, 'com.zzyl.nursing.controller.AlertRuleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/nursing/alertRule/49', '172.16.43.100', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-09-12 19:06:48', 3),
       (351, '设备', 2, 'com.zzyl.nursing.controller.DeviceController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/device', '172.16.43.100', '内网IP',
        '{\"bindingLocation\":\"1\",\"deviceDescription\":\"1,1,1\",\"deviceName\":\"xzsb001\",\"id\":203,\"iotId\":\"lN27S46N5PArvueMvht1j0rk00\",\"locationType\":1,\"nickname\":\"新增设备001\",\"params\":{},\"physicalLocationType\":2,\"productKey\":\"j0rk0xgSbjY\",\"remark\":\"1楼,101,101-1\",\"updateBy\":\"1\",\"updateTime\":\"2024-09-12 19:15:36\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-12 19:15:37', 182),
       (352, '设备', 2, 'com.zzyl.nursing.controller.DeviceController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/device', '172.16.43.100', '内网IP',
        '{\"bindingLocation\":\"328\",\"deviceName\":\"xzsb001\",\"id\":203,\"iotId\":\"lN27S46N5PArvueMvht1j0rk00\",\"locationType\":0,\"nickname\":\"新增设备001\",\"params\":{},\"physicalLocationType\":-1,\"productKey\":\"j0rk0xgSbjY\",\"remark\":\"老李头儿\",\"updateBy\":\"1\",\"updateTime\":\"2024-09-12 19:16:14\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-12 19:16:14', 289),
       (353, '设备', 2, 'com.zzyl.nursing.controller.DeviceController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/nursing/device', '172.16.43.100', '内网IP',
        '{\"bindingLocation\":\"328\",\"deviceName\":\"xzsb001\",\"id\":203,\"iotId\":\"lN27S46N5PArvueMvht1j0rk00\",\"locationType\":0,\"nickname\":\"新增设备002\",\"params\":{},\"physicalLocationType\":-1,\"productKey\":\"j0rk0xgSbjY\",\"remark\":\"老李头儿\",\"updateBy\":\"1\",\"updateTime\":\"2024-09-12 19:16:35\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-12 19:16:35', 367),
       (354, '菜单管理', 3, 'com.zzyl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/2034', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2024-09-12 14:41:12', 17),
       (355, '菜单管理', 3, 'com.zzyl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/2033', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2024-09-12 14:41:14', 12),
       (356, '菜单管理', 3, 'com.zzyl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/2032', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2024-09-12 14:41:17', 14),
       (357, '菜单管理', 3, 'com.zzyl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/2031', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2024-09-12 14:41:20', 12),
       (358, '菜单管理', 3, 'com.zzyl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/2030', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2024-09-12 14:41:23', 11),
       (359, '菜单管理', 3, 'com.zzyl.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/2029', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2024-09-12 14:41:28', 12),
       (360, '房型', 1, 'com.zzyl.nursing.controller.RoomTypeController.add()', 'POST', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"bedCount\":10,\"createBy\":\"1\",\"createTime\":\"2024-09-12 22:52:35\",\"id\":116,\"name\":\"标准双人间\",\"params\":{},\"photo\":\"https://itheim.oss-cn-beijing.aliyuncs.com/91c4a814-efd5-4093-a5ac-963b41047019.png\",\"price\":1500,\"remark\":\"123\",\"status\":0}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-12 14:52:35', 34),
       (361, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"id\":116,\"params\":{},\"status\":1,\"updateBy\":\"1\",\"updateTime\":\"2024-09-12 22:55:10\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-12 14:55:10', 18),
       (362, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"serve/nursingLevel/index\",\"createTime\":\"2024-08-14 08:29:05\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"护理等级\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"nursingLevel\",\"perms\":\"serve:level:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:45:44', 50),
       (363, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"serve/level/index\",\"createTime\":\"2024-08-14 08:29:05\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"护理等级\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"nursingLevel\",\"perms\":\"serve:level:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:46:33', 20),
       (364, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-08-14 08:29:05\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"护理等级查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"serve:level:query\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:47:20', 13),
       (365, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-08-14 08:29:05\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"护理等级新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"serve:level:add\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:47:27', 18),
       (366, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-08-14 08:29:05\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"护理等级修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"serve:level:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:47:32', 15),
       (367, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-08-14 08:29:05\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"护理等级删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"serve:level:remove\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:47:37', 16),
       (368, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-08-14 08:29:05\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"护理等级导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"serve:level:export\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:47:42', 13),
       (369, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"serve/plan/index\",\"createTime\":\"2024-08-14 08:29:10\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"护理计划\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"plan\",\"perms\":\"serve:plan:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:48:07', 12),
       (370, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"serve/arrange/details\",\"createTime\":\"2024-08-29 06:53:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"任务安排详情\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"arrangeDetails\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:48:50', 15),
       (371, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"serve/oldPeople/index\",\"createTime\":\"2024-08-29 06:52:12\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"负责老人\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"oldPeople\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:48:56', 14),
       (372, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"serve/arrange/index\",\"createTime\":\"2024-08-29 06:53:06\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"任务安排\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"arrange\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:49:01', 21),
       (373, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"serve/level/index\",\"createTime\":\"2024-08-14 08:29:05\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"护理等级\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"level\",\"perms\":\"serve:level:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:49:43', 14),
       (374, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"serve/plan/index\",\"createTime\":\"2024-08-14 08:29:10\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"护理计划\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"plan\",\"perms\":\"serve:plan:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:49:50', 19),
       (375, '菜单管理', 2, 'com.zzyl.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"serve/level/index\",\"createTime\":\"2024-08-14 08:29:05\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"护理等级\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"level\",\"perms\":\"serve:level:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 10:49:54', 12),
       (376, '护理计划', 2, 'com.zzyl.serve.controller.NursingPlanController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/serve/plan', '127.0.0.1', '内网IP',
        '{\"id\":134,\"planName\":\"2号护理计划\",\"projectPlans\":[{\"createBy\":\"1\",\"createTime\":\"2024-10-03 22:50:56\",\"executeCycle\":0,\"executeFrequency\":1,\"executeTime\":\"19:28:45\",\"id\":1738,\"params\":{},\"planId\":134,\"projectId\":1}],\"sortNo\":1,\"status\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 14:50:59', 157),
       (377, '房间', 1, 'com.zzyl.nursing.controller.RoomController.add()', 'POST', 1, 'admin', '研发部门',
        '/elder/room', '127.0.0.1', '内网IP',
        '{\"code\":\"110\",\"createBy\":\"1\",\"createTime\":\"2024-10-03 23:39:54\",\"floorId\":1,\"id\":88,\"params\":{},\"sort\":1,\"typeName\":\"豪华单人间\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 15:39:57', 54),
       (378, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"bedCount\":0,\"createBy\":\"1671403256519078153\",\"createTime\":\"2023-09-26 15:57:50\",\"id\":1,\"introduction\":\"宽敞舒适的套房，配备独立卫生间和基本生活设施，满足独自居住的需求，提供私密性和舒适度\",\"name\":\"单人套房\",\"params\":{},\"photo\":\"https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/e2f1031b-e23e-4379-95d4-ce8fe382f58f.png\",\"price\":4001,\"status\":1,\"updateBy\":\"1\",\"updateTime\":\"2024-10-03 23:54:29\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 15:54:32', 40),
       (379, '房型', 2, 'com.zzyl.nursing.controller.RoomTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/elder/roomType', '127.0.0.1', '内网IP',
        '{\"bedCount\":0,\"createBy\":\"1671403256519078153\",\"createTime\":\"2023-09-26 15:57:50\",\"id\":1,\"introduction\":\"宽敞舒适的套房，配备独立卫生间和基本生活设施，满足独自居住的需求，提供私密性和舒适度\",\"name\":\"单人套房\",\"params\":{},\"photo\":\"https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/e2f1031b-e23e-4379-95d4-ce8fe382f58f.png\",\"price\":4000,\"status\":1,\"updateBy\":\"1\",\"updateTime\":\"2024-10-03 23:54:33\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 15:54:37', 12),
       (380, '床位', 1, 'com.zzyl.nursing.controller.BedController.add()', 'POST', 1, 'admin', '研发部门', '/elder/bed',
        '127.0.0.1', '内网IP',
        '{\"bedNumber\":\"111\",\"createBy\":\"1\",\"createTime\":\"2024-10-03 23:54:46\",\"id\":2,\"params\":{},\"roomId\":1,\"sort\":1}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'bed.PRIMARY\'\r\n### The error may exist in com/zzyl/nursing/mapper/BedMapper.java (best guess)\r\n### The error may involve com.zzyl.nursing.mapper.BedMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bed  ( id, bed_number,  sort, room_id, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?,  ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'bed.PRIMARY\'\n; Duplicate entry \'2\' for key \'bed.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'bed.PRIMARY\'',
        '2024-10-03 15:54:50', 168),
       (381, '床位', 1, 'com.zzyl.nursing.controller.BedController.add()', 'POST', 1, 'admin', '研发部门', '/elder/bed',
        '127.0.0.1', '内网IP',
        '{\"bedNumber\":\"111\",\"createBy\":\"1\",\"createTime\":\"2024-10-03 23:54:53\",\"id\":2,\"params\":{},\"roomId\":1,\"sort\":1}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'bed.PRIMARY\'\r\n### The error may exist in com/zzyl/nursing/mapper/BedMapper.java (best guess)\r\n### The error may involve com.zzyl.nursing.mapper.BedMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bed  ( id, bed_number,  sort, room_id, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?,  ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'bed.PRIMARY\'\n; Duplicate entry \'2\' for key \'bed.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'bed.PRIMARY\'',
        '2024-10-03 15:54:56', 6),
       (382, '床位', 1, 'com.zzyl.nursing.controller.BedController.add()', 'POST', 1, 'admin', '研发部门', '/elder/bed',
        '127.0.0.1', '内网IP',
        '{\"bedNumber\":\"11111\",\"createBy\":\"1\",\"createTime\":\"2024-10-03 23:55:04\",\"id\":2,\"params\":{},\"roomId\":1,\"sort\":1}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'bed.PRIMARY\'\r\n### The error may exist in com/zzyl/nursing/mapper/BedMapper.java (best guess)\r\n### The error may involve com.zzyl.nursing.mapper.BedMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bed  ( id, bed_number,  sort, room_id, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?,  ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'bed.PRIMARY\'\n; Duplicate entry \'2\' for key \'bed.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'bed.PRIMARY\'',
        '2024-10-03 15:55:07', 5),
       (383, '床位', 1, 'com.zzyl.nursing.controller.BedController.add()', 'POST', 1, 'admin', '研发部门', '/elder/bed',
        '127.0.0.1', '内网IP',
        '{\"bedNumber\":\"11111\",\"createBy\":\"1\",\"createTime\":\"2024-10-03 23:55:07\",\"id\":2,\"params\":{},\"roomId\":1,\"sort\":2}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'bed.PRIMARY\'\r\n### The error may exist in com/zzyl/nursing/mapper/BedMapper.java (best guess)\r\n### The error may involve com.zzyl.nursing.mapper.BedMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bed  ( id, bed_number,  sort, room_id, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?,  ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'bed.PRIMARY\'\n; Duplicate entry \'2\' for key \'bed.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'bed.PRIMARY\'',
        '2024-10-03 15:55:10', 7),
       (384, '床位', 1, 'com.zzyl.nursing.controller.BedController.add()', 'POST', 1, 'admin', '研发部门', '/elder/bed',
        '127.0.0.1', '内网IP',
        '{\"bedNumber\":\"1111\",\"createBy\":\"1\",\"createTime\":\"2024-10-04 00:01:30\",\"params\":{},\"roomId\":1,\"sort\":1}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'bed.bed_number\'\r\n### The error may exist in com/zzyl/nursing/mapper/BedMapper.java (best guess)\r\n### The error may involve com.zzyl.nursing.mapper.BedMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bed  ( bed_number,  sort, room_id, create_by, create_time, update_by, update_time )  VALUES  ( ?,  ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'bed.bed_number\'\n; Duplicate entry \'1111\' for key \'bed.bed_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'bed.bed_number\'',
        '2024-10-03 16:01:33', 11),
       (385, '楼层', 1, 'com.zzyl.nursing.controller.FloorController.add()', 'POST', 1, 'admin', '研发部门',
        '/elder/floor', '127.0.0.1', '内网IP',
        '{\"code\":1,\"createBy\":\"1\",\"createTime\":\"2024-10-04 00:02:58\",\"id\":413,\"name\":\"13楼\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 16:03:01', 15),
       (386, '床位', 1, 'com.zzyl.nursing.controller.BedController.add()', 'POST', 1, 'admin', '研发部门', '/elder/bed',
        '127.0.0.1', '内网IP',
        '{\"bedNumber\":\"1201-1\",\"createBy\":\"1\",\"createTime\":\"2024-10-04 00:03:31\",\"id\":200,\"params\":{},\"roomId\":83,\"sort\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 16:03:34', 11),
       (387, '房间', 3, 'com.zzyl.nursing.controller.RoomController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/elder/room/88', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2024-10-03 16:12:20', 112),
       (388, '代码生成', 3, 'com.zzyl.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/16', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2024-10-06 14:46:26', 96),
       (389, '代码生成', 3, 'com.zzyl.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/17', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2024-10-06 14:46:28', 50);
/*!40000 ALTER TABLE `sys_oper_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post`
(
    `post_id`     bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
    `post_code`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
    `post_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
    `post_sort`   int                                                          NOT NULL COMMENT '显示顺序',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post`
    DISABLE KEYS */;
INSERT INTO `sys_post`
VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-08-14 02:48:23', '', NULL, ''),
       (2, 'se', '项目经理', 2, '0', 'admin', '2024-08-14 02:48:23', '', NULL, ''),
       (3, 'hr', '人力资源', 3, '0', 'admin', '2024-08-14 02:48:23', '', NULL, ''),
       (4, 'user', '普通员工', 4, '0', 'admin', '2024-08-14 02:48:23', '', NULL, '');
/*!40000 ALTER TABLE `sys_post`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role`
(
    `role_id`             bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `role_name`           varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '角色名称',
    `role_key`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
    `role_sort`           int                                                           NOT NULL COMMENT '显示顺序',
    `data_scope`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    `menu_check_strictly` tinyint(1)                                                    DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
    `dept_check_strictly` tinyint(1)                                                    DEFAULT '1' COMMENT '部门树选择项是否关联显示',
    `status`              char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NOT NULL COMMENT '角色状态（0正常 1停用）',
    `del_flag`            char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '创建者',
    `create_time`         datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '更新者',
    `update_time`         datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `remark`              varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role`
    DISABLE KEYS */;
INSERT INTO `sys_role`
VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-08-14 02:48:23', '', NULL, '超级管理员'),
       (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-08-14 02:48:23', '', NULL, '普通角色');
/*!40000 ALTER TABLE `sys_role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept`
(
    `role_id` bigint NOT NULL COMMENT '角色ID',
    `dept_id` bigint NOT NULL COMMENT '部门ID',
    PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept`
    DISABLE KEYS */;
INSERT INTO `sys_role_dept`
VALUES (2, 100),
       (2, 101),
       (2, 105);
/*!40000 ALTER TABLE `sys_role_dept`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu`
(
    `role_id` bigint NOT NULL COMMENT '角色ID',
    `menu_id` bigint NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu`
    DISABLE KEYS */;
INSERT INTO `sys_role_menu`
VALUES (2, 1),
       (2, 2),
       (2, 3),
       (2, 4),
       (2, 100),
       (2, 101),
       (2, 102),
       (2, 103),
       (2, 104),
       (2, 105),
       (2, 106),
       (2, 107),
       (2, 108),
       (2, 109),
       (2, 110),
       (2, 111),
       (2, 112),
       (2, 113),
       (2, 114),
       (2, 115),
       (2, 116),
       (2, 117),
       (2, 500),
       (2, 501),
       (2, 1000),
       (2, 1001),
       (2, 1002),
       (2, 1003),
       (2, 1004),
       (2, 1005),
       (2, 1006),
       (2, 1007),
       (2, 1008),
       (2, 1009),
       (2, 1010),
       (2, 1011),
       (2, 1012),
       (2, 1013),
       (2, 1014),
       (2, 1015),
       (2, 1016),
       (2, 1017),
       (2, 1018),
       (2, 1019),
       (2, 1020),
       (2, 1021),
       (2, 1022),
       (2, 1023),
       (2, 1024),
       (2, 1025),
       (2, 1026),
       (2, 1027),
       (2, 1028),
       (2, 1029),
       (2, 1030),
       (2, 1031),
       (2, 1032),
       (2, 1033),
       (2, 1034),
       (2, 1035),
       (2, 1036),
       (2, 1037),
       (2, 1038),
       (2, 1039),
       (2, 1040),
       (2, 1041),
       (2, 1042),
       (2, 1043),
       (2, 1044),
       (2, 1045),
       (2, 1046),
       (2, 1047),
       (2, 1048),
       (2, 1049),
       (2, 1050),
       (2, 1051),
       (2, 1052),
       (2, 1053),
       (2, 1054),
       (2, 1055),
       (2, 1056),
       (2, 1057),
       (2, 1058),
       (2, 1059),
       (2, 1060);
/*!40000 ALTER TABLE `sys_role_menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
create table sys_user
(
    user_id         bigint(20)  not null auto_increment comment '用户ID',
    dept_id         bigint(20)   default null comment '部门ID',
    user_name       varchar(30) not null comment '用户账号',
    nick_name       varchar(30) not null comment '用户昵称',
    user_type       varchar(2)   default '00' comment '用户类型（00系统用户）',
    email           varchar(50)  default '' comment '用户邮箱',
    phonenumber     varchar(11)  default '' comment '手机号码',
    sex             char(1)      default '0' comment '用户性别（0男 1女 2未知）',
    avatar          varchar(100) default '' comment '头像地址',
    password        varchar(100) default '' comment '密码',
    status          char(1)      default '0' comment '账号状态（0正常 1停用）',
    del_flag        char(1)      default '0' comment '删除标志（0代表存在 2代表删除）',
    login_ip        varchar(128) default '' comment '最后登录IP',
    login_date      datetime comment '最后登录时间',
    pwd_update_date datetime comment '密码最后更新时间',
    create_by       varchar(64)  default '' comment '创建者',
    create_time     datetime comment '创建时间',
    update_by       varchar(64)  default '' comment '更新者',
    update_time     datetime comment '更新时间',
    remark          varchar(500) default null comment '备注',
    primary key (user_id)
) engine = innodb
  auto_increment = 100 comment = '用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user`
    DISABLE KEYS */;
insert into sys_user
values (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', sysdate(), sysdate(),
        'admin', sysdate(), '', null, '管理员');
insert into sys_user
values (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', sysdate(), sysdate(),
        'admin', sysdate(), '', null, '测试员');
/*!40000 ALTER TABLE `sys_user`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post`
(
    `user_id` bigint NOT NULL COMMENT '用户ID',
    `post_id` bigint NOT NULL COMMENT '岗位ID',
    PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post`
    DISABLE KEYS */;
INSERT INTO `sys_user_post`
VALUES (1, 1),
       (2, 2);
/*!40000 ALTER TABLE `sys_user_post`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role`
(
    `user_id` bigint NOT NULL COMMENT '用户ID',
    `role_id` bigint NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role`
    DISABLE KEYS */;
INSERT INTO `sys_user_role`
VALUES (1, 1),
       (2, 2);
/*!40000 ALTER TABLE `sys_user_role`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2024-10-06 22:47:42
