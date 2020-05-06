#!/bin/sh 

/usr/local/bin/docker-entrypoint.sh

. /docker-scripts/read_ini.sh
read_ini /docker-scripts/events-script.ini


arr=(${INI__ALL_SECTIONS})  


for i in $arr;
do
    local args=eval "echo \$INI__${i}__args"
    local command=eval "echo \$INI__${i}__command"
    /docker-scripts/fifo_event.sh $i "$args" "$command" &
done;

docker events


