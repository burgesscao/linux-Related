#!/bin/bash 
##Burgess
##检查定时任务是否错误导致无法发送


## 时间
D_tdate=`date '+%Y-%m-%d'`


## cd /www/html/storage/logs/$D_tdate
## pwd

for E_et in `ls /www/html/storage/logs/$D_tdate | grep -v .log`
do
    ## 当产生错误日志目录小于7点时
    if [ $E_et -le 7 ];then
        ##获取错误的脚本名
        E_err=`cat /www/html/storage/logs/$D_tdate/$E_et/logs.php |grep Line`
        E_error=`echo ${E_err##*/}`
        
        cd /www/html/
        ## 老壁把错误发送到老壁手机   脚本错误定位还没好
        /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=ServiceNotice --script_name=$E_error --sms_tpl_name=TPL_SERVICE_NOTICE_ERROR --mobile=17620051589 --env=production
        echo $E_et >> /shell/php_error.log
    else
        echo $E_et $D_tdate >> /shell/php_error.txt
    fi
done

