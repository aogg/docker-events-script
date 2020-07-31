#!/bin/sh 

# $1 唯一名称
# $2 events参数
# $3 执行命令

command=$3
function fifo_read (){
    read one_line < "$1";
    date "+%Y-%m-%d %H:%M:%S";
    echo 'bash -c '$command;
    bash -c "$command" || echo '执行命令';
    
    if [[ $? ]]; then
        # 尝试三次
        for i in `seq 3`; do
            sleep 2;
            bash -c "$command" || echo '执行命令'$i;
        done 
    fi
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
