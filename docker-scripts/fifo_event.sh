#!/bin/sh 

# $1 唯一名称
# $2 events参数
# $3 执行命令

command=$3
function fifo_read (){
    read one_line < "$1";
    date "+%Y-%m-%d %H:%M:%S";
    echo 'eval '$command;
    eval $command || echo '执行命令';
}

path=/tmp/fifo/$1
mkdir -p /tmp/fifo
mkfifo $path

{
    while [ 1 ]
    do
        fifo_read $path
        sleep 1
    done
} &

eval "docker events $2" >& $path
