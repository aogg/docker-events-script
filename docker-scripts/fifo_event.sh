#!/bin/sh 

# $1 唯一名称
# $2 events参数
# $3 执行命令


function fifo_read{
    read one_line < $path
    $3
    sleep 1;
    fifo_read &
}

path=/tmp/fifo/$1
mkdir -p /tmp/fifo
mkfifo $path

fifo_read &
docker events $2 >& $path