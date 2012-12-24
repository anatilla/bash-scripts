#!/bin/sh

usage(){
  echo "usage: $(basename $0) <file url>"
}

if [[ $# -eq 0 ]]; then
  usage
  exit 1
fi

																									    
COUNTER=0
TIMESTAMP=$(stat -c '%Z' $1)
LINES=5

while true; do
	if [ $COUNTER -eq 0 ]; then
		TIMESTAMP=$( stat -c '%Z' $1 )
		let COUNTER++
                tail -n $LINES $1
		
		elif [ $TIMESTAMP -ne $(stat -c '%Z' $1) ]; then
			$TIMESTAMP = $(stat -c '%Z' $1)
			echo -e "Updated at " $TIMESTAMP " :"
			let COUNTER++
	        	tail -n $LINES $1
	fi
	
sleep 30s
done
