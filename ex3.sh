#!/bin/bash

usage(){
	cat << END
		Create directory and file in it.

		Example:
			ex3.sh -d failname ~/direcrory/directory
END
}

	if [[ $1 == "-d" ]] ; then
		shift
		while [[ $# -gt 0 ]] ; do
		case $1 in
			/*)
			DIR+=( "$1" )
			shift
			continue
		     ;;
	                *)
			FILES+=( "$1" )
			shift
		esac

	done
	else
		echo "-d not ok"
		shift
	fi

mkdir -p ${DIR[@]}
sleep 1
touch ${DIR[@]}/${FILES[@]}
