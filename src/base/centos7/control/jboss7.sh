#!/bin/bash

export JAVA_HOME=/jdk/

jboss_base=/jboss/
chmod +x "$jboss_base"/bin/*.sh

case "$1" in
    start)
        echo '[-] Starting JBoss server'
        echo ' -  Logging to /var/log/jboss.log'
        nohup bash "$jboss_base"/bin/standalone.sh -b 0.0.0.0 &> /var/log/jboss.log &

        echo '[-] Waiting for JBoss server to start'
        while true
        do
            curl -I 127.0.0.1:80 &>/dev/null && break
            sleep 1
        done
    ;;
    stop)
        bash "$jboss_base"/bin/jboss-cli.sh --connect command=:shutdown
    ;;
    restart)
		$0 stop
		$0 start
	;;
    *)
		echo Unknown action: $1
	;;

esac
