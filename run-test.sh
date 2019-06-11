#!/bin/bash

export LD_LIBRARY_PATH=./3rdparty/lib:$LD_LIBRARY_PATH

#./jsc $@
#exit 0

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)
col=10 

echo   '=======================================================' 
printf '                     %sSUNSPIDER%s \n' "$RED" "$NORMAL"
echo   '=======================================================' 
for file in ./jstest/sunspider/*
do
	printf 'Time(ms): %s%*s%s - Running %s \n' "$GREEN" $col `./jsc $file` "$NORMAL"  "$file" 
done

