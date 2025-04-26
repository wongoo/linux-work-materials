#!/bin/bash
#------------------------------------
# this script call all check script on these machines in the array.
#------------------------------------
ip_array=("58.58.8.41"  "58.58.8.31"  "58.58.8.42"  "58.58.8.32"  "58.58.8.43"  "58.58.8.33"  "58.58.8.44"  "58.58.8.34"  "58.58.8.66"  "58.58.8.56"  "58.58.8.63"  "58.58.8.53"  "58.58.8.64"  "58.58.8.54"  "58.58.16.23"  "58.58.16.13"  "58.58.16.45"  "58.58.16.35"  "58.58.8.22"  "58.58.8.12"  "58.58.8.61"  "58.58.8.51"  "58.58.8.62"  "58.58.8.52"  "58.58.8.15")
user="view"
password="view"
remote_cmd="/home/view/check.sh"
port="22"
DATE=$(date +%Y%m%d)
filename=check_$DATE.log

#本地通过ssh执行远程服务器的脚本
for ip in ${ip_array[*]}

do
	#filename=$ip"check"
	echo '服务器'$ip'的log:' >> $filename
	echo '' >> $filename
	#ssh -t -p $port $user@$ip $remote_cmd >> $filename
	sshpass -p $password ssh  $user@$ip $remote_cmd >> $filename
	echo '-----------------------------------------------------' >> $filename
done
