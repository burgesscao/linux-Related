#!/bin/bash
##Burgess

##定义变量时间与路径
##2018-09-11
D_toda=`date +"%Y-%m-%d"`
##当前时间 前一分钟 格式16:26 
D_date=`date -d "1 minutes ago" |awk '{print $4}' |cut -c 1-5`

L_logd="/usr/local/nginx/logs/"
L_dxsh="dx.xiaoshupuhui.com.error.log"
L_dxh5sh="dxh5.xiaoshupuhui.com.error.log"
L_dxtw="dx.tenwincash.com.error.log"
L_dxh5tw="dxh5.tenwincash.com.error.log"


## dx.tenwincash
function TPHP_message {
    cat $L_logd$L_dxtw |grep $D_date |grep "PHP message" | wc -l
}

function Terror_open {
    cat $L_logd$L_dxtw |grep $D_date |grep "open()" | wc -l
}

function Ttimed_out {
    cat $L_logd$L_dxtw |grep $D_date |grep "timed out" | wc -l
}

## dxh5.tenwincash
function THPHP_message {
    cat $L_logd$L_dxh5tw |grep $D_date |grep "PHP message" | wc -l
}

function THerror_open {
    cat $L_logd$L_dxh5tw |grep $D_date |grep "open()" | wc -l
}

function THtimed_out {
    cat $L_logd$L_dxh5tw |grep $D_date |grep "timed out" | wc -l
}

## dx.xiaoshupuhui
function SPHP_message {
    cat $L_logd$L_dxsh |grep $D_date |grep "PHP message" | wc -l
}

function Serror_open {
    cat $L_logd$L_dxsh |grep $D_date |grep "open()" | wc -l
}

function Stimed_out {
    cat $L_logd$L_dxsh |grep $D_date |grep "timed out" | wc -l
}

## dxh5.xiaoshupuhui
function ShPHP_message {
    cat $L_logd$L_dxh5sh |grep $D_date |grep "PHP message" | wc -l
}

function Sherror_open {
    cat $L_logd$L_dxh5sh |grep $D_date |grep "open()" | wc -l
}

function Shtimed_out {
    cat $L_logd$L_dxh5sh |grep $D_date |grep "timed out" | wc -l
}


$1
