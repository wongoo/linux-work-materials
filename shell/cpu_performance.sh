cpu_mhz=$(cat /proc/cpuinfo |grep "cpu MHz" |tail -1 |cut -c 12-20)
cpu_count=$(cat /proc/cpuinfo |grep processor |wc -l)
cpu_performance=$(echo "$cpu_mhz*$cpu_count" |bc)
echo "CPU PERFORMANCE: $(hostname) => $cpu_performance"