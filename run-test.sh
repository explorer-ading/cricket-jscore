#!/bin/sh

export LD_LIBRARY_PATH=./doc/lib:$LD_LIBRARY_PATH

#./jsc $@

for file in ./sunspider/*
do
	echo "Running $file " , `./jsc $file`
done
