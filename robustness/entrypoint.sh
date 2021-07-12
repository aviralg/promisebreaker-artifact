#!/bin/bash
nohup sudo service nginx start > /tmp/nginx.log 2>&1 &
nohup sudo Xvfb :0 -ac -screen 0 1280x1024x24 > /tmp/X.log 2>&1 &
export DISPLAY=:0
bash
