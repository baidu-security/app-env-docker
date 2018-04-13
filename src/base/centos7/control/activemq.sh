#!/bin/bash

export JAVA_HOME=/jdk

case "$1" in
    start)
        echo '[-] Starting Apache ActiveMQ'
        /activemq/bin/activemq start

        echo '[-] Waiting for ActiveMQ to start'
        while true
        do
            curl -I 127.0.0.1:80 2>/dev/null && break
            sleep 1
        done
    ;;
    stop)
        /activemq/bin/activemq stop
    ;;
    restart)
		$0 stop
		$0 start
	;;
    *)
		echo Unknown action: $1
	;;

esac
