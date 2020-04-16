#!/bin/bash

usage(){
	cat << END
		This program for delete empty li		ne from a text file and replaces		small characters to larg
		
		Options:
			--help || -h - for help
			-d - for delete empty line	
			-ch - for replaces small characters tp larg

		Examples:
			$0 --help
			$0 -d file.txt
			$0 -ch file.txt
END
}

while [[ $# -gt 0 ]] ; do
  if [[ -e $1 ]] ; then
    FILES+=( "$1" )
    shift && continue
  else

    case $1 in
        --help|-h)
        usage
        exit 0
    ;;
        -d)
        ARGS+=( "-s '\n'" )
        shift
    ;;
        -ch)
	ARGS+=( "[:lower:] [:upper:]"  )
	shift
    esac
  fi
done

(( ${#FILES[@]} == 0 )) && echo "Files not found." && exit 3

#tr $(echo "${ARGS[@]} < ${FILES}")

tr  ${ARGS[@]} < ${FILES}
