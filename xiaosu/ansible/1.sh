#!/bin/bash
##

#H_server="$1"
#C_ommand="$2"


echo "输入“Pull_git”更新电销  输入“Return_git”回退上次版本"
echo -n "inptu Pull_git or Return_git: "
read N_run



function Pull_git {
## 更新DX
    ansible-playbook pullgit.yml

## 查看更新
    ansible DX_web -a "/usr/bin/cat /home/www/anGitpull.txt"
}
#
#ansible $H_server -a "$C_ommand"

##回退
function Return_git {
    ansible-playbook returngit.yml
##
     ansible DX_web -a "/usr/bin/head -n 5 /home/www/Returngit.txt"
}


$N_run
