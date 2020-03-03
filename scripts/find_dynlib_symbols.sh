#!/bin/bash

# set -ex

# echo $1
for lib in $1
do
    # echo ${lib}
    out=$(nm -CD ${lib} | grep "$2")
    if [ ! -z "${out}" ]
    then
        echo "------- " ${lib}
        echo ${out}
    fi
done
