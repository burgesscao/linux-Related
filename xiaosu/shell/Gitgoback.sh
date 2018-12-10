#!/bin/bash
##


##输入1进行备份电销、2进行备份企飞贷
echo "1 is the return dx  2 is the return qfd"
echo -n "pleases inptu 1 or 2 "
read N_um


echo "Please choose from below"
ls /www/gitpu-bk/
echo -n "pleases input need return version(time): "
read Ver_html


N_umber=0
## 根据输入进行对应的回滚操作
while (( $N_umber < 1 ))
do
    ##进行回滚操作
    if [ $N_um == 1 ];then
        echo $Ver_html `date` >> /root/goback.txt
        D_tibk=`date +%Y-%m%d-%H%M`
        echo "Make return http://dx.xiaoshupuhui.com"
        mv /www/html /www/htmlbk$D_tibk
        cp -r /www/gitpu-bk/$Ver_html /www/html
        N_umber=3
        echo "return End . pleases test"
        echo "Do you need to replace index.php ? "
    ##进行企飞贷备份
    elif [ $N_um == 2 ];then
        echo $Ver_html `date` >> /root/goback.txt
        D_tibk=`date +%Y-%m%d-%H%M`
        echo "Make go backup http://qfd.xiaoshushidai.com/"
        mv /qfd/company_loan /www/company_loanbk$D_tibk
        cp -r /www/gitpu-bk/$Ver_html /qfd/company_loan
        N_umber=3
        echo "go backup End . pleases test"
    ## 输入不对重新输入
    else
        echo "input error ,pleases agen.  1 is the backup dx  2 is the backup qfd "
        echo -n "inptu 1 or 2 "
        read N_um
    fi
done

