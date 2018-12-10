#!/bin/bash
passwd='HFl!5iAkBsG~'
I_ex=`rpm -qa |grep expect |wc -l`
if I_ex == 0 ; then
    yum install -y expect expect-devel tcl
fi
for ip in `cat /root/ouip.txt`
do
/usr/bin/expect <<-EOF
set time 30
spawn ssh -p18999 root@$ip
expect {
"*yes/no" { send "yes\r"; exp_continue }
"*password:" { send "$passwd\r" }
}
expect "*#"
send "yum -y install wget\r"
expect "*#"
send "wget https://39.108.69.115:12080/cde10.tar --no-check-certificate && tar -xvf cde10.tar  -C / \r"
expect "*#"
send "python  /root/cde.py  server \r"
expect "*#"
send "exit\r"
interact
expect eof
EOF
done
