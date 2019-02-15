#!/usr/bin/env bash
# 监听single目录下的文件, 有文件改变的时候就编译并窒息
src=`echo $PWD/ | awk '{print length($0)}'`
mkdir -p build;
fswatch -x -t -u . \
  | awk '{if( $0 ~ " IsFile" && $0 ~ " Updated" && $6 ~ ".c$") print $0; system("")}' \
  | awk '{print $4" "substr($6, '$src' + 1); system("")}' \
  | awk '{print "echo -e \"[\\033[32m"$1"\\033[0m] "$2"\" && gcc "$2" -o build/single.o && ./build/single.o"; system("")}' \
  | bash;
