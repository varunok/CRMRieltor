# -*- coding: utf-8 -*-



import os
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django import forms
from facility.models import TypeFacility
from django.utils import timezone, dateformat
from facility.forms import AddressFacilityForm
from homes.views import object_list, add_object
from change_form import change_form_text
from save_photo import save_photo
from facility.models import ContactOwner, PhoneOwner, DatabasePhoneOwner
from django.contrib.auth.models import User


BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# Create your views here.

def add_facility(request):
    if request.method == 'POST':
        form = AddressFacilityForm(request.POST, request.FILES)
        print (form.errors)
        if form.is_valid():
            form.save()
            phone_numb = ContactOwner.objects.last()
            phone_owner = PhoneOwner(phone=phone_numb)
            phone_owner.save()
            db_phone = DatabasePhoneOwner(db_id_owner=phone_numb.id,
                                          db_phone_owner=phone_numb.phone_owner)
            db_phone.save()
            db_phone = DatabasePhoneOwner(db_id_owner=phone_numb.id,
                                          db_phone_owner=phone_numb.phone_owner_plus)
            db_phone.save()
            save_photo(request, phone_numb.id)
            return object_list(request)
        else:
            form = change_form_text(form)
        return add_object(request, form)


def check_phone(request):
    if request.method == 'GET':
        seek_obj =  DatabasePhoneOwner.objects.filter(db_phone_owner__icontains = request.GET['check'])
        dict_obj = dict()
        for elem in seek_obj:
            dict_obj[str(elem.db_id_owner)] = str(elem.db_phone_owner)
    return HttpResponse(JsonResponse(dict_obj))


def add_img(request):
    if request.method == 'POST':
        img_list = handle_uploaded_file(request.FILES)
    return HttpResponse(JsonResponse(img_list))


def del_img(request):
    try:
        os.remove(str(request).split('?')[-1][1:-2])
        return HttpResponse('delete image')
    except:
        return HttpResponse('wrong delete')


def handle_uploaded_file(f):
    try:
        list_tmp_img = os.listdir('media/tmpimg/')
        for ele in list_tmp_img:
            os.remove(''.join(('media/tmpimg/', ele)))
    except:
        pass
    list_img = {}
    for ele in f:
        with open('media/tmpimg/'+f[ele].name, 'wb+') as destination:
            for chunk in f[ele].chunks():
                destination.write(chunk)
                list_img[ele] = ('/media/tmpimg/'+f[ele].name)
    return list_img
