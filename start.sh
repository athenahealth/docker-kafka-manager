#!/bin/bash

ZK_HOSTS=${ZK_HOSTS:-"localhost:2181"}
APPLICATION_SECRET=${APPLICATION_SECRET:-"letmein"}
KM_CONFIGFILE=${ZK_HOSTS:-"conf/application.conf"}
KM_ARGS=${KM_ARGS:-"-Djava.net.preferIPv4Stack=true"}

exec ./bin/kafka-manager -Dconfig.file=${KM_CONFIGFILE} "${KM_ARGS}" "${@}"
