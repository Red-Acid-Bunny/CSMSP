#!/usr/bin/env bash
# Приводит десятичные дроби к стандарту для языков программирования


out_file=$1
in_file=$2

cat ${out_file} | sed 's/,/./g' > ${in_file}
