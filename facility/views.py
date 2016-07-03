# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django import forms
from facility.models import TypeFacility
from django.utils import timezone, dateformat
from facility.forms import AddressFacilityForm
from homes.views import object_list, add_object
from change_form import change_form_text

# Create your views here.

def add_facility(request):
    if request.method == 'POST':
        form = AddressFacilityForm(request.POST)
        if form.is_valid():
            form.save()
            return object_list(request)
        else:
            form = change_form_text(form)
        return add_object(request, form)
