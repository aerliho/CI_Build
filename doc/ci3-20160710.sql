/*
SQLyog Enterprise v12.09 (32 bit)
MySQL - 5.5.38 : Database - bycms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bycms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bycms`;

/*Table structure for table `by_admin` */

DROP TABLE IF EXISTS `by_admin`;

CREATE TABLE `by_admin` (
  `admin_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(45) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机',
  `email` char(32) NOT NULL DEFAULT '' COMMENT '邮箱',
  `province_id` int(10) unsigned NOT NULL DEFAULT '0',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录ip',
  `lasttime` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '管理员类型,100超级管理员',
  `salt` char(6) NOT NULL DEFAULT '' COMMENT '盐',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1开放',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `by_admin` */

insert  into `by_admin`(`admin_id`,`username`,`password`,`mobile`,`email`,`province_id`,`city_id`,`lastip`,`lasttime`,`type`,`salt`,`status`) values (2,'admin','a652a611c0c2da8558a06596ec3f371d','111','atfeng2011@qq.com',0,0,0,0,100,'904692',1);

/*Table structure for table `by_article` */

DROP TABLE IF EXISTS `by_article`;

CREATE TABLE `by_article` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `catid` smallint(6) NOT NULL DEFAULT '0' COMMENT '所属栏目',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `thumb` varchar(200) NOT NULL DEFAULT '' COMMENT '文章缩略图',
  `description` mediumtext NOT NULL COMMENT '文章简介(纯文本)',
  `content` text NOT NULL COMMENT '文章详情',
  `author` varchar(100) NOT NULL DEFAULT '' COMMENT '作者',
  `from` varchar(100) NOT NULL DEFAULT '' COMMENT '来源',
  `posid` mediumtext NOT NULL COMMENT '推荐id号',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态，0待审核，1正常，-1禁用',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶，1置顶，0不置顶',
  `displayorder` int(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `modified` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `dateline` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='文章表';

/*Data for the table `by_article` */

insert  into `by_article`(`id`,`catid`,`title`,`thumb`,`description`,`content`,`author`,`from`,`posid`,`status`,`is_recommend`,`displayorder`,`modified`,`dateline`) values (1,2,'我的第一篇文章','','文章简介','<b>我的文章</b>','小小酥','中国大侠','',1,1,0,0,0),(3,1,'伊利丹·黑神','','简单介绍内容','<p>我的信息要填写，把信息尽可能的多保留<br/></p>','风味英雄','http://blog.dota2.com','[\"1\"]',0,0,0,1456716910,1456716910),(5,2,'北狂神雕侠杨过精彩图集1','','条件语句一般来说是不可避免的，有的时候，我们要判断很多条件就会写很多if-elseif语句，嵌套的话，就更加麻烦了。如果有一天增加了新需求，我们就要去增加一个if分支语句，这样不仅修改起来麻烦，而且容易出错。《代码大全》提出的表驱动法可以有效地解决if语句带来的问题。我们来看下面这个例子：','<p>条件语句一般来说是不可避免的，有的时候，我们要判断很多条件就会写很多if-elseif语句，嵌套的话，就更加麻烦了。如果有一天增加了新需求，我们就要去增加一个if分支语句，这样不仅修改起来麻烦，而且容易出错。《代码大全》提出的表驱动法可以有效地解决if语句带来的问题。我们来看下面这个例子：</p>','风味英雄','http://blog.dota2.com','null',1,0,0,1457420699,1456717221),(10,5,'书剑恩仇录','','江湖瓢把子陈家洛，伙同十三位当家的救助四当家文泰来，并劝说乾隆恢复大明江山，斗智斗勇故事','<p>江湖瓢把子陈家洛，伙同十三位当家的救助四当家文泰来，并劝说乾隆恢复大明江山，斗智斗勇故事<br/></p>','金庸','台湾武侠小说','[\"1\"]',1,0,0,1457423604,1457423246),(6,2,'北狂神雕侠杨过精彩图集','','共同热乎乎业行业，旺，汪汪','<p>共同热乎乎业行业，旺，汪汪<br/></p>','2','http://blog.dota2.com','null',1,0,0,1457420492,1456718235),(7,6,'美人鱼夺冠精彩回放','','韩国人巍峨和融合','<p>韩国人巍峨和融合<br/></p>','黄易','http://blog.dota2.com','[\"2\"]',1,1,0,1457420448,1456718292),(9,6,'寻秦记','','项少龙，官封太子太傅，博学多才','<p>项少龙，官封太子太傅，博学多才<br/></p>','黄易','台湾武侠小说','[\"1\"]',1,0,0,1457422940,1457417734),(8,2,'东邪黄药师多才多艺美貌俊朗武学大师','','写点什么，有些代码必须要过滤掉','<p>写点什么，有些代码必须要过滤掉<br/></p>','金庸','http://blog.dota2.com','[\"1\"]',1,1,0,1457420072,1456718569),(12,5,'射雕英雄传','','憨直傻的郭靖和伶俐能的黄蓉及身边的故事','<p>憨直傻的郭靖和伶俐能的黄蓉及身边的故事<br/></p>','金庸','射雕三部曲','[\"1\"]',0,0,0,1457424341,1457424341);

/*Table structure for table `by_captcha` */

DROP TABLE IF EXISTS `by_captcha`;

CREATE TABLE `by_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `by_captcha` */

/*Table structure for table `by_category` */

DROP TABLE IF EXISTS `by_category`;

CREATE TABLE `by_category` (
  `catid` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '栏目id号',
  `catname` varchar(30) NOT NULL DEFAULT '' COMMENT '名称，标题',
  `pid` int(6) NOT NULL DEFAULT '0' COMMENT '父栏目',
  `child` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有子栏目，1有，0无',
  `arrchildid` mediumtext NOT NULL COMMENT '子栏目id',
  `ismenu` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示，1显示，0不显示',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目模版',
  `thumb` varchar(200) NOT NULL DEFAULT '' COMMENT '栏目封面图',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT 'SEO,title信息',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT 'SEO,关键字',
  `description` varchar(300) NOT NULL DEFAULT '' COMMENT 'SEO,页面描述',
  `displayorder` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` smallint(4) NOT NULL DEFAULT '1' COMMENT '是否显示，0不显示，1显示',
  `modified` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `dateline` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='栏目表';

/*Data for the table `by_category` */

insert  into `by_category`(`catid`,`catname`,`pid`,`child`,`arrchildid`,`ismenu`,`template`,`thumb`,`title`,`keywords`,`description`,`displayorder`,`status`,`modified`,`dateline`) values (1,'金庸',0,0,'2,3',1,'list','','第三大个人','行业资讯，新闻','信息描述',0,1,0,0),(2,'人名',1,0,'',1,'list','','','人物名','金庸人物名字',0,1,0,0),(3,'地址',1,0,'',1,'list','','','','',0,1,0,0),(4,'古龙',0,0,'5',1,'list','/uploads/category/2016/03/201603051359153.jpg','','','古大侠',0,1,1457157561,0),(5,'人名',4,0,'',1,'','/uploads/category/2016/03/201603051152260.jpg','','','',0,1,1457149946,0),(6,'黄易',0,0,'',1,'list','/uploads/category/2016/03/201603051357267.jpg','','','新武侠形式，糅合了现代气息，有穿越，动漫等气质',0,1,1457157501,1457058566);

/*Table structure for table `by_link` */

DROP TABLE IF EXISTS `by_link`;

CREATE TABLE `by_link` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '标题',
  `url` mediumtext NOT NULL COMMENT '地址',
  `thumb` mediumtext NOT NULL COMMENT '图片地址',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '类型，1导航，2链接',
  `description` mediumtext NOT NULL COMMENT '描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态，0关闭，1开放',
  `displayorder` smallint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `modified` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `dateline` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='链接表';

/*Data for the table `by_link` */

insert  into `by_link`(`id`,`title`,`url`,`thumb`,`type`,`description`,`status`,`displayorder`,`modified`,`dateline`) values (2,'金庸','http://www.google.com','http://pic.qiantucdn.com/58pic/18/19/04/23958PICmQF_1024.jpg',1,'优秀促进人类进步的公司谷歌',1,5,1457686627,1457685888),(3,'古龙','http://www.baidu.com','',1,'写点什么1',1,0,1460035977,0),(4,'黄易','http://qq.com','',1,'',1,0,1460035954,1460035954);

/*Table structure for table `by_position` */

DROP TABLE IF EXISTS `by_position`;

CREATE TABLE `by_position` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '推荐名称',
  `module` varchar(100) NOT NULL DEFAULT '' COMMENT '类型，模型',
  `catid` smallint(6) NOT NULL DEFAULT '0' COMMENT '栏目id',
  `displayorder` smallint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` smallint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `modified` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `dateline` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='推荐位表';

/*Data for the table `by_position` */

insert  into `by_position`(`id`,`name`,`module`,`catid`,`displayorder`,`status`,`modified`,`dateline`) values (1,'首页-热门','article',0,2,1,1457404113,1457403722),(2,'首页-推荐','article',0,0,1,1457407681,1457407681),(3,'精彩','article',0,0,1,1457491505,1457491505);

/*Table structure for table `by_position_data` */

DROP TABLE IF EXISTS `by_position_data`;

CREATE TABLE `by_position_data` (
  `id` int(10) NOT NULL DEFAULT '0' COMMENT '被推荐信息id',
  `posid` int(10) NOT NULL DEFAULT '0' COMMENT '推荐位id',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '推荐标题',
  `module` varchar(100) NOT NULL DEFAULT '' COMMENT '模型',
  `content` tinytext NOT NULL COMMENT '推荐信息简介',
  `thumb` tinytext NOT NULL COMMENT '封面图地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推荐信息表';

/*Data for the table `by_position_data` */

insert  into `by_position_data`(`id`,`posid`,`title`,`module`,`content`,`thumb`) values (12,1,'射雕英雄传','artilce','憨直傻的郭靖和伶俐能的黄蓉及身边的故事',''),(11,1,'书剑恩仇录1','artilce','江湖瓢把子陈家洛，伙同十三位当家的救助四当家文泰来，并劝说乾隆恢复大明江山，斗智斗勇故事','');

/*Table structure for table `by_site` */

DROP TABLE IF EXISTS `by_site`;

CREATE TABLE `by_site` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '健名',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '显示名称',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分类组',
  `value` mediumtext NOT NULL COMMENT '属性值',
  `displayorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='网站信息设置表';

/*Data for the table `by_site` */

insert  into `by_site`(`id`,`key`,`name`,`group`,`value`,`displayorder`) values (1,'sitename','站点名称','1','木木咨询站',0),(2,'siteurl','根目录','1','/',0),(3,'siteemail','站长邮箱','1','abc@abc.com',0),(4,'description','站点描述','2','本站是最棒的站',0),(5,'keywords','关键字','2','资讯,信息,系统',0),(6,'template','默认模版','1','',0);

/*Table structure for table `by_user` */

DROP TABLE IF EXISTS `by_user`;

CREATE TABLE `by_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL COMMENT '用户名（登录名）',
  `password` varchar(45) NOT NULL COMMENT '密码',
  `salt` char(6) NOT NULL COMMENT '为自己带盐',
  `mobile` varchar(15) NOT NULL COMMENT '电话手机',
  `email` varchar(32) NOT NULL COMMENT '邮箱',
  `regip` int(10) NOT NULL DEFAULT '0' COMMENT '注册ip',
  `lastip` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录ip',
  `regdate` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `lastdate` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员类型，0禁用，1普通',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员表';

/*Data for the table `by_user` */

/*Table structure for table `by_user_detail` */

DROP TABLE IF EXISTS `by_user_detail`;

CREATE TABLE `by_user_detail` (
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `nick_name` varchar(20) NOT NULL DEFAULT '' COMMENT '昵称',
  `real_name` varchar(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别，1男，2女，0保密',
  `avatar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '头像，1有，0无',
  `modified` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `dateline` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户详情表';

/*Data for the table `by_user_detail` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
