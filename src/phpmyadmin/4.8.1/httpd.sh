#!/bin/bash

case "$1" in
    start)
        echo '[-] Starting Apache'
        apachectl -k start

        echo '[-] Waiting for HTTPD to start'
        while true
        do
            curl -I 127.0.0.1:80 &>/dev/null && break
            sleep 1
        done
    ;;
    stop)
        echo '[-] Stopping Apache'
        apachectl -k stop
    ;;
    reload)
        echo '[-] Reloading Apache'
        apachectl -k reload
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
