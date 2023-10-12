#!/bin/bash

if [ "$1" == "" ]; then
  if [ -e default.txt ]; then
    iFile=default.txt
    oFile=""
  else
    echo -e "File 'default.txt' not found"
  fi
else
  if [ -e $1 ]; then
    if [ "$2" == "" ]; then
      iFile="$1"
      oFile=""
    else
      iFile="$1"
      oFile="$2"
    fi
  else
    if [ -e default.txt ]; then
      iFile=default.txt
      oFile="$1"
    else
      echo -e "File 'default.txt' not found"
    fi
  fi
fi

text="`cat ${iFile} | sed 's/,/./g'`"
if [ "${iFile}" != "" ]; then
  if [ "${oFile}" == "" ]; then
    echo ${text}
  else
    echo -e "${text}" | wc | awk '{print $2}' > ${oFile}
    echo ${text} >> ${oFile}
  fi
fi
