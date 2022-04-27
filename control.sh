#!/bin/bash

##################################################################
#####################       CONTROL.SH      ######################
##################################################################
# This script will look for the docker compose file to be executed
# so, if no arguments were passed, a help panel will be displayed. 
# The script will accept only two arguments. The first: 'start' 
# to run docker-compose up --detach. And, the second: 'stop' to 
# run docker-compose down. Note, that you might need privileged
# permissions (root) to run this script successfully. Also, dont
# forget to change the docker-compose.yml file with the actual
# information of your project.
#################################################################
#################################################################

# variables
ARG=$1
DOCKER_COMPOSE_FILE="docker-compose.yml"
DC_UP="docker-compose up --detach"
DC_DOWN="docker-compose down"

# errors
E_DOCKER_COMPOSE="[!] Missing file: 'docker-compose.yml' ..."

usage()
{
	echo
	echo -e "[!] Usage: $0 [start] || [stop]\n\n\n\tCommand:\tDescription:\n\tstart\t\tStart local environment container\n\tstop\t\tShutdown local environment container"
	echo
	exit 1
}

# docker-compose.yml file
if [ ! -f ${DOCKER_COMPOSE_FILE} ]; then
	echo; echo ${E_DOCKER_COMPOSE}; echo
	exit 1
fi

# Main
case ${ARG} in
	start) ${DC_UP} ;;
	stop) ${DC_DOWN} ;;
	*) usage ;;
esac	
