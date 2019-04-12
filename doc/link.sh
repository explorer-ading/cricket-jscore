#!/bin/sh

find generated_link -iname \*h | xargs ls -l | awk '{printf "ln -sf " $11 " " $9 "\n" }' | sed 's=\/home\/bruce\/owb\/trunk\/='"$PWD"'\/=g' | sh

#find generated_link -iname \*h | xargs ls -l | awk '{printf "ln -sf " $11 " " $9 "\n" }' | sed 's=\/home\/bruce\/tmp\/owb-pkg-bk\/owb-jsc\/='"$PWD"'\/=g' | sh

#sed -e "s/@\w*@//g" ../OWB/Base/BALBase.h.in  > ../OWB/Base/BALBase.h
#sed -e "s/@\w*@//g" ../OWB/Base/WebKitTypes.h.in > ../OWB/Base/WebKitTypes.h
#sed -e "s/[$]{CMAKE_INSTALL_PREFIX}/\/usr\/local/g" ../OWB/Base/owb-config.h.in | sed 's=[$]{WITH_OWB_CONFIG_DIR}=\/home\/'"$USER"'\/.owb\/conf\/=g' > ../OWB/Base/owb-config.h
