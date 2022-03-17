#! /bin/sh
#
# 去除一些明显是垃圾不能补全的 tags
# TODO macro @ 的vim补全 总是 出现两个 @@

sed -i '/^[A-Za-z]\{1,\}_\w\{1,\}\t/d' $@
sed -i '/^[A-Za-z]\{1,\}_.*!\t/d' $@
sed -i '/^\w\{,2\}\t/d' $@
sed -i '/^\w\{,2\}!\t/d' $@
sed -i '/^_/d' $@
sed -i 's/^\(.*\tm\t\)/@\1/' $@
