# app-env-docker

基于Docker，真实应用测试环境。我们构建这个仓库是为了快速测试大量漏洞，并补充到 [CVE 漏洞覆盖说明](https://rasp.baidu.com/doc/usage/cve.html) 列表里。欢迎大家提交 pull request~

## 使用方法

构建基础镜像

```
cd base/php5.4
docker build -t openrasp/php:5.4 .
```

构建应用镜像，e.g

```
cd zzcms/8.2
docker build -t openrasp/zzcms:8.2 .
```

## 添加新的应用环境

请参考以下步骤来执行，

1. 在 `CentOS 7` 虚拟机内安装这个应用
2. 使用 `diff` 找出安装前后的不同之处，比如多了一个 config.php、install.lock
3. 使用 `mysqldump` 保存数据库内容
4. 参考 [zzcms/8.2/Dockerfile](zzcms/8.2/Dockerfile) 编写 Dockerfile

## Poc 列表

请参考 [exploits.md](exploits.md)

