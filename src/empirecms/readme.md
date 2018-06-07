## 环境说明

* src/empirecms/7.0

  * 管理员账号

    admin/admin

  * 后台地址

    http://172.17.0.2/admin/admin.php

## EmpireCMS csrf漏洞

测试镜像

- src/empirecms/7.0

影响版本

- empirecms 7.0

参考链接

- [帝国CMS CSRF GetShell](http://www.loner.fm/bugs/bug_detail.php?wybug_id=wooyun-2013-032472)

Poc

使用管理员登录后台，并访问

```
http://172.17.0.2/csrf.html
```

成功则生成文件：

```
http://172.17.0.2/e/admin/myshell.php
```



