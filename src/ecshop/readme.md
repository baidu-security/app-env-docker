## 环境说明

* src/ecshop/3.0.0

  * 后台地址

    http://172.17.0.2/admin/privilege.php?act=login

  * 管理员账号

    admin/admin123

  * 去除补丁

    删除了./flow.php line 2137的intval函数，用于复现前一版本的SQL注入漏洞



## ECShop3.0.0 SQL注入漏洞

测试镜像

* src/ecshop/3.0.0

影响版本

* ECShop 3.0.0 <  Release0906

参考链接

* [ECShop v3.0 渗透实例](https://www.bodkin.ren/index.php/archives/6/)

Poc

执行脚本：

```shell
python SQL注入漏洞/sqli-exp.py -u http://172.17.0.2/
```

测试成功会返回succeed

