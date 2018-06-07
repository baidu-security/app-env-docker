## 环境说明

* src/phpcms/9.6.0 , 9.6.1 , 9.6.2

  * 管理员账号

    admin/admin123

  * 后台地址

    http://172.17.0.2/index.php?m=admin&c=index&a=login

## PHPCMS v9.6.0 sql注入漏洞

测试镜像

- src/phpcms/9.6.0

影响版本

- phpcms = 9.6.0

参考链接

- [phpcms_v9.6.0_sql注入与exp](https://zhuanlan.zhihu.com/p/26263513)

Poc

执行测试脚本：

```
sql注入漏洞/sqli-exp.py
```

测试成功会返回存在sql注入漏洞



## PHPCMS v9.6.0 文件上传漏洞

测试镜像

- src/phpcms/9.6.0

影响版本

- phpcms = 9.6.0

参考链接

- [PHPCMS v9.6.0 任意文件上传漏洞分析](https://www.anquanke.com/post/id/85879)

Poc

测试环境在web根目录下添加了shell.txt作为下载的目标文件，执行测试脚本：

```
文件上传漏洞/upload-exp.py
```

上传成功会返回上传文件的地址

## PHPCMS v9.6.1 任意文件下载漏洞

测试镜像

- src/phpcms/9.6.1

影响版本

- phpcms = 9.6.1

参考链接

- [PHPCMS V9.6.1 任意文件读取漏洞分析](https://www.anquanke.com/post/id/86007)

Poc

执行测试脚本：

```
任意文件下载漏洞/download-exp.py
```

上成功会返回下载文件（/etc/passwd）内容



## PHPCMS v9.6.2 文件读取漏洞

测试镜像

* src/phpcms/9.6.2

影响版本

* phpcms = 9.6.2/9.6.1

参考链接

* [PHPCMS v9.6.2 任意文件读取漏洞（最新版本补丁可绕过）](http://www.lybbn.cn/data/datas.php?yw=176)

Poc

执行测试脚本：

```
任意文件下载漏洞/download-exp.py
```

上成功会返回下载文件（/etc/passwd）内容

