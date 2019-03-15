#!/bin/bash

export JAVA_HOME=/jdk/

control=/resin/bin/httpd.sh
if [[ ! -f "$control" ]]; then
    control=/resin/bin/resin.sh
fi

case "$1" in
    start)
        echo '[-] Starting Resin server'
        echo ' -  Logging to /var/log/resin.log'
        nohup bash "$control" start &> /var/log/resin.log &

        echo '[-] Waiting for Resin server to start'
        while true
        do
            curl -I 127.0.0.1:80 &>/dev/null && break
            sleep 1
        done
    ;;
    stop)
        bash "$control" stop
    ;;
    restart)
		$0 stop
		$0 start
	;;
    *)
		echo Unknown action: $1
	;;

esac
