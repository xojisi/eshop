# -*- coding:utf-8 -*-
__author__ = 'xojisi'

from django.views.generic.base import View
from django.shortcuts import render, HttpResponse
import json

class UploadImage(View):
    def get(self, request):
        return render(request, 'upload_sm.html', {})

    def post(self,request):
        data = json.loads(request.body.decode('utf-8'))
        print(data)
        url = data.get("url","")
        print(url)
        delete_image = data.get("delete","")
        print(delete_image)
        return HttpResponse('{"status":"success"}', content_type="application/json")
