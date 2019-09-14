#!/usr/bin/env bash

NAME="$1"
DIR_NAME="$2"
DIR_PATH="$3"

cd $DIR_PATH

curl -s https://api.github.com/users/$NAME/repos?per_page=1000 |grep git_url |awk '{print $2}'| sed 's/"\(.*\)",/\1/' >$DIR_NAME

xargs -n1 git clone < $DIR_NAME
