#!/bin/bash
##


#P_port="7800"
#P_pass="burgess70qkK"

## 0 is oK  1 is error
#function master_ping {    
#    /work/redis/redis_master/src/redis-cli -a burgess70qkK -h 172.16.129.192 -p 7800 ping 2>/dev/null
    m_redis=`/work/redis/redis_master/src/redis-cli -a burgess70qkK -h 172.16.129.192 -p 7800 ping > /work/zabbix/shell/redis/master_ping.txt`
    c_mredis=`cat master_ping.txt`
    if [ "$c_mredis" == "PONG" ];then
        echo "0"
    else
        echo "1"
    fi
#}

## 0 is oK  1 is error
#function slave_ping {
#    /work/redis/redis_master/src/redis-cli -a burgess70qkK -h 172.16.129.192 -p 7800 ping 2>/dev/null
    s_redis=`/work/redis/redis_master/src/redis-cli -a burgess70qkK -h 172.16.129.191 -p 7811 ping > /work/zabbix/shell/redis/slave_ping.txt`
    c_mredis=`cat lave_ping.txt`
    if [ "$c_sredis" == "PONG" ];then
        echo "0"
    else
        echo "1"
    fi
#}


#function master_clients {
#    connected_clients=`/work/redis/redis_master/src/redis-cli -a burgess70qkK -h 172.16.129.192 -p 7800 info clients |grep connected_clients |awk -F ':' '{print $2}' 1>/dev/null`
    connected_clients=`/work/redis/redis_master/src/redis-cli -a burgess70qkK -h 172.16.129.192 -p 7800 info clients |grep connected_clients |awk -F ':' '{print $2}' > /work/zabbix/shell/redis/master_clients.txt`
    cat /work/zabbix/shell/redis/master_clients.txt
#    if [ ]
#        echo $connected_clients
#}


#function slave_clients {
#    connected_clients=`/work/redis/redis_master/src/redis-cli -a burgess70qkK -h 172.16.129.192 -p 7800 info clients |grep connected_clients |awk -F ':' '{print $2}' 1>/dev/null`
    connected_clients=`/work/redis/redis_master/src/redis-cli -a burgess70qkK -h 172.16.129.191 -p 7811 info clients |grep connected_clients |awk -F ':' '{print $2}' > /work/zabbix/shell/redis/slave_clients.txt`
    cat /work/zabbix/shell/redis/slave_clients.txt
#    if [ ]
#        echo $connected_clients
#}


##
$1
