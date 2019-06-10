#!/bin/bash

export LD_LIBRARY_PATH=./doc/lib:$LD_LIBRARY_PATH

#./jsc $@

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)
col=10 # change this to whatever column you want the output to start at

for file in ./sunspider/*
do
	#echo "Running $file , \t\t\t\t\t\ttime(ms):"  `./jsc $file`
	#printf 'Running %s %s%*s%s\n' "$file" "$GREEN" $col `./jsc $file` "$NORMAL"
	printf 'Time(ms): %s%*s%s - Running %s \n' "$GREEN" $col `./jsc $file` "$NORMAL"  "$file" 
done
