# docker 测试环境 - 自动化代理方案

我们希望能够通过一个统一的域名，来访问所有的容器，比如

* discuz72.docker.openrasp.com
* activemq50.docker.openrasp.com
* ...

市面上常用的方案，是通过不同的子网IP来访问，需要修改本机 DNS 服务器地址，感觉不太安全。这个项目采用了一个新的方案，即使用修改过的 socks5 代理，根据子域名来实现自动化的请求转发。

比如，我们目前运行着如下镜像:

```
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS              PORTS               NAMES
3be0ad27deaf        openrasp/tomcat7.0      "/bin/bash /root/sta…"   37 minutes ago      Up 37 minutes       80/tcp, 10001/tcp   nervous_colden
8c96b0486f4b        openrasp/joomla:3.8.3   "/bin/bash /root/sta…"   About an hour ago   Up About an hour    80/tcp              vigilant_wozniak
4f5968e8da6d        openrasp/php5.4         "/bin/bash /root/sta…"   2 hours ago         Up 2 hours          80/tcp              cranky_mccarthy
```

当你访问 `nervous_colden.192.168.154.200.xip.io` 时，这个代理服务会提取你的目标镜像名，即 `nervous_colden`。然后调用 docker HTTP API 查询这个名字对应的IP。如果查到了，就修改 socks5 请求，让你的请求转发到这个IP去。转发的事后不修改你的目标端口，这样就可以实现全端口的转发。

为了实现这个，我们需要一个简单的管理界面（3081 端口），以及 socks5 代理服务（3080 端口），具体请看 golang 代码。

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

3. 编译，并启动本服务，e.g 

   ```
   GOPATH=$PWD go build -o /tmp/docker-socks5
   /tmp/docker-socks5
   ```

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

5. 对于非HTTP协议的，可以使用 `proxychains-ng` 访问，e.g

   ```
   %> cat ubuntu.conf
   strict_chain
   proxy_dns
   remote_dns_subnet 224
   tcp_read_time_out 15000
   tcp_connect_time_out 8000
   [ProxyList]
   socks5 192.168.154.200 3080

   %> proxychains -f ubuntu.conf java -cp /pentest/java/ysoserial.jar ysoserial.exploit.RMIRegistryExploit nostalgic_goldwasser.192.168.154.200.xip.io 10001 Groovy1 "cp /etc/passwd /tmp"
   ```

## 截图

主界面 - 镜像列表页面

![screen](contrib/screenshot.jpg)

应用界面 - 点击主页面的端口号进入

![screen](contrib/app.jpg)

非 HTTP 接口使用方法 - Java RMI 漏洞远程利用

![screen](contrib/proxychains.jpg)



