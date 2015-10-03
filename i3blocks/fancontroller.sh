#!/bin/bash

s=`sensors -u | grep temp1_input | cut -c 15-17`

# echo $s

if [ $s -gt "55" ]
then
    i8kfan - 2 > /dev/null
    echo FULL
elif [ $s -gt "45" ]
then
    i8kfan - 1 > /dev/null
    echo HALF
else
    i8kfan - 0 > /dev/null
    echo OFF
fi

