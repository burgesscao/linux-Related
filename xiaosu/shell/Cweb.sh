#!/bin/bash
##CYH
##checking Nginx restart





CHECK_Web="dx.xiaoshupuhui.com"
CHECK_Nginx=`curl -o /dev/null -m 10 --connect-timeout 10 -s -w %{http_code} $CHECK_Web`


## restartnginx
[ $CHECK_Nginx != 200 ] && {
    killall nginx
    killall php-fpm
    sleep 2
    /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
    /usr/local/php/sbin/php-fpm
    echo $CHECK_Nginx `date` >> /shell/rweb.txt
}


