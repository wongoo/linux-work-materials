#!/bin/bash

pid=$1

javadump()
{
    timenow=$(date '+%Y%m%d%H%M%S')
    corefile=/tmp/java_thread_dump-$timenow.core
    if [ "$pid" = "" ]; then
        echo "no PID"
    else
		std=$(ls -l /proc/$pid/fd |grep " 1 -> " | awk -F' -> ' '{print $NF}')
		echo "process[$pid] stdout now redirect to $std"
		if [ "$std" == "/dev/null" ]; then
			echo "process[$pid] redirect stdout to $corefile"
			gdb -p $pid >/dev/null 2>&1 <<LOADLOG
p close(1)
p creat("$corefile", 0600)
q
LOADLOG
		fi

		for i in {1..5}
		do
				echo "kill -3 $pid"
			kill -3 $pid
			echo "sleep 5"
			sleep 5
		done

		if [ "$std" == "/dev/null" ]; then
			echo "process[$pid] generate java thread dump file $corefile"
			echo "process[$pid] redirect stdout to $std"
			gdb -p $pid >/dev/null 2>&1 <<LOADLOG
p close(1)
p creat("$std", 0600)
q
LOADLOG
		fi
    fi
}

javadump
