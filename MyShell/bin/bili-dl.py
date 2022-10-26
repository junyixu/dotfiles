#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2020 junyi <junyixu0@gmail.com>
#
# Distributed under terms of the MIT license.
"""
正则匹配数字
造两个集合，然后作差
"""

from glob import iglob
import re
import subprocess
import logging

logger = logging.getLogger(__name__)
PATTERN = re.compile(r'.*P(\d+)\..*')


def run_cmd(URL, num):
    cmd = ['you-get', URL + num]
    logger.debug('running cmd: %r', cmd)
    subprocess.check_call(cmd)


def get_not_finished():
    xml_files = iglob('./*.xml')
    mp4_files = iglob('./*.mp4')
    set_xml = set()  # 清空集合
    set_mp4 = set()
    for file in xml_files:
        set_xml.add((PATTERN.findall(file))[0])
    for file in mp4_files:
        set_mp4.add((PATTERN.findall(file))[0])
    set_not_finished = set_mp4 - set_xml
    return set_not_finished  # 返回没下完的视频的序号的集合


def main():
    import argparse
    parser = argparse.ArgumentParser(
        description='automatically download n videos frome bilibili', )
    parser.add_argument('-n', '--nvideos', type=int, help='n videos totally')
    parser.add_argument(
        '-u',
        '--url',
        default='https://www.bilibili.com/video/BV1B4411g7H3?p=',
        help='Bilibili URL')
    args = parser.parse_args()
    URL = args.url
    # for i in range(1, args.nvideos +
    #                1):  # 区间： [1, args.nvideos+1) == [1, args.nvideos]
    #     run_cmd(URL, str(i))

    set_not_finished = get_not_finished()
    print(set_not_finished)
    while set_not_finished != set():  # 如果不为空集
        for num in set_not_finished:
            run_cmd(URL, num)
        set_not_finished = get_not_finished()
    print('SUCCESS!')


if __name__ == '__main__':
    main()
