# Docker 测试环境 - 自动化代理方案

本工程包含一个改造过的 socks5 代理 (3080 端口），以及一个 HTTP 服务器（3081 端口）

## 使用方法

假设虚拟机的 IP 为 `192.168.154.200`，你需要按照如下步骤使用本代理服务

1. 在虚拟机里安装 docker，并设置监听端口为 `127.0.0.1:2375`，e.g
   
   ```
   ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375
   ```

2. 启动一些你需要的镜像，e.g
   
   ```
   make -C src/base/tomcat7.0
   make -C src/openrasp/php5.3
   ```

3. 编译，并启动本服务，e.g `/tmp/docker-socks5`
4. 在浏览器里配置 `PAC` 脚本，e.g

   ```
   function FindProxyForURL(url, host) {
      ...

      if (host.indexOf('.192.168.154.200.xip.io') != -1) {
         return 'SOCKS5 192.168.154.200:3080';
      }
    
      ...
   }
   ```

4. 使用 `192.168.154.200.xip.io:3081` 访问镜像列表页面

另外，对于非HTTP协议的，可以使用 `proxychains-ng` 访问，e.g

```
strict_chain
proxy_dns
remote_dns_subnet 224
tcp_read_time_out 15000
tcp_connect_time_out 8000
[ProxyList]
socks5 192.168.154.200 3080
```

## 截图

主界面 - 镜像列表页面

![screen](contrib/screenshot.jpg)

应用界面 - 点击主页面的端口号进入

![screen](contrib/app.jpg)

非 HTTP 接口使用方法 - Java RMI 漏洞远程利用

![screen](contrib/proxychains.jpg)



