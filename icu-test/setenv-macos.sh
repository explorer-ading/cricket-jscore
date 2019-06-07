#!/bin/bash

## source ...

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

export LDFLAGS="-L/usr/local/opt/icu4c/lib"       
export CPPFLAGS="-I/usr/local/opt/icu4c/include"  

export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

