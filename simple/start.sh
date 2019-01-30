#!/usr/bin/env bash
# 监听single目录下的文件, 有文件改变的时候就编译并窒息
src=`echo $PWD/ | awk '{print length($0)}'`
mkdir -p build;
fswatch -x -t -u . \
  | awk '{if( $0 ~ " IsFile" && $0 ~ " Updated" && $6 ~ ".c$") print $6; system("")}' \
  | awk '{print substr($0, '$src' + 1); system("")}' \
  | awk '{print "echo ["$0"] && gcc "$0" -o build/single.o && ./build/single.o"; system("")}' \
  | bash;
