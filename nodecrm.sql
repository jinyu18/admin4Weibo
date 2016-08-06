-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.5.49

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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `menuName` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `parentId` int(11) DEFAULT NULL COMMENT '父级菜单编号',
  `path` varchar(255) DEFAULT NULL COMMENT '页面路径',
  `level` varchar(255) DEFAULT NULL COMMENT '菜单顺序',
  `menuIcon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='菜单属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'首页',0,'#/','1','fa-home'),(2,'系统设置',0,'javascript:;','2','fa-cogs'),(3,'用户管理',2,'#/user','1','fa-user'),(4,'角色管理',2,'#/role','2','fa-group'),(5,'菜单管理',2,'#/menu','3','fa-list-alt'),(6,'系统日志',2,'#/log','4','fa-info'),(7,'微博登陆Log',1,'#/weiboLog','1','fa-weibo');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `roleName` varchar(255) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'超级管理员');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolegroup`
--

DROP TABLE IF EXISTS `rolegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolegroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleId` varchar(255) DEFAULT NULL COMMENT '角色编号',
  `menuId` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='角色菜单关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolegroup`
--

LOCK TABLES `rolegroup` WRITE;
/*!40000 ALTER TABLE `rolegroup` DISABLE KEYS */;
INSERT INTO `rolegroup` VALUES (7,'1','1'),(8,'1','2'),(9,'1','3'),(10,'1','4'),(11,'1','5'),(12,'1','6'),(13,'1','7');
/*!40000 ALTER TABLE `rolegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `userName` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'金钰','123456','jinyu@node.com'),(2,'田伟','123456','tianwei@node.com'),(3,'陈晨','123456','chenchen@node.com'),(4,'陈浩然','123456','chenhaoran@node.com'),(5,'felix','123456','admin@a.c');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleId` varchar(255) DEFAULT NULL COMMENT '角色编号',
  `userId` varchar(255) DEFAULT NULL COMMENT '用户编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户角色关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
INSERT INTO `usergroup` VALUES (1,'1','1'),(2,'1','5');
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weibolog`
--

DROP TABLE IF EXISTS `weibolog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weibolog` (
  `useragent` varchar(45) NOT NULL,
  `createtime` varchar(45) DEFAULT NULL,
  `weibologId` varchar(45) NOT NULL,
  PRIMARY KEY (`weibologId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weibolog`
--

LOCK TABLES `weibolog` WRITE;
/*!40000 ALTER TABLE `weibolog` DISABLE KEYS */;
INSERT INTO `weibolog` VALUES ('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_','Sat Aug 06 2016 23:59:56 GMT+0800 (CST)','1470499196118'),('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_','Sun Aug 07 2016 00:00:41 GMT+0800 (CST)','1470499241421'),('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_','Sun Aug 07 2016 00:04:22 GMT+0800 (CST)','1470499462735'),('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_','Sun Aug 07 2016 00:41:31 GMT+0800 (CST)','1470501691962'),('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_','Sun Aug 07 2016 00:41:38 GMT+0800 (CST)','1470501698128'),('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_','Sun Aug 07 2016 00:41:40 GMT+0800 (CST)','1470501700419'),('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_','Sun Aug 07 2016 00:41:50 GMT+0800 (CST)','1470501710486'),('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_','Sun Aug 07 2016 00:49:29 GMT+0800 (CST)','1470502169745'),('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_','Sun Aug 07 2016 00:49:36 GMT+0800 (CST)','1470502176351'),('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_','Sun Aug 07 2016 00:49:41 GMT+0800 (CST)','1470502181349'),('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_','Sat Aug 06 2016 23:40:29 GMT+0800 (CST)','2222');
/*!40000 ALTER TABLE `weibolog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-07  0:56:50
