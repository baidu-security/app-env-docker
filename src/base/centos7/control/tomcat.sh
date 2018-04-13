#!/bin/bash

tomcat_base=/tomcat/
chmod +x "$tomcat_base"/bin/*.sh

case "$1" in
    start)
		echo '[-] Starting Tomcat'
        "$tomcat_base"/bin/startup.sh

        echo '[-] Waiting for Tomcat to start'
		while true
		do
			curl -I 127.0.0.1:80 2>/dev/null && break
			sleep 1
		done
    ;;
    stop)
		echo '[-] Stopping Tomcat'
        "$tomcat_base"/bin/shutdown.sh
    ;;
    restart)
		$0 stop
		$0 start
	;;
    *)
		echo Unknown action: $1
	;;

esac
