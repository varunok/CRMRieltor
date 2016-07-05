# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django import forms
from facility.models import TypeFacility
from django.utils import timezone, dateformat
from facility.forms import AddressFacilityForm
from homes.views import object_list, add_object
from change_form import change_form_text
from facility.models import ContactOwner, PhoneOwner, DatabasePhoneOwner

# Create your views here.

def add_facility(request):
    if request.method == 'POST':
        form = AddressFacilityForm(request.POST)
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
            print (dict_obj)
    return HttpResponse(JsonResponse(dict_obj))