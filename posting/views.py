# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse,  JsonResponse
from insert_table import InsertData
from crm.settings import DATABASES_POST
from setting_globall.models import Franshise
from facility.models import ContactOwner
import requests
from requests.auth import HTTPBasicAuth
# Create your views here.

datas = {
'data[title]': 'Двушка',
'data[category_id]': 31,
'data[offer_seek]': '',
'data[param_price][0]': 'price',
'data[param_price][1]': 300,
'data[param_price][currency]': 'UAH',
'data[param_number_of_rooms]': 1,
'data[param_total_living_area]': 25,
'data[param_total_area]': 50,
'data[param_floor]': 2,
'data[param_total_floors]': 3,
'data[param_currency]': '',
'data[param_house_type]': 2,
'data[private_business]': 'private',
'data[description]': 'гуудддддддддддддддддддддддддддддддддддддддддд',
'data[riak_key]': '',
'image[1]': '',
'image[2]': '',
'image[3]': '',
'image[4]': '',
'image[5]': '',
'image[6]': '',
'image[7]': '',
'image[8]': '',
'image[9]': '',
'image[10]': '',
'image[11]': '',
'image[12]': '',
'data[gallery_html]': '',
'data[city_id]': 27,
'data[city]': 'Жолква, Львовская область, Львовская область',
'data[district_id]': '',
'loc-option': 'loc-opt-2',
'data[person]': 'Андрій',
'data[phone]': '+380964874353',
'data[skype]': '',
'data[payment_code]': '',
'data[sms_number]': '',
'data[adding_key]': '',
'paidadFirstPrice': '',
'paidadChangesLog': '',
'data[map_zoom]': 12,
'data[map_lat]': 50.0730848001349,
'data[map_lon]': 24.041408689741274,
'data[map_radius]': 3000,
}
# adding_57c6059f050bb8.27306621

def posting_true(request):
    if request.method == 'POST':
        franshise = Franshise.objects.values()
        franshise =  franshise[0]['franshise'].replace('.', '')
        DATABASE =''.join([DATABASES_POST['DATABASE'], franshise])
        single_object = ContactOwner.objects.get(id=request.POST['id_so'])
        print single_object.list_operations
        single_object.public = True
        single_object.save()
        InsertData(DATABASES_POST['USER'], DATABASES_POST['PASS'], DATABASES_POST['HOST'], DATABASE, single_object)
        return HttpResponse(status=200)
    else:
        return HttpResponse(status=500)
