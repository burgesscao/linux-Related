#!/bin/bash
##Burgess 20180830


D_date=`date +%m%d_%H-%M`
L_login=`netstat -ant |grep ':22' |grep ESTABLISHED |awk '{print $5}' |awk -F ':' '{print $1}' | wc -l`
C_conn=`netstat -ant |grep ':80' |grep ESTABLISHED |awk '{print $5}' |awk -F ':' '{print $1}' | wc -l`


## Login_user
function Login_user {
#    echo $D_date >> log_in.txt
#    netstat -ant |grep ':22' |grep ESTABLISHED |awk '{print $5}' |awk -F ':' '{print $1}' >> log_in.txt
    netstat -ant |grep ':22' |grep ESTABLISHED |awk '{print $5}' |awk -F ':' '{print $1}' | wc -l
}
## Login_user
function ESTABLISHED {    
    ESTABLISHED=`netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}' |grep ESTABLISHED |awk '{print $2}'`
    if [ ! -n "$ESTABLISHED" ] ; then
        echo "0"
    else
        echo $ESTABLISHED
    fi
}
## Login_user
function CLOSE_WAIT {
    CLOSE_WAIT=`netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}' |grep CLOSE_WAIT |awk '{print $2}'`
    if [ ! -n "$CLOSE_WAIT" ] ; then
        echo "0"
    else
        echo $CLOSE_WAIT
    fi
}
## Login_user
function TIME_WAIT {
    TIME_WAIT=`netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}' |grep TIME_WAIT |awk '{print $2}'`
    if [ ! -n "$TIME_WAIT" ] ; then
        echo "0"
    else
        echo $TIME_WAIT
    fi
}
## Login_user
function LAST_ACK {
    LAST_ACK=`netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}' |grep LAST_ACK |awk '{print $2}'`
    if [ ! -n "$LAST_ACK" ] ; then
        echo "0"
    else
        echo $LAST_ACK
    fi
}
## Login_user
function SYN_SENT {
    SYN_SENT=`netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}' |grep SYN_SENT |awk '{print $2}'`
    if [ ! -n "$SYN_SENT" ] ; then
        echo "0"
    else
        echo $SYN_SENT
    fi
}


##
$1

#echo $D_date
#echo $L_login
#echo $C_conn

