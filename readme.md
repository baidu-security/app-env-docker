# app-env-docker

基于 Docker，真实应用测试环境。我们构建这个仓库是为了快速测试大量漏洞，并补充到 [CVE 漏洞覆盖说明](https://rasp.baidu.com/doc/usage/cve.html) 列表里。欢迎大家提交 pull request~

至于本仓库的 Poc 列表，请查看 [exploits.md](exploits.md)

## 使用方法

构建所有基础镜像，`PHP`、`Java`、`NodeJS` etc.

```
make -C src/base/
```

构建所有镜像 - 非必须

```
make -C src
```

构建，并启动指定应用，e.g

```
make -C src/zzcms/8.2
```

启动后，会直接进入一个 bash shell，可以使用 curl 测试应用是否正常，e.g

```
[ubuntu-server: /share/docker]
# make -C src/seacms/6.45/
make: Entering directory '/share/docker/src/seacms/6.45'
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
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[-] Starting MariaDB
[-] Waiting for MySQL to start ...
[-] Accessing 127.0.0.1 for the first time
[-] Dropping shell
[root@4d12c4920c80 /]#
```

大部分情况下，后台密码都是 `admin:admin`

## 添加新的应用环境

请参考以下步骤来执行，

1. 使用 `CentOS 7` 虚拟机内安装这个应用
2. 使用 `diff` 找出安装前后的不同之处，比如多了一个 `config.php`、`install.lock`
3. 打包 MySQL 数据库
   * 对于 MyIASM，打包指定文件夹，e.g `/var/lib/mysql/joomla`
   * 对于 InnoDB，需要同时打包 `/var/lib/mysql/ib*`
4. 参考 [src/zzcms/8.2/Dockerfile](src/zzcms/8.2/Dockerfile) 编写 Dockerfile，写好注释
5. 测试没问题后，提交 pull request

