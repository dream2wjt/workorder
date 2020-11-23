-- ----------------------------
-- Table structure for tenant
-- ----------------------------
DROP TABLE IF EXISTS `tenant`;
CREATE TABLE `tenant` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `TENANT_NAME` varchar(100) NOT NULL COMMENT '租户名称',
  `CONTACT` varchar(70) NOT NULL COMMENT '联系人',
  `TELEPHONE` varchar(25) DEFAULT '' COMMENT '联系方式',
  `TENANT_TYPE` tinyint(1) DEFAULT NULL COMMENT '租户类型（0:超级租户;1:医联体/医共体;2:医疗机构;3:公司/企业;4:政府/事业单位;5:联影;6:个人;7:合作伙伴;8:开发伙伴;9:其他;）',
  `COUNTRY_ID` bigint(20) NOT NULL COMMENT '国家主键',
  `PROVINCE_ID` bigint(20) NOT NULL COMMENT '省份/州主键',
  `CITY_ID` bigint(20) NOT NULL COMMENT '城市主键',
  `DISTRICT_ID` bigint(20) NOT NULL COMMENT '区域主键',
  `ADDRESS` varchar(200) DEFAULT '' COMMENT '详细地址',
  `DIRECTOR_OF_CONTRACTS` varchar(100) DEFAULT '' COMMENT '内部签约人',
  `QUALIFICATION_DOC_ID` varchar(100) DEFAULT '' COMMENT '资质文件唯一标识',
  `LOCATED_DATETIME` datetime DEFAULT NULL COMMENT '入驻时间',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租户';

-- ----------------------------
-- Table structure for org_organization
-- ----------------------------
DROP TABLE IF EXISTS `org_organization`;
CREATE TABLE `org_organization` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `NAME` varchar(100) NOT NULL COMMENT '机构名称',
  `CODE` varchar(50) NOT NULL COMMENT '组织机构代码',
  `COUNTRY_ID` bigint(20) NOT NULL COMMENT '国家主键',
  `PROVINCE_ID` bigint(20) DEFAULT NULL COMMENT '省份/州主键',
  `CITY_ID` bigint(20) DEFAULT NULL COMMENT '城市主键',
  `DISTRICT_ID` bigint(20) DEFAULT NULL COMMENT '区域主键',
  `ADDRESS` varchar(200) DEFAULT '' COMMENT '详细地址',
  `CONTACT_PERSON` varchar(50) DEFAULT NULL COMMENT '联系人',
  `TELEPHONE` varchar(25) NOT NULL DEFAULT '' COMMENT '联系方式',
  `DESCRIPTION` varchar(255) DEFAULT '' COMMENT '机构描述',
  `SOP_ID` varchar(20) DEFAULT '' COMMENT 'SOP 系统 ID',
  `IS_DEFAULT` tinyint(1) DEFAULT '0' COMMENT '是否默认机构，已不使用，后续删除（0:否, 1:是）',
  `LAST_SYNC_DATETIME` datetime DEFAULT NULL COMMENT '最近同步信息时间',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构';

-- ----------------------------
-- Table structure for tenant_organization
-- ----------------------------
DROP TABLE IF EXISTS `tenant_organization`;
CREATE TABLE `tenant_organization` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `TENANT_ID` bigint(20) NOT NULL COMMENT '角色主键',
  `ORGANIZATION_ID` bigint(20) NOT NULL COMMENT '权限主键',
  `IS_DEFAULT` tinyint(1) DEFAULT '0' COMMENT '是否默认机构（0:否, 1:是）',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租户机构';



-- ----------------------------
-- Table structure for address_country
-- ----------------------------
DROP TABLE IF EXISTS `address_country`;
CREATE TABLE `address_country` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ENGLISH_SHORT_NAME` varchar(200) NOT NULL COMMENT '英文名称',
  `ALPHA_CODE2` varchar(2) NOT NULL COMMENT '国家编码，2位字母',
  `ALPHA_CODE3` varchar(3) NOT NULL COMMENT '国家编码，3位字母',
  `NUMERIC_CODE` varchar(5) NOT NULL COMMENT '国家编码，数字',
  `COUNTRY_REMARK` varchar(255) NOT NULL COMMENT '国家描述',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='国家';

-- ----------------------------
-- Table structure for address_province
-- ----------------------------
DROP TABLE IF EXISTS `address_province`;
CREATE TABLE `address_province` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ENGLISH_SHORT_NAME` varchar(200) NOT NULL COMMENT '英文名称',
  `COUNTRY_ID` bigint(20) NOT NULL COMMENT '国家主键',
  `CODE` varchar(8) NOT NULL COMMENT '省份编码',
  `PROVINCE_REMARK` varchar(255) NOT NULL COMMENT '省份/州描述',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='省份';

-- ----------------------------
-- Table structure for address_city
-- ----------------------------
DROP TABLE IF EXISTS `address_city`;
CREATE TABLE `address_city` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ENGLISH_SHORT_NAME` varchar(200) NOT NULL COMMENT '英文名称',
  `PROVINCE_ID` bigint(20) NOT NULL COMMENT '省份主键',
  `CODE` varchar(8) NOT NULL COMMENT '城市编码',
  `CITY_REMARK` varchar(255) NOT NULL COMMENT '城市描述',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市';

-- ----------------------------
-- Table structure for address_district
-- ----------------------------
DROP TABLE IF EXISTS `address_district`;
CREATE TABLE `address_district` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ENGLISH_SHORT_NAME` varchar(200) NOT NULL COMMENT '英文名称',
  `CITY_ID` bigint(20) NOT NULL COMMENT '城市主键',
  `CODE` varchar(8) NOT NULL COMMENT '行政区编码',
  `DISTRICT_REMARK` varchar(255) NOT NULL COMMENT '行政区描述',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政区';

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
INSERT INTO  `user_account` (`ID`, `NAME`, `NICK_NAME`, `PASSWORD`, `APPLET_ID`, `WECHAT_OPENID`, `GENDER`, `BIRTHDAY`, `PASSPORT_NO`, `IDCARD_NO`, `BANK_CARD_NO`, `PHONE_NO`, `LEADER_ID`, `PROVINCE`,`CITY`,`DISTRICT`,`EMAIL`, `ADDRESS`, `HEAD_URL`, `SIGN_URL`, `DESCRIPTION`, `ROLE_ID`,`ACTIVE`, `DELETED`, `LOCKED`, `CREATE_USER_ID`, `CREATE_DATETIME`, `MODIFY_USER_ID`, `MODIFY_DATETIME`, `VERSION`) VALUES ('cd74f9b0bb1e46908cbfe39a8c9e8ef9',  '景甜', '', '123@yzh', '', '', 'M', '1988-02-20', '4110810677579425317', '421125198802207015', '622202185645821482', '13100678595', 'cd74f9b0bb1e46908cbfe39a8c9e8ef9','湖北省','武汉市','洪山区','365171291@qq.com', '', '', '', '', '4110810677579425317', '1', '0', '0', NULL, NULL, NULL, NULL, '1');

-- ----------------------------
-- Table structure for org_department
-- ----------------------------
DROP TABLE IF EXISTS `org_department`;
CREATE TABLE `org_department` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ORGANIZATION_ID` bigint(20) NOT NULL COMMENT '机构ID',
  `NAME` varchar(100) NOT NULL COMMENT '部门名称',
  `CODE` varchar(50) NOT NULL COMMENT '部门代码',
  `IS_DEFAULT` tinyint(1) DEFAULT '0' COMMENT '是否默认部门（0:否, 1:是）',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT '部门描述',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '上级部门唯一标识ID',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='部门表 包含科室等级别，可当作用户组';
-- ----------------------------
-- Table structure for user_org_department
-- ----------------------------
DROP TABLE IF EXISTS `user_org_department`;
CREATE TABLE `user_org_department` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ACCOUNT_ID` bigint(20) DEFAULT NULL COMMENT '用户唯一ID',
  `DOMAIN_NAME` varchar(20) DEFAULT '' COMMENT '域名',
  `DEPARTMENT_ID` bigint(20) DEFAULT NULL COMMENT '部门唯一ID',
  `LAST_JOIN_DATETIME` datetime DEFAULT NULL COMMENT '最近加入租户时间',
  `APPLICATION_STATUS` tinyint(1) DEFAULT '3' COMMENT '审核状态（1:待审核, 2：已拒绝, 3：已通过）',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户-机构-部门关系表';

-- ----------------------------
-- Table structure for user_collect
-- ----------------------------
DROP TABLE IF EXISTS `user_collect`;
CREATE TABLE `user_collect` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `USER_ACCOUNT_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `COLLECT_NAME` varchar(100) NOT NULL COMMENT '收藏对象名称',
  `COLLECT_IMAGE_URL` varchar(100) DEFAULT NULL COMMENT '收藏对象缩略图链接',
  `COLLECT_URL` varchar(100) NOT NULL COMMENT '收藏对象链接',
  `COLLECT_TYPE` tinyint(1) DEFAULT '0' COMMENT '收藏对象类型（0:应用, 1:文档, 2:视频，3:问答，4:设备）',
  `DESCRIPTION` varchar(200) DEFAULT NULL COMMENT '文本摘要',
  `COLLECT_DATETIME` datetime DEFAULT NULL COMMENT '收藏时间',
  `COLLECT_ID` bigint(20) DEFAULT NULL COMMENT '收藏对象唯一标识',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否收藏（1：已收藏，0：未收藏）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（1:删除，0:未删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';

-- ----------------------------
-- Table structure for user_prase
-- ----------------------------
DROP TABLE IF EXISTS `user_prase`;
CREATE TABLE `user_prase` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `USER_ACCOUNT_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `PRASE_NAME` varchar(100) NOT NULL COMMENT '点赞对象名称',
  `PRASE_IMAGE_URL` varchar(100) DEFAULT NULL COMMENT '收藏对象缩略图链接',
  `PRASE_URL` varchar(100) NOT NULL COMMENT '收藏对象链接',
  `PRASE_TYPE` tinyint(1) DEFAULT NULL COMMENT '点赞类型（0:取消赞, 1:有用赞,2:取消踩, 3:有用踩）',
  `PRASE_DATETIME` datetime DEFAULT NULL COMMENT '点赞时间',
  `DESCRIPTION` varchar(200) DEFAULT NULL COMMENT '描述',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否点赞（1:点赞，0:未点赞）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（1:删除，0:未删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点赞表';


-- ----------------------------
-- Table structure for app_client
-- ----------------------------
DROP TABLE IF EXISTS `app_client`;
CREATE TABLE `app_client` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `NAME` varchar(100) NOT NULL COMMENT '应用名称',
  `DESCRIPTION` varchar(500) DEFAULT '' COMMENT '应用描述',
  `DETAIL` text DEFAULT NULL COMMENT '应用详细介绍',
  `PRODUCT_VERSION` varchar(50) DEFAULT '' COMMENT '产品版本',
  `PUBLISHER` varchar(50) DEFAULT '' COMMENT '发布方',
  `IS_DEFAULT` tinyint(1) DEFAULT '0' COMMENT '是否内置应用（0:否, 1:是）',
  `APP_TYPE` tinyint(1) DEFAULT NULL COMMENT '应用分类',
  `NEED_PERMISSION_CFG` tinyint(1) DEFAULT '1' COMMENT '是否支持权限配置（0:否, 1:是）',
  `IS_DEPENDENT` tinyint(1) DEFAULT '0' COMMENT '是否依赖其他应用（0:否, 1:是）',
  `DEPENDENCE_APP_ID` bigint(20) DEFAULT NULL COMMENT '依赖应用主键',
  `IS_AVL_FOR_ALL_TENANTS` tinyint(1) DEFAULT '1' COMMENT '是否全部租户可用（0:否, 1:是）',
  `AVL_TENANT_ID_LIST` varchar(500) DEFAULT NULL COMMENT '可用租户主键，多个用英文逗号隔离',
  `CLIENT_NAME` varchar(200) NOT NULL COMMENT '客户端名称',
  `VISIBLE_TYPE` tinyint(1) NOT NULL COMMENT '应用可见性分类（0:隐藏；1:固定-所有人；2:固定-普通用户；3:固定-管理员 ;4:已安装-所有人;5:已安装-普通用户;6:已安装-管理员）',
  `CLIENT_URL` varchar(200) NOT NULL COMMENT '客户端访问地址',
  `CLIENT_LOGO_URL` varchar(200) DEFAULT NULL COMMENT 'LOGO 地址',
  `CLIENT_ID` varchar(50) NOT NULL COMMENT '客户端ID标识',
  `CLIENT_SECRET` varchar(32) DEFAULT NULL COMMENT '客户端身份钥匙',
  `APP_SOURCE` varchar(100) DEFAULT NULL COMMENT '应用来源',
  `REQUIRE_CLIENT_SECRET` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要ClientSecret（0:不需要, 1:需要）',
  `CLIENT_CALLBACK_HOST` varchar(500) NOT NULL COMMENT '客户端回调地址主机信息',
  `IS_THIRD_PARTY` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为第三方(1：是；0：否)',
  `AUTH_TYPE` varchar(20) DEFAULT NULL COMMENT '认证方式(code,implicit,client_credentials)',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL,
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  `READ_ONLY` tinyint(1) NOT NULL DEFAULT '0' COMMENT '只读(1：是；0：否)',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='客户端表(由产品表拆分得到)';

-- ----------------------------
-- Table structure for sys_dict_field
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_field`;
CREATE TABLE `sys_dict_field` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `FIELD_CODE` varchar(100) NOT NULL COMMENT '字段编码',
  `FIELD_NAME` varchar(100) NOT NULL COMMENT '字段名称',
  `FIELD_DISPLAY_NAME` varchar(100) NOT NULL COMMENT '字段显示名称',
  `DESCRIPTION` varchar(200) DEFAULT NULL COMMENT '字段描述',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典字段表';

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `FIELD_ID` bigint(20) NOT NULL COMMENT '字典字段主键',
  `DATA_VALUE` varchar(3) DEFAULT NULL COMMENT '字段值',
  `DATA_DISPLAY_NAME` varchar(100) DEFAULT NULL COMMENT '字段值显示名称',
  `DESCRIPTION` varchar(200) DEFAULT NULL COMMENT '值描述',
  `IS_DEFAULT` tinyint(1) DEFAULT '0' COMMENT '是否默认',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典字段值表';

-- ----------------------------
-- Table structure for app_tariff
-- ----------------------------
DROP TABLE IF EXISTS `app_tariff`;
CREATE TABLE `app_tariff` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `APP_ID` bigint(20) NOT NULL COMMENT '应用主键',
  `EDITION` varchar(50) DEFAULT NULL COMMENT '使用方案',
  `USER_COUNT` int DEFAULT NULL COMMENT '使用人数',
  `LIFECYCLE` int DEFAULT NULL COMMENT '使用周期（单位：天）',
  `PRICE` decimal(7,2) DEFAULT '0.00' COMMENT '金额',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用资费方案表';

-- ----------------------------
-- Table structure for app_order_record
-- ----------------------------
DROP TABLE IF EXISTS `app_order_record`;
CREATE TABLE `app_order_record` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `APP_TARIFF_ID` bigint(20) NOT NULL COMMENT '应用资费主键',
  `TENANT_ID` bigint(20) NOT NULL COMMENT '租户主键',
  `ORG_ID` bigint(20) NOT NULL COMMENT '机构主键',
  `PERMISSION_SETTING_TYPE` varchar(2) DEFAULT NULL COMMENT '权限维护方式',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '订购人主键',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用订购记录表';

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ORDER_RECORD_ID` bigint(20) NOT NULL COMMENT '应用订购记录主键',
  `PAYMENT_DATETIME` datetime DEFAULT NULL COMMENT '支付时间',
  `PAYMENT_STATUS` tinyint(1) DEFAULT '1' COMMENT '支付状态（1：等待支付,2：已支付,3：超时）',
  `PAYMENT_WAY` tinyint(1) DEFAULT NULL COMMENT '支付方式（0：支付宝,1：微信）',
  `PAYMENT_ACCOUNT` varchar(100) DEFAULT NULL COMMENT '支付账号',
  `CHARGE` decimal(7,2) DEFAULT '0.00' COMMENT '支付金额',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付记录表';


-- ----------------------------
-- Table structure for user_schedule
-- ----------------------------
DROP TABLE IF EXISTS `user_schedule`;
CREATE TABLE `user_schedule` (
`ID`  bigint(20) NOT NULL COMMENT '主键' ,
`ACCOUNT_ID`  bigint(20) NOT NULL COMMENT '用户ID' ,
`TENANT_ID`  bigint(20) NOT NULL COMMENT '租户ID' ,
`DETAIL`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程描述' ,
`START_DATETIME`  datetime NULL DEFAULT NULL COMMENT '开始时间' ,
`END_DATETIME`  datetime NULL DEFAULT NULL COMMENT '结束时间' ,
`ACTIVE`  tinyint(1) NULL DEFAULT 1 COMMENT '是否有效（0:无效, 1:有效）' ,
`DELETED`  tinyint(1) NULL DEFAULT 0 COMMENT '是否删除（0:未删除, 1:删除）' ,
`CREATE_USER_ID`  bigint(20) NULL DEFAULT NULL COMMENT '创建人ID' ,
`CREATE_DATETIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`MODIFY_USER_ID`  bigint(20) NULL DEFAULT NULL COMMENT '修改人ID' ,
`MODIFY_DATETIME`  datetime NULL DEFAULT NULL COMMENT '修改时间' ,
`VERSION`  int(11) NULL DEFAULT 1 COMMENT '版本号' ,
PRIMARY KEY (`ID`),
KEY `ID` (`ID`) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日程表';

-- ----------------------------
-- Table structure for data_limits
-- ----------------------------
DROP TABLE IF EXISTS `data_limits`;
CREATE TABLE `data_limits` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色主键',
  `ACCESSIBLE_APP_IDS` varchar(1000) DEFAULT NULL COMMENT '可访问应用 ID 列表',
  `ACCESSIBLE_TENANT_IDS` varchar(1000) DEFAULT NULL COMMENT '可访问租户 ID 列表',
  `AVAILABLE_FOR_TENANT` tinyint(1) DEFAULT '0' COMMENT '是否对租户开放（0:否, 1:是）',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限表';

-- ----------------------------
-- Table structure for log_app_usage
-- ----------------------------
DROP TABLE IF EXISTS `log_app_usage`;
CREATE TABLE `log_app_usage` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `IP` varchar(210) NOT NULL COMMENT '登录 IP',
  `ACCESS_DATETIME` datetime DEFAULT NULL COMMENT '进入时间',
  `LEFT_DATETIME` datetime DEFAULT NULL COMMENT '离开时间',
  `CURRENT_DEVICE` varchar(100) DEFAULT NULL COMMENT '登录设备',
  `USER_NAME` varchar(100) DEFAULT NULL COMMENT '登录人',
	`USER_ID` bigint(20) NOT NULL COMMENT '登录人 ID',
  `TENANT_NAME` varchar(100) DEFAULT NULL COMMENT '登录人所在租户',
	`TENANT_ID` bigint(20) NOT NULL COMMENT '登录人所在租户 ID',
  `ORGANIZATION_NAME` varchar(100) DEFAULT NULL COMMENT '登录人所在机构',
	`ORGANIZATION_ID` bigint(20) NOT NULL COMMENT '登录人所在机构 ID',
  `APPLICATION_NAME` varchar(100) DEFAULT NULL COMMENT '登录应用名称',
	`APPLICATION_ID` bigint(20) NOT NULL COMMENT '登录人应用名称 ID',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用登录日志表';

-- ----------------------------
-- Table structure for log_user_login
-- ----------------------------
DROP TABLE IF EXISTS `log_user_login`;
CREATE TABLE `log_user_login` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `IP` varchar(210) NOT NULL COMMENT '登录 IP',
  `LOGIN_DATETIME` datetime DEFAULT NULL COMMENT '登录时间',
  `CURRENT_DEVICE` varchar(100) DEFAULT '0' COMMENT '登录设备',
  `USER_NAME` varchar(100) DEFAULT NULL COMMENT '登录人',
	`USER_ID` bigint(20) NOT NULL COMMENT '登录人 ID',
  `TENANT_NAME` varchar(100) DEFAULT NULL COMMENT '登录人所在租户',
	`TENANT_ID` bigint(20) NOT NULL COMMENT '登录人所在租户 ID',
  `ORGANIZATION_NAME` varchar(100) DEFAULT NULL COMMENT '登录人所在机构',
	`ORGANIZATION_ID` bigint(20) NOT NULL COMMENT '登录人所在机构 ID',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录日志表';

-- ----------------------------
-- Table structure for sys_holiday
-- ----------------------------
DROP TABLE IF EXISTS `sys_holiday`;
CREATE TABLE `sys_holiday` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `LOCALE` varchar(8) NOT NULL COMMENT '本地化地区',
  `FESTIVAL` varchar(100) NOT NULL COMMENT '节日名称',
  `DATE` datetime DEFAULT NULL COMMENT '日期·',
  `DAY_STATUS` tinyint(1) DEFAULT NULL COMMENT '休假或者补班（1:休假, 2:补班）',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节假日表';

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `TITLE` varchar(10) NOT NULL COMMENT '公告标题',
  `CONTENT` text NOT NULL COMMENT '公告内容',
  `ANNOUNCE_TYPE` tinyint(1) NOT NULL COMMENT '公告类型(1运营动态,2新功能通知,3运维通知)',
  `PUBLISH_TENANT_ID` bigint(20) NOT NULL COMMENT '发送公告的租户ID',
  `PUBLISH_STATUS` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发布状态(0已发布,1草稿)',
  `LAST_PUBLISH_TIME` datetime DEFAULT NULL COMMENT '最新发布时间',
  `RECEIVE_TYPE` tinyint(1) DEFAULT '0' COMMENT '发布对象，即公告接收方类型(0全部,1租户组,2机构组,3部门组,4其他用户组)',
  `RECEIVE_ID_LIST` varchar(500) DEFAULT NULL COMMENT '可用发布对象主键，多个用英文逗号隔离',
  `VISIT_AMOUNT` bigint(20) NOT NULL DEFAULT '0' COMMENT '访问量',
  `ACTIVE` tinyint(1) DEFAULT '1' COMMENT '是否有效（0:无效, 1:有效）',
  `DELETED` tinyint(1) DEFAULT '0' COMMENT '是否删除（0:未删除, 1:删除）',
  `CREATE_USER_ID` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATETIME` datetime DEFAULT NULL,
  `MODIFY_USER_ID` bigint(20) NOT NULL COMMENT '修改人ID',
  `MODIFY_DATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='公告表';

-- ----------------------------
-- View structure for user_account_info_view
-- ----------------------------
DROP VIEW
IF EXISTS `user_account_info_view`;

CREATE VIEW `user_account_info_view` AS SELECT
	`t_acc`.`ID`,
	`t_acc`.`ACTIVE`,
	`t_acc`.`DELETED`,
	`t_detail`.`NAME`,
	`t_detail`.`GENDER`,
	`t_ldap`.`ACCOUNT_NAME` AS `ldapAccountName`,
  `t_acc`.`CREATE_DATETIME`,
	t_acc.DEACTIVATE_DATETIME,
  `t_acc`.`LAST_LOGIN_TIME` AS `LAST_LOGIN_TIME`,
	CASE
WHEN isnull(`t_ldap`.`SOP_ID`) THEN
	0
ELSE
	`t_ldap`.`SOP_ID`
END AS `SOP_ID`,
 `t_local`.`ACCOUNT_NAME` AS `localAccountName`,
 `t_phone`.`ACCOUNT_NAME` AS `phoneNoAccountName`,
 `t_email`.`ACCOUNT_NAME` AS `emailAccountName`
FROM
	(
		`user_account` `t_acc`
		LEFT JOIN `user_account_ldap` `t_ldap` ON `t_acc`.`ID` = `t_ldap`.`ACCOUNT_ID`
		AND `t_ldap`.`DELETED` = 0
		LEFT JOIN `user_account_local` `t_local` ON `t_local`.`ACCOUNT_ID` = `t_acc`.`ID`
		AND `t_local`.`DELETED` = 0
		LEFT JOIN (
			SELECT
				`user_account_verify`.`ACCOUNT_ID` AS `ACCOUNT_ID`,
				`user_account_verify`.`ACCOUNT_NAME` AS `ACCOUNT_NAME`
			FROM
				`user_account_verify`
			WHERE
				`user_account_verify`.`VERIFY_TYPE` = 0
			AND `user_account_verify`.`DELETED` = 0
		) `t_phone` ON `t_phone`.`ACCOUNT_ID` = `t_acc`.`ID`
		LEFT JOIN (
			SELECT
				`user_account_verify`.`ACCOUNT_ID` AS `ACCOUNT_ID`,
				`user_account_verify`.`ACCOUNT_NAME` AS `ACCOUNT_NAME`
			FROM
				`user_account_verify`
			WHERE
				`user_account_verify`.`VERIFY_TYPE` = 1
			AND `user_account_verify`.`DELETED` = 0
		) `t_email` ON `t_email`.`ACCOUNT_ID` = `t_acc`.`ID`
		LEFT JOIN `user_detail_info` `t_detail` ON `t_detail`.`ACCOUNT_ID` = `t_acc`.`ID`
		AND `t_detail`.`DELETED` = 0
	);

-- ----------------------------
-- View structure for app_order_detail
-- ----------------------------
DROP VIEW
IF EXISTS `app_order_detail`;

CREATE VIEW `app_order_detail` AS (
	SELECT
		ord.ID AS ORDER_ID,
		app.CLIENT_NAME AS APPLICATION_NAME,
		app.CLIENT_LOGO_URL AS LOGO,
    app.ID AS APPLICATION_ID,
		app.NEED_PERMISSION_CFG,
		tar.`EDITION`,
		tar.`PRICE`,
		tar.USER_COUNT,
		tar.LIFECYCLE,
		app.`APP_TYPE`,
		ord.`CREATE_DATETIME`,
		DATE_FORMAT(DATE_ADD(ord.`CREATE_DATETIME`, INTERVAL tar.LIFECYCLE DAY), '%Y-%m-%d') AS DUE_DATE,
		CASE WHEN ord.`ACTIVE` = '0' THEN '4'
        WHEN tar.LIFECYCLE IS NULL OR (tar.LIFECYCLE IS NOT NULL AND DATE_ADD(ord.`CREATE_DATETIME`, INTERVAL LIFECYCLE - 30 DAY) >= DATE(NOW())) THEN '1'
        WHEN tar.LIFECYCLE IS NOT NULL AND DATE_ADD(ord.`CREATE_DATETIME`, INTERVAL LIFECYCLE DAY) < DATE(NOW()) THEN	'3'
        ELSE '2' END APP_SERVICE_STATUS,
		p.`PAYMENT_DATETIME`,
		p.`CHARGE`,
		p.`PAYMENT_STATUS`,
		ord.TENANT_ID,
		t.`TENANT_NAME`,
		ord.ORG_ID,
		org.`NAME` AS `ORG_NAME`,
		u.ACCOUNT_ID,
		u.`NAME` AS `USER_NAME`,
		ord.`ACTIVE` AS APP_ORDER_ACTIVE_STATUS,
		ord.PERMISSION_SETTING_TYPE
	FROM
		app_order_record ord
	LEFT JOIN app_tariff tar ON ord.APP_TARIFF_ID = tar.ID
	LEFT JOIN app_client app ON tar.APP_ID = app.ID
	LEFT JOIN payment p ON ord.ID = p.ORDER_RECORD_ID
	LEFT JOIN user_detail_info u ON ord.CREATE_USER_ID = u.ACCOUNT_ID
	LEFT JOIN tenant t ON t.ID = ord.TENANT_ID
	LEFT JOIN org_organization org ON ord.ORG_ID = org.ID
);

-- ----------------------------
-- View structure for organization_detail_view
-- ----------------------------
DROP VIEW
IF EXISTS `organization_detail_view`;

CREATE VIEW `organization_detail_view` AS (
SELECT torg.TENANT_ID, torg.ORGANIZATION_ID, org.`NAME` AS ORGANIZATION_NAME,
org.`CODE` AS ORGANIZATION_CODE, org.COUNTRY_ID, country.ALPHA_CODE3 AS COUNTRY_CODE,
org.PROVINCE_ID, province.`CODE` AS PROVINCE_CODE, org.CITY_ID,
city.`CODE` AS CITY_CODE, org.DISTRICT_ID, district.`CODE` AS DISTRICT_CODE,
org.ADDRESS, org.CONTACT_PERSON, org.TELEPHONE, org.DESCRIPTION, org.SOP_ID,
torg.IS_DEFAULT, org.ACTIVE AS ORGANIZATION_ACTIVE, org.DELETED as ORGANIZATION_DELETE
FROM org_organization org
LEFT JOIN tenant_organization torg ON org.ID = torg.ORGANIZATION_ID
LEFT JOIN address_country country ON org.COUNTRY_ID = country.ID
LEFT JOIN address_province province ON org.PROVINCE_ID = province.ID
LEFT JOIN address_city city ON org.CITY_ID = city.ID
LEFT JOIN address_district district ON org.DISTRICT_ID = district.ID
);

-- ----------------------------
-- 2020-10-27 add table user_default_config
-- ----------------------------
-- Table structure for user_default_config
-- ----------------------------
DROP TABLE IF EXISTS `user_default_config`;
CREATE TABLE `user_default_config` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ACCOUNT_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `DEFAULT_TENANT_ID` bigint(20) NOT NULL COMMENT '默认租户 ID',
  `DEFAULT_LOCALE` varchar(8) DEFAULT NULL COMMENT '默认本地化地区',
  `DEFAULT_THEME` varchar(100) DEFAULT '0' COMMENT '默认主题',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户默认配置表';

-- ----------------------------
-- Table structure for role_tenant
-- ----------------------------
DROP TABLE IF EXISTS `role_tenant`;
CREATE TABLE `role_tenant` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色 ID',
  `TENANT_ID` bigint(20) NOT NULL COMMENT '租户 ID',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色租户关联表';

-- ----------------------------
-- Table structure for role_application
-- ----------------------------
DROP TABLE IF EXISTS `role_application`;
CREATE TABLE `role_application` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色 ID',
  `APP_ID` bigint(20) NOT NULL COMMENT '应用 ID',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色应用关联表';

-- ----------------------------
-- 2020-10-28 add user default config of admin account
-- ----------------------------
INSERT INTO `user_default_config` (`ID`, `ACCOUNT_ID`, `DEFAULT_TENANT_ID`, `DEFAULT_LOCALE`, `DEFAULT_THEME`) VALUES ('1321340134823108610', '4042053130253308199', '1300804603026509826', 'zh-cn', NULL);

ALTER TABLE org_organization DROP COLUMN IS_DEFAULT;

-- ----------------------------
-- 2020-11-02 add initial data to table [role_application]
-- ----------------------------
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144908736315394', '4110810677579425317', '4110810540140478016');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144909038305281', '4110810677579425318', '4110810540140478016');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144909126385666', '4110810677579425319', '4110810540140478016');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144909210271745', '4110810677579425320', '4110810540140478016');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144909294157825', '4110810677579425321', '4110810540140478016');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144909382238209', '4110810677579425322', '4110810540140478016');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144909470318593', '4110810677579425323', '4110810540140478016');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144909562593281', '4110810677579425324', '4110810540140478016');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144909646479362', '4110810711939165597', '4110810540140478016');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144909738754049', '4229192173964317983', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144909826834433', '4229192173964317984', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144909914914818', '4229192173964317985', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144909998800898', '4229192173964317986', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144910082686977', '4229192173964317987', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144910170767361', '4229192173964317988', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144910258847746', '4229192173964317989', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144910342733825', '4229192173964317990', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144910430814209', '4229192173964317991', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144910518894594', '4229192173964317992', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144910606974978', '4229192173964317993', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144910695055362', '4229192173964317994', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144910778941442', '4229192173964317995', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144910871216129', '4229192173964317996', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144910955102209', '4229192173964317997', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144911043182593', '4229192173964317998', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144911131262977', '4229192173964317999', '4110810540140478010');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144911210954753', '4229204887067515134', '4110810540140478016');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144911299035137', '4229204887067515153', '4110810540140478016');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144911391309825', '4229214645233206978', '4110810540140478016');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144911479390209', '4229214645233206995', '4110810540140478016');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144911563276289', '4229214645233206996', '4110810574500216630');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144911668133890', '4229214645233206997', '4110810574500216630');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144911752019970', '4229214645233206998', '4110810574500216630');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144911835906050', '4229214645233206999', '4110810574500216630');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144911919792129', '4229214645233207000', '4110810574500216630');
INSERT INTO `role_application` (`ID`, `ROLE_ID`, `APP_ID`) VALUES ('1323144912012066818', '4229214645233207001', '4110810574500216630');

ALTER TABLE user_role ADD COLUMN `TENANT_ID` bigint(20) DEFAULT NULL COMMENT '租户 ID';
ALTER TABLE user_doctor_info ADD COLUMN `ORGANIZATION_ID` bigint(20) DEFAULT NULL COMMENT '机构 ID';
ALTER TABLE user_doctor_info DROP COLUMN TENANT_ID;

-- ----------------------------
-- View structure for user_department_detail_view
-- ----------------------------
DROP VIEW
IF EXISTS `user_department_detail_view`;

CREATE VIEW `user_department_detail_view` AS (
SELECT ud.ID AS USER_ORG_DEP_ID, ud.APPLICATION_STATUS, ud.LAST_JOIN_DATETIME,
ud.CREATE_DATETIME AS USER_ORG_DEP_CREATE_DATETIME, ud.MODIFY_DATETIME AS USER_ORG_DEP_MODIFY_DATETIME,ud.DELETED AS USER_ORG_DEP_DELETED,
udi.ACCOUNT_ID, u.LOGIN_ID, u.ACTIVE AS USER_ACCOUNT_ACTIVE, u.DELETED AS USER_ACCOUNT_DELETED, udi.`NAME`,
udi.NICK_NAME, udi.PHONE_NO AS CONTACT_PHONE_NO, udi.EMAIL AS CONTACT_EMAIL, udi.SIGN_URL, um.MOBILE, ue.EMAIL,
ud.DEPARTMENT_ID, dep.`NAME` AS DEPARTMENT_NAME, doctor.DOCTOR_STAFF_NO AS EMPLOYEE_NO, doctor.DUTY,
dep.ORGANIZATION_ID, org.`NAME` AS ORGANIZATION_NAME, org.SOP_ID, org.`CODE` AS ORGANIZATION_CODE,
org.DELETED AS ORGANIZATION_DELETED, torg.TENANT_ID, t.TENANT_NAME, t.DELETED AS TENANT_DELETED,`t`.`TENANT_TYPE`,t.ACTIVE AS TENANT_ACTIVE
FROM
 user_org_department ud
LEFT JOIN user_account u ON ud.ACCOUNT_ID = u.ID
LEFT JOIN user_detail_info udi ON ud.ACCOUNT_ID = udi.ACCOUNT_ID
LEFT JOIN (SELECT ACCOUNT_ID, ACCOUNT_NAME AS MOBILE FROM user_account_verify WHERE VERIFY_TYPE = '0') um ON ud.ACCOUNT_ID = um.ACCOUNT_ID
LEFT JOIN (SELECT ACCOUNT_ID, ACCOUNT_NAME AS EMAIL FROM user_account_verify WHERE VERIFY_TYPE = '1') ue ON ud.ACCOUNT_ID = ue.ACCOUNT_ID
LEFT JOIN org_department dep ON dep.ID = ud.DEPARTMENT_ID
LEFT JOIN org_organization org ON org.ID = dep.ORGANIZATION_ID
LEFT JOIN tenant_organization torg ON org.ID = torg.ORGANIZATION_ID
LEFT JOIN tenant t ON t.ID = torg.TENANT_ID
LEFT JOIN user_doctor_info doctor ON u.ID = doctor.ACCOUNT_ID AND doctor.ORGANIZATION_ID = org.ID
);


-- 2020/11/03 消息中心相关表重构

-- ----------------------------
-- Table structure for message_catalog
-- ----------------------------
DROP TABLE IF EXISTS `message_catalog`;
CREATE TABLE `message_catalog` (
`ID`  bigint(20) NOT NULL COMMENT '主键' ,
`APP_ID`  bigint(20) NULL DEFAULT NULL COMMENT '应用ID' ,
`MESSAGE_TYPE`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '消息类型（0：平台消息，1：业务消息，2：站内消息）' ,
`MESSAGE_LEVEL`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '消息级别（0：一般；1：警告；2：紧急）' ,
`NAME`  varchar(200)  NOT NULL COMMENT '消息分类名称' ,
`ACTIVE`  tinyint(1)  DEFAULT 1 COMMENT '是否有效（0：无，1：有）' ,
`DELETED`  tinyint(1)  DEFAULT 0 COMMENT '是否删除（1:删除，0:未删除）' ,
`CREATE_USER_ID`  bigint(20)  DEFAULT NULL COMMENT '创建人ID' ,
`CREATE_DATETIME`  datetime  DEFAULT NULL COMMENT '创建时间' ,
`MODIFY_USER_ID`  bigint(20)  DEFAULT NULL COMMENT '修改人ID' ,
`MODIFY_DATETIME`  datetime  DEFAULT NULL COMMENT '修改时间' ,
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息分类表';

-- ----------------------------
-- Table structure for message_content
-- ----------------------------
DROP TABLE IF EXISTS `message_content`;
CREATE TABLE `message_content` (
`ID`  bigint(20) NOT NULL COMMENT '主键 Message_ID' ,
`MESSAGE_CATALOG_ID`  bigint(20) NOT NULL COMMENT '消息分类ID' ,
`MESSAGE_TITLE`  varchar(255)  NOT NULL COMMENT '消息标题' ,
`MESSAGE_TEXT`  text  NOT NULL COMMENT '消息正文' ,
`ACTIVE`  tinyint(1)  DEFAULT 1 COMMENT '是否有效（0：无，1：有）' ,
`DELETED`  tinyint(1)  DEFAULT 0 COMMENT '是否删除（1:删除，0:未删除）' ,
`CREATE_USER_ID`  bigint(20)  DEFAULT NULL COMMENT '创建人ID' ,
`CREATE_DATETIME`  datetime  DEFAULT NULL COMMENT '创建时间' ,
`MODIFY_USER_ID`  bigint(20)  DEFAULT NULL COMMENT '修改人ID' ,
`MODIFY_DATETIME`  datetime  DEFAULT NULL COMMENT '修改时间' ,
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息主体正文表';

-- ----------------------------
-- Table structure for message_inbox
-- ----------------------------
DROP TABLE IF EXISTS `message_inbox`;
CREATE TABLE `message_inbox` (
`ID`  bigint(20) NOT NULL COMMENT '主键' ,
`USER_ACCOUNT_ID`  bigint(20) NOT NULL COMMENT '用户ID' ,
`MESSAGE_ID`  bigint(20) NOT NULL COMMENT '消息ID' ,
`MESSAGE_STATUS`  tinyint(1)  DEFAULT 0 COMMENT '消息状态（0：未读，1：已读）' ,
`MESSAGE_CREATE_DATETIME`  datetime NOT NULL COMMENT '消息创建时间' ,
`RECEIVE_DATETIME`  datetime NOT NULL COMMENT '接收消息时间' ,
`TENANT_ID`  bigint(20) NULL DEFAULT NULL COMMENT '租户ID，站内消息所属租户' ,
`ACTIVE`  tinyint(1)  DEFAULT 1 COMMENT '是否有效（0：无，1：有）' ,
`DELETED`  tinyint(1)  DEFAULT 0 COMMENT '是否删除（1:删除，0:未删除）' ,
`CREATE_USER_ID`  bigint(20)  DEFAULT NULL COMMENT '创建人ID' ,
`CREATE_DATETIME`  datetime  DEFAULT NULL COMMENT '创建时间' ,
`MODIFY_USER_ID`  bigint(20)  DEFAULT NULL COMMENT '修改人ID' ,
`MODIFY_DATETIME`  datetime  DEFAULT NULL COMMENT '修改时间' ,
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收件箱表';
-- ----------------------------
-- Table structure for message_outbox
-- ----------------------------
DROP TABLE IF EXISTS `message_outbox`;
CREATE TABLE `message_outbox` (
`ID`  bigint(20) NOT NULL COMMENT '主键' ,
`MESSAGE_ID`  bigint(20) NOT NULL COMMENT '消息ID' ,
`RECEIVER_TYPE`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '消息接收对象类型（0：全部，1：用户；2：租户，3：机构，4：部门）' ,
`RECEIVER_ID_LIST`  varchar(500)  NOT NULL COMMENT '消息接收对象ID集合，用逗号分隔' ,
`PUSH_METHOD`  varchar(10)  NOT NULL DEFAULT '0' COMMENT '接收消息形式（0：线上，1：邮箱，2：手机；3：微信）' ,
`TENANT_ID`  bigint(20)  DEFAULT NULL COMMENT '租户ID，站内消息所属租户' ,
`ACTIVE`  tinyint(1)  DEFAULT 1 COMMENT '是否有效（0：无，1：有）' ,
`DELETED`  tinyint(1)  DEFAULT 0 COMMENT '是否删除（1:删除，0:未删除）' ,
`CREATE_USER_ID`  bigint(20)  DEFAULT NULL COMMENT '创建人ID' ,
`CREATE_DATETIME`  datetime  DEFAULT NULL COMMENT '创建时间' ,
`MODIFY_USER_ID`  bigint(20)  DEFAULT NULL COMMENT '修改人ID' ,
`MODIFY_DATETIME`  datetime  DEFAULT NULL COMMENT '修改时间' ,
PRIMARY KEY (`ID`),
INDEX `MESSAGE_ID` (`MESSAGE_ID`) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发件箱表';



-- 2020/11/09 机构表结构修改（添加机构来源字段）
ALTER TABLE `org_organization`
ADD COLUMN `SOURCE_TYPE`  tinyint(1) NULL DEFAULT 0 COMMENT '机构来源（0:自定义；1:系统创建）' AFTER `DESCRIPTION`;


-- ----------------------------
-- 2020-11-10 add column UNIQUE_ID on table user_account_social
-- ----------------------------
ALTER TABLE user_account_social ADD COLUMN `UNIQUE_ID` varchar(128) DEFAULT NULL COMMENT '第三方账号唯一标识';


-- 2020/11/12 新增平台配置表与用户意见表
-- ----------------------------
-- Table structure for platform_config
-- ----------------------------
DROP TABLE IF EXISTS `platform_config`;
CREATE TABLE `platform_config` (
`ID`  bigint(20) NOT NULL COMMENT '主键' ,
`CONFIG_NAME`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置名称' ,
`CONFIG_DETAIL`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置详情' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Table structure for user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE `user_feedback` (
`ID`  bigint(20) NOT NULL COMMENT '主键' ,
`ACCOUNT_ID`  bigint(20) NOT NULL COMMENT '用户ID' ,
`TENANT_ID`  bigint(20) NOT NULL COMMENT '租户ID' ,
`FEEDBACK_TYPE`  tinyint(1) NOT NULL COMMENT '意见类型（0：FEATURE_SUGGESTION （功能建议）；1：USER_EXPERIENCE（用户体验）；2：PRODUCT_DEFECTS（产品缺陷）；3：OTHER（其他））' ,
`TITLE`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题' ,
`DETAIL`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '意见详细内容' ,
`ACTIVE`  tinyint(1) NULL DEFAULT 1 COMMENT '是否有效（0:无效, 1:有效）' ,
`DELETED`  tinyint(1) NULL DEFAULT 0 COMMENT '是否删除（0:未删除, 1:删除）' ,
`CREATE_USER_ID`  bigint(20) NULL DEFAULT NULL COMMENT '创建人ID' ,
`CREATE_DATETIME`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`MODIFY_USER_ID`  bigint(20) NULL DEFAULT NULL COMMENT '修改人ID' ,
`MODIFY_DATETIME`  datetime NULL DEFAULT NULL COMMENT '修改时间' ,
`VERSION`  int(11) NULL DEFAULT 1 COMMENT '版本号' ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户意见反馈';

-- 2020/11/13  新增平台配置内置数据(400)
INSERT INTO `platform_config` (`ID`, `CONFIG_NAME`, `CONFIG_DETAIL`) VALUES ('1326897725574856706', 'ConsultingTelephone', '{\"logo\":\"909a0ae12b8f4fc6a8504437f6b70c1b\",\"name\":\"全国免费咨询电话\",\"phoneNo\":\"400800123\"}');

-- 2020/11/13 add column EXTENDED_FIELD on table app_client
ALTER TABLE app_client ADD COLUMN `EXTENDED_FIELD` varchar(400) DEFAULT NULL COMMENT 'Token 扩展字段';

UPDATE app_client SET EXTENDED_FIELD = '{"Chatbot-front":"4110810540140478010","library-portal-web":"4110810540140478014","library-admin-web":"4110810540140478016","solar-web":"4110810574500216630"}'
WHERE CLIENT_ID = 'wechat-drawboard-web';

-- ----------------------------
-- 2020-11-10 add permission '租户成员加入申请'
-- ----------------------------
INSERT INTO `permission` (`ID`, `NAME`, `CODE`, `URL`, `DESCRIPTION`, `ICO`, `PARENT_ID`, `APP_CLIENT_ID`, `ACTIVE`, `DELETED`, `CREATE_USER_ID`, `CREATE_DATETIME`, `MODIFY_USER_ID`, `MODIFY_DATETIME`, `VERSION`) VALUES ('1328894150234845185', '租户成员加入申请', 'P01010203', '', '租户成员加入申请', '', '1303259418063224833', '4042053130253308208', '1', '0', '4042053130253308199', '2020-09-08 13:08:43', '4042053130253308199', '2020-09-08 13:08:43', '1');
INSERT INTO `role_permission` (`ID`, `ROLE_ID`, `PERMISSION_ID`, `ACTIVE`, `DELETED`, `CREATE_USER_ID`, `CREATE_DATETIME`, `MODIFY_USER_ID`, `MODIFY_DATETIME`, `VERSION`) VALUES ('1328894150234845282', '1300815585496993793', '1303261271123505154', '1', '0', '4042053130253308199', '2020-09-08 13:08:43', '4042053130253308199', '2020-09-08 13:08:43', '1');


