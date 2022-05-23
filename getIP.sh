#!/bin/bash

getIP()
{
	ens33=$(ip a | awk '/ens33/' | grep "inet" | cut -d"/" -f1 | xargs | awk '{print $2}')
	eth0=$(ip a | awk '/eth0/' | grep "inet" | cut -d"/" -f1 | xargs | awk '{print $2}')
	
	if [[ ${ens33} =~ ^[0-9.]+$ ]]; then
		echo;echo "[+] IP: ${ens33}";echo
	elif [[ ${eth0} =~ ^[0-9.]+$ ]]; then
		echo;echo "[+] IP: ${eth0}";echo
	else
		echo;echo "[!] IP can not be found.";echo
	fi
}

getIP
