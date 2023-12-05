#!/bin/bash
# 
# https://lug.ustc.edu.cn/wiki/scripts/wlt
#
# out_type =
#     0 -- 教育网出口
#     1 -- 电信出口
#     2 -- 联通出口
#     3 -- 电信出口2
#     4 -- 联通出口2
#     5 -- 电信出口3
#     6 -- 联通出口3
#     7 -- 教育网出口2
#     8 -- 移动测试国际出口
#
#  exp =
#    0     -- 永久
#    120   -- 动态
#    3600  -- 1小时
#    14400 -- 4小时
#    39600 -- 11小时
#    50400 -- 14小时
 
out_type=7
exp=0

curl --data "name=jyxu&password=EB1taoWLm8fU08Y0&cmd=set&type=$out_type&exp=$exp" \
http://wlt.ustc.edu.cn/cgi-bin/ip
