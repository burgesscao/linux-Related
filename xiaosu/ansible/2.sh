#!/bin/bash 
##

E_rrse=$1
ansible $E_rrse -a "git pull chdir=/www/html"

####
##ansible $E_rrse -a "git checkout       chdir=/www/html"
##
