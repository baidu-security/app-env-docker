#!/bin/bash

version=${1:-latest}
shift

echo '[-] Download and install rasp-php'
rm -rf /tmp/rasp-*
curl "https://packages.baidu.com/app/openrasp/release/${version}/rasp-php-linux.tar.bz2" -o - | tar -xjf - -C /tmp

cd /tmp/rasp-*
php install.php -d /opt/rasp "$@"

curl https://packages.baidu.com/app/openrasp/999-event-logger.js -o /opt/rasp/plugins/999-event-logger.js
apachectl -k restart

