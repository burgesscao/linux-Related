#!/bin/bash
##


DB_host=""
DB_port="3306"
DB_user=""
DB_pass=""
DB_data=""

elect_sql=$1
mysql -h"${DB_host}" -P"${DB_port}" -u"${DB_user}" -p"${DB_pass}" "${DB_data}" -e "${elect_sql}"

