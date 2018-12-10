#!/bin/bash
passwd='HFl!5iAkBsG~'
yum install -y expect expect-devel tcl
for ip in `cat /root/inip.txt`
do
/usr/bin/expect <<-EOF
set time 30
spawn ssh -p18999 root@$ip
expect {
"*yes/no" { send "yes\r"; exp_continue }
"*password:" { send "$passwd\r" }
}
expect "*#"
send "ls\r"
expect "*#"
send "ip a\r"
expect "*#"
send "exit\r"
interact
expect eof
EOF
done
