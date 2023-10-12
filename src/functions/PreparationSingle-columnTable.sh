#!/usr/bin/env bash

out_file=$1
in_file=$2

text="`cat ${out_file} | tr -d '\n'`"
echo ${text} | wc | awk '{print $2}' > ${in_file}
echo ${text} >> ${in_file}

