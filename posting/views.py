# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse,  JsonResponse
from work_table import InsertData, SetShows, SearchData
from facility.models import ContactOwner
import requests
from requests.auth import HTTPBasicAuth
# Create your views here.


def posting_true(request):
    if request.method == 'POST':
        single_object = ContactOwner.objects.get(id=request.POST['id_so'])
        if SearchData(single_object).isFind:
            SetShows(request.POST['id_so'], 'true')
            single_object.public = True
            single_object.save()
            return HttpResponse(JsonResponse({'data': 'true'}), status=200)
        else:
            if InsertData(single_object).isPost:
                single_object.public = True
                single_object.save()
                return HttpResponse(JsonResponse({'data': 'true'}), status=200)
            else:
                 return HttpResponse(status=500)
    else:
        return HttpResponse(status=500)


def posting_false(request):
    if request.method == 'POST':
        single_object = ContactOwner.objects.get(id=request.POST['id_so'])
        single_object.public = False
        single_object.save()
        SetShows(request.POST['id_so'], 'false')
        return HttpResponse(JsonResponse({'data': 'false'}), status=200)
    else:
        return HttpResponse(status=500)
