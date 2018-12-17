#!/bin/bash
##Burgess
## 检查 /www/html/storage/logs 有错误日志时报警


D_toda=`date +"%Y-%m-%d"`
D_date=`date -d "1 minutes ago" |awk '{print $4}' |cut -c 1-4`
D_time=`date +%H`
L_logd="/www/html/storage/logs/"
L_logs=`ls $L_logd$D_toda |grep -v .log |grep $D_time |wc -l`


if [ $L_logs -eq 0 ];then
    echo 0
else
    echo 1
fi
