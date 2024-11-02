/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - xiangzhenlanqiudui
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xiangzhenlanqiudui` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xiangzhenlanqiudui`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/fd-ssmj/upload/1613705295135.jpg'),(2,'picture2','http://localhost:8080/fd-ssmj/upload/1613705301525.jpg'),(3,'picture3','http://localhost:8080/fd-ssmj/upload/1613799912302.JPG'),(4,'picture4','http://localhost:8080/fd-ssmj/upload/1613705325348.jpg'),(5,'picture5','http://localhost:8080/fd-ssmj/upload/1613705332544.jpg'),(6,'homepage','http://localhost:8080/fd-ssmj/upload/1613705342094.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint(4) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别',1,'男',NULL,'2021-02-25 11:41:54'),(2,'sex_types','性别',2,'女',NULL,'2021-02-25 11:41:54');

/*Table structure for table `liuyanxinxi` */

DROP TABLE IF EXISTS `liuyanxinxi`;

CREATE TABLE `liuyanxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `note` varchar(255) DEFAULT NULL COMMENT '留言信息',
  `yhnote` varchar(11) DEFAULT NULL COMMENT '留言人',
  `note_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '留言时间 Search',
  `reply` varchar(255) DEFAULT NULL COMMENT '回复',
  `glreply` varchar(11) DEFAULT NULL COMMENT '回复人',
  `reply_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '回复时间 Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `liuyanxinxi` */

insert  into `liuyanxinxi`(`id`,`note`,`yhnote`,`note_time`,`reply`,`glreply`,`reply_time`) values (4,'1231111','admin','2021-02-03 17:15:28','只有管理员可以回复','admin','2021-02-03 17:15:29'),(11,'123','球员1','2021-03-22 15:24:28',NULL,NULL,NULL);

/*Table structure for table `qiudui` */

DROP TABLE IF EXISTS `qiudui`;

CREATE TABLE `qiudui` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '球队名称 Search',
  `xz_types` int(11) DEFAULT NULL COMMENT '所属乡镇 Search',
  `img_photo` varchar(200) DEFAULT NULL COMMENT '球队队徽',
  `sum` int(11) DEFAULT '0' COMMENT '队员人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='球队信息';

/*Data for the table `qiudui` */

insert  into `qiudui`(`id`,`name`,`xz_types`,`img_photo`,`sum`) values (1,'菜狗队',1,'http://localhost:8080/xiangzhenlanqiudui/file/download?fileName=1616391508112.jpg',1),(2,'老王队',3,'http://localhost:8080/xiangzhenlanqiudui/file/download?fileName=1616391638096.jpg',1),(3,'奶狗队',2,'http://localhost:8080/xiangzhenlanqiudui/file/download?fileName=1616391668443.jpg',1);

/*Table structure for table `saicheng` */

DROP TABLE IF EXISTS `saicheng`;

CREATE TABLE `saicheng` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `qd1_types` int(11) DEFAULT NULL COMMENT '比赛队伍1',
  `qd2_types` int(11) DEFAULT NULL COMMENT '比赛队伍2',
  `kaishi_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `jieshu_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `jieguo_content` varchar(200) DEFAULT NULL COMMENT '比赛结果',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='赛程信息';

/*Data for the table `saicheng` */

insert  into `saicheng`(`id`,`qd1_types`,`qd2_types`,`kaishi_time`,`jieshu_time`,`jieguo_content`) values (3,1,2,'2021-03-22 09:00:00','2021-03-22 11:00:00','菜狗队胜 此处省略一万字的详情信息········\r\n');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (5,1,'admin','users','管理员','5xztoafoizln8sg3apkj2ytxytp8ceqo','2021-03-04 11:02:31','2021-03-22 16:11:57'),(6,1,'111','users','用户','6bg8iocj41dl38dltedxddj1uyvqujpm','2021-03-15 13:40:48','2021-03-15 16:20:15'),(7,4,'333','users','用户','oqdebtejtrkcuilcb6p1z5obzljzrq3q','2021-03-15 15:33:25','2021-03-15 16:43:25'),(8,5,'球员1','users','球员','r4iccl02scflzz55lrax30oxup80x1s4','2021-03-22 14:50:34','2021-03-22 16:20:10');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) NOT NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-03-01 00:00:00');

/*Table structure for table `xiangzhen` */

DROP TABLE IF EXISTS `xiangzhen`;

CREATE TABLE `xiangzhen` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '乡镇名称 Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='乡镇信息';

/*Data for the table `xiangzhen` */

insert  into `xiangzhen`(`id`,`name`) values (1,'乡镇1'),(2,'乡镇2'),(3,'乡镇3');

/*Table structure for table `xitonggonggao` */

DROP TABLE IF EXISTS `xitonggonggao`;

CREATE TABLE `xitonggonggao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题 Search',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `neirong` longtext COMMENT '内容',
  `riqi` datetime DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统公告';

/*Data for the table `xitonggonggao` */

insert  into `xitonggonggao`(`id`,`addtime`,`biaoti`,`leixing`,`neirong`,`riqi`) values (4,'2021-03-22 14:38:18','标题1','类型1','内容1','2021-03-22 14:38:18'),(5,'2021-03-22 14:38:18','标题2','类型2','内容2','2021-03-22 14:38:18'),(6,'2021-03-22 14:38:18','标题3','类型3','内容3','2021-03-22 14:38:18');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '名称 Search',
  `username` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `jiguan` varchar(200) DEFAULT NULL COMMENT '籍贯',
  `age` int(4) DEFAULT NULL COMMENT '年龄',
  `height` int(4) DEFAULT NULL COMMENT '身高体重',
  `averaged` int(4) DEFAULT NULL COMMENT '场均得分',
  `backboard` int(4) DEFAULT NULL COMMENT '场均篮板数',
  `assists` int(4) DEFAULT NULL COMMENT '场均助攻数',
  `sex_types` tinyint(4) DEFAULT NULL COMMENT '性别 Search',
  `qd_types` tinyint(4) DEFAULT NULL COMMENT '所属球队 Search',
  `phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  `role` varchar(255) DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='球员信息';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`name`,`username`,`password`,`img_photo`,`jiguan`,`age`,`height`,`averaged`,`backboard`,`assists`,`sex_types`,`qd_types`,`phone`,`role`) values (5,'球员1','111','111','http://localhost:8080/xiangzhenlanqiudui/file/download?fileName=1616394713808.jpg','籍贯1',11,11,11,11,11,1,1,'111111111','球员'),(6,'球员2','222','123456','http://localhost:8080/xiangzhenlanqiudui/file/download?fileName=1616397006326.jpg','籍贯2',22,22,22,22,22,2,2,'22222222','球员'),(7,'球员3','333','123456','http://localhost:8080/xiangzhenlanqiudui/file/download?fileName=1616397182606.jpg','籍贯3',33,33,33,33,33,1,3,'3333333','球员');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
