#!/bin/bash

export ZK_HOSTS=${ZK_HOSTS:-"localhost:2181"}
export APPLICATION_SECRET=${APPLICATION_SECRET:-"letmein"}
export KM_CONFIGFILE=${KM_CONFIGFILE:-"conf/application.conf"}
export CONSUMER_PROPERTIES_FILE=${CONSUMER_PROPERTIES_FILE:-"conf/consumer.properties"}
export KM_ARGS=${KM_ARGS:-"-Djava.net.preferIPv4Stack=true"}

exec ./bin/kafka-manager -Dconfig.file=${KM_CONFIGFILE} "${KM_ARGS}" "${@}"
