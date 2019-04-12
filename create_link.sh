#!/bin/sh

BAL_DIR=${PWD}/BAL
GENDIR=${PWD}/out

# Memory
python ${BAL_DIR}/Scripts/createLink.py ${BAL_DIR}/Memory/WTF/ ${GENDIR}/BAL/wtf

# Internationalization
python ${BAL_DIR}/Scripts/createLink.py ${BAL_DIR}/Internationalization/WTF ${GENDIR}/BAL/wtf/unicode
python ${BAL_DIR}/Scripts/createLink.py ${BAL_DIR}/Internationalization/WTF/Text ${GENDIR}/BAL/wtf/text
python ${BAL_DIR}/Scripts/createLink.py ${BAL_DIR}/Internationalization/WTF/ICU ${GENDIR}/BAL/wtf/unicode

# Types
python ${BAL_DIR}/Scripts/createLink.py ${BAL_DIR}/Types/WTF/Pthreads ${GENDIR}/BAL/wtf/
python ${BAL_DIR}/Scripts/createLink.py ${BAL_DIR}/Types/WTF/ ${GENDIR}/BAL/wtf/



