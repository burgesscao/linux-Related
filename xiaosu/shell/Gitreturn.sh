#!/bin/bash
##


###
Go_backup=`l -n 2 /www/gitpu-bk/dxgit.txt`
###
rm -rf /usr/local/src/index.php
cp /www/html/index.php /usr/local/src/

###
git reset --hard $Go_backup

####
rm -rf /www/html/index.php
cp /usr/local/src/index.php /www/html/


####
sleep 3
curl -o /dev/null -s -w %{http_code} http://dx.xiaoshupuhui.com
