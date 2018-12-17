#!/bin/bash
##Burgess
##DXphp-fpm


W_web="dx.tenwincash.com"
W_port="80"
 
# 检测php进程是否存在
function ping {
    ps -ef | grep php-fpm | awk '{ print $9}' |  grep master  | wc -l 
}
# 检测php性能
## 运行时长
function start_since {
    curl 172.16.129.191:8091/cphp_status 2>/dev/null |grep "start since" |awk '{print $3}'
}
## 当前池子接受的请求数
function accepted_conn {
    curl 172.16.129.191:8091/cphp_status 2>/dev/null |grep "accepted conn" |awk '{print $3}'
}
## 请求等待队列，如果这个值不为0，那么要增加FPM的进程数量
function listen_queue {
    curl 172.16.129.191:8091/cphp_status 2>/dev/null |grep "listen queue" |awk '{print $3}' | head -n 1
}
## 请求等待队列最高的数量
function max_listen_queue {
    curl 172.16.129.191:8091/cphp_status 2>/dev/null |grep "max listen queue" |awk '{print $4}'
}
## socket等待队列长度
function listen_queue_len {
    curl 172.16.129.191:8091/cphp_status 2>/dev/null |grep "listen queue len" |awk '{print $4}'
}
## 空闲进程数量
function idle_processes {
    curl 172.16.129.191:8091/cphp_status 2>/dev/null |grep "idle processes" |awk '{print $3}'
}
## 活跃进程数量
function active_processes {
    curl 172.16.129.191:8091/cphp_status 2>/dev/null |grep "active processes" |awk '{print $3}' |head -n 1
}
## 总进程数量
function total_processes {
    curl 172.16.129.191:8091/cphp_status 2>/dev/null |grep "total processes" |awk '{print $3}'
}
## 最大的活跃进程数量（FPM启动开始算）
function max_active_processes {
    curl 172.16.129.191:8091/cphp_status 2>/dev/null |grep "max active processes" |awk '{print $4}'
}
## 进程最大数量限制的次数，如果这个数量不为0，那说明你的最大进程数量太小了，请改大一点
function max_children_reached {
    curl 172.16.129.191:8091/cphp_status 2>/dev/null |grep "max children reached" |awk '{print $4}'
}
## 缓慢请求的数量
function slow_requests {
    curl 172.16.129.191:8091/cphp_status 2>/dev/null |grep "slow requests" |awk '{print $3}'
}

# 执行function
$1
