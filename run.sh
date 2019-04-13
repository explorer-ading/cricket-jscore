#!/bin/sh

#sh export LIBS= 
#sh export CFLAGS= 

export LD_LIBRARY_PATH=./doc/lib:$LD_LIBRARY_PATH

#./out/jsc $@
./jsc $@
