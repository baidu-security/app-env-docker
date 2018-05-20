#!/bin/bash

# 使用 openrasp-buildenv/java6
# 下载源代码
git clone https://github.com/apache/shiro.git
cd shiro
git checkout shiro-root-1.2.4
cd samples/web

# 修改 pom.xml，手动给 jstl 增加版本号，否则各种出错
# <version>1.2</version>

