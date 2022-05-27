#!/bin/sh

Year=`date +%Y`
Month=`date +%m`
Day=`date +%d`
Hour=`date +%H`
Minute=`date +%M`
Second=`date +%S`
echo `date`

cat /proc/meminfo | awk -F, 'FNR == 3 {print $1;}'