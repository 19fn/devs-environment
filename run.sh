#!/bin/bash

# Vars
CONTAINER=""
ENV_FILE=".env"
JAR_FILE=$1
DOCKER_COMPOSE_FILE="docker-compose.yml"
DC_UP="docker-compose up -d"

# Errors
E_ENV_FILE="[!] Missing file '.env' ..."
E_JAR_FILE="[!] Cannot found '${JAR_FILE}' ..."
E_EXT_JAR_FILE="[!] You must provide a '.jar' file ..."
E_DOCKER_COMPOSE="[!] Missing file 'docker-compose.yml' ..."

getHelp()
{
	echo
	echo -e "\n[!] Usage: $0 [path/to/file.jar]\n\n\n\tArgument:\tDescription:\n\tfile.jar\tlaunch file.jar server\n"
	echo
	exit 1
}

if [ ! -f ${ENV_FILE} ]; then
	echo
	echo ${E_ENV_FILE}
	echo
	exit 1
fi

if [ ! -f ${DOCKER_COMPOSE_FILE} ]; then
	echo 
	echo ${E_DOCKER_COMPOSE}
	echo
	exit 1
fi

if [ ! -f ${JAR_FILE} ]; then
	echo
	echo ${E_JAR_FILE}
	echo
	exit 1
fi

if [ $# -ne 1 ]; then
	getHelp
else
	if [ "$(echo ${JAR_FILE} | tr '.' ' ' | awk '{print $NF}')" == "jar" ]; then
		${DC_UP}
       	else
	       echo
	       echo ${E_EXT_JAR_FILE}
	       echo
	fi	 
fi
