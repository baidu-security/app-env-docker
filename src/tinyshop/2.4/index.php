<?php
//应用目录，为了程序的更好应用与开发。
define("APP_ROOT",dirname(__file__).DIRECTORY_SEPARATOR);
//引入框架文件

include("framework/tiny.php");

//加载配制文件
$configPath = "protected/config/config.php";
$config = is_file($configPath)?include($configPath):null;
//运行应用程序

Tiny::createWebApp($config)->run();
?>