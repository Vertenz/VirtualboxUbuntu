#!/bin/bash

usage() {
	cat << END
		This script dislays login errors.
		Option:
			--help|-h - for help
		Example:
			$0
			$0 -h
END
}

case $1 in 
	  --help|-h)
          usage
          exit 0
esac

egrep "Failed|Failure" /var/log/auth.log

