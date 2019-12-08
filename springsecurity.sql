-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema springsecurity
--

CREATE DATABASE IF NOT EXISTS springsecurity;
USE springsecurity;

--
-- Definition of table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `sso_id` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sso_id` (`sso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_user`
--

/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` (`id`,`sso_id`,`password`,`first_name`,`last_name`,`email`) VALUES 
 (2,'bari','$2a$10$EavM9J3oLC69Mm7YDOEaiuwaUKDLEY4qXxjZnypzdPAvqvxIms/z6','A','Bari','tc.tcld@yahoo.com'),
 (3,'aaa','$2a$10$nibnekw36dURRlYtITrHduJ.ny3CjbK7u/nuGH22Z8eKC4zBh5UTW','Mr.','X','admin@codenx.com'),
 (4,'bbb','$2a$10$smitg.NyB/.K0xv/83bn5enLwcPLvBoZnyzlvYzKWB7v7yXc9qJ3u','Mr.','Z','tc.tcld@yahoo.com'),
 (5,'qqq','$2a$10$/Xdem6E3b7wygjgjKcLH..La6kWbg1YuADOUwJOIkEXFcFA.JpmFS','Mr.','Z','eng.abari@gmail.com'),
 (6,'1','$2a$10$6P2oacaj8tJZ8nbnZJ9vfObsNsSdx4NaurWiTUPxMoQyfadGtqsiS','A','B','test'),
 (7,'dba','$2a$10$OiXftAXrXfdUZFsa7jp8dOkbEi6K0HrD8kK0XH/dMfYzN5tGaVcWS','Mr.','DBA','test@test.com');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;


--
-- Definition of table `app_user_user_profile`
--

DROP TABLE IF EXISTS `app_user_user_profile`;
CREATE TABLE `app_user_user_profile` (
  `user_id` bigint(20) NOT NULL,
  `user_profile_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`user_id`,`user_profile_id`),
  KEY `FK_USER_PROFILE` (`user_profile_id`),
  CONSTRAINT `FK_APP_USER` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `FK_USER_PROFILE` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_user_user_profile`
--

/*!40000 ALTER TABLE `app_user_user_profile` DISABLE KEYS */;
INSERT INTO `app_user_user_profile` (`user_id`,`user_profile_id`) VALUES 
 (3,1),
 (4,1),
 (5,1),
 (6,1),
 (2,2),
 (4,3),
 (7,3);
/*!40000 ALTER TABLE `app_user_user_profile` ENABLE KEYS */;


--
-- Definition of table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persistent_logins`
--

/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;


--
-- Definition of table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL auto_increment,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profile`
--

/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` (`id`,`type`) VALUES 
 (2,'ADMIN'),
 (3,'DBA'),
 (1,'USER');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
