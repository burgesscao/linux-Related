#!/bin/bash
##Burgess 2018-06-22
##Check Nginx 




while [ 0 -lt 1 ]
do
    T_now=`date '+%Y-%m-%d %H:%M:%S'`
    N_nginx=`ps aux | grep nginx | grep -v grep | wc -l`
    if [ $N_nginx -eq 0 ]; then
        cd /shell/
        /work/nginx/sbin/nginx -c /work/nginx/conf/nginx.conf
        if [ $? == 0 ];then
            echo "$T_now restart Nginx" >> /shell/Nginx.log    
        else
            echo "$T_now restart Nginx error" >> /shell/Nginx.log
        fi
    else
        echo "$T_now " > /shell/Nginx.txt
    fi
    sleep 30
done

