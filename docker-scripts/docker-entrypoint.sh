#!/bin/bash 

/usr/local/bin/docker-entrypoint.sh bash &

. /docker-scripts/read_ini.sh
read_ini /docker-scripts/events-script.ini

echo $INI__ALL_SECTIONS;

arr=(${INI__ALL_SECTIONS})  
for i in $arr;
do
    eval "args=\$INI__${i}__args";
    eval "command=\$INI__${i}__command"

    echo $i' events '$args;

    /docker-scripts/fifo_event.sh $i "$args" "$command" &
done;

mkdir -p /tmp/fifo/
touch "/tmp/fifo/null null"
tail -f /tmp/fifo/*


