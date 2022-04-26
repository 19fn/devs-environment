#!/bin/bash

# Vars
CONTAINER="local-environment"
ENV_FILE=".env"
JAR_FILE=$2
DOCKER_COMPOSE_FILE="docker-compose.yml"
DC_UP="docker-compose up --detach"
DC_DOWN="docker-compose down"

# Errors
E_ENV_FILE="[!] Missing file '.env' ..."
E_JAR_FILE="[!] Cannot found '${JAR_FILE}' ..."
E_EXT_JAR_FILE="[!] You must provide a '.jar' file ..."
E_DOCKER_COMPOSE="[!] Missing file 'docker-compose.yml' ..."

usage()
{
	echo
	echo -e "[!] Usage: $0 [--start] || [--stop]\n\n\n\tCMD:\t\tDescription:\n\t--start\t\tdocker compose up\n\t--stop\t\tdocker compose down"
	echo
	exit 1
}

#dc_start()
#{
#	if [ "$(echo ${JAR_FILE} | tr '.' ' ' | awk '{print $NF}')" == "jar" ]; then
#                sed -i '/ARTIFACT/d' ${ENV_FILE} && \
#			echo "ARTIFACT=${JAR_FILE}" >> ${ENV_FILE} && \
#			${DC_UP}
#        else
#                echo
#                echo ${E_EXT_JAR_FILE}
#                echo
#        fi
#}

# .env file
#if [ ! -f ${ENV_FILE} ]; then
#	echo
#	echo ${E_ENV_FILE}
#	echo
#	exit 1
#fi

# docker-compose.yml file
if [ ! -f ${DOCKER_COMPOSE_FILE} ]; then
	echo 
	echo ${E_DOCKER_COMPOSE}
	echo
	exit 1
fi

# .jar file
#if [ ! -f ${JAR_FILE} ]; then
#	echo
#	echo ${E_JAR_FILE}
#	echo
#	exit 1
#fi

case $1 in
	--start) ${DC_UP} ;;
	--stop) ${DC_DOWN} ;;
	*) usage ;;
esac		
