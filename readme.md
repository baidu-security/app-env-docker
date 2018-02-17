# app-env-docker

基于Docker，真实应用测试环境。我们构建这个仓库是为了快速测试大量漏洞，并补充到 [CVE 漏洞覆盖说明](https://rasp.baidu.com/doc/usage/cve.html) 列表里。欢迎大家提交 pull request~

至于本仓库的 Poc 列表，请查看 [exploits.md](exploits.md)

## 使用方法

构建基础镜像，e.g

```
make -C src/base/php5.4
```

构建，并启动指定应用，e.g

```
make -C src/zzcms/8.2
```

启动后，会直接进入一个 bash shell，可以使用 curl 测试应用是否正常，e.g

```
# make -C src/typecho/1.1/
make: Entering directory '/mnt/hgfs/share/docker/src/typecho/1.1'
docker build -t openrasp/typecho:1.1 .
Sending build context to Docker daemon 3.072 kB
Step 1/9 : FROM openrasp/php:5.4
 ---> 0c8fc9d4a64a
Step 2/9 : MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>
 ---> Using cache
 ---> 57db05e219dc
Step 3/9 : ENV install_url https://packages.baidu.com/app/typecho-v1.1-15.5.12-beta.tar.gz
 ---> Running in 7ba59b52d51f
 ---> 25034d243521
Removing intermediate container 7ba59b52d51f
Step 4/9 : ENV install_path /var/www/html/
 ---> Running in 6b4760c5ac2b
 ---> 87d3f49490d6
Removing intermediate container 6b4760c5ac2b
Step 5/9 : RUN rm -rf "$install_path"
 ---> Running in 76c9159ca7cf
 ---> 8a64f5a0a801
Removing intermediate container 76c9159ca7cf
Step 6/9 : RUN wget $install_url -O /tmp/typecho.tar.gz
 ---> Running in bb41f4142d49
--2018-02-17 09:26:10--  https://packages.baidu.com/app/typecho-v1.1-15.5.12-beta.tar.gz
Resolving packages.baidu.com (packages.baidu.com)... 220.181.57.191
Connecting to packages.baidu.com (packages.baidu.com)|220.181.57.191|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 488233 (477K) [application/octet-stream]
Saving to: '/tmp/typecho.tar.gz'

     0K .......... .......... .......... .......... .......... 10% 86.0K 5s
    50K .......... .......... .......... .......... .......... 20%  161K 3s
   100K .......... .......... .......... .......... .......... 31%  125K 3s
   150K .......... .......... .......... .......... .......... 41% 97.8K 2s
   200K .......... .......... .......... .......... .......... 52% 30.4K 3s
   250K .......... .......... .......... .......... .......... 62% 38.5K 3s
   300K .......... .......... .......... .......... .......... 73%  376K 2s
   350K .......... .......... .......... .......... .......... 83%  721K 1s
   400K .......... .......... .......... .......... .......... 94%  640K 0s
   450K .......... .......... ......                          100%  719K=5.1s

2018-02-17 09:26:17 (94.2 KB/s) - '/tmp/typecho.tar.gz' saved [488233/488233]

 ---> 790f88b92ba0
Removing intermediate container bb41f4142d49
Step 7/9 : RUN tar -xf /tmp/typecho.tar.gz
 ---> Running in aae4780d29ed
 ---> 09d2f1d2cef0
Removing intermediate container aae4780d29ed
Step 8/9 : RUN mv build "$install_path"
 ---> Running in 2eb8464a1115
 ---> abe9a723af21
Removing intermediate container 2eb8464a1115
Step 9/9 : RUN touch "$install_path/config.inc.php"
 ---> Running in ad0001774f5d
 ---> 9c1f81397203
Removing intermediate container ad0001774f5d
Successfully built 9c1f81397203
docker run --rm -it openrasp/typecho:1.1
[-] Starting Apache
Passing arguments to httpd using apachectl is no longer supported.
You can only start/stop/restart httpd using this script.
If you want to pass extra arguments to httpd, edit the
/etc/sysconfig/httpd config file.
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[-] Starting MariaDB
[-] Dropping shell
[root@252681d38c24 /]# exit
make: Leaving directory '/mnt/hgfs/share/docker/src/typecho/1.1'
[ubuntu-server: /share/docker]
# make -C src/zzcms/8.2/
[ubuntu-server: /share/docker]
# make -C src/
base/    discuz/  seacms/  typecho/ zzcms/
[ubuntu-server: /share/docker]
# make -C src/seacms/6.45/
[ubuntu-server: /share/docker]
# make -C src/seacms/6.45/
make: Entering directory '/mnt/hgfs/share/docker/src/seacms/6.45'
docker build -t openrasp/seacms:6.45 .
Sending build context to Docker daemon 23.04 kB
Step 1/14 : FROM openrasp/php:5.4
 ---> 0c8fc9d4a64a

-- 精简掉的内容 --

Step 14/14 : RUN chown mysql -R /var/lib/mysql
 ---> Running in 586aa2f25f15
 ---> 2bc8468709c0
Removing intermediate container 586aa2f25f15
Successfully built 2bc8468709c0
docker run --rm -it openrasp/seacms:6.45
[-] Starting Apache
Passing arguments to httpd using apachectl is no longer supported.
You can only start/stop/restart httpd using this script.
If you want to pass extra arguments to httpd, edit the
/etc/sysconfig/httpd config file.
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[-] Starting MariaDB
[-] Dropping shell
[root@4d12c4920c80 /]#
```

## 添加新的应用环境

请参考以下步骤来执行，

1. 使用 `CentOS 7` 虚拟机内安装这个应用
2. 使用 `diff` 找出安装前后的不同之处，比如多了一个 config.php、install.lock
3. 使用 `mysqldump` 保存数据库内容
4. 参考 [zzcms/8.2/Dockerfile](zzcms/8.2/Dockerfile) 编写 Dockerfile
5. 测试没问题后，提交 pull request

