#!/bin/bash

DC_FILE="docker-compose.yml"

helpPanel()
{
    echo;echo -e "[!] Bad usage. Try bash $0 [on | off]";echo
    exit 1
}

if [ ! -f ${DC_FILE} ]; then
    echo;echo "[!] '${DC_FILE}' not found.";echo
    exit 1
fi

case $1 in
    on)
        docker-compose up -d
    ;;
    off)
        docker-compose down
    ;;
    *)
        helpPanel
    ;;
esac
