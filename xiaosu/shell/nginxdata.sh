#!/bin/bash
##burgess 0820
##

Y_ear=`date +%Y`
M_onth=`date +%m`
D_ay=`date +%d`

#N_logsbk="/usr/local/nginx/logs/$Y_ear$M_onth"
N_logs="/usr/local/nginx/logs/$Y_ear/$M_onth-$D_ay"
#N_lserror="error"
#N_laccess="access"

mkdir -p $N_logs

cd /usr/local/nginx/logs/
dx_access=`cat dx.xiaoshupuhui.com.access.log |grep $Y_ear-$M_onth-$D_ay > $N_logs/dx.access.log`
dx_error=`cat dx.xiaoshupuhui.com.error.log |grep $Y_ear/$M_onth/$D_ay > $N_logs/dx.error.log`
#echo $dx_access

