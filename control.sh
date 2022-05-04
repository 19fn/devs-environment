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
PASSWORD="your-strong-password-here"
ARG=$1
DOCKER_COMPOSE_FILE="docker-compose.yml"
SQL_SCRIPT="schema.sql"
DC_UP="docker-compose up --detach"
DC_DOWN="docker-compose down"
DC_LOGS="docker-compose logs"
DC_PS="docker-compose ps"
DC_UP_DB="docker-compose up mssql-db"

# errors
E_DOCKER_COMPOSE="[!] Missing file: 'docker-compose.yml' ..."
E_NO_SQL_SCRIPT_FILE="[!] Missing file: 'schema.sql' ..."

usage()
{
	echo
	echo -e "[!] Usage: $0 [init] || [start] || [stop] || [logs] || [state]\n\n\n\tCommand:\tDescription:\n\tinit\t\tInitialize database for the first time\n\tstart\t\tStart local environment container\n\tstop\t\tShutdown local environment container\n\tlogs\t\tShow containers logs\n\tstate\t\tShow containers state"
	echo
	exit 1
}

initializeDB()
{
	docker-compose up -d mssql-db && \
		if [ -f ${SQL_SCRIPT} ]; then
			for i in {1..50}; do
				docker cp ./${SQL_SCRIPT} mssql_db:/opt && \
					docker exec -it mssql_db /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P ${PASSWORD} -i /opt/${SQL_SCRIPT} > /tmp/mssql_schema.logs 2>&1
				if [ $? -eq 0 ]; then
					echo;echo "[+] schema.sql script finished successfully ...";echo
					break
				else
					echo;echo "[!] waiting for schema.sql script  to finish ...";echo
					sleep 1
				fi
			done
		else
			echo; echo ${E_NO_SQL_SCRIPT_FILE}; echo
			exit 1
		fi
}

# docker-compose.yml file
if [ ! -f ${DOCKER_COMPOSE_FILE} ]; then
	echo; echo ${E_DOCKER_COMPOSE}; echo
	exit 1
fi

# Main
case ${ARG} in
	init) initializeDB ;;
	start) ${DC_UP} ;;
	stop) ${DC_DOWN} ;;
	logs) ${DC_LOGS} ;;
	state) ${DC_PS} ;;
	*) usage ;;
esac	
