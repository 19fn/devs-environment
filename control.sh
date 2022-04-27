#!/bin/bash

# Vars
arg=$1
DOCKER_COMPOSE_FILE="docker-compose.yml"
DC_UP="docker-compose up --detach"
DC_DOWN="docker-compose down"

# Errors
E_DOCKER_COMPOSE="[!] Missing file: 'docker-compose.yml' ..."
E_TARGET_NOT_FOUND="[!] Directory: 'target' not found ..."

usage()
{
	echo
	echo -e "[!] Usage: $0 [start] || [stop]\n\n\n\tCommand:\tDescription:\n\tstart\t\tStart local environment container\n\tstop\t\tShutdown local environment container"
	echo
	exit 1
}

# target directory
if ! [[ $(find ../ -maxdepth 1 -type d -name "target") ]]; then
	echo; echo ${E_TARGET_NOT_FOUND}; echo
fi

# docker-compose.yml file
if [ ! -f ${DOCKER_COMPOSE_FILE} ]; then
	echo; echo ${E_DOCKER_COMPOSE}; echo
	exit 1
fi

# Main
case ${arg} in
	start) ${DC_UP} ;;
	stop) ${DC_DOWN} ;;
	*) usage ;;
esac	
