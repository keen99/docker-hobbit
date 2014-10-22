#!/bin/bash
echo
echo "Visit your boot2docker ip /xymon (ie: http://127.0.0.1/xymon) - will take a few minutes for the cache to build, so dont panic if you see an empty directory"
echo
echo
/etc/init.d/xymon start 2>&1;
bash /root/start-httpd.sh
