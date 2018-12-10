#!/bin/bash
##BurgessCYH
## start Redis


#### Redis  7700
Ch_redis=`ps -ef |grep 7700 |grep -v grep`
if [ $? == 0 ];then
    echo "This is OK"
else
    /work/redis-4.0.9/src/redis-server /work/redis-4.0.9/redis.conf
    echo `date` 7700  >> /shell/R_redis.txt
fi


#### Redis  6379
Ch_redis_f=`ps -ef |grep 6379 |grep -v grep`
if [ $? == 0 ];then
    echo "This is OK"
else
    echo `date` 6379  >> /shell/R_redis.txt
    nohup redis-server &
fi

