#!/bin/sh
#use cron

crontab -l > crontab_new 
ip=172.25.0.3
path=$(pwd)
echo "20 01 * * * * $path/change_image.sh $ip" >> crontab_new
echo "40 01 * * * $path/get_data.sh" >> crontab_new
echo "00 02 * * * * $path/remove_image.sh $ip" >> crontab_new
#for testing, have it run every 5 minutes
#echo "*/5 * * * * $path/get_data.sh $ip" >> crontab_new

crontab crontab_new
rm crontab_new