### xor 弱加密漏洞

测试镜像

* src/codeignitor/2.1.4/

说明

> 在CI 2.1.4及以前的版本中，存在一个弱加密漏洞，如果目标环境中没有安装Mcrypt扩展，则CI会使用一个相对比较弱的加密方式来处理session

参考资料

* [CODEIGNITER SESSION DECODING VULNERABILITY](https://www.dionach.com/blog/codeigniter-session-decoding-vulnerability)
* [CodeIgniter <=2.1.4 session cookie decryption vulnerability](https://github.com/Dionach/CodeIgniterXor)
* [客户端 session 导致的安全问题](https://paper.seebug.org/550/)

Poc

```
python breakkey.py http://127.0.0.1/news/show/1
```

