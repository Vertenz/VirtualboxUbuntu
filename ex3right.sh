#!/bin/bash -x

usage(){
        cat << END
                Create file in directory.
		Option:
			-d - directory

                Example:
                        ex3right.sh -d ~/direcrory/directory filename
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
                      *.sh)
                         PROGRAMS+=( "$1" )
                         shift
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
		        if [ -f ${DIR[@]}/${FILES[@]} ] ; then
                                        echo 'Faile already exists'
                                        usage
                                        exit 3
                                elif [ -d $0 ] ; then
                                        echo 'Use only one directory'
                                        usage
                                        exit 4
                                else
                                        touch ${DIR[@]}/${FILES[@]}					                                 touch ${DIR[@]}/${PROGRAMS[@]}
					chmod +x ${DIR[@]}/${PROGRAMS[@]}
                                fi

        
#touch ${DIR[@]}${FILES[@]}
