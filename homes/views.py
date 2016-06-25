# -*- coding: utf-8 -*-


from django.shortcuts import render

from notes.models import Notes
from setting_street.models import Street


# Create your views here.
def homes(request):
    notes = Notes.objects.all()
    return render(request, 'homes/index.html', {'notes': notes})


def object_list(request):
    return render(request, 'homes/objects.html', {})


def buyers_list(request):
    return render(request, 'homes/buyers.html', {})


def maklers_list(request):
    return render(request, 'homes/maklers.html', {})


def arendators_list(request):
    return render(request, 'homes/arendators.html', {})


def add_buyer(request):
    return render(request, 'homes/add_buyer.html', {})


def add_arendator(request):
    return render(request, 'homes/add_arendator.html', {})


def add_object(request):
    street_list = Street.objects.all()
    return render(request,
                  'homes/add_object.html', {'street_list': street_list})


def tasking(request):
    return render(request, 'homes/tasking.html', {})


def setting(request):
    return render(request, 'homes/setting.html', {})


def meeting(request):
    return render(request, 'homes/meeting.html', {})
