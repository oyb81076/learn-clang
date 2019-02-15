#!/usr/bin/env bash
PWD=`pwd`
SRC=`echo $PWD/ | awk '{print length($0)}'`
OUT=$PWD/build/a.out
mkdir -p build
fswatch -x -t -u .\
    | awk '{if($6 ~ "\.c$") print $0; system("")}'\
    | awk '{if($0 ~ "Updated") print $0; system("")}'\
    | awk '{if($0 ~ "IsFile") print $0; system("")}'\
    | awk '{print $4" "substr($6, '$SRC' + 1);system("")}'\
    | awk '{print "echo -e \"[\\033[32m"$1"\\033[0m] "$2"\" && gcc "$2" -o '$OUT' && '$OUT'";system("")}'\
    | bash 
