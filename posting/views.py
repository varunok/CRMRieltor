# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse,  JsonResponse
from work_table import InsertData
from crm.settings import DATABASES_POST
from setting_globall.models import Franshise
from facility.models import ContactOwner
import requests
from requests.auth import HTTPBasicAuth
# Create your views here.

def posting_true(request):
    if request.method == 'POST':
        franshise = Franshise.objects.values()
        franshise = franshise[0]['franshise'].replace('.', '')
        DATABASE = ''.join([DATABASES_POST['DATABASE'], franshise])
        single_object = ContactOwner.objects.get(id=request.POST['id_so'])
        single_object.public = True
        single_object.save()
        InsertData(DATABASES_POST['USER'], DATABASES_POST['PASS'], DATABASES_POST['HOST'], DATABASE, single_object)
        return HttpResponse(status=200)
    else:
        return HttpResponse(status=500)
