#!/bin/bash
##Burgess
##检查用户池数据同步


#######获取时间
D_date=`date |awk '{print $3}'`
#echo $D_date

## 获取UserSyncNew更新时间
L_UserSyncNew=`ls -l /www/html/storage/task/UserSyncNew.log |awk '{print $7}'`

## DispatchUser
L_DispatchUser=`ls -l /www/html/storage/task/DispatchUser.log |awk '{print $7}'`

## UsersMailToSomeOne
## L_UsersMailToSomeOne=`ls -l /www/html/storage/task/UsersMailToSomeOne.log |awk '{print $7}'`

## LfqAndLzxMakeLoan
## L_LfqAndLzxMakeLoan=`ls -l /www/html/storage/task/LfqAndLzxMakeLoan.log |awk '{print $7}'`

## LfqYesterdayData
L_LfqYesterdayData=`ls -l /www/html/storage/task/LfqYesterdayData.log |awk '{print $7}'`

## LteYesterdayData
## L_LteYesterdayData=`ls -l /www/html/storage/task/LteYesterdayData.log |awk '{print $7}'`

## LfqBeforeThreeNotLte
## L_LfqBeforeThreeNotLte=`ls -l /www/html/storage/task/LfqBeforeThreeNotLte.log |awk '{print $7}'`

## LteYesterdayData  getLteBeforeYesterday.xlsx
L_mon=`ls -l /www/html/storage/mail/getLteBeforeYesterday.xlsx |awk '{print $6}'`
L_period=`ls -l /www/html/storage/mail/getLteBeforeYesterday.xlsx |awk '{print $7}'`
L_Dtime=`date |awk '{print $3}'`



#######进到html目录
cd /www/html/


#######时间不对为不更新，发送不更新报错短信给老壁，执行脚本。如执行报错再次发送短信给老壁
[ $D_date != $L_UserSyncNew ] && {
    echo `date` UserSyncNew  >> /shell/error.txt
    /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=ServiceNotice --script_name=UserSyncNew --sms_tpl_name=TPL_SERVICE_NOTICE_FAIL --mobile=17620051589 --env=production
    /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=UserSyncNew --env=production
    if [ $? != 0 ];then
        /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=ServiceNotice --script_name=UserSyncNew --sms_tpl_name=TPL_SERVICE_NOTICE_ERROR --mobile=17620051589 --env=production
    fi
}

##DispatchUse
[ $D_date != $L_DispatchUser ] && {
    echo `date` DispatchUser  >> /shell/error.txt
    /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=ServiceNotice --script_name=DispatchUse --sms_tpl_name=TPL_SERVICE_NOTICE_FAIL --mobile=17620051589 --env=production
    /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=DispatchUser --env=production
    if [ $? != 0 ];then
        /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=ServiceNotice --script_name=DispatchUse --sms_tpl_name=TPL_SERVICE_NOTICE_ERROR --mobile=17620051589 --env=production
    fi
}

##UsersMailToSomeOne
## [ $D_date != $L_UsersMailToSomeOne ] && {
##    echo `date` UsersMailToSomeOne  >> /shell/error.txt
##    /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=ServiceNotice --script_name=UsersMailToSomeOne --sms_tpl_name=TPL_SERVICE_NOTICE_FAIL --mobile=17620051589 --env=production
##    /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=UsersMailToSomeOne --env=production
##    if [ $? != 0 ];then
##        /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=ServiceNotice --script_name=UsersMailToSomeOne --sms_tpl_name=TPL_SERVICE_NOTICE_ERROR --mobile=17620051589 --env=production
##    fi
## }

##LfqYesterdayData
[ $D_date != $L_LfqYesterdayData ] && {
    echo `date` LfqYesterdayData  >> /shell/error.txt
    /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=ServiceNotice --script_name=LfqYesterdayData --sms_tpl_name=TPL_SERVICE_NOTICE_FAIL --mobile=17620051589 --env=production
    /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=LfqYesterdayData --env=production
    if [ $? != 0 ];then
        /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=ServiceNotice --script_name=LfqYesterdayData --sms_tpl_name=TPL_SERVICE_NOTICE_ERROR --mobile=17620051589 --env=production
    fi
}

## LfqBeforeThreeNotLte
## [ $D_date != $L_LfqBeforeThreeNotLte ] && {
##    echo `date` LfqBeforeThreeNotLte  >> /shell/error.txt
##    /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=ServiceNotice --script_name=LfqBeforeThreeNotLte --sms_tpl_name=TPL_SERVICE_NOTICE_FAIL --mobile=17620051589 --env=production
##    /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=LfqBeforeThreeNotLte --env=production
##    if [ $? != 0 ];then
##        /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=ServiceNotice --script_name=LfqBeforeThreeNotLte --sms_tpl_name=TPL_SERVICE_NOTICE_ERROR --mobile=17620051589 --env=production
##    fi
## }

## LteYesterdayData
[ $L_mon != Mon ] && {
    if [ $L_period != $L_Dtime  ];then
        /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=ServiceNotice --script_name=getLteBeforeYesterday --sms_tpl_name=TPL_SERVICE_NOTICE_FAIL --mobile=17620051589 --env=production
        cd /www/html/
        /usr/local/php/bin/php -c /usr/local/php/etc/exec_shell_php.ini index.php --task=LteYesterdayData --env=production
    fi
}



chown -R www:www /www/html/
