<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>OpenRASP Java 版本 - 测试用例目录</title>
  <link rel="stylesheet" href="https://packages.baidu.com/bootswatch/3/cosmo/bootstrap.min.css" media="screen">
  <style>

  </style>
</head>

<body>
  <div ng-app="myapp" ng-controller="main">
	<div class="container" id="main">
		<div class="row">
			<div class="col-xs-12 col-sm-8 col-sm-offset-2">
				<h1 class="text-center page-header">OpenRASP Java 版本 - 测试用例目录</h1>
                <br/>
				<a href="/vulns/" class="btn btn-primary btn-lg btn-block" target="_blank">OWASP TOP 10 - 常见弱点测试用例</a>
				<br>
				<a href="/fastjson/" class="btn btn-primary btn-lg btn-block" target="_blank">Fastjson 反序列化漏洞测试</a>
				<a href="/fastjson-1.2.60/" class="btn btn-primary btn-lg btn-block" target="_blank">Fastjson 1.2.60 反序列化漏洞测试</a>
				<br>
				<a href="/S2-016/" class="btn btn-primary btn-lg btn-block" target="_blank">S2-016 - Struts 系列漏洞测试</a>
				<br>
				<a href="/wxpay-xxe/" class="btn btn-primary btn-lg btn-block" target="_blank">微信SDK XXE漏洞测试</a>
				<br>				
				<a href="/webdav-demo/" class="btn btn-primary btn-lg btn-block" target="_blank">WebDAV 测试环境</a>
				<br>					
			</div>
		</div>
	</div>
  </div> 

</body>
<!-- design, implemented by c0debreak -->
</html>