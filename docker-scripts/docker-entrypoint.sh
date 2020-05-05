#!/bin/sh 

/usr/local/bin/docker-entrypoint.sh

. /docker-scripts/read_ini.sh
read_ini /docker-scripts/events-script.ini
