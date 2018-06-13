# -*- coding:utf-8 -*-
__author__ = 'xojisi'

import uuid
import ast
import qiniu
from django.shortcuts import render, HttpResponse
def upload(request):
    key = str(uuid.uuid1()).replace("-","")
    access_key = 'oMeMdJgAvlDtqFlngNHscl3we3DCaLtrNG3ttT6u'
    secret_key = 'r5GZeoqzT__JOGjNusxYRMXE4GJqSX6hQkCfpKZJ'
    bucket = 'dhac-shop'
    policy = {
        "returnURL": "http://127.0.0.1/uploadprocessor",
        "callbackBody" : '{"name":$(fname), "key":$(key)}',
    }

    q = qiniu.Auth(access_key=access_key, secret_key=secret_key)

    token = q.upload_token(bucket=bucket, key=key, expires=3600, policy=policy)

    return render(request, 'upload.html', {'token':token, 'key':key})

def uploadprocessor(request):
    code = request.GET.get("code","")
    error = request.GET.get("error","")
    if code and error:
        res = "code:%s error:%s" % (code,error)
        return HttpResponse(res)

    ret = request.GET.get("upload","")
    decode_ret = qiniu.urlsafe_base64_decode(ret)
    decode_str = decode_ret.decode('utf-8')
    ret_dict = ast.literal_eval(decode_str)
    key = ret_dict.get("key","")
    name = request.get("name","")
    res = "key:%s name:%s" % (key, name)
    return HttpResponse(res)