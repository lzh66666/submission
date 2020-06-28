DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `id` VARCHAR(255) NOT NULL COMMENT '作者ID',
  `account_` VARCHAR(255) NOT NULL COMMENT '作者登录账号',
  `password_` VARCHAR(255) NOT NULL COMMENT '作者登录密码',
  `name_` VARCHAR(255) NOT NULL COMMENT '作者姓名',
  `contact` VARCHAR(255) NOT NULL COMMENT '作者联系方式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `author_account__uindex` (`account_`),
  UNIQUE KEY `author_id_uindex` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='作者表';

LOCK TABLES `author` WRITE;
INSERT INTO `author` VALUES ('20a1043f-15cc-4c53-ae6a-957ad62b63f6','hs','hshshs','何俗','12345678901'),('79b64fc3-6e82-4fe5-a931-1009b75e6400','lzh','lzhlzh','卢泽华','12345678900'),('a7db8231-0c80-45eb-920d-9ca2bb5d3741','zyc','zyczyc','朱禹丞','12345678902');
UNLOCK TABLES;


DROP TABLE IF EXISTS `reviewer`;
CREATE TABLE `reviewer` (
  `id` VARCHAR(255) NOT NULL COMMENT '审稿人ID',
  `account_` VARCHAR(255) NOT NULL COMMENT '审稿人登录账号',
  `password_` VARCHAR(255) NOT NULL COMMENT '审稿人登录密码',
  `name_` VARCHAR(255) NOT NULL COMMENT '审稿人姓名',
  `contact` VARCHAR(255) NOT NULL COMMENT '审稿人联系方式',
  `total` BIGINT(20) NOT NULL COMMENT '审稿人审稿费总计',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewer_account__uindex` (`account_`),
  UNIQUE KEY `reviewer_id_uindex` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='审稿人表';

LOCK TABLES `reviewer` WRITE;
INSERT INTO `reviewer` VALUES ('043db4e0-cf83-4c39-9b8d-b4380b290b78','zyc1','zyc1zyc1','丞禹朱','12345678902',0),('cbc8e9f0-54dd-4d8b-9877-032c49f10517','hs1','hs1hs1','俗何','12345678901',3),('d485d94d-6d22-414a-ae15-720d8236bbe0','lzh1','lzh1lzh1','华泽卢','12345678900',12);
UNLOCK TABLES;

DROP TABLE IF EXISTS `submission`;
CREATE TABLE `submission` (
  `id` VARCHAR(255) NOT NULL COMMENT '稿件编号',
  `name_` VARCHAR(255) DEFAULT NULL COMMENT '稿件名称',
  `state` TINYINT(4) DEFAULT NULL COMMENT '稿件状态\n0 未投递 投递->1\n1 已投递 审稿人接稿->2\n2 待审核 审阅->3,4\n3 未通过\n4 审阅通过',
  `content` TEXT COMMENT '稿件内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_id_uindex` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='稿件表';

LOCK TABLES `submission` WRITE;
INSERT INTO `submission` VALUES ('7889f19d-1ccc-4338-8ac1-a2b5b8caf82d','hello,卢泽华',5,'hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华hello,卢泽华'),('fa3a40be-6ccf-4d8f-b028-a50f9d86098d','hello,何俗',5,'何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗何俗');
UNLOCK TABLES;

DROP TABLE IF EXISTS `author_submission_mapping`;
CREATE TABLE `author_submission_mapping` (
  `id` VARCHAR(255) NOT NULL COMMENT '订单编号',
  `author_id` VARCHAR(255) DEFAULT NULL COMMENT '作者编号',
  `submission_id` VARCHAR(255) DEFAULT NULL COMMENT '稿件编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `author_submission_mapping_id_uindex` (`id`),
  KEY `author_submission_mapping_author_id_fk` (`author_id`),
  KEY `author_submission_mapping_submission_id_fk` (`submission_id`),
  CONSTRAINT `author_submission_mapping_author_id_fk` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `author_submission_mapping_submission_id_fk` FOREIGN KEY (`submission_id`) REFERENCES `submission` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='作者投稿表';

LOCK TABLES `author_submission_mapping` WRITE;
INSERT INTO `author_submission_mapping` VALUES ('2f39bec3-a167-4461-b587-bead284b7310','79b64fc3-6e82-4fe5-a931-1009b75e6400','7889f19d-1ccc-4338-8ac1-a2b5b8caf82d'),('a496a957-a8d3-48d0-b94b-4c1168b41198','20a1043f-15cc-4c53-ae6a-957ad62b63f6','fa3a40be-6ccf-4d8f-b028-a50f9d86098d');
UNLOCK TABLES;

DROP TABLE IF EXISTS `review_submission_mapping`;
CREATE TABLE `review_submission_mapping` (
  `id` VARCHAR(255) NOT NULL COMMENT '订单编号',
  `state` TINYINT(4) DEFAULT NULL COMMENT '审阅标记',
  `payment` INT(11) DEFAULT NULL COMMENT '稿费',
  `charge` INT(11) DEFAULT NULL COMMENT '版面费',
  `reviewer_id` VARCHAR(255) DEFAULT NULL COMMENT '审稿人ID',
  `submission_id` VARCHAR(255) DEFAULT NULL COMMENT '稿件ID',
  `fee` INT(11) DEFAULT NULL COMMENT '审稿费',
  `fee_state` INT(11) DEFAULT '0' COMMENT '审稿费是否收到标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `review_submission_mapping_id_uindex` (`id`),
  KEY `review_submission_mapping_reviewer_id_fk` (`reviewer_id`),
  KEY `review_submission_mapping_submission_id_fk` (`submission_id`),
  CONSTRAINT `review_submission_mapping_reviewer_id_fk` FOREIGN KEY (`reviewer_id`) REFERENCES `reviewer` (`id`),
  CONSTRAINT `review_submission_mapping_submission_id_fk` FOREIGN KEY (`submission_id`) REFERENCES `submission` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='审阅稿件表';

LOCK TABLES `review_submission_mapping` WRITE;
INSERT INTO `review_submission_mapping` VALUES ('42f2e982-d91f-4af7-b74c-b4c4a3c9c37a',1,3,3,'cbc8e9f0-54dd-4d8b-9877-032c49f10517','fa3a40be-6ccf-4d8f-b028-a50f9d86098d',3,0),('53de2aff-565b-4e4d-8d2d-e98db49c2fd8',1,12,12,'d485d94d-6d22-414a-ae15-720d8236bbe0','7889f19d-1ccc-4338-8ac1-a2b5b8caf82d',12,1);
UNLOCK TABLES;



DROP TRIGGER IF EXISTS g_afterupdate_submission;
DELIMITER //
CREATE TRIGGER g_afterupdate_submission
AFTER UPDATE
ON `submission` FOR EACH ROW
BEGIN
IF old.state=5 THEN
UPDATE `review_submission_mapping` SET fee_state=1 WHERE `submission_id` = old.id;
END IF;
END
//


DELIMITER $$
CREATE PROCEDURE pro_author(IN authorid VARCHAR(255))
BEGIN
	SELECT submission.* 
	FROM submission, author_submission_mapping, author
	WHERE submission.`id` = author_submission_mapping.`submission_id`
	AND author_submission_mapping.`author_id` = author.`id`
	AND author.`id` = authorid;
	
END
$$
