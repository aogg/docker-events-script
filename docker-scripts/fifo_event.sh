#!/bin/sh 

# $1 唯一名称
# $2 events参数
# $3 执行命令

command=$3
function fifo_read (){
    read one_line < "$1";
    eval $command
    sleep 1;
    fifo_read $1 &
}

path=/tmp/fifo/$1
mkdir -p /tmp/fifo
mkfifo $path

fifo_read $path &
eval "docker events $2" >& $path