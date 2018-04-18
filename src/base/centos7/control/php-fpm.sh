#!/bin/bash

case "$1" in
    start)
        echo '[-] Starting PHP-FPM'
        nohup php-fpm -F &> /var/log/php-fpm.log &
    ;;
    stop)
        echo '[-] Stopping PHP-FPM'
        killall -9 php-fpm
    ;;
    reload)
        echo '[-] Reloading PHP-FPM'
        killall -USR2 php-fpm
    ;;
    restart)
		$0 stop
        sleep 1
		$0 start
	;;
    *)
		echo Unknown action: $1
	;;

esac
