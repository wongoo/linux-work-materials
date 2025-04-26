#---------------------------------
# 1. create user <view> on all machines needed to check
# 2. put this script to directory /home/view/check.sh
#---------------------------------
df|awk 'NR==2{print $(NF-1),$NF}'
df|awk 'NR==3{print $(NF-1),$NF}'
df|awk 'NR==5{print $(NF-1),$NF}'
df|awk 'NR==7{print $(NF-1),$NF}'
df|awk 'NR==9{print $(NF-1),$NF}'
free -m | awk 'NR==3{printf "memory Usage:%s/%sMB(%.2f%)\n",$3,$3+$4,$3*100/($3+$4)}'
a=$(top -bn1|awk -F , 'NR==3{print}'|cut -d ' ' -f8|awk -F % '{print $1}')
b=100
c=$(echo "scale=3;$b -$a"|bc)
echo CPU Usage $c%
