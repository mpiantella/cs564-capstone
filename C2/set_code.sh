#!/bin/sh

    #Use to add secret code to an image
    #add to cron: 00 01 * * * set_code.sh

#Follows ./ourside.bash <clean_image_name> <commmand>
image=$1
code=$2
if [ -z $image ]; then
    image="clean_image.png"
fi
if [ -z $code ]; then
    code="0000" #post = default
fi
if [ $code = "1101" ]; then
    path=$3
    if [ -z $path ]; then
        path="/usr" #post = default
    fi
    touch path.html
    echo $path > path.html
fi

cat $image > mainImage.png
echo $code >> mainImage.png
