# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse

from notes.models import Notes


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
    return render(request, 'homes/add_object.html', {})


def tasking(request):
    return render(request, 'homes/tasking.html', {})


def setting(request):
    return render(request, 'homes/setting.html', {})

def meeting(request):
    return render(request, 'homes/meeting.html', {})
