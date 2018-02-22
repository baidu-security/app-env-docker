<?php

/*
	[Discuz!] (C)2001-2006 Comsenz Inc.
	This is NOT a freeware, use is subject to license terms

	$RCSfile: config5.inc.php,v $
	$Revision: 1.9 $
	$Date: 2007/01/26 01:11:32 $
*/

// [CH] 以下变量请根据空间商提供的账号参数修改,如有疑问,请联系服务器提供商

	$dbhost = 'localhost';			// 数据库服务器
	$dbuser = 'root';			// 数据库用户名
	$dbpw = '';				// 数据库密码
	$dbname = 'discuz';			// 数据库名
	$pconnect = 0;				// 数据库持久连接 0=关闭, 1=打开

// [CH] Mysql 辅助服务器设置，只有当您拥有多个 Mysql 服务器且协同工作时请进行设置

	$multiserver = array();			// 服务器变量初始化，请勿修改或删除
	
// [CH] 如您对 cookie 作用范围有特殊要求, 或论坛登录不正常, 请修改下面变量, 否则请保持默认

	$cookiepre = 'ZD4_';			// cookie 前缀
	$cookiedomain = ''; 			// cookie 作用域
	$cookiepath = '/';			// cookie 作用路径

// [CH] 论坛投入使用后不能修改的变量

	$tablepre = 'cdb_';   			// 表名前缀, 同一数据库安装多个论坛请修改此处

// [CH] 小心修改以下变量, 否则可能导致论坛无法正常使用

	$database = 'mysql';			// 论坛数据库类型，请勿修改
	$dbcharset = '';			// MySQL 字符集, 可选 'gbk', 'big5', 'utf8', 'latin1', 留空为按照论坛字符集设定

	$charset = 'utf-8';			// 论坛页面默认字符集, 可选 'gbk', 'big5', 'utf-8'
	$headercharset = 0;			// 强制论坛页面使用默认字符集，可避免部分服务器空间页面出现乱码，一般无需开启。 0=关闭 1= 开启

	$tplrefresh = 1;			// 论坛风格模板自动刷新开关 0=关闭, 1=打开。

// [CH] 论坛安全设置, 调整以下设置，可以增强论坛的安全性能和防御性能

	$adminemail = 'admin@your.com';		// 系统管理员 Email

	$forumfounders = '1';			// 论坛创始人 UID, 可以支持多个创始人，之间使用 “,” 分隔。[出于安全考虑，请务必设置一名管理员为创始人]
						// 论坛创始人可对其他管理员进行设置。如果不设置论坛创始人，则论坛管理员之间权利平等。

	$dbreport = 0;				// 论坛出现数据库错误时，是否通过 email 发送错误报告给系统管理员

	$errorreport = 1;			// 是否屏蔽程序错误信息, 0=屏蔽所有错误(安全) 1=报告给管理员和版主(安全) 2=报告给任何人

	$attackevasive = 0;			// 论坛防御级别，可防止大量的非正常请求造成的拒绝服务攻击
						// 防护大量非正常请求造成的拒绝服务攻击,
						// 0=关闭, 1=cookie 刷新限制, 2=限制代理访问, 4=二次请求, 8=回答问题（第一次访问时需要回答问题）
						// 组合为: 1|2, 1|4, 2|8, 1|2|4...
	
	$urlxssdefend = 1;			// 论坛访问页面防御开关，可避免用户通过非法的url地址对本站用户造成危害，建议打开。1=打开 0关闭

	$admincp = array();
	$admincp['forcesecques'] = 0;		// 管理人员必须设置安全提问才能进入系统设置, 0=否, 1=是[安全]
	$admincp['checkip'] = 1;		// 后台管理操作是否验证管理员的 IP, 1=是[安全], 0=否。仅在管理员无法登陆后台时设置 0。
	$admincp['tpledit'] = 0;		// 是否允许在线编辑论坛模板 1=是 0=否[安全]
	$admincp['runquery'] = 1;		// 是否允许后台运行 SQL 语句 1=是 0=否[安全]
	$admincp['dbimport'] = 1;		// 是否允许后台恢复论坛数据  1=是 0=否[安全]

// ============================================================================
define('UC_CONNECT', 'mysql');
define('UC_DBHOST', 'localhost');
define('UC_DBUSER', 'root');
define('UC_DBPW', '');
define('UC_DBNAME', 'discuz');
define('UC_DBCHARSET', 'utf8');
define('UC_DBTABLEPRE', '`discuz`.cdb_uc_');
define('UC_DBCONNECT', '0');
define('UC_KEY', 'peE474eeS6G7oaw9H9reK299H6TfSeBaLa3f5dO0Jdn6v1zbY3TeycL8kdE2ub19');
define('UC_API', 'http://centos7/uc_server');
define('UC_CHARSET', 'utf-8');
define('UC_IP', '127.0.0.1');
define('UC_APPID', '1');
define('UC_PPP', '20');