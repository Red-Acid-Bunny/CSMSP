#!/usr/bin/env bash

PathToSettingsFile=$1
Parametr=$2
cat "${PathToSettingsFile}" | awk -v test=${Parametr} '{if(test==$1)print $3}' | sed 's/"//g'
