-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account` (
  `ID` varchar(100) NOT NULL COMMENT '主键',
  `NAME` varchar(100) NOT NULL DEFAULT '' COMMENT '姓名',
  `NICK_NAME` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) NOT NULL DEFAULT '' COMMENT '密码',
  `APPLET_ID` varchar(100) NOT NULL DEFAULT '' COMMENT '小程序唯一ID',
  `WECHAT_OPENID` varchar(100) NOT NULL DEFAULT '' COMMENT '微信账户OpenID',
  `GENDER` varchar(2) NOT NULL DEFAULT 'O' COMMENT '性别（F:女, M:男, O:其他）',
  `BIRTHDAY` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `PASSPORT_NO` varchar(100) DEFAULT NULL COMMENT '护照号',
  `IDCARD_NO` varchar(50) NOT NULL DEFAULT '' COMMENT '身份证号',
  `BANK_CARD_NO` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `PHONE_NO` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
  `LEADER_ID` varchar(100)  DEFAULT '' COMMENT '上级负责人ID',
  `PROVINCE` varchar(50) NOT NULL DEFAULT '' COMMENT '省份',
  `CITY` varchar(50) NOT NULL DEFAULT '' COMMENT '城市',
  `DISTRICT` varchar(50) NOT NULL DEFAULT '' COMMENT '区域',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `ADDRESS` varchar(50) DEFAULT NULL COMMENT '联系方式',
  `HEAD_URL` varchar(800) DEFAULT NULL COMMENT '头像图片地址',
  `SIGN_URL` varchar(255) DEFAULT NULL COMMENT '签名图片地址',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT '描述',
  `ROLE_ID` bigint(20) NOT NULL DEFAULT '4110810677579425317' COMMENT '用户角色ID',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `LOCKED` tinyint(1) DEFAULT '0' COMMENT '是否锁定（0:未锁定, 1:锁定）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户账号表';
INSERT INTO  `user_account` (`ID`, `NAME`, `NICK_NAME`, `PASSWORD`, `APPLET_ID`, `WECHAT_OPENID`, `GENDER`, `BIRTHDAY`, `PASSPORT_NO`, `IDCARD_NO`, `BANK_CARD_NO`, `PHONE_NO`, `LEADER_ID`, `PROVINCE`,`CITY`,`DISTRICT`,`EMAIL`, `ADDRESS`, `HEAD_URL`, `SIGN_URL`, `DESCRIPTION`, `ROLE_ID`,`ACTIVE`, `DELETED`, `LOCKED`, `CREATE_USER_ID`, `CREATE_DATETIME`, `MODIFY_USER_ID`, `MODIFY_DATETIME`, `VERSION`) VALUES ('cd74f9b0bb1e46908cbfe39a8c9e8ef9',  '管理员', '', '123admin@yzh', '', '', 'M', '1988-02-20', '4110810677579425317', '421125198802207015', '622202185645821482', 'admin', 'cd74f9b0bb1e46908cbfe39a8c9e8ef9','湖北省','武汉市','洪山区','365171291@qq.com', '', '', '', '', '4110810677579425317', '1', '0', '0', NULL, NULL, NULL, NULL, '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `NAME` varchar(100) NOT NULL COMMENT '角色名称',
  `DESCRIPTION` varchar(255) DEFAULT '' COMMENT '角色描述',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `PERMISSION_CODE` varchar(255) DEFAULT '' COMMENT '权限',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';