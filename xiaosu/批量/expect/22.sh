#!/bin/bash
##
##

passwd='DQhE1qMlLd'
## I_ex=`rpm -qa |grep expect |wc -l`
## if [ $I_ex -eq 0 ] ; then
##     yum install -y expect expect-devel tcl
## fi	

for ip in `cat /root/inip.txt`
do
/usr/bin/expect <<-EOF
set time 30
spawn ssh -p12008 root@$ip
expect {
"*yes/no" { send "yes\r"; exp_continue }
"*password:" { send "$passwd\r" }
}
expect "*#"
send "cd /usr/local/src \r"
expect "*#"
send "yum -y install wget\r"
expect "*#"
send "wget 203.95.195.141/cewg.sh --no-check-certificate \r"
expect "*#"
send "bash cewg.sh \r"
expect "*#"
send "exit\r"
interact
expect eof
EOF
done

