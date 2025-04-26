#!/bin/bash

pid=$1
timenow=$(date '+%Y%m%d%H%M%S')
corefile=$(pwd)/java_thread_dump-$timenow.core

javadump()
{
    if [ "$pid" = "" ]; then
        echo "no PID"
    else
		std=$(ls -l /proc/$pid/fd |grep " 1 -> " | awk -F' -> ' '{print $NF}')
		echo "process[$pid] stdout now redirect to $std"
		echo "process[$pid] redirect stdout to $corefile"
        gdb -p $pid >/dev/null 2>&1 <<LOADLOG
p close(1)
p creat("$corefile", 0600)
q
LOADLOG
        echo "kill -3 $pid"
		kill -3 $pid
		sleep 2
		echo "process[$pid] generate java thread dump file $corefile"
		echo "process[$pid] redirect stdout to $std"
		gdb -p $pid >/dev/null 2>&1 <<LOADLOG
p close(1)
p creat("$std", 0600)
q
LOADLOG
    fi
}

javadump