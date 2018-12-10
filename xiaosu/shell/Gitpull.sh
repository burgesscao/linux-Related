#!/bin/bash
##


##输入1进行备份电销、2进行备份企飞贷
echo "1 is the backup dx  2 is the backup qfd"
echo -n "pleases inptu 1 or 2 "
read N_um
N_umber=0
## 根据输入进行对应的备份操作
while (( $N_umber < 1 ))
do
    ##进行电销备份
    if [ $N_um == 1 ];then
        D_tibk=`date +%Y-%m%d-%H%M`
        echo "Make a backup http://dx.xiaoshupuhui.com"
        cp -r /www/html /www/gitpu-bk/html$D_tibk
        chown -R www:www /www/gitpu-bk
        N_umber=3
    ##进行企飞贷备份
    elif [ $N_um == 2 ];then
        D_tibk=`date +%Y-%m%d-%H%M`
        echo "Make a backup http://qfd.xiaoshushidai.com/"
        cp -r /qfd/company_loan /www/gitpu-bk/company_loan$D_tibk
        chown -R www:www /www/gitpu-bk
        N_umber=3
    ## 输入不对重新输入
    else
        echo "input error ,pleases agen.  1 is the backup dx  2 is the backup qfd "
        echo -n "inptu 1 or 2 "
        read N_um
    fi
done

###切换到有证书的用户进行拉代码
su - www /home/www/gitpull.sh

