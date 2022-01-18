#!/usr/bin/env python3
# -*- encoding: utf-8 -*-
# author: guiu
# data: 2020.2.28

import requests
import json
import mimetypes
import argparse
import sys

if len(sys.argv) == 1:
    sys.argv.append('--help')

parser = argparse.ArgumentParser()
parser.add_argument('-s',
                    '--source',
                    type=str,
                    nargs='+',
                    help="",
                    required=True)
parser.add_argument('-c',
                    '--config',
                    default="$HOME/chevereto/config.json",
                    help="读取配置文件",
                    required=True)
args = parser.parse_args()

# 从参数中获取要上传的文件列表
img_list = args.source
# print(img_list)


def read_conf(path):
    with open(path, "r", encoding="utf-8") as f:
        confstr = f.read()
        conf = json.loads(confstr)
    return conf


def up_to_chevereto(img_list):
    # 获得本地图片路径后，上传至图床并记录返回的json字段
    for img in img_list:
        # 先判断传过来的是本地路径还是远程图片地址
        if "http" == img[:4]:
            # 非本地图片的话可以考虑下载到本地再上传，但是没这个必要
            print(img)
            continue
        else:
            try:
                res_json = upload(formatSource(img))
                parse_response_url(res_json, img)
            except:
                print(img + "\t上传失败")


def upload(files):
    # 图床api
    # APIKey = "THERE PUT YOUR APIKEY"
    conf = read_conf(args.config)
    url = conf['url'] + "?key=" + conf['APIKEY']
    r = requests.post(url, files=files)
    return json.loads(r.text)


def formatSource(filename):
    imageList = []
    mime_type = mimetypes.guess_type(filename)[0]
    imageList.append(('source', (filename, open(filename, 'rb'), mime_type)))
    #print (imageList)
    return imageList


def parse_response_url(json, img_path):
    # 从返回的json中解析字段
    if json['status_code'] != 200:
        print("{}\tweb端返回失败,可能是APIKey不对. status_code {} .".format(
            img_path, json['status_code']))
    else:
        img_url = json["image"]["url"]
        print(img_url)


up_to_chevereto(img_list)
