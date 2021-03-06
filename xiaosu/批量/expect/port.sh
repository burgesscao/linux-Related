#!/bin/bash
##
##


Aa=`cat /etc/rc.d/rc.local |grep PREROUTING | awk '{print $9}'| cut -d ":" -f 1 |sed -n '1p'`
#echo $Aa
Bb=$[$Aa-2]
#echo $Bb
Cc=7000
iptables -t nat -F
In=`cat /etc/rc.d/rc.local |grep POSTROUTING |awk '{print $9}'|sed -n '1p'`
Ou=`cat /etc/rc.d/rc.local |grep POSTROUTING |awk '{print $15}'|sed -n '1p'`

sed -i "s@\(.*nat.*\)@#\1@" /etc/rc.d/rc.local
for((Nu=0;Nu<17;Nu++))
do
Bb=$[$Aa+$Nu]
Dc=$[$Cc+$Nu]
iptables -t nat -A PREROUTING -p tcp --dport $Bb -j DNAT --to-destination $In:$Dc
iptables -t nat -A PREROUTING -p udp --dport $Bb -j DNAT --to-destination $In:$Dc
iptables -t nat -A POSTROUTING -p tcp -d $In --dport $Dc -j SNAT --to-source  $Ou
iptables -t nat -A POSTROUTING -p udp -d $In --dport $Dc -j SNAT --to-source  $Ou

echo "iptables -t nat -A PREROUTING -p tcp --dport $Bb -j DNAT --to-destination $In:$Cc" >> /etc/rc.d/rc.local
echo "iptables -t nat -A PREROUTING -p udp --dport $Bb -j DNAT --to-destination $In:$Cc" >> /etc/rc.d/rc.local
echo "iptables -t nat -A POSTROUTING -p tcp -d $In --dport $Dc -j SNAT --to-source  $Ou" >> /etc/rc.d/rc.local
echo "iptables -t nat -A POSTROUTING -p udp -d $In --dport $Dc -j SNAT --to-source  $Ou" >> /etc/rc.d/rc.local

done

iptables -t nat -L -n -v
