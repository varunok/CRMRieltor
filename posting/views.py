# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse,  JsonResponse
from insert_table import InsertData
from crm.settings import DATABASES_POST
from setting_globall.models import Franshise
# Create your views here.


def posting_true(request):
    franshise = Franshise.objects.values()
    franshise =  franshise[0]['franshise'].replace('.', '')
    DATABASE =''.join([DATABASES_POST['DATABASE'], franshise])
    InsertData(DATABASES_POST['USER'], DATABASES_POST['PASS'], DATABASES_POST['HOST'], DATABASE, 'HELLO')
    return HttpResponse(status=200)