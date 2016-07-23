# -*- coding: utf-8 -*-


import os
# from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
# from django import forms
from django.utils import timezone, dateformat
from facility.forms import AddressFacilityForm
from homes.views import add_object
from change_form import change_form_text
from save_photo import save_photo
from facility.models import ContactOwner, PhoneOwner, DatabasePhoneOwner
from django.contrib.auth.models import User


BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# Create your views here.


def add_facility(request):
    if request.method == 'POST':
        form = AddressFacilityForm(request.POST, request.FILES)
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
            return HttpResponseRedirect('/objects/')
        else:
            form = change_form_text(form)
        return add_object(request, form)


def check_phone(request):
    if request.method == 'GET':
        seek_obj = DatabasePhoneOwner.objects.filter(db_phone_owner__icontains=request.GET['check'])
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


def trash_obj(request):
    if request.method == 'POST':
        id_obj = request.POST.get('trash')
        trash_obj = ContactOwner.objects.get(id=id_obj)
        user = User.objects.get(id=request.POST.get('iduser'))
        trash_obj.trash = 1
        trash_obj.time_trash = timezone.now()
        trash_obj.name_user_trash = user.get_full_name()
        trash_obj.save()
        return HttpResponse("Обьект перемещен в корзину")
    else:
        return HttpResponse("Ошибка")
