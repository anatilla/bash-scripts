#!/bin/sh

usage(){
  echo "usage: $(basename $0) <file path> <number of lines>"
}

if [[ $# -eq 0 || $# -eq 1 ]]; then
  usage
  exit 1
fi

																									    
COUNTER=0
TIMESTAMP=$(stat -c '%Z' $1)

while true; do
	if [ $COUNTER -eq 0 ]; then
		TIMESTAMP=$( stat -c '%Z' $1 )
		let COUNTER++
                tail -n $2 $1
		
		elif [ $TIMESTAMP -ne $(stat -c '%Z' $1) ]; then
			$TIMESTAMP = $(stat -c '%Z' $1)
			echo -e "Updated at " $TIMESTAMP " :"
			let COUNTER++
	        	tail -n $2 $1
	fi
	
sleep 30s
done
