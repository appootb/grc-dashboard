#!/bin/sh

# start nginx in background
/usr/sbin/nginx

# run dashboard
/dashboard -cfg=/etc/config.yaml