#!/bin/bash

options="--port 6379"

case "$1" in
    start)
        echo
        echo '[-] Starting Redis'
        echo '    - Logging to /var/log/redis.log'
        nohup redis-server "$options" &> /var/log/redis.log &

        echo
        echo '[-] Waiting for redis to start'
        while true
        do
            redis-cli -h 127.0.0.1 ping 2>/dev/null && break
            sleep 1
        done
    ;;
    stop)
        killall -9 redis-server
    ;;
    restart)
		$0 stop
		$0 start
	;;
    *)
		echo Unknown action: $1
	;;

esac
