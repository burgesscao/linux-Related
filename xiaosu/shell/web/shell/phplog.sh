#!/bin/bash
##Burgess

##定义变量时间与路径
D_toda=`date +"%Y-%m-%d"`
D_date=`date -d "1 minutes ago" |awk '{print $4}' |cut -c 1-4`
D_time=`date +%H`
L_logd="/www/html/storage/logs/"
L_logs=`ls $L_logd$D_toda |grep -v .log`
L_lt="$L_logd$D_toda/$D_time"
N_sz=0
E_rror="$1"

## 非数据库连接失败时
[ "$E_rror"e != "Xs_Exception_Database"e ] && {
    if [ ! -d "$L_lt" ]; then  
        echo $N_sz 
    else
        cat $L_lt/logs.php |grep -B 4 "$D_date" |grep Xs_Exception_500 |wc -l
    fi  
}

## 数据库连接错误
[ "$E_rror"e == "Xs_Exception_Database"e ] && {
    if [ ! -d "$L_lt" ]; then
        echo $N_sz 
    else
        cat $L_lt/logs.php |grep Xs_Exception_Database |wc -l
    fi
}


#for i in $L_logs 
#do
#    cat $L_logd$D_toda/$i/logs.php |grep -B 4 "$D_date" |grep Xs_Exception_500 |wc -l
#done

#cat $L_logd$D_toda/default.log 
#| grep -A 1 "$D_date" |grep "$P_defaulterror" | wc -l

